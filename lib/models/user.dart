//Model for Authenticated user
class AuthUser {
  String uid;

  AuthUser({required this.uid});

  @override
  String toString() {
    return uid;
  }
}

class CustomUser {
  String apparmentNumber;
  String name;
  String email;
  String password;

  CustomUser(
      {required this.apparmentNumber,
      required this.name,
      required this.email,
      required this.password});
}
