import 'package:get_storage/get_storage.dart';

class CacheClient {
  final GetStorage _getStorage;

  CacheClient(this._getStorage);

  dynamic get(String key) => _getStorage.read(key);

  Future<void> save(String key, var value) async => await _getStorage.write(key, value);

  Future<void> delete(String key) async => await _getStorage.remove(key);

  Future<void> erase() async => await _getStorage.erase();
}
