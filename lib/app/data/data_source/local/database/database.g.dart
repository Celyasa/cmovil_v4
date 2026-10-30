// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $EmpresaTable extends Empresa with TableInfo<$EmpresaTable, EmpresaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmpresaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _empIdMeta = const VerificationMeta('empId');
  @override
  late final GeneratedColumn<int> empId = GeneratedColumn<int>(
    'emp_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _empNombreMeta = const VerificationMeta(
    'empNombre',
  );
  @override
  late final GeneratedColumn<String> empNombre = GeneratedColumn<String>(
    'emp_nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usrNombreMeta = const VerificationMeta(
    'usrNombre',
  );
  @override
  late final GeneratedColumn<String> usrNombre = GeneratedColumn<String>(
    'usr_nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usrCodigoMeta = const VerificationMeta(
    'usrCodigo',
  );
  @override
  late final GeneratedColumn<String> usrCodigo = GeneratedColumn<String>(
    'usr_codigo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    empId,
    empNombre,
    usrNombre,
    usrCodigo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'empresa';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmpresaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('emp_id')) {
      context.handle(
        _empIdMeta,
        empId.isAcceptableOrUnknown(data['emp_id']!, _empIdMeta),
      );
    }
    if (data.containsKey('emp_nombre')) {
      context.handle(
        _empNombreMeta,
        empNombre.isAcceptableOrUnknown(data['emp_nombre']!, _empNombreMeta),
      );
    } else if (isInserting) {
      context.missing(_empNombreMeta);
    }
    if (data.containsKey('usr_nombre')) {
      context.handle(
        _usrNombreMeta,
        usrNombre.isAcceptableOrUnknown(data['usr_nombre']!, _usrNombreMeta),
      );
    } else if (isInserting) {
      context.missing(_usrNombreMeta);
    }
    if (data.containsKey('usr_codigo')) {
      context.handle(
        _usrCodigoMeta,
        usrCodigo.isAcceptableOrUnknown(data['usr_codigo']!, _usrCodigoMeta),
      );
    } else if (isInserting) {
      context.missing(_usrCodigoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {empId};
  @override
  EmpresaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmpresaData(
      empId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}emp_id'],
      )!,
      empNombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emp_nombre'],
      )!,
      usrNombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usr_nombre'],
      )!,
      usrCodigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usr_codigo'],
      )!,
    );
  }

  @override
  $EmpresaTable createAlias(String alias) {
    return $EmpresaTable(attachedDatabase, alias);
  }
}

class EmpresaData extends DataClass implements Insertable<EmpresaData> {
  final int empId;
  final String empNombre;
  final String usrNombre;
  final String usrCodigo;
  const EmpresaData({
    required this.empId,
    required this.empNombre,
    required this.usrNombre,
    required this.usrCodigo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['emp_id'] = Variable<int>(empId);
    map['emp_nombre'] = Variable<String>(empNombre);
    map['usr_nombre'] = Variable<String>(usrNombre);
    map['usr_codigo'] = Variable<String>(usrCodigo);
    return map;
  }

  EmpresaCompanion toCompanion(bool nullToAbsent) {
    return EmpresaCompanion(
      empId: Value(empId),
      empNombre: Value(empNombre),
      usrNombre: Value(usrNombre),
      usrCodigo: Value(usrCodigo),
    );
  }

  factory EmpresaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmpresaData(
      empId: serializer.fromJson<int>(json['empId']),
      empNombre: serializer.fromJson<String>(json['empNombre']),
      usrNombre: serializer.fromJson<String>(json['usrNombre']),
      usrCodigo: serializer.fromJson<String>(json['usrCodigo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'empId': serializer.toJson<int>(empId),
      'empNombre': serializer.toJson<String>(empNombre),
      'usrNombre': serializer.toJson<String>(usrNombre),
      'usrCodigo': serializer.toJson<String>(usrCodigo),
    };
  }

  EmpresaData copyWith({
    int? empId,
    String? empNombre,
    String? usrNombre,
    String? usrCodigo,
  }) => EmpresaData(
    empId: empId ?? this.empId,
    empNombre: empNombre ?? this.empNombre,
    usrNombre: usrNombre ?? this.usrNombre,
    usrCodigo: usrCodigo ?? this.usrCodigo,
  );
  EmpresaData copyWithCompanion(EmpresaCompanion data) {
    return EmpresaData(
      empId: data.empId.present ? data.empId.value : this.empId,
      empNombre: data.empNombre.present ? data.empNombre.value : this.empNombre,
      usrNombre: data.usrNombre.present ? data.usrNombre.value : this.usrNombre,
      usrCodigo: data.usrCodigo.present ? data.usrCodigo.value : this.usrCodigo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmpresaData(')
          ..write('empId: $empId, ')
          ..write('empNombre: $empNombre, ')
          ..write('usrNombre: $usrNombre, ')
          ..write('usrCodigo: $usrCodigo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(empId, empNombre, usrNombre, usrCodigo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmpresaData &&
          other.empId == this.empId &&
          other.empNombre == this.empNombre &&
          other.usrNombre == this.usrNombre &&
          other.usrCodigo == this.usrCodigo);
}

class EmpresaCompanion extends UpdateCompanion<EmpresaData> {
  final Value<int> empId;
  final Value<String> empNombre;
  final Value<String> usrNombre;
  final Value<String> usrCodigo;
  const EmpresaCompanion({
    this.empId = const Value.absent(),
    this.empNombre = const Value.absent(),
    this.usrNombre = const Value.absent(),
    this.usrCodigo = const Value.absent(),
  });
  EmpresaCompanion.insert({
    this.empId = const Value.absent(),
    required String empNombre,
    required String usrNombre,
    required String usrCodigo,
  }) : empNombre = Value(empNombre),
       usrNombre = Value(usrNombre),
       usrCodigo = Value(usrCodigo);
  static Insertable<EmpresaData> custom({
    Expression<int>? empId,
    Expression<String>? empNombre,
    Expression<String>? usrNombre,
    Expression<String>? usrCodigo,
  }) {
    return RawValuesInsertable({
      if (empId != null) 'emp_id': empId,
      if (empNombre != null) 'emp_nombre': empNombre,
      if (usrNombre != null) 'usr_nombre': usrNombre,
      if (usrCodigo != null) 'usr_codigo': usrCodigo,
    });
  }

  EmpresaCompanion copyWith({
    Value<int>? empId,
    Value<String>? empNombre,
    Value<String>? usrNombre,
    Value<String>? usrCodigo,
  }) {
    return EmpresaCompanion(
      empId: empId ?? this.empId,
      empNombre: empNombre ?? this.empNombre,
      usrNombre: usrNombre ?? this.usrNombre,
      usrCodigo: usrCodigo ?? this.usrCodigo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (empId.present) {
      map['emp_id'] = Variable<int>(empId.value);
    }
    if (empNombre.present) {
      map['emp_nombre'] = Variable<String>(empNombre.value);
    }
    if (usrNombre.present) {
      map['usr_nombre'] = Variable<String>(usrNombre.value);
    }
    if (usrCodigo.present) {
      map['usr_codigo'] = Variable<String>(usrCodigo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmpresaCompanion(')
          ..write('empId: $empId, ')
          ..write('empNombre: $empNombre, ')
          ..write('usrNombre: $usrNombre, ')
          ..write('usrCodigo: $usrCodigo')
          ..write(')'))
        .toString();
  }
}

class $ModuloTable extends Modulo with TableInfo<$ModuloTable, ModuloData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModuloTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _modIdMeta = const VerificationMeta('modId');
  @override
  late final GeneratedColumn<int> modId = GeneratedColumn<int>(
    'mod_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modNombreMeta = const VerificationMeta(
    'modNombre',
  );
  @override
  late final GeneratedColumn<String> modNombre = GeneratedColumn<String>(
    'mod_nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usrIdExtMeta = const VerificationMeta(
    'usrIdExt',
  );
  @override
  late final GeneratedColumn<String> usrIdExt = GeneratedColumn<String>(
    'usr_id_ext',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _almIdMeta = const VerificationMeta('almId');
  @override
  late final GeneratedColumn<int> almId = GeneratedColumn<int>(
    'alm_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _almNombreMeta = const VerificationMeta(
    'almNombre',
  );
  @override
  late final GeneratedColumn<String> almNombre = GeneratedColumn<String>(
    'alm_nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _empIdMeta = const VerificationMeta('empId');
  @override
  late final GeneratedColumn<int> empId = GeneratedColumn<int>(
    'emp_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES empresa (emp_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _selectedMeta = const VerificationMeta(
    'selected',
  );
  @override
  late final GeneratedColumn<bool> selected = GeneratedColumn<bool>(
    'selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("selected" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    modId,
    modNombre,
    usrIdExt,
    almId,
    almNombre,
    empId,
    selected,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modulo';
  @override
  VerificationContext validateIntegrity(
    Insertable<ModuloData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mod_id')) {
      context.handle(
        _modIdMeta,
        modId.isAcceptableOrUnknown(data['mod_id']!, _modIdMeta),
      );
    } else if (isInserting) {
      context.missing(_modIdMeta);
    }
    if (data.containsKey('mod_nombre')) {
      context.handle(
        _modNombreMeta,
        modNombre.isAcceptableOrUnknown(data['mod_nombre']!, _modNombreMeta),
      );
    } else if (isInserting) {
      context.missing(_modNombreMeta);
    }
    if (data.containsKey('usr_id_ext')) {
      context.handle(
        _usrIdExtMeta,
        usrIdExt.isAcceptableOrUnknown(data['usr_id_ext']!, _usrIdExtMeta),
      );
    } else if (isInserting) {
      context.missing(_usrIdExtMeta);
    }
    if (data.containsKey('alm_id')) {
      context.handle(
        _almIdMeta,
        almId.isAcceptableOrUnknown(data['alm_id']!, _almIdMeta),
      );
    } else if (isInserting) {
      context.missing(_almIdMeta);
    }
    if (data.containsKey('alm_nombre')) {
      context.handle(
        _almNombreMeta,
        almNombre.isAcceptableOrUnknown(data['alm_nombre']!, _almNombreMeta),
      );
    } else if (isInserting) {
      context.missing(_almNombreMeta);
    }
    if (data.containsKey('emp_id')) {
      context.handle(
        _empIdMeta,
        empId.isAcceptableOrUnknown(data['emp_id']!, _empIdMeta),
      );
    } else if (isInserting) {
      context.missing(_empIdMeta);
    }
    if (data.containsKey('selected')) {
      context.handle(
        _selectedMeta,
        selected.isAcceptableOrUnknown(data['selected']!, _selectedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ModuloData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModuloData(
      modId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mod_id'],
      )!,
      modNombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mod_nombre'],
      )!,
      usrIdExt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usr_id_ext'],
      )!,
      almId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alm_id'],
      )!,
      almNombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alm_nombre'],
      )!,
      empId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}emp_id'],
      )!,
      selected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}selected'],
      )!,
    );
  }

  @override
  $ModuloTable createAlias(String alias) {
    return $ModuloTable(attachedDatabase, alias);
  }
}

class ModuloData extends DataClass implements Insertable<ModuloData> {
  final int modId;
  final String modNombre;
  final String usrIdExt;
  final int almId;
  final String almNombre;
  final int empId;
  final bool selected;
  const ModuloData({
    required this.modId,
    required this.modNombre,
    required this.usrIdExt,
    required this.almId,
    required this.almNombre,
    required this.empId,
    required this.selected,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mod_id'] = Variable<int>(modId);
    map['mod_nombre'] = Variable<String>(modNombre);
    map['usr_id_ext'] = Variable<String>(usrIdExt);
    map['alm_id'] = Variable<int>(almId);
    map['alm_nombre'] = Variable<String>(almNombre);
    map['emp_id'] = Variable<int>(empId);
    map['selected'] = Variable<bool>(selected);
    return map;
  }

  ModuloCompanion toCompanion(bool nullToAbsent) {
    return ModuloCompanion(
      modId: Value(modId),
      modNombre: Value(modNombre),
      usrIdExt: Value(usrIdExt),
      almId: Value(almId),
      almNombre: Value(almNombre),
      empId: Value(empId),
      selected: Value(selected),
    );
  }

  factory ModuloData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModuloData(
      modId: serializer.fromJson<int>(json['modId']),
      modNombre: serializer.fromJson<String>(json['modNombre']),
      usrIdExt: serializer.fromJson<String>(json['usrIdExt']),
      almId: serializer.fromJson<int>(json['almId']),
      almNombre: serializer.fromJson<String>(json['almNombre']),
      empId: serializer.fromJson<int>(json['empId']),
      selected: serializer.fromJson<bool>(json['selected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'modId': serializer.toJson<int>(modId),
      'modNombre': serializer.toJson<String>(modNombre),
      'usrIdExt': serializer.toJson<String>(usrIdExt),
      'almId': serializer.toJson<int>(almId),
      'almNombre': serializer.toJson<String>(almNombre),
      'empId': serializer.toJson<int>(empId),
      'selected': serializer.toJson<bool>(selected),
    };
  }

  ModuloData copyWith({
    int? modId,
    String? modNombre,
    String? usrIdExt,
    int? almId,
    String? almNombre,
    int? empId,
    bool? selected,
  }) => ModuloData(
    modId: modId ?? this.modId,
    modNombre: modNombre ?? this.modNombre,
    usrIdExt: usrIdExt ?? this.usrIdExt,
    almId: almId ?? this.almId,
    almNombre: almNombre ?? this.almNombre,
    empId: empId ?? this.empId,
    selected: selected ?? this.selected,
  );
  ModuloData copyWithCompanion(ModuloCompanion data) {
    return ModuloData(
      modId: data.modId.present ? data.modId.value : this.modId,
      modNombre: data.modNombre.present ? data.modNombre.value : this.modNombre,
      usrIdExt: data.usrIdExt.present ? data.usrIdExt.value : this.usrIdExt,
      almId: data.almId.present ? data.almId.value : this.almId,
      almNombre: data.almNombre.present ? data.almNombre.value : this.almNombre,
      empId: data.empId.present ? data.empId.value : this.empId,
      selected: data.selected.present ? data.selected.value : this.selected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModuloData(')
          ..write('modId: $modId, ')
          ..write('modNombre: $modNombre, ')
          ..write('usrIdExt: $usrIdExt, ')
          ..write('almId: $almId, ')
          ..write('almNombre: $almNombre, ')
          ..write('empId: $empId, ')
          ..write('selected: $selected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    modId,
    modNombre,
    usrIdExt,
    almId,
    almNombre,
    empId,
    selected,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModuloData &&
          other.modId == this.modId &&
          other.modNombre == this.modNombre &&
          other.usrIdExt == this.usrIdExt &&
          other.almId == this.almId &&
          other.almNombre == this.almNombre &&
          other.empId == this.empId &&
          other.selected == this.selected);
}

class ModuloCompanion extends UpdateCompanion<ModuloData> {
  final Value<int> modId;
  final Value<String> modNombre;
  final Value<String> usrIdExt;
  final Value<int> almId;
  final Value<String> almNombre;
  final Value<int> empId;
  final Value<bool> selected;
  final Value<int> rowid;
  const ModuloCompanion({
    this.modId = const Value.absent(),
    this.modNombre = const Value.absent(),
    this.usrIdExt = const Value.absent(),
    this.almId = const Value.absent(),
    this.almNombre = const Value.absent(),
    this.empId = const Value.absent(),
    this.selected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ModuloCompanion.insert({
    required int modId,
    required String modNombre,
    required String usrIdExt,
    required int almId,
    required String almNombre,
    required int empId,
    this.selected = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : modId = Value(modId),
       modNombre = Value(modNombre),
       usrIdExt = Value(usrIdExt),
       almId = Value(almId),
       almNombre = Value(almNombre),
       empId = Value(empId);
  static Insertable<ModuloData> custom({
    Expression<int>? modId,
    Expression<String>? modNombre,
    Expression<String>? usrIdExt,
    Expression<int>? almId,
    Expression<String>? almNombre,
    Expression<int>? empId,
    Expression<bool>? selected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (modId != null) 'mod_id': modId,
      if (modNombre != null) 'mod_nombre': modNombre,
      if (usrIdExt != null) 'usr_id_ext': usrIdExt,
      if (almId != null) 'alm_id': almId,
      if (almNombre != null) 'alm_nombre': almNombre,
      if (empId != null) 'emp_id': empId,
      if (selected != null) 'selected': selected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ModuloCompanion copyWith({
    Value<int>? modId,
    Value<String>? modNombre,
    Value<String>? usrIdExt,
    Value<int>? almId,
    Value<String>? almNombre,
    Value<int>? empId,
    Value<bool>? selected,
    Value<int>? rowid,
  }) {
    return ModuloCompanion(
      modId: modId ?? this.modId,
      modNombre: modNombre ?? this.modNombre,
      usrIdExt: usrIdExt ?? this.usrIdExt,
      almId: almId ?? this.almId,
      almNombre: almNombre ?? this.almNombre,
      empId: empId ?? this.empId,
      selected: selected ?? this.selected,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (modId.present) {
      map['mod_id'] = Variable<int>(modId.value);
    }
    if (modNombre.present) {
      map['mod_nombre'] = Variable<String>(modNombre.value);
    }
    if (usrIdExt.present) {
      map['usr_id_ext'] = Variable<String>(usrIdExt.value);
    }
    if (almId.present) {
      map['alm_id'] = Variable<int>(almId.value);
    }
    if (almNombre.present) {
      map['alm_nombre'] = Variable<String>(almNombre.value);
    }
    if (empId.present) {
      map['emp_id'] = Variable<int>(empId.value);
    }
    if (selected.present) {
      map['selected'] = Variable<bool>(selected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModuloCompanion(')
          ..write('modId: $modId, ')
          ..write('modNombre: $modNombre, ')
          ..write('usrIdExt: $usrIdExt, ')
          ..write('almId: $almId, ')
          ..write('almNombre: $almNombre, ')
          ..write('empId: $empId, ')
          ..write('selected: $selected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EmpresaTable empresa = $EmpresaTable(this);
  late final $ModuloTable modulo = $ModuloTable(this);
  late final UsuarioDao usuarioDao = UsuarioDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [empresa, modulo];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'empresa',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('modulo', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$EmpresaTableCreateCompanionBuilder = EmpresaCompanion Function({
  Value<int> empId,
  required String empNombre,
  required String usrNombre,
  required String usrCodigo,
});
typedef $$EmpresaTableUpdateCompanionBuilder = EmpresaCompanion Function({
  Value<int> empId,
  Value<String> empNombre,
  Value<String> usrNombre,
  Value<String> usrCodigo,
});

final class $$EmpresaTableReferences
    extends BaseReferences<_$AppDatabase, $EmpresaTable, EmpresaData> {
  $$EmpresaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ModuloTable, List<ModuloData>> _moduloRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.modulo,
    aliasName: 'empresa__emp_id__modulo__emp_id',
  );

  $$ModuloTableProcessedTableManager get moduloRefs {
    final manager = $$ModuloTableTableManager(
      $_db,
      $_db.modulo,
    ).filter((f) => f.empId.empId.sqlEquals($_itemColumn<int>('emp_id')!));

    final cache = $_typedResult.readTableOrNull(_moduloRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EmpresaTableFilterComposer
    extends Composer<_$AppDatabase, $EmpresaTable> {
  $$EmpresaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get empId => $composableBuilder(
    column: $table.empId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get empNombre => $composableBuilder(
    column: $table.empNombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usrNombre => $composableBuilder(
    column: $table.usrNombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usrCodigo => $composableBuilder(
    column: $table.usrCodigo,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> moduloRefs(
    Expression<bool> Function($$ModuloTableFilterComposer f) f,
  ) {
    final $$ModuloTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.empId,
      referencedTable: $db.modulo,
      getReferencedColumn: (t) => t.empId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModuloTableFilterComposer(
            $db: $db,
            $table: $db.modulo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmpresaTableOrderingComposer
    extends Composer<_$AppDatabase, $EmpresaTable> {
  $$EmpresaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get empId => $composableBuilder(
    column: $table.empId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get empNombre => $composableBuilder(
    column: $table.empNombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usrNombre => $composableBuilder(
    column: $table.usrNombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usrCodigo => $composableBuilder(
    column: $table.usrCodigo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmpresaTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmpresaTable> {
  $$EmpresaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get empId =>
      $composableBuilder(column: $table.empId, builder: (column) => column);

  GeneratedColumn<String> get empNombre =>
      $composableBuilder(column: $table.empNombre, builder: (column) => column);

  GeneratedColumn<String> get usrNombre =>
      $composableBuilder(column: $table.usrNombre, builder: (column) => column);

  GeneratedColumn<String> get usrCodigo =>
      $composableBuilder(column: $table.usrCodigo, builder: (column) => column);

  Expression<T> moduloRefs<T extends Object>(
    Expression<T> Function($$ModuloTableAnnotationComposer a) f,
  ) {
    final $$ModuloTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.empId,
      referencedTable: $db.modulo,
      getReferencedColumn: (t) => t.empId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModuloTableAnnotationComposer(
            $db: $db,
            $table: $db.modulo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmpresaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmpresaTable,
          EmpresaData,
          $$EmpresaTableFilterComposer,
          $$EmpresaTableOrderingComposer,
          $$EmpresaTableAnnotationComposer,
          $$EmpresaTableCreateCompanionBuilder,
          $$EmpresaTableUpdateCompanionBuilder,
          (EmpresaData, $$EmpresaTableReferences),
          EmpresaData,
          PrefetchHooks Function({bool moduloRefs})
        > {
  $$EmpresaTableTableManager(_$AppDatabase db, $EmpresaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmpresaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmpresaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmpresaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> empId = const Value.absent(),
                Value<String> empNombre = const Value.absent(),
                Value<String> usrNombre = const Value.absent(),
                Value<String> usrCodigo = const Value.absent(),
              }) => EmpresaCompanion(
                empId: empId,
                empNombre: empNombre,
                usrNombre: usrNombre,
                usrCodigo: usrCodigo,
              ),
          createCompanionCallback:
              ({
                Value<int> empId = const Value.absent(),
                required String empNombre,
                required String usrNombre,
                required String usrCodigo,
              }) => EmpresaCompanion.insert(
                empId: empId,
                empNombre: empNombre,
                usrNombre: usrNombre,
                usrCodigo: usrCodigo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EmpresaTable, EmpresaData>(table),
                  $$EmpresaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({moduloRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (moduloRefs) db.modulo],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (moduloRefs)
                    await $_getPrefetchedDataByColumns<
                      EmpresaData,
                      $EmpresaTable,
                      ModuloData,
                      $ModuloTable
                    >(
                      currentTable: table,
                      referencedTable: $$EmpresaTableReferences
                          ._moduloRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EmpresaTableReferences(db, table, p0).moduloRefs,
                      currentColumn: 'emp_id',
                      referencedColumn: 'emp_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EmpresaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmpresaTable,
      EmpresaData,
      $$EmpresaTableFilterComposer,
      $$EmpresaTableOrderingComposer,
      $$EmpresaTableAnnotationComposer,
      $$EmpresaTableCreateCompanionBuilder,
      $$EmpresaTableUpdateCompanionBuilder,
      (EmpresaData, $$EmpresaTableReferences),
      EmpresaData,
      PrefetchHooks Function({bool moduloRefs})
    >;
typedef $$ModuloTableCreateCompanionBuilder = ModuloCompanion Function({
  required int modId,
  required String modNombre,
  required String usrIdExt,
  required int almId,
  required String almNombre,
  required int empId,
  Value<bool> selected,
  Value<int> rowid,
});
typedef $$ModuloTableUpdateCompanionBuilder = ModuloCompanion Function({
  Value<int> modId,
  Value<String> modNombre,
  Value<String> usrIdExt,
  Value<int> almId,
  Value<String> almNombre,
  Value<int> empId,
  Value<bool> selected,
  Value<int> rowid,
});

final class $$ModuloTableReferences
    extends BaseReferences<_$AppDatabase, $ModuloTable, ModuloData> {
  $$ModuloTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmpresaTable _empIdTable(_$AppDatabase db) =>
      db.empresa.createAlias('modulo__emp_id__empresa__emp_id');

  $$EmpresaTableProcessedTableManager get empId {
    final $_column = $_itemColumn<int>('emp_id')!;

    final manager = $$EmpresaTableTableManager(
      $_db,
      $_db.empresa,
    ).filter((f) => f.empId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_empIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ModuloTableFilterComposer
    extends Composer<_$AppDatabase, $ModuloTable> {
  $$ModuloTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get modId => $composableBuilder(
    column: $table.modId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modNombre => $composableBuilder(
    column: $table.modNombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usrIdExt => $composableBuilder(
    column: $table.usrIdExt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get almId => $composableBuilder(
    column: $table.almId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get almNombre => $composableBuilder(
    column: $table.almNombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get selected => $composableBuilder(
    column: $table.selected,
    builder: (column) => ColumnFilters(column),
  );

  $$EmpresaTableFilterComposer get empId {
    final $$EmpresaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.empId,
      referencedTable: $db.empresa,
      getReferencedColumn: (t) => t.empId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpresaTableFilterComposer(
            $db: $db,
            $table: $db.empresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModuloTableOrderingComposer
    extends Composer<_$AppDatabase, $ModuloTable> {
  $$ModuloTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get modId => $composableBuilder(
    column: $table.modId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modNombre => $composableBuilder(
    column: $table.modNombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usrIdExt => $composableBuilder(
    column: $table.usrIdExt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get almId => $composableBuilder(
    column: $table.almId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get almNombre => $composableBuilder(
    column: $table.almNombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get selected => $composableBuilder(
    column: $table.selected,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmpresaTableOrderingComposer get empId {
    final $$EmpresaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.empId,
      referencedTable: $db.empresa,
      getReferencedColumn: (t) => t.empId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpresaTableOrderingComposer(
            $db: $db,
            $table: $db.empresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModuloTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModuloTable> {
  $$ModuloTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get modId =>
      $composableBuilder(column: $table.modId, builder: (column) => column);

  GeneratedColumn<String> get modNombre =>
      $composableBuilder(column: $table.modNombre, builder: (column) => column);

  GeneratedColumn<String> get usrIdExt =>
      $composableBuilder(column: $table.usrIdExt, builder: (column) => column);

  GeneratedColumn<int> get almId =>
      $composableBuilder(column: $table.almId, builder: (column) => column);

  GeneratedColumn<String> get almNombre =>
      $composableBuilder(column: $table.almNombre, builder: (column) => column);

  GeneratedColumn<bool> get selected =>
      $composableBuilder(column: $table.selected, builder: (column) => column);

  $$EmpresaTableAnnotationComposer get empId {
    final $$EmpresaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.empId,
      referencedTable: $db.empresa,
      getReferencedColumn: (t) => t.empId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpresaTableAnnotationComposer(
            $db: $db,
            $table: $db.empresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModuloTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ModuloTable,
          ModuloData,
          $$ModuloTableFilterComposer,
          $$ModuloTableOrderingComposer,
          $$ModuloTableAnnotationComposer,
          $$ModuloTableCreateCompanionBuilder,
          $$ModuloTableUpdateCompanionBuilder,
          (ModuloData, $$ModuloTableReferences),
          ModuloData,
          PrefetchHooks Function({bool empId})
        > {
  $$ModuloTableTableManager(_$AppDatabase db, $ModuloTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModuloTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModuloTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModuloTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> modId = const Value.absent(),
                Value<String> modNombre = const Value.absent(),
                Value<String> usrIdExt = const Value.absent(),
                Value<int> almId = const Value.absent(),
                Value<String> almNombre = const Value.absent(),
                Value<int> empId = const Value.absent(),
                Value<bool> selected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModuloCompanion(
                modId: modId,
                modNombre: modNombre,
                usrIdExt: usrIdExt,
                almId: almId,
                almNombre: almNombre,
                empId: empId,
                selected: selected,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int modId,
                required String modNombre,
                required String usrIdExt,
                required int almId,
                required String almNombre,
                required int empId,
                Value<bool> selected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModuloCompanion.insert(
                modId: modId,
                modNombre: modNombre,
                usrIdExt: usrIdExt,
                almId: almId,
                almNombre: almNombre,
                empId: empId,
                selected: selected,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ModuloTable, ModuloData>(table),
                  $$ModuloTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({empId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (empId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.empId,
                        referencedTable: $$ModuloTableReferences._empIdTable(
                          db,
                        ),
                        referencedColumn: $$ModuloTableReferences
                            ._empIdTable(db)
                            .empId,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ModuloTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ModuloTable,
      ModuloData,
      $$ModuloTableFilterComposer,
      $$ModuloTableOrderingComposer,
      $$ModuloTableAnnotationComposer,
      $$ModuloTableCreateCompanionBuilder,
      $$ModuloTableUpdateCompanionBuilder,
      (ModuloData, $$ModuloTableReferences),
      ModuloData,
      PrefetchHooks Function({bool empId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EmpresaTableTableManager get empresa =>
      $$EmpresaTableTableManager(_db, _db.empresa);
  $$ModuloTableTableManager get modulo =>
      $$ModuloTableTableManager(_db, _db.modulo);
}
