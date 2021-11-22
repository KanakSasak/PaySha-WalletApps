import 'package:dartz/dartz.dart';
import 'package:Paysha/common/failure.dart';
import 'package:Paysha/domain/entities/balance.dart';
import 'package:Paysha/domain/entities/wallet.dart';

abstract class WalletRepository {
  Future<Either<Failure, Balance>> getBalance(String token);
  Future<Either<Failure, Wallet>> transferBalance(
    String walletId,
    String amount,
    String token,
  );
}
