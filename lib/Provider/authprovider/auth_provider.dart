import 'dart:io';
import 'dart:convert'; // Importing json
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/constant/url.dart';
import 'package:http/http.dart' as http;

class Authentication extends ChangeNotifier {
  final String rqsturl = Appurl.baseurl;
  bool _isLoading = false;
  String _resMessage = '';

  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();
    String url = "$rqsturl/users/";

    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
    print("Request Body: $body");

    try {
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      print("Response status: ${req.statusCode}");
      print("Response body: ${req.body}");

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(res);

        _isLoading = false;
        _resMessage = 'Account created';
        notifyListeners();
      } else {
        print("Unexpected response format");
        _resMessage = "Unexpected response format: ${req.body}";
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "No internet connection";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "An error occurred: $e";
      notifyListeners();
      print(e);
    }
  }

  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();
    String url = "$rqsturl/users/login";

    final body = {"email": email, "password": password};
    print("Request Body: $body");

    try {
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      print("Response status: ${req.statusCode}");
      print("Response body: ${req.body}");

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(res);

        _isLoading = false;
        _resMessage = "Account logged in";
        notifyListeners();
      } else {
        print("Unexpected response format");
        _resMessage = "Unexpected response format: ${req.body}";
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "No internet connection";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "An error occurred: $e";
      notifyListeners();
      print(e);
    }
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
