import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_get_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';
import 'package:patota_app/core/database/database_firestore.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class GetPatotaDataSource implements IGetPatotaDataSource {
  final FirebaseFirestore database = DataBaseFirestore.get();
  final _auth = doctor<AuthService>();

  @override
  Future<List<IPatota>> call() async {
    final List<IPatota> list = [];
    await database //
        .collection('patotas')
        .where('owner', isEqualTo: _auth.value.userId)
        .get()
        .then(
      (snapshot) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> document in snapshot.docs) {
          list.add(
            Patota.fromJson(document.data())..id = document.id,
          );
        }
      },
    );

    return list;
  }
}
