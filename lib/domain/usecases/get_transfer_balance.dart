import 'package:dartz/dartz.dart';
import 'package:Paysha/common/failure.dart';
import 'package:Paysha/domain/entities/wallet.dart';
import 'package:Paysha/domain/repositories/wallet_repository.dart';

class GetTransferBalance {
  final WalletRepository repository;

  GetTransferBalance(this.repository);

  Future<Either<Failure, Wallet>> execute(
      String walletId, String amount, String token) {
    return repository.transferBalance(walletId, amount, token);
  }
}
