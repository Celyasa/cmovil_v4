// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_dao.dart';

// ignore_for_file: type=lint
mixin _$UsuarioDaoMixin on DatabaseAccessor<AppDatabase> {
  $EmpresaTable get empresa => attachedDatabase.empresa;
  $ModuloTable get modulo => attachedDatabase.modulo;
  UsuarioDaoManager get managers => UsuarioDaoManager(this);
}

class UsuarioDaoManager {
  final _$UsuarioDaoMixin _db;
  UsuarioDaoManager(this._db);
  $$EmpresaTableTableManager get empresa =>
      $$EmpresaTableTableManager(_db.attachedDatabase, _db.empresa);
  $$ModuloTableTableManager get modulo =>
      $$ModuloTableTableManager(_db.attachedDatabase, _db.modulo);
}
