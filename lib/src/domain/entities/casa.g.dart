// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCasaCollection on Isar {
  IsarCollection<Casa> get casas => this.collection();
}

const CasaSchema = CollectionSchema(
  name: r'Casa',
  id: -2282036825283923974,
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
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'descricao': PropertySchema(
      id: 3,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'imobiliariaId': PropertySchema(
      id: 4,
      name: r'imobiliariaId',
      type: IsarType.long,
    ),
    r'numero': PropertySchema(
      id: 5,
      name: r'numero',
      type: IsarType.string,
    ),
    r'rua': PropertySchema(
      id: 6,
      name: r'rua',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _casaEstimateSize,
  serialize: _casaSerialize,
  deserialize: _casaDeserialize,
  deserializeProp: _casaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _casaGetId,
  getLinks: _casaGetLinks,
  attach: _casaAttach,
  version: '3.1.0+1',
);

int _casaEstimateSize(
  Casa object,
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
  bytesCount += 3 + object.descricao.length * 3;
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
  return bytesCount;
}

void _casaSerialize(
  Casa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bairro);
  writer.writeString(offsets[1], object.cep);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.descricao);
  writer.writeLong(offsets[4], object.imobiliariaId);
  writer.writeString(offsets[5], object.numero);
  writer.writeString(offsets[6], object.rua);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

Casa _casaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Casa();
  object.bairro = reader.readStringOrNull(offsets[0]);
  object.cep = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.descricao = reader.readString(offsets[3]);
  object.id = id;
  object.imobiliariaId = reader.readLongOrNull(offsets[4]);
  object.numero = reader.readStringOrNull(offsets[5]);
  object.rua = reader.readStringOrNull(offsets[6]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _casaDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _casaGetId(Casa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _casaGetLinks(Casa object) {
  return [];
}

void _casaAttach(IsarCollection<dynamic> col, Id id, Casa object) {
  object.id = id;
}

extension CasaQueryWhereSort on QueryBuilder<Casa, Casa, QWhere> {
  QueryBuilder<Casa, Casa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CasaQueryWhere on QueryBuilder<Casa, Casa, QWhereClause> {
  QueryBuilder<Casa, Casa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Casa, Casa, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Casa, Casa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Casa, Casa, QAfterWhereClause> idBetween(
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

extension CasaQueryFilter on QueryBuilder<Casa, Casa, QFilterCondition> {
  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroEqualTo(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroBetween(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroStartsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroEndsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bairro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> bairroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cep',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cep',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepEqualTo(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepBetween(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepStartsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepEndsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cep',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cep',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> cepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cep',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> imobiliariaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imobiliariaId',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> imobiliariaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imobiliariaId',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> imobiliariaIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imobiliariaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> imobiliariaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imobiliariaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> imobiliariaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imobiliariaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> imobiliariaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imobiliariaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numero',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numero',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroEqualTo(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroBetween(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroStartsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroEndsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numero',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> numeroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numero',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rua',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rua',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaEqualTo(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaBetween(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaStartsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaEndsWith(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rua',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> ruaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Casa, Casa, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Casa, Casa, QAfterFilterCondition> updatedAtBetween(
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

extension CasaQueryObject on QueryBuilder<Casa, Casa, QFilterCondition> {}

extension CasaQueryLinks on QueryBuilder<Casa, Casa, QFilterCondition> {}

extension CasaQuerySortBy on QueryBuilder<Casa, Casa, QSortBy> {
  QueryBuilder<Casa, Casa, QAfterSortBy> sortByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByCep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByCepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByImobiliariaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByImobiliariaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CasaQuerySortThenBy on QueryBuilder<Casa, Casa, QSortThenBy> {
  QueryBuilder<Casa, Casa, QAfterSortBy> thenByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByCep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByCepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByImobiliariaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByImobiliariaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Casa, Casa, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CasaQueryWhereDistinct on QueryBuilder<Casa, Casa, QDistinct> {
  QueryBuilder<Casa, Casa, QDistinct> distinctByBairro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bairro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByCep(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cep', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByImobiliariaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imobiliariaId');
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByNumero(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numero', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByRua(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rua', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Casa, Casa, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension CasaQueryProperty on QueryBuilder<Casa, Casa, QQueryProperty> {
  QueryBuilder<Casa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Casa, String?, QQueryOperations> bairroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bairro');
    });
  }

  QueryBuilder<Casa, String?, QQueryOperations> cepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cep');
    });
  }

  QueryBuilder<Casa, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Casa, String, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<Casa, int?, QQueryOperations> imobiliariaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imobiliariaId');
    });
  }

  QueryBuilder<Casa, String?, QQueryOperations> numeroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numero');
    });
  }

  QueryBuilder<Casa, String?, QQueryOperations> ruaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rua');
    });
  }

  QueryBuilder<Casa, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
