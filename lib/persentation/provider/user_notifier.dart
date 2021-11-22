import 'package:Paysha/common/state_enum.dart';
import 'package:Paysha/domain/entities/user.dart';
import 'package:Paysha/domain/usecases/get_user.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class UserNotifier extends ChangeNotifier {
  User? _user;
  User get user => _user!;

  RequestState _userRequestState = RequestState.Empty;
  RequestState get userRequestState => _userRequestState;

  String _message = "";
  String get message => _message;

  UserNotifier({
    required this.getUser,
  });

  GetUser getUser;
  Logger _logger = Logger();

  Future<void> signInUser(
    String authToken,
    String deviceId,
    String deviceType,
    String phone,
    String signInMethod,
    String tokenFcm,
  ) async {
    _userRequestState = RequestState.Loading;
    notifyListeners();

    final result = await getUser.execute(
      authToken,
      deviceId,
      deviceType,
      phone,
      signInMethod,
      tokenFcm,
    );

    _logger.d(result);

    result.fold((failure) {
      _userRequestState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (user) {
      _userRequestState = RequestState.Loaded;
      _user = user;
      notifyListeners();
    });
  }
}
