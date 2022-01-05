//Model for Authenticated user
class AuthUser {
  String uid;

  AuthUser({required this.uid});

  @override
  String toString() {
    return uid;
  }
}
