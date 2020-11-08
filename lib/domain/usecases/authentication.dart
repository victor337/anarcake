import 'package:flutter/material.dart';


import '../entities/entities.dart';


abstract class Authentuication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password
  });
}