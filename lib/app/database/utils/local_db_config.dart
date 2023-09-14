class LocalDBConfig {
  String path;
  String dbName;
  int version;

  LocalDBConfig({required this.path, required this.dbName, this.version = 1});
}
