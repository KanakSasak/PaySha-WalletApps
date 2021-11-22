import 'dart:io';

import 'package:Paysha/common/exception.dart';
import 'package:Paysha/data/datasources/wallet_remote_data_source.dart';
import 'package:Paysha/domain/entities/balance.dart';
import 'package:Paysha/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:Paysha/domain/entities/wallet.dart';
import 'package:Paysha/domain/repositories/wallet_repository.dart';
import 'package:logger/logger.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource walletRemoteDataSource;

  WalletRepositoryImpl({
    required this.walletRemoteDataSource,
  });

  Logger _logger = Logger();

  @override
  Future<Either<Failure, Balance>> getBalance(String token) async {
    try {
      final result = await walletRemoteDataSource.getBalance(token);

      _logger.d(result);

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(""));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, Wallet>> transferBalance(
    String walletId,
    String amount,
    String token,
  ) async {
    try {
      final result =
          await walletRemoteDataSource.transferBalance(walletId, amount, token);

      _logger.d(result);

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(""));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }
}
