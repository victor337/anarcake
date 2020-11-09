import 'package:flutter/material.dart';


import '../entities/entities.dart';


abstract class Authentuication {
  Future<AccountEntity> auth(
    AuthenticationParams params
  );
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  Map toJson() => {"email": email, "password": secret};
}