import 'package:cmovil_v4/app/data/data_source/local/database/database.dart';
import 'package:cmovil_v4/app/data/data_source/local/tables/tables.dart'; // <--- EL IMPORT QUE FALTA
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:drift/drift.dart';

part 'usuario_dao.g.dart';

@DriftAccessor(tables: [Empresa, Modulo])
class UsuarioDao extends DatabaseAccessor<AppDatabase> with _$UsuarioDaoMixin {
  UsuarioDao(super.db);
  Future<void> guardarPerfilLocal(UsuarioPerfil perfil) {
    return db.transaction(() async {
      await delete(empresa).go();
      await into(empresa).insert(
        EmpresaData(
          empId: perfil.empId,
          empNombre: perfil.empNombre,
          usrNombre: perfil.usrNombre,
          usrCodigo: perfil.usrCodigo,
        ),
      );
      await batch((b) {
        b.insertAll(modulo, [
          for (final mod in perfil.modulos)
            ModuloCompanion.insert(
              empId: perfil.empId,
              modId: mod.modId,
              modNombre: mod.modNombre,
              usrIdExt: mod.usrIdExt,
              almId: mod.almId,
              almNombre: mod.almNombre,
              selected: Value(perfil.modulos.length == 1),
            ),
        ]);
      });
    });
  }

  Stream<UsuarioPerfil?> watchPerfilLocal() {
    final query = select(empresa).join([
      leftOuterJoin(modulo, modulo.empId.equalsExp(empresa.empId)),
    ])..orderBy([OrderingTerm.asc(modulo.modId)]);

    return query.watch().map((rows) {
      if (rows.isEmpty) return null;
      return _buildPerfil(rows.first.readTable(empresa), [
        for (final row in rows) ?row.readTableOrNull(modulo),
      ]);
    });
  }

  Future<void> eliminarPerfilLocal() async {
    await delete(empresa).go();
  }

  UsuarioPerfil _buildPerfil(
    EmpresaData empresaRow,
    List<ModuloData> modulosRows,
  ) {
    return UsuarioPerfil(
      empId: empresaRow.empId,
      empNombre: empresaRow.empNombre,
      usrNombre: empresaRow.usrNombre,
      usrCodigo: empresaRow.usrCodigo,
      modulos: [
        for (final row in modulosRows)
          UsuarioModulo(
            modId: row.modId,
            modNombre: row.modNombre,
            usrIdExt: row.usrIdExt,
            almId: row.almId,
            almNombre: row.almNombre,
            selected: row.selected,
          ),
      ],
    );
  }

  Future<void> seleccionarModulo(String usrIdExt) async {
    await db.transaction(() async {
      await update(modulo).write(const ModuloCompanion(selected: Value(false)));
      await (update(modulo)..where((m) => m.usrIdExt.equals(usrIdExt))).write(
        const ModuloCompanion(selected: Value(true)),
      );
    });
  }
}
