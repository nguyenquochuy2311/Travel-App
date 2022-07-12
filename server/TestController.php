<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Facades\Cafe24\Cafe24;
use App\Http\Controllers\BaseController;
use App\Facades\Cafe24\Cafe24Api;
use App\Models\ProductMeta;
use App\Models\Mall;
use App\Services\HelperService;
use App\Http\Requests\GetProductListRequest;
use App\Http\Requests\GetProductDetailRequest;
use App\Http\Requests\UploadImageRequest;
use Illuminate\Support\Str;
use Carbon\Carbon;

class TestController extends Controller
{
   public function getCafe24ProductList($param){

      $param = base64_decode($param);
      $param = json_decode($param, true);

      $cafe_mall_id = $param["cafe_mall_id"];
      $shop_no = $param["shop_no"];
      // echo print_r( $cafe_mall_id , true );

      $mall = Mall::where('cafe_mall_id' , $cafe_mall_id )->first();


      $access_token = $mall['access_token'];

      $end_point = "products";
      $param = [
         "shop_no" => $shop_no,
         "embed" => 'seo',

         "start_date" => '2022-05-01',
         "end_date" => '2022-06-09'
      ];

      // call cafe24 products list api
      $products = Cafe24Api::get($cafe_mall_id, $access_token, $end_point, $param);

      // echo '<pre>'.print_r( $products['data'] ,true ).'</pre>';

      $order_list =$products['data']->products;
      $data = [];
      $data_detail = [];

      $detail_condition = ['simple_description', 'has_option', 'shipping_info', 'shipping_method', 'shipping_area', 'shipping_period'];
      foreach( $order_list as $K => $V ){

         $product = (array) $V;

         foreach( $V as $K1 => $V1 ){
            ## Option ########################################
            // if( $K1 == 'options' ){

            //    $options = (array) $V1;
            //    $options = (array) $options['options'];
            //    $option = '';
            //    if( count( $options ) > 0 ){
            //       $array = [];
            //       foreach( $options as $K2 => $V2 ){
                     
            //          echo print_r( $V2 , true );
            //          $code = $V2->option_code;
            //          $name = $V2->option_name;
            //          $display = $V2->option_display_type;
            //          if( ! key_exists( $product['product_no'], $array ) ){
            //             $array[$product['product_no']] = ['option_code' => $V2->option_code,
            //                                              'option_name' => $V2->option_name,
            //                                              'option_display_type' => $V2->option_display_type,
            //                                              ];
            //             if( $V2->option_value > 0 ){
            //             foreach( $V2->option_value as $K3 => $V3 ){
            //                $V3 = $V3;
            //                $text = $V3->option_text;
            //                $array[$product['product_no']]['option_name'] .= "{{$text}|";
            //                } 
            //             }
            //          } else {
            //             $array[$product['product_no']]['option_code'] .= "|{$code}";
            //             $array[$product['product_no']]['option_name'] .= "|{$name}";                                                         
            //             $array[$product['product_no']]['option_display_type'] .= "|{$display}";                                                        
            //          }
            //       }
            //             echo '<pre>'.print_r( $array ,true ).'</pre>';
            //    }
            // }
            ## Option ########################################

            $data[] = [ "cafe_mall_id" => $cafe_mall_id,
                        "shop_no" => $shop_no,
                        "product_no" => $product['product_no'],
                        "meta_key" => $K1,
                        "meta_value" => is_object($V1) || is_array($V1) ? json_encode( $V1 ) : $V1,
                        "created_at"        => Carbon::now(),
                        "updated_at"        => Carbon::now(),
                     ];
         }


         $end_point = "products/" . $product['product_no'];
         $param = [
            "shop_no" => $shop_no,
         ];

         // call cafe24 products list api
         $products_detail = Cafe24Api::get($cafe_mall_id, $access_token, $end_point, $param);

         $resource = (array) $products_detail['data']->product;
         // echo '<pre>'.print_r( $resource['category'], true ) . '</pre><hr>';

         foreach( $resource as $K2=>$V2 ){
            if( $K2 == 'category' ) { 
               $V2 = (array) $V2[0];
               foreach( $V2 as $K3 => $V3 ){                
                  $data_detail[] = [ "cafe_mall_id" => $cafe_mall_id,
                                    "shop_no" => $shop_no,
                                    "product_no" => $product['product_no'],
                                    "meta_key" => $K3,
                                    "meta_value" => $V3,
                                    "created_at"        => Carbon::now(),
                                    "updated_at"        => Carbon::now(),
                                    ];
               }
            }

            elseif( in_array( $K2 , $detail_condition ) == 1 ){

               $data_detail[] = [ "cafe_mall_id" => $cafe_mall_id,
                                    "shop_no" => $shop_no,
                                    "product_no" => $product['product_no'],
                                    "meta_key" => $K2,
                                    "meta_value" => is_object($V2) || is_array($V2) ? json_encode( $V2 ) : $V2,
                                    "created_at"        => Carbon::now(),
                                    "updated_at"        => Carbon::now(),
                                 ];
            }
         }

      }

      // echo '<pre>'.print_r( $data_detail ,true ).'</pre>';

      $db_insert = array_merge( $data , $data_detail );
      echo '<pre>'.print_r( $db_insert ,true ).'</pre>';

      $product_meta_insert = ProductMeta::insert($db_insert);
      
      if (!empty($product)) {   

      }
   }

   public function getCafe24OrderList($param){

      $param = base64_decode($param);
      $param = json_decode($param, true);

      $cafe_mall_id = $param["cafe_mall_id"];
      $shop_no = $param["shop_no"];
      // echo print_r( $cafe_mall_id , true );

      $mall = Mall::where('cafe_mall_id' , $cafe_mall_id )->first();


      $access_token = $mall['access_token'];

      $end_point = "orders";
      $param = [
         "shop_no" => $shop_no,
         "embed" => "buyer",

         "start_date" => "2022-05-01",
         "end_date" => "2022-06-12"
      ];

      // call cafe24 products list api
      $orders = Cafe24Api::get($cafe_mall_id, $access_token, $end_point, $param);

      // echo '<pre>'.print_r( $orders['data'] ,true ).'</pre>';

      $order_list =$orders['data']->orders;
      $data = [];
      $data_items = [];

      // $detail_condition = ['simple_description', 'has_option', 'shipping_info', 'shipping_method', 'shipping_area', 'shipping_period'];
      foreach( $order_list as $K => $V ){

         $order = (array) $V;

            $data[] = [ "cafe_mall_id" => $cafe_mall_id,
                        "shop_no" => $shop_no,
                        "cafe_order_id" => $order['order_id'],
                        "status" => "" ,
                        "is_paid" => $V->paid,
                        "created_at"        => Carbon::now(),
                        "updated_at"        => Carbon::now(),
                     ];

               if( $K == 'buyer' ) { 
                     echo print_r( $V  ,true ).'<hr>';
                     $data_detail[] = [ "cafe_mall_id" => $cafe_mall_id,
                                       "shop_no" => $shop_no,
                                       "cafe_order_id" => $order['order_id'],
                                       "meta_key" => 'member_name',
                                       "meta_value" => $V->buyer->name,
                                       "created_at"        => Carbon::now(),
                                       "updated_at"        => Carbon::now(),
                                       ];
                  }

               // elseif( in_array( $K2 , $detail_condition ) == 1 ){

               //    $data_detail[] = [ "cafe_mall_id" => $cafe_mall_id,
               //                         "shop_no" => $shop_no,
               //                         "product_no" => $product['product_no'],
               //                         "meta_key" => $K2,
               //                         "meta_value" => is_object($V2) || is_array($V2) ? json_encode( $V2 ) : $V2,
               //                         "created_at"        => Carbon::now(),
               //                         "updated_at"        => Carbon::now(),
               //                      ];
               // }
         }
         
      echo '<pre>'.print_r( $data_detail,true ).'</pre>';

   }


      // $db_insert = array_merge( $data , $data_detail );
      // echo '<pre>'.print_r( $db_insert ,true ).'</pre>';

      // $product_meta_insert = ProductMeta::insert($db_insert);
      
      // if (!empty($product)) {   

      // }
}



