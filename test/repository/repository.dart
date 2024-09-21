import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Repository{
  Future<bool>  cachedLocalLoginState();
  Future<void> setLoginStateToLocal(bool state);
}

class RepositoryImpl implements Repository{


  @override
  Future<void> setLoginStateToLocal(bool state) async{
    // TODO: implement setLoginStateToLocal
  }

  @override
  Future<bool> cachedLocalLoginState() async {
    return await Future.delayed(const Duration(seconds: 5),() => true);
  }


}

final repositoryProvider = Provider.  autoDispose<Repository>((ref) {
  return RepositoryImpl();
});