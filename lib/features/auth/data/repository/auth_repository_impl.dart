import 'package:care_mingle/features/auth/data/data%20sources/auth_service.dart';
import 'package:care_mingle/features/auth/data/models/request/sign_in_req.dart';
import 'package:care_mingle/features/auth/data/models/response/sign_in_response.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:care_mingle/features/auth/domain/repository/auth_repository.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> login(SignInReq signInReq) {
    return sl<AuthService>().login(signInReq);
  }

  @override
  Future<Either<LoginResponse,dynamic>> registerBabySitter(BabySitterModel babySitterModel) async {
    return sl<AuthService>().registerBabySitter(babySitterModel);
  }

  @override
  Future<Either> registerParent(ParentModel parentModel) {
    return sl<AuthService>().registerParent(parentModel);
  }
}
