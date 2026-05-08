part of 'locator.dart';


class SecureStorageService {
  SecureStorageService._();
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _authTokenKey = 'auth_token';
  static const String _themeModeKey = 'theme_mode';

  String? _cachedToken; // <--- in-memory cache

  /// Load token once at app startup
  Future<void> init() async {
    _cachedToken = await _storage.read(key: _authTokenKey);
  }

  /// Get token from cache (fast, no decryption)
  String? get cachedAuthToken => _cachedToken;

  /// Save token to storage + update cache
  Future<void> saveAuthToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
    _cachedToken = token;
  }

  Future<String?> readAuthToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  /// Remove token from storage + cache
  Future<void> deleteAuthToken() async {
    await _storage.delete(key: _authTokenKey);
    _cachedToken = null;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _storage.write(key: _themeModeKey, value: themeMode.name);
  }

  Future<ThemeMode> readThemeMode() async {
    final themeMode = await _storage.read(key: _themeModeKey);
    if (themeMode == null) {
      return ThemeMode.light;
    }
    return ThemeMode.values.byName(themeMode);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
    _cachedToken = null;
  }
}
