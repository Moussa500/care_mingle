import 'package:care_mingle/features/auth/data/models/request/sign_in_req.dart';
import 'package:care_mingle/features/auth/data/models/response/sign_in_response.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either<LoginResponse,dynamic>> registerBabySitter(BabySitterModel babySitterModel);
  Future<Either> registerParent(ParentModel parentModel);
  Future<Either> login(SignInReq signInReq);
}