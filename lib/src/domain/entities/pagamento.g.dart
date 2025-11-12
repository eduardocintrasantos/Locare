// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPagamentoCollection on Isar {
  IsarCollection<Pagamento> get pagamentos => this.collection();
}

const PagamentoSchema = CollectionSchema(
  name: r'Pagamento',
  id: 8623451737080573641,
  properties: {
    r'ano': PropertySchema(
      id: 0,
      name: r'ano',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'mes': PropertySchema(
      id: 2,
      name: r'mes',
      type: IsarType.long,
    ),
    r'recebido': PropertySchema(
      id: 3,
      name: r'recebido',
      type: IsarType.bool,
    ),
    r'recebidoEm': PropertySchema(
      id: 4,
      name: r'recebidoEm',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vinculoId': PropertySchema(
      id: 6,
      name: r'vinculoId',
      type: IsarType.long,
    )
  },
  estimateSize: _pagamentoEstimateSize,
  serialize: _pagamentoSerialize,
  deserialize: _pagamentoDeserialize,
  deserializeProp: _pagamentoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pagamentoGetId,
  getLinks: _pagamentoGetLinks,
  attach: _pagamentoAttach,
  version: '3.1.0+1',
);

int _pagamentoEstimateSize(
  Pagamento object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pagamentoSerialize(
  Pagamento object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ano);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.mes);
  writer.writeBool(offsets[3], object.recebido);
  writer.writeDateTime(offsets[4], object.recebidoEm);
  writer.writeDateTime(offsets[5], object.updatedAt);
  writer.writeLong(offsets[6], object.vinculoId);
}

Pagamento _pagamentoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pagamento();
  object.ano = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.mes = reader.readLong(offsets[2]);
  object.recebido = reader.readBool(offsets[3]);
  object.recebidoEm = reader.readDateTimeOrNull(offsets[4]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[5]);
  object.vinculoId = reader.readLong(offsets[6]);
  return object;
}

P _pagamentoDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pagamentoGetId(Pagamento object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pagamentoGetLinks(Pagamento object) {
  return [];
}

void _pagamentoAttach(IsarCollection<dynamic> col, Id id, Pagamento object) {
  object.id = id;
}

extension PagamentoQueryWhereSort
    on QueryBuilder<Pagamento, Pagamento, QWhere> {
  QueryBuilder<Pagamento, Pagamento, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PagamentoQueryWhere
    on QueryBuilder<Pagamento, Pagamento, QWhereClause> {
  QueryBuilder<Pagamento, Pagamento, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pagamento, Pagamento, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterWhereClause> idBetween(
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

extension PagamentoQueryFilter
    on QueryBuilder<Pagamento, Pagamento, QFilterCondition> {
  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> anoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ano',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> anoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ano',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> anoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ano',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> anoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ano',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition>
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> mesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mes',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> mesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mes',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> mesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mes',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> mesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> recebidoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recebido',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> recebidoEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recebidoEm',
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition>
      recebidoEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recebidoEm',
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> recebidoEmEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recebidoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition>
      recebidoEmGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recebidoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> recebidoEmLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recebidoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> recebidoEmBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recebidoEm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition>
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> vinculoIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vinculoId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition>
      vinculoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vinculoId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> vinculoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vinculoId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterFilterCondition> vinculoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vinculoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PagamentoQueryObject
    on QueryBuilder<Pagamento, Pagamento, QFilterCondition> {}

extension PagamentoQueryLinks
    on QueryBuilder<Pagamento, Pagamento, QFilterCondition> {}

extension PagamentoQuerySortBy on QueryBuilder<Pagamento, Pagamento, QSortBy> {
  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByRecebido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebido', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByRecebidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebido', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByRecebidoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebidoEm', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByRecebidoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebidoEm', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByVinculoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vinculoId', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> sortByVinculoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vinculoId', Sort.desc);
    });
  }
}

extension PagamentoQuerySortThenBy
    on QueryBuilder<Pagamento, Pagamento, QSortThenBy> {
  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByRecebido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebido', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByRecebidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebido', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByRecebidoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebidoEm', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByRecebidoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recebidoEm', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByVinculoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vinculoId', Sort.asc);
    });
  }

  QueryBuilder<Pagamento, Pagamento, QAfterSortBy> thenByVinculoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vinculoId', Sort.desc);
    });
  }
}

extension PagamentoQueryWhereDistinct
    on QueryBuilder<Pagamento, Pagamento, QDistinct> {
  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ano');
    });
  }

  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mes');
    });
  }

  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByRecebido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recebido');
    });
  }

  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByRecebidoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recebidoEm');
    });
  }

  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Pagamento, Pagamento, QDistinct> distinctByVinculoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vinculoId');
    });
  }
}

extension PagamentoQueryProperty
    on QueryBuilder<Pagamento, Pagamento, QQueryProperty> {
  QueryBuilder<Pagamento, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pagamento, int, QQueryOperations> anoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ano');
    });
  }

  QueryBuilder<Pagamento, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Pagamento, int, QQueryOperations> mesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mes');
    });
  }

  QueryBuilder<Pagamento, bool, QQueryOperations> recebidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recebido');
    });
  }

  QueryBuilder<Pagamento, DateTime?, QQueryOperations> recebidoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recebidoEm');
    });
  }

  QueryBuilder<Pagamento, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Pagamento, int, QQueryOperations> vinculoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vinculoId');
    });
  }
}
