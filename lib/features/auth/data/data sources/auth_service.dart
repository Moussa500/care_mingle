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
  Future<Either> registerBabySitter(BabySitterModel babySitterModel) async {
    return await apiHelper.postFormData(
        url: baseUrl + registerEndPoint,
        data: babySitterModel.toJson(),
        headers: headers);
  }

  @override
  Future<Either> registerParent(ParentModel parentModel) async {
    return await apiHelper.postFormData(
        url: baseUrl + registerEndPoint,
        data: parentModel.toJson(),
        headers: headers);
  }
  
  @override
  Future<Either> login(SignInReq signInReq) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
