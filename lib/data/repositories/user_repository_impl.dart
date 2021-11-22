import 'dart:io';

import 'package:Paysha/common/exception.dart';
import 'package:Paysha/data/datasources/user_remote_data_source.dart';
import 'package:Paysha/domain/entities/user.dart';
import 'package:Paysha/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:Paysha/domain/repositories/user_repository.dart';
import 'package:logger/logger.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  Logger _logger = Logger();

  @override
  Future<Either<Failure, User>> getUser(
    String authToken,
    String deviceId,
    String deviceType,
    String phone,
    String signInMethod,
    String tokenFcm,
  ) async {
    try {
      final result = await userRemoteDataSource.getUser(
        authToken,
        deviceId,
        deviceType,
        phone,
        signInMethod,
        tokenFcm,
      );

      _logger.d(result);

      return Right(result.data.data.toentity());
    } on ServerException {
      return Left(ServerFailure(""));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }
}
