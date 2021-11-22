import 'package:dartz/dartz.dart';
import 'package:Paysha/common/failure.dart';
import 'package:Paysha/domain/entities/user.dart';
import 'package:Paysha/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, User>> execute(
    String authToken,
    String deviceId,
    String deviceType,
    String phone,
    String signInMethod,
    String tokenFcm,
  ) {
    return repository.getUser(
      authToken,
      deviceId,
      deviceType,
      phone,
      signInMethod,
      tokenFcm,
    );
  }
}
