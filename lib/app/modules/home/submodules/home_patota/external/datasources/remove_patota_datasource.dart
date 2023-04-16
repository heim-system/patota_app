import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/infrastructure/datasources/i_remove_patota_datasourse.dart';
import 'package:patota_app/core/database/database_firestore.dart';

class RemovePatotaDatasource implements IRemovePatotaDatasource {
  final FirebaseFirestore database = DataBaseFirestore.get();

  @override
  Future call(IPatota patota) async {
    try {
      debugPrint(patota.id);
      await database.collection('patotas').doc(patota.id).delete();
    } catch (e) {
      debugPrint('Erro ao excluir patota');
    }
  }
}
