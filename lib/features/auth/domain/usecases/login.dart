import 'package:care_mingle/core/usecase/use_case.dart';
import 'package:care_mingle/features/auth/data/models/sign_in_req.dart';
import 'package:care_mingle/features/auth/domain/repository/auth_repository.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<Either, SignInReq> {
  @override
  Future<Either> call({SignInReq? params}) async {
    return await sl<AuthRepository>().login(params!);
  }
}