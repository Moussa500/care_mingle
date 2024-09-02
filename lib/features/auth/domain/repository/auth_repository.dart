import 'package:care_mingle/features/auth/data/models/sign_in_req.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either> registerBabySitter(BabySitterModel babySitterModel);
  Future<Either> registerParent(ParentModel parentModel);
  Future<Either> login(SignInReq signInReq);
}