import 'package:patota_app/app/modules/login/domain/entities/auth_user.dart';

class AuthUser implements IAuthUser {
  @override
  String userId = '';

  @override
  String displayName = '';

  @override
  String email = '';

  @override
  String password = '';

  @override
  String photoUrl = '';

  void clear() {
    userId = '';
    displayName = '';
    email = '';
    password = '';
    photoUrl = '';
  }
}
