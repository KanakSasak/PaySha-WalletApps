import 'package:e_wallet_new/data/datasources/user_remote_data_source.dart';
import 'package:e_wallet_new/data/datasources/wallet_remote_data_source.dart';
import 'package:e_wallet_new/data/repositories/user_repository_impl.dart';
import 'package:e_wallet_new/data/repositories/wallet_repository_impl.dart';
import 'package:e_wallet_new/domain/repositories/user_repository.dart';
import 'package:e_wallet_new/domain/repositories/wallet_repository.dart';
import 'package:e_wallet_new/domain/usecases/get_balance.dart';
import 'package:e_wallet_new/domain/usecases/get_transfer_balance.dart';
import 'package:e_wallet_new/domain/usecases/get_user.dart';
import 'package:e_wallet_new/persentation/provider/scanner_notifier.dart';
import 'package:e_wallet_new/persentation/provider/user_notifier.dart';
import 'package:e_wallet_new/persentation/provider/wallet_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // PROVIDER
  getIt.registerFactory(
    () => UserNotifier(
      getUser: getIt(),
    ),
  );
  getIt.registerFactory(
    () => WalletNotifier(
      getBalance: getIt(),
      getTransferBalance: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ScannerNotifier(),
  );

  // USECASES
  getIt.registerLazySingleton(() => GetUser(getIt()));
  getIt.registerLazySingleton(() => GetBalance(getIt()));
  getIt.registerLazySingleton(() => GetTransferBalance(getIt()));

  // REPOSITORY
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: getIt()));
  getIt.registerLazySingleton<WalletRepository>(
      () => WalletRepositoryImpl(walletRemoteDataSource: getIt()));

  // DATASOURCE
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<WalletRemoteDataSource>(
      () => WalletRemoteDataSourceImpl(client: getIt()));

  // EXTERNAL
  getIt.registerLazySingleton(() => http.Client());
}
