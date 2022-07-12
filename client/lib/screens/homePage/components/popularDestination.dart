import 'package:client/config/theme.dart';
import 'package:client/features/popularDetination/popularAPI.dart';
import 'package:client/features/popularDetination/popularSlice.dart';
import 'package:client/screens/national/NationalDetail.dart';
import 'package:flutter/material.dart';

class PopularList extends StatelessWidget {
  const PopularList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 26.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const Text(
                  "Popular Destination",
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.start,
                )),
          ),
          Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 16.0),
              child: const PopularSlice()),
        ],
      ),
    );
  }
}

class PopularSlice extends StatefulWidget {
  const PopularSlice({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PopularSlice> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts![index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        posts![index].url ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
// child: Row(
//         children: imgPopular
//             .map((String e) => GestureDetector(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 0.0, horizontal: 8.0),
//                     child: Container(
//                       child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(20.0)),
//                           child: Stack(
//                             children: <Widget>[
//                               Image.asset(
//                                 e.toString(),
//                                 fit: BoxFit.cover,
//                                 width: 291.0,
//                                 height: 188.0,
//                               ),
//                               Positioned(
//                                 top: 0.0,
//                                 left: 0.0,
//                                 right: 0.0,
//                                 child: Container(
//                                   margin: const EdgeInsets.all(0.0),
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 11.0, horizontal: 18.0),
//                                   child: const Text(
//                                     'Japan',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: kFontFamily),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )),
//                     ),
//                   ),
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => NationalDetail(
//                                 country: "Japan",
//                                 url: e,
//                               ))),
//                 ))
//             .toList(),
//       ),
