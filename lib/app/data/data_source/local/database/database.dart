import 'package:cmovil_v4/app/data/data_source/local/dao/usuario_dao.dart';
import 'package:cmovil_v4/app/data/data_source/local/tables/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Empresa, Modulo], daos: [UsuarioDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Constructor para tests: permite inyectar un `QueryExecutor` en memoria.
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      // Activa foreign keys en SQLite (necesario para ON DELETE CASCADE).
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'cmovil_v4');
  }
}
