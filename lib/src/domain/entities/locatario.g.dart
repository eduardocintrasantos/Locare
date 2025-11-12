// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locatario.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocatarioCollection on Isar {
  IsarCollection<Locatario> get locatarios => this.collection();
}

const LocatarioSchema = CollectionSchema(
  name: r'Locatario',
  id: -7929924801253318914,
  properties: {
    r'celular': PropertySchema(
      id: 0,
      name: r'celular',
      type: IsarType.string,
    ),
    r'cpf': PropertySchema(
      id: 1,
      name: r'cpf',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'fiadorCelular': PropertySchema(
      id: 3,
      name: r'fiadorCelular',
      type: IsarType.string,
    ),
    r'fiadorCpf': PropertySchema(
      id: 4,
      name: r'fiadorCpf',
      type: IsarType.string,
    ),
    r'fiadorNome': PropertySchema(
      id: 5,
      name: r'fiadorNome',
      type: IsarType.string,
    ),
    r'fiadorRg': PropertySchema(
      id: 6,
      name: r'fiadorRg',
      type: IsarType.string,
    ),
    r'fiadorTelefone': PropertySchema(
      id: 7,
      name: r'fiadorTelefone',
      type: IsarType.string,
    ),
    r'nome': PropertySchema(
      id: 8,
      name: r'nome',
      type: IsarType.string,
    ),
    r'rg': PropertySchema(
      id: 9,
      name: r'rg',
      type: IsarType.string,
    ),
    r'telefone': PropertySchema(
      id: 10,
      name: r'telefone',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _locatarioEstimateSize,
  serialize: _locatarioSerialize,
  deserialize: _locatarioDeserialize,
  deserializeProp: _locatarioDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _locatarioGetId,
  getLinks: _locatarioGetLinks,
  attach: _locatarioAttach,
  version: '3.1.0+1',
);

int _locatarioEstimateSize(
  Locatario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.celular;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cpf;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fiadorCelular;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fiadorCpf;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fiadorNome;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fiadorRg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fiadorTelefone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nome.length * 3;
  {
    final value = object.rg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telefone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _locatarioSerialize(
  Locatario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.celular);
  writer.writeString(offsets[1], object.cpf);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.fiadorCelular);
  writer.writeString(offsets[4], object.fiadorCpf);
  writer.writeString(offsets[5], object.fiadorNome);
  writer.writeString(offsets[6], object.fiadorRg);
  writer.writeString(offsets[7], object.fiadorTelefone);
  writer.writeString(offsets[8], object.nome);
  writer.writeString(offsets[9], object.rg);
  writer.writeString(offsets[10], object.telefone);
  writer.writeDateTime(offsets[11], object.updatedAt);
}

Locatario _locatarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Locatario();
  object.celular = reader.readStringOrNull(offsets[0]);
  object.cpf = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.fiadorCelular = reader.readStringOrNull(offsets[3]);
  object.fiadorCpf = reader.readStringOrNull(offsets[4]);
  object.fiadorNome = reader.readStringOrNull(offsets[5]);
  object.fiadorRg = reader.readStringOrNull(offsets[6]);
  object.fiadorTelefone = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.nome = reader.readString(offsets[8]);
  object.rg = reader.readStringOrNull(offsets[9]);
  object.telefone = reader.readStringOrNull(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  return object;
}

P _locatarioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _locatarioGetId(Locatario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locatarioGetLinks(Locatario object) {
  return [];
}

void _locatarioAttach(IsarCollection<dynamic> col, Id id, Locatario object) {
  object.id = id;
}

extension LocatarioQueryWhereSort
    on QueryBuilder<Locatario, Locatario, QWhere> {
  QueryBuilder<Locatario, Locatario, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocatarioQueryWhere
    on QueryBuilder<Locatario, Locatario, QWhereClause> {
  QueryBuilder<Locatario, Locatario, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocatarioQueryFilter
    on QueryBuilder<Locatario, Locatario, QFilterCondition> {
  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'celular',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'celular',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'celular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'celular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'celular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'celular',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'celular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'celular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'celular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'celular',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> celularIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'celular',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      celularIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'celular',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cpf',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cpf',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cpf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cpf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpf',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> cpfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cpf',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiadorCelular',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiadorCelular',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorCelular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiadorCelular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiadorCelular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiadorCelular',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fiadorCelular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fiadorCelular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fiadorCelular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fiadorCelular',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorCelular',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCelularIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fiadorCelular',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiadorCpf',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCpfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiadorCpf',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorCpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCpfGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiadorCpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiadorCpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiadorCpf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fiadorCpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fiadorCpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fiadorCpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fiadorCpf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorCpfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorCpf',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorCpfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fiadorCpf',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiadorNome',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorNomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiadorNome',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorNomeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiadorNome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorNomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fiadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fiadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fiadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorNomeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fiadorNome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorNomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorNome',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorNomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fiadorNome',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiadorRg',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorRgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiadorRg',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorRg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiadorRg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiadorRg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiadorRg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fiadorRg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fiadorRg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fiadorRg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fiadorRg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> fiadorRgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorRg',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorRgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fiadorRg',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiadorTelefone',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiadorTelefone',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorTelefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiadorTelefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiadorTelefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiadorTelefone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fiadorTelefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fiadorTelefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fiadorTelefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fiadorTelefone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiadorTelefone',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      fiadorTelefoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fiadorTelefone',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rg',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rg',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rg',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> rgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rg',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefone',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      telefoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefone',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> telefoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefone',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      telefoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefone',
        value: '',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocatarioQueryObject
    on QueryBuilder<Locatario, Locatario, QFilterCondition> {}

extension LocatarioQueryLinks
    on QueryBuilder<Locatario, Locatario, QFilterCondition> {}

extension LocatarioQuerySortBy on QueryBuilder<Locatario, Locatario, QSortBy> {
  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByCelular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celular', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByCelularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celular', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByCpf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByCpfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorCelular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCelular', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorCelularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCelular', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorCpf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCpf', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorCpfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCpf', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorNome', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorNome', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorRg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorRg', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorRgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorRg', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorTelefone', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByFiadorTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorTelefone', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByRg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rg', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByRgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rg', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocatarioQuerySortThenBy
    on QueryBuilder<Locatario, Locatario, QSortThenBy> {
  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByCelular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celular', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByCelularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celular', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByCpf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByCpfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorCelular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCelular', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorCelularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCelular', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorCpf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCpf', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorCpfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorCpf', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorNome', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorNome', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorRg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorRg', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorRgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorRg', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorTelefone', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByFiadorTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiadorTelefone', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByRg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rg', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByRgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rg', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.desc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Locatario, Locatario, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocatarioQueryWhereDistinct
    on QueryBuilder<Locatario, Locatario, QDistinct> {
  QueryBuilder<Locatario, Locatario, QDistinct> distinctByCelular(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'celular', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByCpf(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cpf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByFiadorCelular(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiadorCelular',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByFiadorCpf(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiadorCpf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByFiadorNome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiadorNome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByFiadorRg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiadorRg', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByFiadorTelefone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiadorTelefone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByNome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByRg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rg', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByTelefone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Locatario, Locatario, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LocatarioQueryProperty
    on QueryBuilder<Locatario, Locatario, QQueryProperty> {
  QueryBuilder<Locatario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> celularProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'celular');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> cpfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cpf');
    });
  }

  QueryBuilder<Locatario, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> fiadorCelularProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiadorCelular');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> fiadorCpfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiadorCpf');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> fiadorNomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiadorNome');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> fiadorRgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiadorRg');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> fiadorTelefoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiadorTelefone');
    });
  }

  QueryBuilder<Locatario, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> rgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rg');
    });
  }

  QueryBuilder<Locatario, String?, QQueryOperations> telefoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefone');
    });
  }

  QueryBuilder<Locatario, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
