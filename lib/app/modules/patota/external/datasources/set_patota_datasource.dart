import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_set_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';
import 'package:patota_app/core/database/database_firestore.dart';

class SetPatotaDataSource implements ISetPatotaDataSource {
  final FirebaseFirestore database = DataBaseFirestore.get();
  final AuthService auth;

  SetPatotaDataSource({
    required this.auth,
  });

  @override
  Future call(Patota newPatota) async {
    await database.collection('patotas').doc().set(newPatota.toJson());
  }
}
