import 'package:jwt_decoder/jwt_decoder.dart';

class DecodeToken {
  static Map<String, dynamic> decodeToken(String token) {
    return JwtDecoder.decode(token);
  }
}
