import 'package:dartz/dartz.dart';
import 'package:e_wallet_new/common/failure.dart';
import 'package:e_wallet_new/domain/entities/user.dart';

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
