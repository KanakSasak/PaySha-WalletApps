import 'package:dartz/dartz.dart';
import 'package:e_wallet_new/common/failure.dart';
import 'package:e_wallet_new/domain/entities/wallet.dart';
import 'package:e_wallet_new/domain/repositories/wallet_repository.dart';

class GetTransferBalance {
  final WalletRepository repository;

  GetTransferBalance(this.repository);

  Future<Either<Failure, Wallet>> execute(
      String walletId, String amount, String token) {
    return repository.transferBalance(walletId, amount, token);
  }
}
