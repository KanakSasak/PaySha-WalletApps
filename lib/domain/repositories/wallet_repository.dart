import 'package:dartz/dartz.dart';
import 'package:e_wallet_new/common/failure.dart';
import 'package:e_wallet_new/domain/entities/balance.dart';
import 'package:e_wallet_new/domain/entities/wallet.dart';

abstract class WalletRepository {
  Future<Either<Failure, Balance>> getBalance(String token);
  Future<Either<Failure, Wallet>> transferBalance(
    String walletId,
    String amount,
    String token,
  );
}
