import 'dart:io';

import 'dart:convert'; // Importing json

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/constant/url.dart';
import 'package:http/http.dart' as http;

class Authentication extends ChangeNotifier {
  final rqsturl = Appurl.baseurl;
  bool _isloading = false;
  String _resMessage = '';

  bool get isLoading => _isloading;
  String get resMessage => _resMessage;

  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    BuildContext? context,
  }) async {
    _isloading = true;
    notifyListeners();
    String url = "$rqsturl/users/";
    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));
      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(res.body);

        _isloading = false;
        _resMessage = 'account created';
        notifyListeners();
      } else {
        final res = json.decode(req.body);
        print(res);
        _isloading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;

      _resMessage = "No internet";
      notifyListeners();
    } catch (e) {
      _isloading = false;
      _resMessage = "please try again";
      notifyListeners();
      print(e);
    }
  }

  //login
  void LoginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isloading = true;
    notifyListeners();
    String url = "$rqsturl/users/login";
    final body = {"email": email, "password": password};
    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));
      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(res.body);

        _isloading = false;
        _resMessage = "account logged in";
        notifyListeners();
      } else {
        final res = json.decode(req.body);
        _resMessage = res['message'];
        print(res);
        _isloading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;

      _resMessage = "No internet";
      notifyListeners();
    } catch (e) {
      _isloading = false;
      _resMessage = "please try again";
      notifyListeners();
      print(e);
    }

    //login
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
