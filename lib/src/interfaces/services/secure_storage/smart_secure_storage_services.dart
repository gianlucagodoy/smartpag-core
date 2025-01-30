import '../../../../app_lib_core.dart';

/// A classe [SmartSecureStorageServices] é uma interface que define os métodos para acessar e armazenar informações
/// de forma segura. Esses métodos são utilizados para manipular dados sensíveis, como usuário, token de autenticação,
/// contatos validados, tokens biométricos e avaliações [CSAT].
///
/// Os métodos da interface são:
///
/// -  getUser() : obtém o objeto  User  armazenado.
///
/// -  saveUser(User user) : salva o objeto  User .
///
/// -  saveToken(String token) : salva o token de autenticação.
///
/// -  getToken() : obtém o token de autenticação.
///
/// -  logout() : realiza o logout do usuário.
///
/// -  saveRememberUser(String rememberUser) : salva a opção de lembrar usuário.
///
/// -  getRememberUser() : obtém a opção de lembrar usuário.
///
/// -  saveQuantityTokensGenerated(int quantityTokensGenerated) : salva a quantidade de tokens gerados.
///
/// -  getQuantityTokensGenerated() : obtém a quantidade de tokens gerados.
///
/// -  addValidatedContact(ValidatedContact validatedContact) : adiciona um contato validado.
///
/// -  getValidatedContact() : obtém a lista de contatos validados.
///
/// -  saveBiometryTokens(Map<String, dynamic> biometryTokens) : salva os tokens biométricos.
///
/// -  getBiometryTokens() : obtém os tokens biométricos.
///
/// -  removeUserBiometryTokens(String userDocument) : remove os tokens biométricos de um usuário específico.
///
/// -  saveCSAT(CSAT csat) : salva a avaliação CSAT.
///
/// -  getCSAT() : obtém a avaliação CSAT.
///
/// Esses métodos são utilizados para armazenar e recuperar informações importantes para o funcionamento
/// da aplicação de forma segura.
abstract class SmartSecureStorageServices {
  Future<String?> getValue(String key);

  Future<void> setValue(String key, String? value);

  /// obtém o objeto  User  armazenado.
  Future<User> getUser();

  /// salva o objeto  User .
  Future<bool> saveUser(User user);

  /// salva o token de autenticação.
  Future<bool> saveToken(String token);

  /// obtém o token de autenticação.
  Future<String> getToken();

  /// realiza o logout do usuário.
  Future<void> logout();

  /// salva a opção de lembrar usuário.
  Future<bool> saveRememberUser(String rememberUser);

  /// obtém a opção de lembrar usuário.
  Future<String> getRememberUser();

  /// salva a quantidade de tokens gerados.
  Future<bool> saveQuantityTokensGenerated(int quantityTokensGenerated);

  /// obtém a quantidade de tokens gerados.
  Future<int> getQuantityTokensGenerated();

  /// adiciona um contato validado.
  Future<bool> addValidatedContact(ValidatedContact validatedContact);

  ///  obtém a lista de contatos validados.
  Future<List<ValidatedContact>> getValidatedContact();

  /// salva os tokens biométricos.
  Future<void> saveBiometryTokens(Map<String, dynamic> biometryTokens);

  /// obtém os tokens biométricos.
  Future<Map<String, dynamic>> getBiometryTokens();

  /// remove os tokens biométricos de um usuário específico.
  Future<void> removeUserBiometryTokens(String userDocument);

  /// salva a avaliação CSAT.
  Future<bool> saveCSAT(CSAT csat);

  /// obtém a avaliação CSAT.
  Future<CSAT> getCSAT();
}
