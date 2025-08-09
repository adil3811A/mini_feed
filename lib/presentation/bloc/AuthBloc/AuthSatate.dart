

sealed class AuthState{}

class AuthStateInit extends AuthState{}

class AuthStateLoading extends AuthState{}

class AuthStateError extends AuthState{}