// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vinculo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVinculoCollection on Isar {
  IsarCollection<Vinculo> get vinculos => this.collection();
}

const VinculoSchema = CollectionSchema(
  name: r'Vinculo',
  id: -1438854650140950795,
  properties: {
    r'casaId': PropertySchema(
      id: 0,
      name: r'casaId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'fim': PropertySchema(
      id: 2,
      name: r'fim',
      type: IsarType.dateTime,
    ),
    r'imobiliariaId': PropertySchema(
      id: 3,
      name: r'imobiliariaId',
      type: IsarType.long,
    ),
    r'inicio': PropertySchema(
      id: 4,
      name: r'inicio',
      type: IsarType.dateTime,
    ),
    r'locatarioId': PropertySchema(
      id: 5,
      name: r'locatarioId',
      type: IsarType.long,
    ),
    r'taxaPercent': PropertySchema(
      id: 6,
      name: r'taxaPercent',
      type: IsarType.double,
    ),
    r'taxaValor': PropertySchema(
      id: 7,
      name: r'taxaValor',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'valorAluguel': PropertySchema(
      id: 9,
      name: r'valorAluguel',
      type: IsarType.double,
    )
  },
  estimateSize: _vinculoEstimateSize,
  serialize: _vinculoSerialize,
  deserialize: _vinculoDeserialize,
  deserializeProp: _vinculoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vinculoGetId,
  getLinks: _vinculoGetLinks,
  attach: _vinculoAttach,
  version: '3.1.0+1',
);

int _vinculoEstimateSize(
  Vinculo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _vinculoSerialize(
  Vinculo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.casaId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.fim);
  writer.writeLong(offsets[3], object.imobiliariaId);
  writer.writeDateTime(offsets[4], object.inicio);
  writer.writeLong(offsets[5], object.locatarioId);
  writer.writeDouble(offsets[6], object.taxaPercent);
  writer.writeDouble(offsets[7], object.taxaValor);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeDouble(offsets[9], object.valorAluguel);
}

Vinculo _vinculoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Vinculo();
  object.casaId = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.fim = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.imobiliariaId = reader.readLong(offsets[3]);
  object.inicio = reader.readDateTime(offsets[4]);
  object.locatarioId = reader.readLong(offsets[5]);
  object.taxaPercent = reader.readDoubleOrNull(offsets[6]);
  object.taxaValor = reader.readDoubleOrNull(offsets[7]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[8]);
  object.valorAluguel = reader.readDoubleOrNull(offsets[9]);
  return object;
}

P _vinculoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vinculoGetId(Vinculo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vinculoGetLinks(Vinculo object) {
  return [];
}

void _vinculoAttach(IsarCollection<dynamic> col, Id id, Vinculo object) {
  object.id = id;
}

extension VinculoQueryWhereSort on QueryBuilder<Vinculo, Vinculo, QWhere> {
  QueryBuilder<Vinculo, Vinculo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VinculoQueryWhere on QueryBuilder<Vinculo, Vinculo, QWhereClause> {
  QueryBuilder<Vinculo, Vinculo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Vinculo, Vinculo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterWhereClause> idBetween(
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

extension VinculoQueryFilter
    on QueryBuilder<Vinculo, Vinculo, QFilterCondition> {
  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> casaIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'casaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> casaIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'casaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> casaIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'casaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> casaIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'casaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> fimIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fim',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> fimIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fim',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> fimEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fim',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> fimGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fim',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> fimLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fim',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> fimBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fim',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> imobiliariaIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imobiliariaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition>
      imobiliariaIdGreaterThan(
    int value, {
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> imobiliariaIdLessThan(
    int value, {
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> imobiliariaIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> inicioEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> inicioGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> inicioLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> inicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> locatarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locatarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> locatarioIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locatarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> locatarioIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locatarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> locatarioIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locatarioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxaPercent',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxaPercent',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaPercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxaPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaPercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxaPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaPercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxaPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaPercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxaPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaValorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxaValor',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaValorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxaValor',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaValorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxaValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaValorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxaValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaValorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxaValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> taxaValorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxaValor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> valorAluguelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorAluguel',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition>
      valorAluguelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorAluguel',
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> valorAluguelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorAluguel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> valorAluguelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorAluguel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> valorAluguelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorAluguel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterFilterCondition> valorAluguelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorAluguel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VinculoQueryObject
    on QueryBuilder<Vinculo, Vinculo, QFilterCondition> {}

extension VinculoQueryLinks
    on QueryBuilder<Vinculo, Vinculo, QFilterCondition> {}

extension VinculoQuerySortBy on QueryBuilder<Vinculo, Vinculo, QSortBy> {
  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByCasaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'casaId', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByCasaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'casaId', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fim', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByFimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fim', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByImobiliariaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByImobiliariaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inicio', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inicio', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByLocatarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locatarioId', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByLocatarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locatarioId', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByTaxaPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaPercent', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByTaxaPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaPercent', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByTaxaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaValor', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByTaxaValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaValor', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> sortByValorAluguelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.desc);
    });
  }
}

extension VinculoQuerySortThenBy
    on QueryBuilder<Vinculo, Vinculo, QSortThenBy> {
  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByCasaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'casaId', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByCasaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'casaId', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fim', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByFimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fim', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByImobiliariaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByImobiliariaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imobiliariaId', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inicio', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inicio', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByLocatarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locatarioId', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByLocatarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locatarioId', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByTaxaPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaPercent', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByTaxaPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaPercent', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByTaxaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaValor', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByTaxaValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxaValor', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.asc);
    });
  }

  QueryBuilder<Vinculo, Vinculo, QAfterSortBy> thenByValorAluguelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.desc);
    });
  }
}

extension VinculoQueryWhereDistinct
    on QueryBuilder<Vinculo, Vinculo, QDistinct> {
  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByCasaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'casaId');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fim');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByImobiliariaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imobiliariaId');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inicio');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByLocatarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locatarioId');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByTaxaPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxaPercent');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByTaxaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxaValor');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Vinculo, Vinculo, QDistinct> distinctByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorAluguel');
    });
  }
}

extension VinculoQueryProperty
    on QueryBuilder<Vinculo, Vinculo, QQueryProperty> {
  QueryBuilder<Vinculo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Vinculo, int, QQueryOperations> casaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'casaId');
    });
  }

  QueryBuilder<Vinculo, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Vinculo, DateTime?, QQueryOperations> fimProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fim');
    });
  }

  QueryBuilder<Vinculo, int, QQueryOperations> imobiliariaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imobiliariaId');
    });
  }

  QueryBuilder<Vinculo, DateTime, QQueryOperations> inicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inicio');
    });
  }

  QueryBuilder<Vinculo, int, QQueryOperations> locatarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locatarioId');
    });
  }

  QueryBuilder<Vinculo, double?, QQueryOperations> taxaPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxaPercent');
    });
  }

  QueryBuilder<Vinculo, double?, QQueryOperations> taxaValorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxaValor');
    });
  }

  QueryBuilder<Vinculo, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Vinculo, double?, QQueryOperations> valorAluguelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorAluguel');
    });
  }
}
