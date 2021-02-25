import 'package:annepedia/models/user.dart';
import 'package:annepedia/repository/user_repository.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  Users _user;
  String emailHataMesaji;
  String sifreHataMesaji;

  Users get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<Users> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users> createUserWithEmailandPassword(
      String email, String password) async {
    if (_emailSifreKontrol(email, password)) {
      try {
        state = ViewState.Busy;
        _user = await _userRepository.createUserWithEmailandPassword(
            email, password);

        return _user;
      } finally {
        state = ViewState.Idle;
      }
    } else
      return null;
  }

  @override
  Future<Users> signInWithEmailAndPassword(String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user = await _userRepository.signInWithEmailAndPassword(email, sifre);
        return _user;
      } else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;

    if (sifre.length < 6) {
      sifreHataMesaji = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      sifreHataMesaji = null;
    if (!email.contains('@')) {
      emailHataMesaji = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailHataMesaji = null;
    return sonuc;
  }

  @override
  Future<Users> signInEmailPassword() {
    // TODO: implement signInEmailPassword
    throw UnimplementedError();
  }
}
