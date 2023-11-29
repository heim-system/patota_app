import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patota_app/app/modules/invite/infrastructure/datasources/i_invite_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';
import 'package:patota_app/core/database/database_firestore.dart';

class InvitePatotaDatasource extends IInvitePatotaDatasource {
  final FirebaseFirestore database = DataBaseFirestore.get();

  @override
  Future<void> call({required IPatota patota, required String userEmail}) async {
    final patotaInvite = Patota.copyFrom(patota).toJson();

    await database.collection('patotas').doc(patota.id).update(patotaInvite);
  }
}
