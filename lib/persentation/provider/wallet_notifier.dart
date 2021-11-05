import 'package:e_wallet_new/common/state_enum.dart';
import 'package:e_wallet_new/domain/entities/balance.dart';
import 'package:e_wallet_new/domain/entities/wallet.dart';
import 'package:e_wallet_new/domain/usecases/get_balance.dart';
import 'package:e_wallet_new/domain/usecases/get_transfer_balance.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class WalletNotifier extends ChangeNotifier {
  Balance? _balance;
  Balance get balance => _balance!;

  RequestState _walletRequestState = RequestState.Empty;
  RequestState get walletRequestState => _walletRequestState;

  Wallet? _transferBalance;
  Wallet get transferBalance => _transferBalance!;

  RequestState _transferBalanceRequestState = RequestState.Empty;
  RequestState get transferBalanceRequestState => _transferBalanceRequestState;

  String _message = "";
  String get message => _message;

  WalletNotifier({
    required this.getBalance,
    required this.getTransferBalance,
  });

  GetBalance getBalance;
  GetTransferBalance getTransferBalance;

  Logger _logger = Logger();

  Future<void> getBalanceUser(String token) async {
    _walletRequestState = RequestState.Loading;
    notifyListeners();

    final result = await getBalance.execute(token);
    _logger.d(result);

    result.fold((failure) {
      _walletRequestState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _walletRequestState = RequestState.Loaded;
      _balance = data;
      notifyListeners();
    });
  }

  Future<void> getTransferBalanceUser(
    String walletId,
    String amount,
    String token,
  ) async {
    _walletRequestState = RequestState.Loading;
    notifyListeners();

    final result = await getTransferBalance.execute(walletId, amount, token);
    _logger.d(result);

    result.fold((failure) {
      _transferBalanceRequestState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _transferBalanceRequestState = RequestState.Loaded;
      _transferBalance = data;
      _message = data.data;
      notifyListeners();
    });
  }
}
