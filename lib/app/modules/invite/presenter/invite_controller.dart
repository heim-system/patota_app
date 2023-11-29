import 'package:flutter/material.dart';

class InviteController {
  Future<void> sendInvite({required String patotaId, required String email}) async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('Send: id: $patotaId - email : $email');
  }
}
