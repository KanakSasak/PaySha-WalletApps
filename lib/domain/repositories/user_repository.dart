import 'package:dartz/dartz.dart';
import 'package:Paysha/common/failure.dart';
import 'package:Paysha/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(
    String authToken,
    String deviceId,
    String deviceType,
    String phone,
    String signInMethod,
    String tokenFcm,
  );
}
