import 'package:care_mingle/core/usecase/use_case.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:care_mingle/features/auth/domain/repository/auth_repository.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:dartz/dartz.dart';

class RegisterParentUseCase implements UseCase<Either, ParentModel> {
  @override
  Future<Either> call({ParentModel? params}) async {
    return await sl<AuthRepository>().registerParent(params!);
  }
}

class RegisterBabySitterUseCase implements UseCase<Either, BabySitterModel> {
  @override
  Future<Either> call({BabySitterModel? params}) async {
    return await sl<AuthRepository>().registerBabySitter(params!);
  }
}
