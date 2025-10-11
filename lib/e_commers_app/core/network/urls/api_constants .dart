class ApiConstants {
  static const String baseUrl = 'https://accessories-eshop.runasp.net';

  static const String loginUrl = '$baseUrl/api/auth/login';

  static const String registerUrl = '$baseUrl/api/auth/register';

  static const String verifyEmail = '$baseUrl/api/auth/verify-email';
  static const String resendOtp = '$baseUrl/api/auth/resend-otp';


  //* categories
  static const String categoriesUrl = '$baseUrl/api/categories';

//*products
  static const String productsUrl = '$baseUrl/api/products';
  //*refreshTokenUrl
  static const String refreshTokenUrl = '$baseUrl/api/auth/refresh-token';
}
