import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/repository.dart';

final appServiceProvider = Provider<AppServiceNotifier>((ref) {
  final repository = ref.read(repositoryProvider);
  return AppServiceNotifier(repository: repository);
});

class AppServiceNotifier extends ChangeNotifier {
  AppServiceNotifier({
    required this.repository,
  });

  final Repository repository;

  bool _loginState = false;
  bool _initialized = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;

  Future<void> _cachedLoginStateFromLocal() async{
    _loginState = await repository.cachedLocalLoginState();
  }

  Future<void> setLoginState(bool state) async {
    await repository.setLoginStateToLocal(state);
    _loginState = state;
    notifyListeners();
  }

  void setInitialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _cachedLoginStateFromLocal();
    if (_loginState == true) {
      try {

        await Future.delayed(const Duration(seconds: 2));
       /// init data when app start
      } catch (error) {
        print('onAppStart => $error');
        setLoginState(false);
        setInitialized(true);
        rethrow;
      }
    }
    _initialized = true;
    notifyListeners();
  }
}
