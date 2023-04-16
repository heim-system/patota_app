import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patota_app/app/modules/edit/infrastructure/datasources/i_update_patota_datasource.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/infrastructure/models/patota.dart';
import 'package:patota_app/core/database/database_firestore.dart';

class UpdatePatotaDatasource extends IUpdatePatotaDatasource {
  final FirebaseFirestore database = DataBaseFirestore.get();

  @override
  Future<void> call({required IPatota patotaUpdate}) async {
    final patota = Patota.copyFrom(patotaUpdate).toJson();

    await database.collection('patotas').doc(patotaUpdate.id).update(patota);
  }
}
