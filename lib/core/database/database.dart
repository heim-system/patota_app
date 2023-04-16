abstract class DataBase {
  Future<bool> update();
  Future<bool> insert();
  Future<bool> delete();
  Future<bool> select();
}
