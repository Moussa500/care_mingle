import 'package:care_mingle/core/base/base_repository.dart';
import 'package:care_mingle/core/consts/api_constants.dart';
import 'package:care_mingle/features/auth/data/models/request/sign_in_req.dart';
import 'package:care_mingle/features/auth/data/models/response/sign_in_response.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthService {
  Future<Either<LoginResponse, dynamic>> registerBabySitter(
      BabySitterModel babySitterModel);
  Future<Either> registerParent(ParentModel parentModel);
  Future<Either> login(SignInReq signInReq);
}
class AuthServiceImlp extends MainRepository implements AuthService {
  AuthServiceImlp(
      {required super.remoteData,
      required super.localData,
      required super.networkInfo});

  @override
  Future<Either<LoginResponse, dynamic>> registerBabySitter(
      BabySitterModel babySitterModel) async {
    final result = await data(
      getData: () => remoteData.post(
          model: LoginResponse(),
          body: BabySitterModel().toJson(),
          path: registerEndPoint,
          headers: multiPartHeader()),
      needCash: false,
    );
    return result.fold((failure) {
      return Left(failure);
    }, (authResponse) {
      return Right(authResponse);
    });
  }

  @override
  Future<Either> login(SignInReq signInReq) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either> registerParent(ParentModel parentModel) {
    // TODO: implement registerParent
    throw UnimplementedError();
  }
}
