class AuthConfig {
  static const String appName = "Travel App";
  static const String apiUrl = '{process.env.FLUTTER_API}/api/v1';
  static const String signUpAPI = "/auth/signup";
  static const String signInAPI = "/auth/signin";
  static const String logoutAPI = "/auth/logout";
  static const String refreshTokenAPI = "/auth/refreshToken";
}
