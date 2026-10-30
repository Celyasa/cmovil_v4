import 'package:drift/drift.dart';

class Empresa extends Table {
  IntColumn get empId => integer()();
  TextColumn get empNombre => text().withLength(min: 1, max: 100)();
  TextColumn get usrNombre => text().withLength(min: 1, max: 150)();
  TextColumn get usrCodigo => text().withLength(min: 1, max: 20)();
  @override
  Set<Column> get primaryKey => {empId}; // Llave primaria
}

// 2. Tabla Modulo (Módulos asociados a la empresa)
class Modulo extends Table {
  IntColumn get modId => integer()();
  TextColumn get modNombre => text().withLength(min: 1, max: 100)();
  TextColumn get usrIdExt => text().withLength(min: 1, max: 20)();
  IntColumn get almId => integer()();
  TextColumn get almNombre => text().withLength(min: 1, max: 150)();
  IntColumn get empId =>
      integer().references(Empresa, #empId, onDelete: KeyAction.cascade)();
  BoolColumn get selected => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
    'UNIQUE(emp_id, usr_id_ext, mod_nombre)',
  ];
}
