import 'package:dartz/dartz.dart';
import 'package:Paysha/common/failure.dart';
import 'package:Paysha/domain/entities/balance.dart';
import 'package:Paysha/domain/repositories/wallet_repository.dart';

class GetBalance {
  final WalletRepository repository;

  GetBalance(this.repository);

  Future<Either<Failure, Balance>> execute(String token) {
    return repository.getBalance(token);
  }
}
