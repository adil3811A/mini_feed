
sealed class AuthEvents{}

class AuthEventLogin extends AuthEvents{
  final String email;
  final String password;

  AuthEventLogin({required this.email, required this.password});
}
class AuthEventLogout extends AuthEvents{}