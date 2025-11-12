// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imobiliaria.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetImobiliariaCollection on Isar {
  IsarCollection<Imobiliaria> get imobiliarias => this.collection();
}

const ImobiliariaSchema = CollectionSchema(
  name: r'Imobiliaria',
  id: -7428366815284365507,
  properties: {
    r'bairro': PropertySchema(
      id: 0,
      name: r'bairro',
      type: IsarType.string,
    ),
    r'cep': PropertySchema(
      id: 1,
      name: r'cep',
      type: IsarType.string,
    ),
    r'cnpj': PropertySchema(
      id: 2,
      name: r'cnpj',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'nome': PropertySchema(
      id: 4,
      name: r'nome',
      type: IsarType.string,
    ),
    r'nomeContato': PropertySchema(
      id: 5,
      name: r'nomeContato',
      type: IsarType.string,
    ),
    r'numero': PropertySchema(
      id: 6,
      name: r'numero',
      type: IsarType.string,
    ),
    r'rua': PropertySchema(
      id: 7,
      name: r'rua',
      type: IsarType.string,
    ),
    r'telefone': PropertySchema(
      id: 8,
      name: r'telefone',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _imobiliariaEstimateSize,
  serialize: _imobiliariaSerialize,
  deserialize: _imobiliariaDeserialize,
  deserializeProp: _imobiliariaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _imobiliariaGetId,
  getLinks: _imobiliariaGetLinks,
  attach: _imobiliariaAttach,
  version: '3.1.0+1',
);

int _imobiliariaEstimateSize(
  Imobiliaria object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bairro;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cep;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cnpj;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nome.length * 3;
  {
    final value = object.nomeContato;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numero;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rua;
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

void _imobiliariaSerialize(
  Imobiliaria object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bairro);
  writer.writeString(offsets[1], object.cep);
  writer.writeString(offsets[2], object.cnpj);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.nome);
  writer.writeString(offsets[5], object.nomeContato);
  writer.writeString(offsets[6], object.numero);
  writer.writeString(offsets[7], object.rua);
  writer.writeString(offsets[8], object.telefone);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

Imobiliaria _imobiliariaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Imobiliaria();
  object.bairro = reader.readStringOrNull(offsets[0]);
  object.cep = reader.readStringOrNull(offsets[1]);
  object.cnpj = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.nome = reader.readString(offsets[4]);
  object.nomeContato = reader.readStringOrNull(offsets[5]);
  object.numero = reader.readStringOrNull(offsets[6]);
  object.rua = reader.readStringOrNull(offsets[7]);
  object.telefone = reader.readStringOrNull(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _imobiliariaDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _imobiliariaGetId(Imobiliaria object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _imobiliariaGetLinks(Imobiliaria object) {
  return [];
}

void _imobiliariaAttach(
    IsarCollection<dynamic> col, Id id, Imobiliaria object) {
  object.id = id;
}

extension ImobiliariaQueryWhereSort
    on QueryBuilder<Imobiliaria, Imobiliaria, QWhere> {
  QueryBuilder<Imobiliaria, Imobiliaria, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImobiliariaQueryWhere
    on QueryBuilder<Imobiliaria, Imobiliaria, QWhereClause> {
  QueryBuilder<Imobiliaria, Imobiliaria, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterWhereClause> idBetween(
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

extension ImobiliariaQueryFilter
    on QueryBuilder<Imobiliaria, Imobiliaria, QFilterCondition> {
  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      bairroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      bairroGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bairro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      bairroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> bairroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bairro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      bairroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      bairroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cep',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cep',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cep',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cep',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      cepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cep',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cnpj',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      cnpjIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cnpj',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cnpj',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cnpj',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> cnpjIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      cnpjIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeEqualTo(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeGreaterThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeLessThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeBetween(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeStartsWith(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeEndsWith(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeContains(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeMatches(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nomeContato',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nomeContato',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nomeContato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nomeContato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nomeContato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nomeContato',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nomeContato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nomeContato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nomeContato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nomeContato',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nomeContato',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      nomeContatoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nomeContato',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numero',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      numeroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numero',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      numeroGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numero',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      numeroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> numeroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numero',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      numeroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      numeroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numero',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rua',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rua',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rua',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rua',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> ruaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      ruaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefone',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefone',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> telefoneEqualTo(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneGreaterThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneLessThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> telefoneBetween(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneStartsWith(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneEndsWith(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition> telefoneMatches(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefone',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      telefoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefone',
        value: '',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterFilterCondition>
      updatedAtBetween(
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

extension ImobiliariaQueryObject
    on QueryBuilder<Imobiliaria, Imobiliaria, QFilterCondition> {}

extension ImobiliariaQueryLinks
    on QueryBuilder<Imobiliaria, Imobiliaria, QFilterCondition> {}

extension ImobiliariaQuerySortBy
    on QueryBuilder<Imobiliaria, Imobiliaria, QSortBy> {
  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByCep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByCepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByCnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByCnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByNomeContato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeContato', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByNomeContatoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeContato', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ImobiliariaQuerySortThenBy
    on QueryBuilder<Imobiliaria, Imobiliaria, QSortThenBy> {
  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByCep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByCepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByCnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByCnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByNomeContato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeContato', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByNomeContatoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeContato', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.desc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ImobiliariaQueryWhereDistinct
    on QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> {
  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByBairro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bairro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByCep(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cep', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByCnpj(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cnpj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByNome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByNomeContato(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nomeContato', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByNumero(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numero', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByRua(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rua', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByTelefone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Imobiliaria, Imobiliaria, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ImobiliariaQueryProperty
    on QueryBuilder<Imobiliaria, Imobiliaria, QQueryProperty> {
  QueryBuilder<Imobiliaria, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> bairroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bairro');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> cepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cep');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> cnpjProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cnpj');
    });
  }

  QueryBuilder<Imobiliaria, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Imobiliaria, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> nomeContatoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomeContato');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> numeroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numero');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> ruaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rua');
    });
  }

  QueryBuilder<Imobiliaria, String?, QQueryOperations> telefoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefone');
    });
  }

  QueryBuilder<Imobiliaria, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
