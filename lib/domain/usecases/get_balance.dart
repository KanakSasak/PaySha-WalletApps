import 'package:dartz/dartz.dart';
import 'package:e_wallet_new/common/failure.dart';
import 'package:e_wallet_new/domain/entities/balance.dart';
import 'package:e_wallet_new/domain/repositories/wallet_repository.dart';

class GetBalance {
  final WalletRepository repository;

  GetBalance(this.repository);

  Future<Either<Failure, Balance>> execute(String token) {
    return repository.getBalance(token);
  }
}
