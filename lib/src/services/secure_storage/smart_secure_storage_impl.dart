import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../app_lib_core.dart';

///
/// A classe [SmartSecureStorageServicesImpl] é uma implementação da interface [SmartSecureStorageServices].
/// Ela utiliza o pacote [flutter_secure_storage] para armazenar de forma segura os
/// dados do usuário, como informações de login, token de autenticação,
/// contatos validados, tokens biométricos, entre outros.
///
/// A classe possui um construtor que recebe uma instância de [FlutterSecureStorage] ,
/// responsável por realizar as operações de leitura e escrita no armazenamento seguro.
///
/// Os métodos implementados na classe são:
///
/// -  getUser() : Retorna um objeto  User  contendo as informações do usuário
///    logado, obtidas do armazenamento seguro. Caso não haja um usuário logado,
///     é retornado um objeto  User  vazio.
///
/// -  saveUser(User user) : Salva as informações do usuário logado no armazenamento seguro.
///    Retorna  true  em caso de sucesso e  false  em caso de erro.
///
/// -  saveToken(String token) : Salva o token de autenticação no armazenamento seguro.
///     Retorna  true  em caso de sucesso e  false  em caso de erro.
///
/// -  getToken() : Retorna o token de autenticação obtido do armazenamento seguro.
///     Caso não haja um token válido, é retornado uma string vazia.
///
/// -  logout() : Realiza o logout do usuário, removendo as informações de usuário e
///    token do armazenamento seguro.
///
/// -  saveRememberUser(String rememberUser) : Salva a opção de lembrar usuário no armazenamento
///    seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
///
/// -  getRememberUser() : Retorna a opção de lembrar usuário obtida do armazenamento seguro.
///    Caso não haja uma opção válida, é retornado uma string vazia.
///
/// -  saveQuantityTokensGenerated(int quantityTokensGenerated) : Salva a quantidade de tokens
///    gerados no armazenamento seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
///
/// -  getQuantityTokensGenerated() : Retorna a quantidade de tokens gerados obtida do armazenamento
///    seguro. Caso não haja uma quantidade válida, é retornado zero.
///
/// -  addValidatedContact(ValidatedContact validatedContact) : Adiciona um contato validado no
///    armazenamento seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
///
/// -  getValidatedContact() : Retorna a lista de contatos validados obtida do armazenamento seguro.
///    Caso não haja contatos válidos, é retornado uma lista vazia.
///
/// -  saveBiometryTokens(Map<String, dynamic> biometryTokens) : Salva os tokens biométricos no
///    armazenamento seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
///
/// -  getBiometryTokens() : Retorna os tokens biométricos obtidos do armazenamento seguro.
///    Caso não haja tokens válidos, é retornado um mapa vazio.
///
/// -  removeUserBiometryTokens(String userDocument) : Remove os tokens biométricos de um usuário
///    específico do armazenamento seguro.
///
/// -  saveCSAT(CSAT csat) : Salva as informações do CSAT no armazenamento seguro. Retorna
///    true  em caso de sucesso e  false  em caso de erro.
///
/// -  getCSAT() : Retorna as informações do CSAT obtidas do armazenamento seguro.
///    Caso não haja informações válidas, é retornado um objeto  CSAT  vazio.
///
class SmartSecureStorageServicesImpl implements SmartSecureStorageServices {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  //final AndroidOptions androidOptions = const AndroidOptions(encryptedSharedPreferences: true);
  //final IOSOptions iosOptions = const IOSOptions();
  SmartSecureStorageServicesImpl();

  ///
  /// -  getUser() : Retorna um objeto  User  contendo as informações do usuário
  ///    logado, obtidas do armazenamento seguro. Caso não haja um usuário logado,
  ///     é retornado um objeto  User  vazio.
  ///
  @override
  Future<User> getUser() async {
    try {
      String? resp = await _storage.read(key: "user");
      if (resp == null || resp.isEmpty) return User();
      return User.fromJson(resp);
    } catch (e) {
      return User();
    }
  }

  ///
  /// -  saveUser(User user) : Salva as informações do usuário logado no armazenamento seguro.
  ///    Retorna  true  em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<bool> saveUser(User user) async {
    bool isSuccess = true;
    try {
      await _storage.write(
          key: "user", value: user.toJson(), aOptions: _storage.aOptions);
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }

  ///
  /// -  saveToken(String token) : Salva o token de autenticação no armazenamento seguro.
  ///     Retorna  true  em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<bool> saveToken(String token) async {
    bool isSuccess = true;
    try {
      await _storage.write(
          key: "token", value: token, aOptions: _storage.aOptions);
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }

  ///
  /// -  getToken() : Retorna o token de autenticação obtido do armazenamento seguro.
  ///     Caso não haja um token válido, é retornado uma string vazia.
  ///
  @override
  Future<String> getToken() async {
    try {
      String token =
          await _storage.read(key: "token", aOptions: _storage.aOptions) ?? "";
      return token;
    } catch (e) {
      return '';
    }
  }

  ///
  /// -  logout() : Realiza o logout do usuário, removendo as informações de usuário e
  ///    token do armazenamento seguro.
  ///
  @override
  Future<void> logout() async {
    try {
      await _storage.delete(key: 'user', aOptions: _storage.aOptions);
      await _storage.delete(key: 'token', aOptions: _storage.aOptions);
      await _storage.write(
          key: 'quantityTokensGenerated',
          value: '0',
          aOptions: _storage.aOptions);
    } catch (e) {
      return;
    }
  }

  ///
  /// -  saveRememberUser(String rememberUser) : Salva a opção de lembrar usuário no armazenamento
  ///    seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<bool> saveRememberUser(String rememberUser) async {
    bool isSuccess = true;
    try {
      await _storage.write(
          key: "rememberUser",
          value: rememberUser,
          aOptions: _storage.aOptions);
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }

  ///
  /// -  getRememberUser() : Retorna a opção de lembrar usuário obtida do armazenamento seguro.
  ///    Caso não haja uma opção válida, é retornado uma string vazia.
  ///
  @override
  Future<String> getRememberUser() async {
    try {
      String resp = await _storage.read(
              key: "rememberUser", aOptions: _storage.aOptions) ??
          '';
      return resp;
    } catch (e) {
      return '';
    }
  }

  ///
  /// -  saveQuantityTokensGenerated(int quantityTokensGenerated) : Salva a quantidade de tokens
  ///    gerados no armazenamento seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<bool> saveQuantityTokensGenerated(int quantityTokensGenerated) async {
    try {
      bool isSuccess = true;
      await _storage.write(
          key: 'quantityTokensGenerated',
          value: quantityTokensGenerated.toString(),
          aOptions: _storage.aOptions);
      return isSuccess;
    } catch (e) {
      return false;
    }
  }

  ///
  /// -  getQuantityTokensGenerated() : Retorna a quantidade de tokens gerados obtida do
  /// armazenamento seguro. Caso não haja uma quantidade válida, é retornado zero.
  ///
  @override
  Future<int> getQuantityTokensGenerated() async {
    try {
      String? resp = await _storage.read(
          key: "quantityTokensGenerated", aOptions: _storage.aOptions);
      if (resp == null || resp.isEmpty) return 0;
      return int.tryParse(resp) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  ///
  /// -  addValidatedContact(ValidatedContact validatedContact) : Adiciona um contato validado no
  ///    armazenamento seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<bool> addValidatedContact(ValidatedContact validatedContact) async {
    try {
      bool isSuccess = true;
      List<Map<String, dynamic>> oldValidatedContacts = [];
      String? resp = await _storage.read(
          key: "validatedContact", aOptions: _storage.aOptions);
      if (resp != null && resp.isNotEmpty)
        oldValidatedContacts =
            List<Map<String, dynamic>>.from(json.decode(resp));
      oldValidatedContacts.add(validatedContact.toMap());

      String newValue = json.encode(oldValidatedContacts);
      await _storage.write(
          key: 'validatedContact',
          value: newValue,
          aOptions: _storage.aOptions);
      return isSuccess;
    } catch (e) {
      return false;
    }
  }

  ///
  /// -  getValidatedContact() : Retorna a lista de contatos validados obtida do armazenamento
  ///  seguro. Caso não haja contatos válidos, é retornado uma lista vazia.
  ///
  @override
  Future<List<ValidatedContact>> getValidatedContact() async {
    try {
      List<ValidatedContact> result = [];
      String? resp = await _storage.read(
          key: "validatedContact", aOptions: _storage.aOptions);
      if (resp == null || resp.isEmpty) return result;
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(json.decode(resp));
      for (var element in list) {
        result.add(ValidatedContact.fromMap(element));
      }
      return result;
    } catch (e) {
      return <ValidatedContact>[];
    }
  }

  ///
  /// -  saveBiometryTokens(Map<String, dynamic> biometryTokens) : Salva os tokens biométricos no
  /// armazenamento seguro. Retorna  true  em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<void> saveBiometryTokens(Map<String, dynamic> biometryTokens) async {
    try {
      String? resp = await _storage.read(
          key: 'biometryTokens', aOptions: _storage.aOptions);
      Map<String, dynamic> savedUsers = {};
      if (resp != null && resp.isNotEmpty)
        savedUsers.addAll(Map<String, dynamic>.from(json.decode(resp)));
      if (savedUsers.containsKey(biometryTokens.keys.first)) {
        savedUsers[biometryTokens.keys.first] = biometryTokens.values.first;
      } else {
        savedUsers.addAll(biometryTokens);
      }
      await _storage.write(
          key: 'biometryTokens',
          value: json.encode(savedUsers),
          aOptions: _storage.aOptions);
    } catch (e) {
      return;
    }
  }

  ///
  /// -  getBiometryTokens() : Retorna os tokens biométricos obtidos do armazenamento seguro.
  /// Caso não haja tokens válidos, é retornado um mapa vazio.
  ///
  @override
  Future<Map<String, dynamic>> getBiometryTokens() async {
    try {
      String? resp = await _storage.read(
          key: 'biometryTokens', aOptions: _storage.aOptions);
      Map<String, dynamic> values = {};
      if (resp == null || resp.isEmpty) return values;
      values = Map<String, dynamic>.from(json.decode(resp));
      return values;
    } catch (e) {
      return <String, dynamic>{};
    }
  }

  ///
  /// -  removeUserBiometryTokens(String userDocument) : Remove os tokens biométricos de um usuário
  ///  específico do armazenamento seguro.
  ///
  @override
  Future<void> removeUserBiometryTokens(String userDocument) async {
    try {
      Map<String, dynamic> value = await getBiometryTokens();
      if (value.containsKey(userDocument)) value.remove(userDocument);
      await _storage.write(
          key: 'biometryTokens',
          value: json.encode(value),
          aOptions: _storage.aOptions);
    } catch (e) {
      return;
    }
  }

  ///
  /// -  saveCSAT(CSAT csat) : Salva as informações do CSAT no armazenamento seguro. Retorna true
  /// em caso de sucesso e  false  em caso de erro.
  ///
  @override
  Future<bool> saveCSAT(CSAT csat) async {
    try {
      bool isSuccess = true;
      await _storage.write(
          key: "csat", value: csat.toJson(), aOptions: _storage.aOptions);
      return isSuccess;
    } catch (e) {
      return false;
    }
  }

  ///
  /// - getCSAT() : Retorna as informações do CSAT obtidas do armazenamento seguro.
  /// Caso não haja informações válidas, é retornado um objeto  CSAT  vazio.
  ///
  @override
  Future<CSAT> getCSAT() async {
    try {
      String? resp =
          await _storage.read(key: "csat", aOptions: _storage.aOptions);
      if (resp == null || resp.isEmpty) return CSAT();
      return CSAT.fromJson(resp);
    } catch (e) {
      return CSAT();
    }
  }

  /* 
   * Retorna o valor associado à chave fornecida. 
   *  
   * @param key A chave do valor a ser recuperado. 
   * @return O valor associado à chave, ou null caso não exista valor para a chave fornecida. 
   */
  @override
  Future<String?> getValue(String key) async {
    return await _storage.read(key: key);
  }

  /*  
   * Armazena um valor associado à chave fornecida. 
   *  
   * @param key A chave do valor a ser armazenado. 
   * @param value O valor a ser armazenado. 
   */
  @override
  Future<void> setValue(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }
}
