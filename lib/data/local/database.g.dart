// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CatsTableTable extends CatsTable
    with TableInfo<$CatsTableTable, CatsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedIdMeta = const VerificationMeta(
    'breedId',
  );
  @override
  late final GeneratedColumn<String> breedId = GeneratedColumn<String>(
    'breed_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedNameMeta = const VerificationMeta(
    'breedName',
  );
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
    'breed_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedDescriptionMeta = const VerificationMeta(
    'breedDescription',
  );
  @override
  late final GeneratedColumn<String> breedDescription = GeneratedColumn<String>(
    'breed_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedTemperamentMeta = const VerificationMeta(
    'breedTemperament',
  );
  @override
  late final GeneratedColumn<String> breedTemperament = GeneratedColumn<String>(
    'breed_temperament',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedOriginMeta = const VerificationMeta(
    'breedOrigin',
  );
  @override
  late final GeneratedColumn<String> breedOrigin = GeneratedColumn<String>(
    'breed_origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedLifeSpanMeta = const VerificationMeta(
    'breedLifeSpan',
  );
  @override
  late final GeneratedColumn<String> breedLifeSpan = GeneratedColumn<String>(
    'breed_life_span',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adaptabilityMeta = const VerificationMeta(
    'adaptability',
  );
  @override
  late final GeneratedColumn<int> adaptability = GeneratedColumn<int>(
    'adaptability',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affectionLevelMeta = const VerificationMeta(
    'affectionLevel',
  );
  @override
  late final GeneratedColumn<int> affectionLevel = GeneratedColumn<int>(
    'affection_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _childFriendlyMeta = const VerificationMeta(
    'childFriendly',
  );
  @override
  late final GeneratedColumn<int> childFriendly = GeneratedColumn<int>(
    'child_friendly',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dogFriendlyMeta = const VerificationMeta(
    'dogFriendly',
  );
  @override
  late final GeneratedColumn<int> dogFriendly = GeneratedColumn<int>(
    'dog_friendly',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _energyLevelMeta = const VerificationMeta(
    'energyLevel',
  );
  @override
  late final GeneratedColumn<int> energyLevel = GeneratedColumn<int>(
    'energy_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _healthIssuesMeta = const VerificationMeta(
    'healthIssues',
  );
  @override
  late final GeneratedColumn<int> healthIssues = GeneratedColumn<int>(
    'health_issues',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intelligenceMeta = const VerificationMeta(
    'intelligence',
  );
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
    'intelligence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _socialNeedsMeta = const VerificationMeta(
    'socialNeeds',
  );
  @override
  late final GeneratedColumn<int> socialNeeds = GeneratedColumn<int>(
    'social_needs',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strangerFriendlyMeta = const VerificationMeta(
    'strangerFriendly',
  );
  @override
  late final GeneratedColumn<int> strangerFriendly = GeneratedColumn<int>(
    'stranger_friendly',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _likedAtMeta = const VerificationMeta(
    'likedAt',
  );
  @override
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
    'liked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    url,
    breedId,
    breedName,
    breedDescription,
    breedTemperament,
    breedOrigin,
    breedLifeSpan,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    healthIssues,
    intelligence,
    socialNeeds,
    strangerFriendly,
    likedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cats_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('breed_id')) {
      context.handle(
        _breedIdMeta,
        breedId.isAcceptableOrUnknown(data['breed_id']!, _breedIdMeta),
      );
    }
    if (data.containsKey('breed_name')) {
      context.handle(
        _breedNameMeta,
        breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta),
      );
    }
    if (data.containsKey('breed_description')) {
      context.handle(
        _breedDescriptionMeta,
        breedDescription.isAcceptableOrUnknown(
          data['breed_description']!,
          _breedDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('breed_temperament')) {
      context.handle(
        _breedTemperamentMeta,
        breedTemperament.isAcceptableOrUnknown(
          data['breed_temperament']!,
          _breedTemperamentMeta,
        ),
      );
    }
    if (data.containsKey('breed_origin')) {
      context.handle(
        _breedOriginMeta,
        breedOrigin.isAcceptableOrUnknown(
          data['breed_origin']!,
          _breedOriginMeta,
        ),
      );
    }
    if (data.containsKey('breed_life_span')) {
      context.handle(
        _breedLifeSpanMeta,
        breedLifeSpan.isAcceptableOrUnknown(
          data['breed_life_span']!,
          _breedLifeSpanMeta,
        ),
      );
    }
    if (data.containsKey('adaptability')) {
      context.handle(
        _adaptabilityMeta,
        adaptability.isAcceptableOrUnknown(
          data['adaptability']!,
          _adaptabilityMeta,
        ),
      );
    }
    if (data.containsKey('affection_level')) {
      context.handle(
        _affectionLevelMeta,
        affectionLevel.isAcceptableOrUnknown(
          data['affection_level']!,
          _affectionLevelMeta,
        ),
      );
    }
    if (data.containsKey('child_friendly')) {
      context.handle(
        _childFriendlyMeta,
        childFriendly.isAcceptableOrUnknown(
          data['child_friendly']!,
          _childFriendlyMeta,
        ),
      );
    }
    if (data.containsKey('dog_friendly')) {
      context.handle(
        _dogFriendlyMeta,
        dogFriendly.isAcceptableOrUnknown(
          data['dog_friendly']!,
          _dogFriendlyMeta,
        ),
      );
    }
    if (data.containsKey('energy_level')) {
      context.handle(
        _energyLevelMeta,
        energyLevel.isAcceptableOrUnknown(
          data['energy_level']!,
          _energyLevelMeta,
        ),
      );
    }
    if (data.containsKey('health_issues')) {
      context.handle(
        _healthIssuesMeta,
        healthIssues.isAcceptableOrUnknown(
          data['health_issues']!,
          _healthIssuesMeta,
        ),
      );
    }
    if (data.containsKey('intelligence')) {
      context.handle(
        _intelligenceMeta,
        intelligence.isAcceptableOrUnknown(
          data['intelligence']!,
          _intelligenceMeta,
        ),
      );
    }
    if (data.containsKey('social_needs')) {
      context.handle(
        _socialNeedsMeta,
        socialNeeds.isAcceptableOrUnknown(
          data['social_needs']!,
          _socialNeedsMeta,
        ),
      );
    }
    if (data.containsKey('stranger_friendly')) {
      context.handle(
        _strangerFriendlyMeta,
        strangerFriendly.isAcceptableOrUnknown(
          data['stranger_friendly']!,
          _strangerFriendlyMeta,
        ),
      );
    }
    if (data.containsKey('liked_at')) {
      context.handle(
        _likedAtMeta,
        likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatsTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
      breedId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_id'],
      ),
      breedName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_name'],
      ),
      breedDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_description'],
      ),
      breedTemperament: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_temperament'],
      ),
      breedOrigin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_origin'],
      ),
      breedLifeSpan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_life_span'],
      ),
      adaptability: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}adaptability'],
      ),
      affectionLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affection_level'],
      ),
      childFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}child_friendly'],
      ),
      dogFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dog_friendly'],
      ),
      energyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy_level'],
      ),
      healthIssues: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}health_issues'],
      ),
      intelligence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intelligence'],
      ),
      socialNeeds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}social_needs'],
      ),
      strangerFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stranger_friendly'],
      ),
      likedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}liked_at'],
      ),
    );
  }

  @override
  $CatsTableTable createAlias(String alias) {
    return $CatsTableTable(attachedDatabase, alias);
  }
}

class CatsTableData extends DataClass implements Insertable<CatsTableData> {
  final String id;
  final String url;
  final String? breedId;
  final String? breedName;
  final String? breedDescription;
  final String? breedTemperament;
  final String? breedOrigin;
  final String? breedLifeSpan;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? healthIssues;
  final int? intelligence;
  final int? socialNeeds;
  final int? strangerFriendly;
  final DateTime? likedAt;
  const CatsTableData({
    required this.id,
    required this.url,
    this.breedId,
    this.breedName,
    this.breedDescription,
    this.breedTemperament,
    this.breedOrigin,
    this.breedLifeSpan,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.healthIssues,
    this.intelligence,
    this.socialNeeds,
    this.strangerFriendly,
    this.likedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || breedId != null) {
      map['breed_id'] = Variable<String>(breedId);
    }
    if (!nullToAbsent || breedName != null) {
      map['breed_name'] = Variable<String>(breedName);
    }
    if (!nullToAbsent || breedDescription != null) {
      map['breed_description'] = Variable<String>(breedDescription);
    }
    if (!nullToAbsent || breedTemperament != null) {
      map['breed_temperament'] = Variable<String>(breedTemperament);
    }
    if (!nullToAbsent || breedOrigin != null) {
      map['breed_origin'] = Variable<String>(breedOrigin);
    }
    if (!nullToAbsent || breedLifeSpan != null) {
      map['breed_life_span'] = Variable<String>(breedLifeSpan);
    }
    if (!nullToAbsent || adaptability != null) {
      map['adaptability'] = Variable<int>(adaptability);
    }
    if (!nullToAbsent || affectionLevel != null) {
      map['affection_level'] = Variable<int>(affectionLevel);
    }
    if (!nullToAbsent || childFriendly != null) {
      map['child_friendly'] = Variable<int>(childFriendly);
    }
    if (!nullToAbsent || dogFriendly != null) {
      map['dog_friendly'] = Variable<int>(dogFriendly);
    }
    if (!nullToAbsent || energyLevel != null) {
      map['energy_level'] = Variable<int>(energyLevel);
    }
    if (!nullToAbsent || healthIssues != null) {
      map['health_issues'] = Variable<int>(healthIssues);
    }
    if (!nullToAbsent || intelligence != null) {
      map['intelligence'] = Variable<int>(intelligence);
    }
    if (!nullToAbsent || socialNeeds != null) {
      map['social_needs'] = Variable<int>(socialNeeds);
    }
    if (!nullToAbsent || strangerFriendly != null) {
      map['stranger_friendly'] = Variable<int>(strangerFriendly);
    }
    if (!nullToAbsent || likedAt != null) {
      map['liked_at'] = Variable<DateTime>(likedAt);
    }
    return map;
  }

  CatsTableCompanion toCompanion(bool nullToAbsent) {
    return CatsTableCompanion(
      id: Value(id),
      url: Value(url),
      breedId:
          breedId == null && nullToAbsent
              ? const Value.absent()
              : Value(breedId),
      breedName:
          breedName == null && nullToAbsent
              ? const Value.absent()
              : Value(breedName),
      breedDescription:
          breedDescription == null && nullToAbsent
              ? const Value.absent()
              : Value(breedDescription),
      breedTemperament:
          breedTemperament == null && nullToAbsent
              ? const Value.absent()
              : Value(breedTemperament),
      breedOrigin:
          breedOrigin == null && nullToAbsent
              ? const Value.absent()
              : Value(breedOrigin),
      breedLifeSpan:
          breedLifeSpan == null && nullToAbsent
              ? const Value.absent()
              : Value(breedLifeSpan),
      adaptability:
          adaptability == null && nullToAbsent
              ? const Value.absent()
              : Value(adaptability),
      affectionLevel:
          affectionLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(affectionLevel),
      childFriendly:
          childFriendly == null && nullToAbsent
              ? const Value.absent()
              : Value(childFriendly),
      dogFriendly:
          dogFriendly == null && nullToAbsent
              ? const Value.absent()
              : Value(dogFriendly),
      energyLevel:
          energyLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(energyLevel),
      healthIssues:
          healthIssues == null && nullToAbsent
              ? const Value.absent()
              : Value(healthIssues),
      intelligence:
          intelligence == null && nullToAbsent
              ? const Value.absent()
              : Value(intelligence),
      socialNeeds:
          socialNeeds == null && nullToAbsent
              ? const Value.absent()
              : Value(socialNeeds),
      strangerFriendly:
          strangerFriendly == null && nullToAbsent
              ? const Value.absent()
              : Value(strangerFriendly),
      likedAt:
          likedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(likedAt),
    );
  }

  factory CatsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatsTableData(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      breedId: serializer.fromJson<String?>(json['breedId']),
      breedName: serializer.fromJson<String?>(json['breedName']),
      breedDescription: serializer.fromJson<String?>(json['breedDescription']),
      breedTemperament: serializer.fromJson<String?>(json['breedTemperament']),
      breedOrigin: serializer.fromJson<String?>(json['breedOrigin']),
      breedLifeSpan: serializer.fromJson<String?>(json['breedLifeSpan']),
      adaptability: serializer.fromJson<int?>(json['adaptability']),
      affectionLevel: serializer.fromJson<int?>(json['affectionLevel']),
      childFriendly: serializer.fromJson<int?>(json['childFriendly']),
      dogFriendly: serializer.fromJson<int?>(json['dogFriendly']),
      energyLevel: serializer.fromJson<int?>(json['energyLevel']),
      healthIssues: serializer.fromJson<int?>(json['healthIssues']),
      intelligence: serializer.fromJson<int?>(json['intelligence']),
      socialNeeds: serializer.fromJson<int?>(json['socialNeeds']),
      strangerFriendly: serializer.fromJson<int?>(json['strangerFriendly']),
      likedAt: serializer.fromJson<DateTime?>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String>(url),
      'breedId': serializer.toJson<String?>(breedId),
      'breedName': serializer.toJson<String?>(breedName),
      'breedDescription': serializer.toJson<String?>(breedDescription),
      'breedTemperament': serializer.toJson<String?>(breedTemperament),
      'breedOrigin': serializer.toJson<String?>(breedOrigin),
      'breedLifeSpan': serializer.toJson<String?>(breedLifeSpan),
      'adaptability': serializer.toJson<int?>(adaptability),
      'affectionLevel': serializer.toJson<int?>(affectionLevel),
      'childFriendly': serializer.toJson<int?>(childFriendly),
      'dogFriendly': serializer.toJson<int?>(dogFriendly),
      'energyLevel': serializer.toJson<int?>(energyLevel),
      'healthIssues': serializer.toJson<int?>(healthIssues),
      'intelligence': serializer.toJson<int?>(intelligence),
      'socialNeeds': serializer.toJson<int?>(socialNeeds),
      'strangerFriendly': serializer.toJson<int?>(strangerFriendly),
      'likedAt': serializer.toJson<DateTime?>(likedAt),
    };
  }

  CatsTableData copyWith({
    String? id,
    String? url,
    Value<String?> breedId = const Value.absent(),
    Value<String?> breedName = const Value.absent(),
    Value<String?> breedDescription = const Value.absent(),
    Value<String?> breedTemperament = const Value.absent(),
    Value<String?> breedOrigin = const Value.absent(),
    Value<String?> breedLifeSpan = const Value.absent(),
    Value<int?> adaptability = const Value.absent(),
    Value<int?> affectionLevel = const Value.absent(),
    Value<int?> childFriendly = const Value.absent(),
    Value<int?> dogFriendly = const Value.absent(),
    Value<int?> energyLevel = const Value.absent(),
    Value<int?> healthIssues = const Value.absent(),
    Value<int?> intelligence = const Value.absent(),
    Value<int?> socialNeeds = const Value.absent(),
    Value<int?> strangerFriendly = const Value.absent(),
    Value<DateTime?> likedAt = const Value.absent(),
  }) => CatsTableData(
    id: id ?? this.id,
    url: url ?? this.url,
    breedId: breedId.present ? breedId.value : this.breedId,
    breedName: breedName.present ? breedName.value : this.breedName,
    breedDescription:
        breedDescription.present
            ? breedDescription.value
            : this.breedDescription,
    breedTemperament:
        breedTemperament.present
            ? breedTemperament.value
            : this.breedTemperament,
    breedOrigin: breedOrigin.present ? breedOrigin.value : this.breedOrigin,
    breedLifeSpan:
        breedLifeSpan.present ? breedLifeSpan.value : this.breedLifeSpan,
    adaptability: adaptability.present ? adaptability.value : this.adaptability,
    affectionLevel:
        affectionLevel.present ? affectionLevel.value : this.affectionLevel,
    childFriendly:
        childFriendly.present ? childFriendly.value : this.childFriendly,
    dogFriendly: dogFriendly.present ? dogFriendly.value : this.dogFriendly,
    energyLevel: energyLevel.present ? energyLevel.value : this.energyLevel,
    healthIssues: healthIssues.present ? healthIssues.value : this.healthIssues,
    intelligence: intelligence.present ? intelligence.value : this.intelligence,
    socialNeeds: socialNeeds.present ? socialNeeds.value : this.socialNeeds,
    strangerFriendly:
        strangerFriendly.present
            ? strangerFriendly.value
            : this.strangerFriendly,
    likedAt: likedAt.present ? likedAt.value : this.likedAt,
  );
  CatsTableData copyWithCompanion(CatsTableCompanion data) {
    return CatsTableData(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      breedId: data.breedId.present ? data.breedId.value : this.breedId,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      breedDescription:
          data.breedDescription.present
              ? data.breedDescription.value
              : this.breedDescription,
      breedTemperament:
          data.breedTemperament.present
              ? data.breedTemperament.value
              : this.breedTemperament,
      breedOrigin:
          data.breedOrigin.present ? data.breedOrigin.value : this.breedOrigin,
      breedLifeSpan:
          data.breedLifeSpan.present
              ? data.breedLifeSpan.value
              : this.breedLifeSpan,
      adaptability:
          data.adaptability.present
              ? data.adaptability.value
              : this.adaptability,
      affectionLevel:
          data.affectionLevel.present
              ? data.affectionLevel.value
              : this.affectionLevel,
      childFriendly:
          data.childFriendly.present
              ? data.childFriendly.value
              : this.childFriendly,
      dogFriendly:
          data.dogFriendly.present ? data.dogFriendly.value : this.dogFriendly,
      energyLevel:
          data.energyLevel.present ? data.energyLevel.value : this.energyLevel,
      healthIssues:
          data.healthIssues.present
              ? data.healthIssues.value
              : this.healthIssues,
      intelligence:
          data.intelligence.present
              ? data.intelligence.value
              : this.intelligence,
      socialNeeds:
          data.socialNeeds.present ? data.socialNeeds.value : this.socialNeeds,
      strangerFriendly:
          data.strangerFriendly.present
              ? data.strangerFriendly.value
              : this.strangerFriendly,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatsTableData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('breedId: $breedId, ')
          ..write('breedName: $breedName, ')
          ..write('breedDescription: $breedDescription, ')
          ..write('breedTemperament: $breedTemperament, ')
          ..write('breedOrigin: $breedOrigin, ')
          ..write('breedLifeSpan: $breedLifeSpan, ')
          ..write('adaptability: $adaptability, ')
          ..write('affectionLevel: $affectionLevel, ')
          ..write('childFriendly: $childFriendly, ')
          ..write('dogFriendly: $dogFriendly, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('healthIssues: $healthIssues, ')
          ..write('intelligence: $intelligence, ')
          ..write('socialNeeds: $socialNeeds, ')
          ..write('strangerFriendly: $strangerFriendly, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    url,
    breedId,
    breedName,
    breedDescription,
    breedTemperament,
    breedOrigin,
    breedLifeSpan,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    healthIssues,
    intelligence,
    socialNeeds,
    strangerFriendly,
    likedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatsTableData &&
          other.id == this.id &&
          other.url == this.url &&
          other.breedId == this.breedId &&
          other.breedName == this.breedName &&
          other.breedDescription == this.breedDescription &&
          other.breedTemperament == this.breedTemperament &&
          other.breedOrigin == this.breedOrigin &&
          other.breedLifeSpan == this.breedLifeSpan &&
          other.adaptability == this.adaptability &&
          other.affectionLevel == this.affectionLevel &&
          other.childFriendly == this.childFriendly &&
          other.dogFriendly == this.dogFriendly &&
          other.energyLevel == this.energyLevel &&
          other.healthIssues == this.healthIssues &&
          other.intelligence == this.intelligence &&
          other.socialNeeds == this.socialNeeds &&
          other.strangerFriendly == this.strangerFriendly &&
          other.likedAt == this.likedAt);
}

class CatsTableCompanion extends UpdateCompanion<CatsTableData> {
  final Value<String> id;
  final Value<String> url;
  final Value<String?> breedId;
  final Value<String?> breedName;
  final Value<String?> breedDescription;
  final Value<String?> breedTemperament;
  final Value<String?> breedOrigin;
  final Value<String?> breedLifeSpan;
  final Value<int?> adaptability;
  final Value<int?> affectionLevel;
  final Value<int?> childFriendly;
  final Value<int?> dogFriendly;
  final Value<int?> energyLevel;
  final Value<int?> healthIssues;
  final Value<int?> intelligence;
  final Value<int?> socialNeeds;
  final Value<int?> strangerFriendly;
  final Value<DateTime?> likedAt;
  final Value<int> rowid;
  const CatsTableCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.breedId = const Value.absent(),
    this.breedName = const Value.absent(),
    this.breedDescription = const Value.absent(),
    this.breedTemperament = const Value.absent(),
    this.breedOrigin = const Value.absent(),
    this.breedLifeSpan = const Value.absent(),
    this.adaptability = const Value.absent(),
    this.affectionLevel = const Value.absent(),
    this.childFriendly = const Value.absent(),
    this.dogFriendly = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.healthIssues = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.socialNeeds = const Value.absent(),
    this.strangerFriendly = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatsTableCompanion.insert({
    required String id,
    required String url,
    this.breedId = const Value.absent(),
    this.breedName = const Value.absent(),
    this.breedDescription = const Value.absent(),
    this.breedTemperament = const Value.absent(),
    this.breedOrigin = const Value.absent(),
    this.breedLifeSpan = const Value.absent(),
    this.adaptability = const Value.absent(),
    this.affectionLevel = const Value.absent(),
    this.childFriendly = const Value.absent(),
    this.dogFriendly = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.healthIssues = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.socialNeeds = const Value.absent(),
    this.strangerFriendly = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       url = Value(url);
  static Insertable<CatsTableData> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<String>? breedId,
    Expression<String>? breedName,
    Expression<String>? breedDescription,
    Expression<String>? breedTemperament,
    Expression<String>? breedOrigin,
    Expression<String>? breedLifeSpan,
    Expression<int>? adaptability,
    Expression<int>? affectionLevel,
    Expression<int>? childFriendly,
    Expression<int>? dogFriendly,
    Expression<int>? energyLevel,
    Expression<int>? healthIssues,
    Expression<int>? intelligence,
    Expression<int>? socialNeeds,
    Expression<int>? strangerFriendly,
    Expression<DateTime>? likedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (breedId != null) 'breed_id': breedId,
      if (breedName != null) 'breed_name': breedName,
      if (breedDescription != null) 'breed_description': breedDescription,
      if (breedTemperament != null) 'breed_temperament': breedTemperament,
      if (breedOrigin != null) 'breed_origin': breedOrigin,
      if (breedLifeSpan != null) 'breed_life_span': breedLifeSpan,
      if (adaptability != null) 'adaptability': adaptability,
      if (affectionLevel != null) 'affection_level': affectionLevel,
      if (childFriendly != null) 'child_friendly': childFriendly,
      if (dogFriendly != null) 'dog_friendly': dogFriendly,
      if (energyLevel != null) 'energy_level': energyLevel,
      if (healthIssues != null) 'health_issues': healthIssues,
      if (intelligence != null) 'intelligence': intelligence,
      if (socialNeeds != null) 'social_needs': socialNeeds,
      if (strangerFriendly != null) 'stranger_friendly': strangerFriendly,
      if (likedAt != null) 'liked_at': likedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? url,
    Value<String?>? breedId,
    Value<String?>? breedName,
    Value<String?>? breedDescription,
    Value<String?>? breedTemperament,
    Value<String?>? breedOrigin,
    Value<String?>? breedLifeSpan,
    Value<int?>? adaptability,
    Value<int?>? affectionLevel,
    Value<int?>? childFriendly,
    Value<int?>? dogFriendly,
    Value<int?>? energyLevel,
    Value<int?>? healthIssues,
    Value<int?>? intelligence,
    Value<int?>? socialNeeds,
    Value<int?>? strangerFriendly,
    Value<DateTime?>? likedAt,
    Value<int>? rowid,
  }) {
    return CatsTableCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      breedId: breedId ?? this.breedId,
      breedName: breedName ?? this.breedName,
      breedDescription: breedDescription ?? this.breedDescription,
      breedTemperament: breedTemperament ?? this.breedTemperament,
      breedOrigin: breedOrigin ?? this.breedOrigin,
      breedLifeSpan: breedLifeSpan ?? this.breedLifeSpan,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      healthIssues: healthIssues ?? this.healthIssues,
      intelligence: intelligence ?? this.intelligence,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      strangerFriendly: strangerFriendly ?? this.strangerFriendly,
      likedAt: likedAt ?? this.likedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (breedId.present) {
      map['breed_id'] = Variable<String>(breedId.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (breedDescription.present) {
      map['breed_description'] = Variable<String>(breedDescription.value);
    }
    if (breedTemperament.present) {
      map['breed_temperament'] = Variable<String>(breedTemperament.value);
    }
    if (breedOrigin.present) {
      map['breed_origin'] = Variable<String>(breedOrigin.value);
    }
    if (breedLifeSpan.present) {
      map['breed_life_span'] = Variable<String>(breedLifeSpan.value);
    }
    if (adaptability.present) {
      map['adaptability'] = Variable<int>(adaptability.value);
    }
    if (affectionLevel.present) {
      map['affection_level'] = Variable<int>(affectionLevel.value);
    }
    if (childFriendly.present) {
      map['child_friendly'] = Variable<int>(childFriendly.value);
    }
    if (dogFriendly.present) {
      map['dog_friendly'] = Variable<int>(dogFriendly.value);
    }
    if (energyLevel.present) {
      map['energy_level'] = Variable<int>(energyLevel.value);
    }
    if (healthIssues.present) {
      map['health_issues'] = Variable<int>(healthIssues.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (socialNeeds.present) {
      map['social_needs'] = Variable<int>(socialNeeds.value);
    }
    if (strangerFriendly.present) {
      map['stranger_friendly'] = Variable<int>(strangerFriendly.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<DateTime>(likedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsTableCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('breedId: $breedId, ')
          ..write('breedName: $breedName, ')
          ..write('breedDescription: $breedDescription, ')
          ..write('breedTemperament: $breedTemperament, ')
          ..write('breedOrigin: $breedOrigin, ')
          ..write('breedLifeSpan: $breedLifeSpan, ')
          ..write('adaptability: $adaptability, ')
          ..write('affectionLevel: $affectionLevel, ')
          ..write('childFriendly: $childFriendly, ')
          ..write('dogFriendly: $dogFriendly, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('healthIssues: $healthIssues, ')
          ..write('intelligence: $intelligence, ')
          ..write('socialNeeds: $socialNeeds, ')
          ..write('strangerFriendly: $strangerFriendly, ')
          ..write('likedAt: $likedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CatsTableTable catsTable = $CatsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [catsTable];
}

typedef $$CatsTableTableCreateCompanionBuilder =
    CatsTableCompanion Function({
      required String id,
      required String url,
      Value<String?> breedId,
      Value<String?> breedName,
      Value<String?> breedDescription,
      Value<String?> breedTemperament,
      Value<String?> breedOrigin,
      Value<String?> breedLifeSpan,
      Value<int?> adaptability,
      Value<int?> affectionLevel,
      Value<int?> childFriendly,
      Value<int?> dogFriendly,
      Value<int?> energyLevel,
      Value<int?> healthIssues,
      Value<int?> intelligence,
      Value<int?> socialNeeds,
      Value<int?> strangerFriendly,
      Value<DateTime?> likedAt,
      Value<int> rowid,
    });
typedef $$CatsTableTableUpdateCompanionBuilder =
    CatsTableCompanion Function({
      Value<String> id,
      Value<String> url,
      Value<String?> breedId,
      Value<String?> breedName,
      Value<String?> breedDescription,
      Value<String?> breedTemperament,
      Value<String?> breedOrigin,
      Value<String?> breedLifeSpan,
      Value<int?> adaptability,
      Value<int?> affectionLevel,
      Value<int?> childFriendly,
      Value<int?> dogFriendly,
      Value<int?> energyLevel,
      Value<int?> healthIssues,
      Value<int?> intelligence,
      Value<int?> socialNeeds,
      Value<int?> strangerFriendly,
      Value<DateTime?> likedAt,
      Value<int> rowid,
    });

class $$CatsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CatsTableTable> {
  $$CatsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedId => $composableBuilder(
    column: $table.breedId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedDescription => $composableBuilder(
    column: $table.breedDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedTemperament => $composableBuilder(
    column: $table.breedTemperament,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedOrigin => $composableBuilder(
    column: $table.breedOrigin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedLifeSpan => $composableBuilder(
    column: $table.breedLifeSpan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adaptability => $composableBuilder(
    column: $table.adaptability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get affectionLevel => $composableBuilder(
    column: $table.affectionLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get childFriendly => $composableBuilder(
    column: $table.childFriendly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dogFriendly => $composableBuilder(
    column: $table.dogFriendly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get healthIssues => $composableBuilder(
    column: $table.healthIssues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get socialNeeds => $composableBuilder(
    column: $table.socialNeeds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strangerFriendly => $composableBuilder(
    column: $table.strangerFriendly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CatsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CatsTableTable> {
  $$CatsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedId => $composableBuilder(
    column: $table.breedId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedDescription => $composableBuilder(
    column: $table.breedDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedTemperament => $composableBuilder(
    column: $table.breedTemperament,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedOrigin => $composableBuilder(
    column: $table.breedOrigin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedLifeSpan => $composableBuilder(
    column: $table.breedLifeSpan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adaptability => $composableBuilder(
    column: $table.adaptability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get affectionLevel => $composableBuilder(
    column: $table.affectionLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get childFriendly => $composableBuilder(
    column: $table.childFriendly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dogFriendly => $composableBuilder(
    column: $table.dogFriendly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get healthIssues => $composableBuilder(
    column: $table.healthIssues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get socialNeeds => $composableBuilder(
    column: $table.socialNeeds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strangerFriendly => $composableBuilder(
    column: $table.strangerFriendly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatsTableTable> {
  $$CatsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get breedId =>
      $composableBuilder(column: $table.breedId, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get breedDescription => $composableBuilder(
    column: $table.breedDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breedTemperament => $composableBuilder(
    column: $table.breedTemperament,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breedOrigin => $composableBuilder(
    column: $table.breedOrigin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breedLifeSpan => $composableBuilder(
    column: $table.breedLifeSpan,
    builder: (column) => column,
  );

  GeneratedColumn<int> get adaptability => $composableBuilder(
    column: $table.adaptability,
    builder: (column) => column,
  );

  GeneratedColumn<int> get affectionLevel => $composableBuilder(
    column: $table.affectionLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get childFriendly => $composableBuilder(
    column: $table.childFriendly,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dogFriendly => $composableBuilder(
    column: $table.dogFriendly,
    builder: (column) => column,
  );

  GeneratedColumn<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get healthIssues => $composableBuilder(
    column: $table.healthIssues,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get socialNeeds => $composableBuilder(
    column: $table.socialNeeds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get strangerFriendly => $composableBuilder(
    column: $table.strangerFriendly,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);
}

class $$CatsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatsTableTable,
          CatsTableData,
          $$CatsTableTableFilterComposer,
          $$CatsTableTableOrderingComposer,
          $$CatsTableTableAnnotationComposer,
          $$CatsTableTableCreateCompanionBuilder,
          $$CatsTableTableUpdateCompanionBuilder,
          (
            CatsTableData,
            BaseReferences<_$AppDatabase, $CatsTableTable, CatsTableData>,
          ),
          CatsTableData,
          PrefetchHooks Function()
        > {
  $$CatsTableTableTableManager(_$AppDatabase db, $CatsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CatsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CatsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CatsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> breedId = const Value.absent(),
                Value<String?> breedName = const Value.absent(),
                Value<String?> breedDescription = const Value.absent(),
                Value<String?> breedTemperament = const Value.absent(),
                Value<String?> breedOrigin = const Value.absent(),
                Value<String?> breedLifeSpan = const Value.absent(),
                Value<int?> adaptability = const Value.absent(),
                Value<int?> affectionLevel = const Value.absent(),
                Value<int?> childFriendly = const Value.absent(),
                Value<int?> dogFriendly = const Value.absent(),
                Value<int?> energyLevel = const Value.absent(),
                Value<int?> healthIssues = const Value.absent(),
                Value<int?> intelligence = const Value.absent(),
                Value<int?> socialNeeds = const Value.absent(),
                Value<int?> strangerFriendly = const Value.absent(),
                Value<DateTime?> likedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsTableCompanion(
                id: id,
                url: url,
                breedId: breedId,
                breedName: breedName,
                breedDescription: breedDescription,
                breedTemperament: breedTemperament,
                breedOrigin: breedOrigin,
                breedLifeSpan: breedLifeSpan,
                adaptability: adaptability,
                affectionLevel: affectionLevel,
                childFriendly: childFriendly,
                dogFriendly: dogFriendly,
                energyLevel: energyLevel,
                healthIssues: healthIssues,
                intelligence: intelligence,
                socialNeeds: socialNeeds,
                strangerFriendly: strangerFriendly,
                likedAt: likedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String url,
                Value<String?> breedId = const Value.absent(),
                Value<String?> breedName = const Value.absent(),
                Value<String?> breedDescription = const Value.absent(),
                Value<String?> breedTemperament = const Value.absent(),
                Value<String?> breedOrigin = const Value.absent(),
                Value<String?> breedLifeSpan = const Value.absent(),
                Value<int?> adaptability = const Value.absent(),
                Value<int?> affectionLevel = const Value.absent(),
                Value<int?> childFriendly = const Value.absent(),
                Value<int?> dogFriendly = const Value.absent(),
                Value<int?> energyLevel = const Value.absent(),
                Value<int?> healthIssues = const Value.absent(),
                Value<int?> intelligence = const Value.absent(),
                Value<int?> socialNeeds = const Value.absent(),
                Value<int?> strangerFriendly = const Value.absent(),
                Value<DateTime?> likedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsTableCompanion.insert(
                id: id,
                url: url,
                breedId: breedId,
                breedName: breedName,
                breedDescription: breedDescription,
                breedTemperament: breedTemperament,
                breedOrigin: breedOrigin,
                breedLifeSpan: breedLifeSpan,
                adaptability: adaptability,
                affectionLevel: affectionLevel,
                childFriendly: childFriendly,
                dogFriendly: dogFriendly,
                energyLevel: energyLevel,
                healthIssues: healthIssues,
                intelligence: intelligence,
                socialNeeds: socialNeeds,
                strangerFriendly: strangerFriendly,
                likedAt: likedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CatsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatsTableTable,
      CatsTableData,
      $$CatsTableTableFilterComposer,
      $$CatsTableTableOrderingComposer,
      $$CatsTableTableAnnotationComposer,
      $$CatsTableTableCreateCompanionBuilder,
      $$CatsTableTableUpdateCompanionBuilder,
      (
        CatsTableData,
        BaseReferences<_$AppDatabase, $CatsTableTable, CatsTableData>,
      ),
      CatsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CatsTableTableTableManager get catsTable =>
      $$CatsTableTableTableManager(_db, _db.catsTable);
}
