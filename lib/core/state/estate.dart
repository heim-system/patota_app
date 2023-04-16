import 'package:flutter/material.dart';

abstract class Estate<T> extends ValueNotifier<T> {
  bool _isLoading = false;
  bool _isError = false;
  bool _isReady = false;
  String _errorMessage = '';

  Estate(super.value);

  void setLoading() {
    _isLoading = true;
    _isReady = false;
    _isError = false;
    notifyListeners();
  }

  void setReady() {
    _isLoading = false;
    _isReady = true;
    _isError = false;
    notifyListeners();
  }

  void setError([String newErrorMessage = '']) {
    _isLoading = false;
    _isReady = false;
    _isError = true;
    _errorMessage = newErrorMessage;
    notifyListeners();
  }

  bool get isReady => _isReady;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;
}
