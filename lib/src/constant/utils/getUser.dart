import 'package:flutter/material.dart';

class GetUser {
  int? _idUser;
  String? _token;

    String? get token => _token;

  set token(String? value) {
    _token = value;
  }

  int? get idUser => _idUser;

  set idUser(int? value) {
    _idUser = value;
  }
  
}
