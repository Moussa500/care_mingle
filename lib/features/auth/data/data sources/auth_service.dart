import 'package:care_mingle/common/api/api_helper.dart';
import 'package:care_mingle/common/constants/api_constants.dart';
import 'package:care_mingle/features/auth/data/models/sign_in_req.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthService {
  Future<Either> registerBabySitter(BabySitterModel babySitterModel);
  Future<Either> registerParent(ParentModel parentModel);
  Future<Either> login(SignInReq signInReq);
}

class AuthServiceImlp extends AuthService {
  ApiHelper apiHelper = ApiHelper();
  @override
  Future<Either> login(SignInReq signInReq) async{
    return await apiHelper.post(url: baseUrl+loginEndPoint, data: signInReq.toJson());
  }

  @override
  Future<Either> registerBabySitter(BabySitterModel babySitterModel) async {
    return await apiHelper.post(
        url: baseUrl + registerEndPoint, data: babySitterModel.toJson());
  }

  @override
  Future<Either> registerParent(ParentModel parentModel) async {
    return await apiHelper.post(
        url: baseUrl + registerEndPoint, data: parentModel.toJson());
  }
}
