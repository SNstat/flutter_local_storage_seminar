// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $AuthorTable extends Author with TableInfo<$AuthorTable, AuthorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, firstName, lastName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'author';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthorData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthorData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
    );
  }

  @override
  $AuthorTable createAlias(String alias) {
    return $AuthorTable(attachedDatabase, alias);
  }
}

class AuthorData extends DataClass implements Insertable<AuthorData> {
  final int id;
  final String firstName;
  final String lastName;
  const AuthorData({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    return map;
  }

  AuthorCompanion toCompanion(bool nullToAbsent) {
    return AuthorCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
    );
  }

  factory AuthorData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
    };
  }

  AuthorData copyWith({int? id, String? firstName, String? lastName}) =>
      AuthorData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
  AuthorData copyWithCompanion(AuthorCompanion data) {
    return AuthorData(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthorData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName);
}

class AuthorCompanion extends UpdateCompanion<AuthorData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  const AuthorCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
  });
  AuthorCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
  }) : firstName = Value(firstName),
       lastName = Value(lastName);
  static Insertable<AuthorData> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
    });
  }

  AuthorCompanion copyWith({
    Value<int>? id,
    Value<String>? firstName,
    Value<String>? lastName,
  }) {
    return AuthorCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }
}

class $BookTable extends Book with TableInfo<$BookTable, BookData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    false,
    check: () =>
        ComparableExpr(CustomExpression<int>('page_count'))
            .isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publishingDateMeta = const VerificationMeta(
    'publishingDate',
  );
  @override
  late final GeneratedColumn<DateTime> publishingDate =
      GeneratedColumn<DateTime>(
        'publishing_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  late final GeneratedColumnWithTypeConverter<Language, String> language =
      GeneratedColumn<String>(
        'language',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Language>($BookTable.$converterlanguage);
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES author (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    pageCount,
    publishingDate,
    language,
    authorId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    } else if (isInserting) {
      context.missing(_pageCountMeta);
    }
    if (data.containsKey('publishing_date')) {
      context.handle(
        _publishingDateMeta,
        publishingDate.isAcceptableOrUnknown(
          data['publishing_date']!,
          _publishingDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publishingDateMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      )!,
      publishingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publishing_date'],
      )!,
      language: $BookTable.$converterlanguage.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}language'],
        )!,
      ),
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}author_id'],
      )!,
    );
  }

  @override
  $BookTable createAlias(String alias) {
    return $BookTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Language, String, String> $converterlanguage =
      const EnumNameConverter<Language>(Language.values);
}

class BookData extends DataClass implements Insertable<BookData> {
  final int id;
  final String title;
  final String description;
  final int pageCount;
  final DateTime publishingDate;
  final Language language;
  final int authorId;
  const BookData({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.publishingDate,
    required this.language,
    required this.authorId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['page_count'] = Variable<int>(pageCount);
    map['publishing_date'] = Variable<DateTime>(publishingDate);
    {
      map['language'] = Variable<String>(
        $BookTable.$converterlanguage.toSql(language),
      );
    }
    map['author_id'] = Variable<int>(authorId);
    return map;
  }

  BookCompanion toCompanion(bool nullToAbsent) {
    return BookCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      pageCount: Value(pageCount),
      publishingDate: Value(publishingDate),
      language: Value(language),
      authorId: Value(authorId),
    );
  }

  factory BookData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
      publishingDate: serializer.fromJson<DateTime>(json['publishingDate']),
      language: $BookTable.$converterlanguage.fromJson(
        serializer.fromJson<String>(json['language']),
      ),
      authorId: serializer.fromJson<int>(json['authorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'pageCount': serializer.toJson<int>(pageCount),
      'publishingDate': serializer.toJson<DateTime>(publishingDate),
      'language': serializer.toJson<String>(
        $BookTable.$converterlanguage.toJson(language),
      ),
      'authorId': serializer.toJson<int>(authorId),
    };
  }

  BookData copyWith({
    int? id,
    String? title,
    String? description,
    int? pageCount,
    DateTime? publishingDate,
    Language? language,
    int? authorId,
  }) => BookData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    pageCount: pageCount ?? this.pageCount,
    publishingDate: publishingDate ?? this.publishingDate,
    language: language ?? this.language,
    authorId: authorId ?? this.authorId,
  );
  BookData copyWithCompanion(BookCompanion data) {
    return BookData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      publishingDate: data.publishingDate.present
          ? data.publishingDate.value
          : this.publishingDate,
      language: data.language.present ? data.language.value : this.language,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('pageCount: $pageCount, ')
          ..write('publishingDate: $publishingDate, ')
          ..write('language: $language, ')
          ..write('authorId: $authorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    pageCount,
    publishingDate,
    language,
    authorId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.pageCount == this.pageCount &&
          other.publishingDate == this.publishingDate &&
          other.language == this.language &&
          other.authorId == this.authorId);
}

class BookCompanion extends UpdateCompanion<BookData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> pageCount;
  final Value<DateTime> publishingDate;
  final Value<Language> language;
  final Value<int> authorId;
  const BookCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.publishingDate = const Value.absent(),
    this.language = const Value.absent(),
    this.authorId = const Value.absent(),
  });
  BookCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required int pageCount,
    required DateTime publishingDate,
    required Language language,
    required int authorId,
  }) : title = Value(title),
       description = Value(description),
       pageCount = Value(pageCount),
       publishingDate = Value(publishingDate),
       language = Value(language),
       authorId = Value(authorId);
  static Insertable<BookData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? pageCount,
    Expression<DateTime>? publishingDate,
    Expression<String>? language,
    Expression<int>? authorId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (pageCount != null) 'page_count': pageCount,
      if (publishingDate != null) 'publishing_date': publishingDate,
      if (language != null) 'language': language,
      if (authorId != null) 'author_id': authorId,
    });
  }

  BookCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<int>? pageCount,
    Value<DateTime>? publishingDate,
    Value<Language>? language,
    Value<int>? authorId,
  }) {
    return BookCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      publishingDate: publishingDate ?? this.publishingDate,
      language: language ?? this.language,
      authorId: authorId ?? this.authorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (publishingDate.present) {
      map['publishing_date'] = Variable<DateTime>(publishingDate.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(
        $BookTable.$converterlanguage.toSql(language.value),
      );
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('pageCount: $pageCount, ')
          ..write('publishingDate: $publishingDate, ')
          ..write('language: $language, ')
          ..write('authorId: $authorId')
          ..write(')'))
        .toString();
  }
}

class $GenreTable extends Genre with TableInfo<$GenreTable, GenreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genre';
  @override
  VerificationContext validateIntegrity(
    Insertable<GenreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GenreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenreData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $GenreTable createAlias(String alias) {
    return $GenreTable(attachedDatabase, alias);
  }
}

class GenreData extends DataClass implements Insertable<GenreData> {
  final int id;
  final String name;
  const GenreData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenreCompanion toCompanion(bool nullToAbsent) {
    return GenreCompanion(id: Value(id), name: Value(name));
  }

  factory GenreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenreData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GenreData copyWith({int? id, String? name}) =>
      GenreData(id: id ?? this.id, name: name ?? this.name);
  GenreData copyWithCompanion(GenreCompanion data) {
    return GenreData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GenreData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenreData && other.id == this.id && other.name == this.name);
}

class GenreCompanion extends UpdateCompanion<GenreData> {
  final Value<int> id;
  final Value<String> name;
  const GenreCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenreCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<GenreData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenreCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenreCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenreCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $BookGenreTable extends BookGenre
    with TableInfo<$BookGenreTable, BookGenreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookGenreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<int> bookId = GeneratedColumn<int>(
    'book_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES book (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _genreIdMeta = const VerificationMeta(
    'genreId',
  );
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
    'genre_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES genre (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [bookId, genreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_genre';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookGenreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('book_id')) {
      context.handle(
        _bookIdMeta,
        bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(
        _genreIdMeta,
        genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta),
      );
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bookId, genreId};
  @override
  BookGenreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookGenreData(
      bookId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}book_id'],
      )!,
      genreId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}genre_id'],
      )!,
    );
  }

  @override
  $BookGenreTable createAlias(String alias) {
    return $BookGenreTable(attachedDatabase, alias);
  }
}

class BookGenreData extends DataClass implements Insertable<BookGenreData> {
  final int bookId;
  final int genreId;
  const BookGenreData({required this.bookId, required this.genreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['book_id'] = Variable<int>(bookId);
    map['genre_id'] = Variable<int>(genreId);
    return map;
  }

  BookGenreCompanion toCompanion(bool nullToAbsent) {
    return BookGenreCompanion(bookId: Value(bookId), genreId: Value(genreId));
  }

  factory BookGenreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookGenreData(
      bookId: serializer.fromJson<int>(json['bookId']),
      genreId: serializer.fromJson<int>(json['genreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bookId': serializer.toJson<int>(bookId),
      'genreId': serializer.toJson<int>(genreId),
    };
  }

  BookGenreData copyWith({int? bookId, int? genreId}) => BookGenreData(
    bookId: bookId ?? this.bookId,
    genreId: genreId ?? this.genreId,
  );
  BookGenreData copyWithCompanion(BookGenreCompanion data) {
    return BookGenreData(
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      genreId: data.genreId.present ? data.genreId.value : this.genreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookGenreData(')
          ..write('bookId: $bookId, ')
          ..write('genreId: $genreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bookId, genreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookGenreData &&
          other.bookId == this.bookId &&
          other.genreId == this.genreId);
}

class BookGenreCompanion extends UpdateCompanion<BookGenreData> {
  final Value<int> bookId;
  final Value<int> genreId;
  final Value<int> rowid;
  const BookGenreCompanion({
    this.bookId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookGenreCompanion.insert({
    required int bookId,
    required int genreId,
    this.rowid = const Value.absent(),
  }) : bookId = Value(bookId),
       genreId = Value(genreId);
  static Insertable<BookGenreData> custom({
    Expression<int>? bookId,
    Expression<int>? genreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bookId != null) 'book_id': bookId,
      if (genreId != null) 'genre_id': genreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookGenreCompanion copyWith({
    Value<int>? bookId,
    Value<int>? genreId,
    Value<int>? rowid,
  }) {
    return BookGenreCompanion(
      bookId: bookId ?? this.bookId,
      genreId: genreId ?? this.genreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookGenreCompanion(')
          ..write('bookId: $bookId, ')
          ..write('genreId: $genreId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $AuthorTable author = $AuthorTable(this);
  late final $BookTable book = $BookTable(this);
  late final $GenreTable genre = $GenreTable(this);
  late final $BookGenreTable bookGenre = $BookGenreTable(this);
  late final AuthorDao authorDao = AuthorDao(this as AppDb);
  late final BookDao bookDao = BookDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    author,
    book,
    genre,
    bookGenre,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'author',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('book', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'book',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('book_genre', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'genre',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('book_genre', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AuthorTableCreateCompanionBuilder = AuthorCompanion Function({
  Value<int> id,
  required String firstName,
  required String lastName,
});
typedef $$AuthorTableUpdateCompanionBuilder = AuthorCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
});

final class $$AuthorTableReferences
    extends BaseReferences<_$AppDb, $AuthorTable, AuthorData> {
  $$AuthorTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BookTable, List<BookData>> _bookRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.book,
    aliasName: 'author__id__book__author_id',
  );

  $$BookTableProcessedTableManager get bookRefs {
    final manager = $$BookTableTableManager(
      $_db,
      $_db.book,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuthorTableFilterComposer extends Composer<_$AppDb, $AuthorTable> {
  $$AuthorTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bookRefs(
    Expression<bool> Function($$BookTableFilterComposer f) f,
  ) {
    final $$BookTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableFilterComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorTableOrderingComposer extends Composer<_$AppDb, $AuthorTable> {
  $$AuthorTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthorTableAnnotationComposer extends Composer<_$AppDb, $AuthorTable> {
  $$AuthorTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  Expression<T> bookRefs<T extends Object>(
    Expression<T> Function($$BookTableAnnotationComposer a) f,
  ) {
    final $$BookTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableAnnotationComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $AuthorTable,
          AuthorData,
          $$AuthorTableFilterComposer,
          $$AuthorTableOrderingComposer,
          $$AuthorTableAnnotationComposer,
          $$AuthorTableCreateCompanionBuilder,
          $$AuthorTableUpdateCompanionBuilder,
          (AuthorData, $$AuthorTableReferences),
          AuthorData,
          PrefetchHooks Function({bool bookRefs})
        > {
  $$AuthorTableTableManager(_$AppDb db, $AuthorTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
              }) => AuthorCompanion(
                id: id,
                firstName: firstName,
                lastName: lastName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String firstName,
                required String lastName,
              }) => AuthorCompanion.insert(
                id: id,
                firstName: firstName,
                lastName: lastName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AuthorTable, AuthorData>(table),
                  $$AuthorTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bookRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (bookRefs) db.book],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookRefs)
                    await $_getPrefetchedDataByColumns<
                      AuthorData,
                      $AuthorTable,
                      BookData,
                      $BookTable
                    >(
                      currentTable: table,
                      referencedTable: $$AuthorTableReferences._bookRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$AuthorTableReferences(db, table, p0).bookRefs,
                      currentColumn: 'id',
                      referencedColumn: 'author_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AuthorTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $AuthorTable,
      AuthorData,
      $$AuthorTableFilterComposer,
      $$AuthorTableOrderingComposer,
      $$AuthorTableAnnotationComposer,
      $$AuthorTableCreateCompanionBuilder,
      $$AuthorTableUpdateCompanionBuilder,
      (AuthorData, $$AuthorTableReferences),
      AuthorData,
      PrefetchHooks Function({bool bookRefs})
    >;
typedef $$BookTableCreateCompanionBuilder = BookCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required int pageCount,
  required DateTime publishingDate,
  required Language language,
  required int authorId,
});
typedef $$BookTableUpdateCompanionBuilder = BookCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<int> pageCount,
  Value<DateTime> publishingDate,
  Value<Language> language,
  Value<int> authorId,
});

final class $$BookTableReferences
    extends BaseReferences<_$AppDb, $BookTable, BookData> {
  $$BookTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuthorTable _authorIdTable(_$AppDb db) =>
      db.author.createAlias('book__author_id__author__id');

  $$AuthorTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$AuthorTableTableManager(
      $_db,
      $_db.author,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BookGenreTable, List<BookGenreData>>
  _bookGenreRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.bookGenre,
    aliasName: 'book__id__book_genre__book_id',
  );

  $$BookGenreTableProcessedTableManager get bookGenreRefs {
    final manager = $$BookGenreTableTableManager(
      $_db,
      $_db.bookGenre,
    ).filter((f) => f.bookId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookGenreRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BookTableFilterComposer extends Composer<_$AppDb, $BookTable> {
  $$BookTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishingDate => $composableBuilder(
    column: $table.publishingDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Language, Language, String> get language =>
      $composableBuilder(
        column: $table.language,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$AuthorTableFilterComposer get authorId {
    final $$AuthorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableFilterComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> bookGenreRefs(
    Expression<bool> Function($$BookGenreTableFilterComposer f) f,
  ) {
    final $$BookGenreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookGenre,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookGenreTableFilterComposer(
            $db: $db,
            $table: $db.bookGenre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BookTableOrderingComposer extends Composer<_$AppDb, $BookTable> {
  $$BookTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishingDate => $composableBuilder(
    column: $table.publishingDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  $$AuthorTableOrderingComposer get authorId {
    final $$AuthorTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableOrderingComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookTableAnnotationComposer extends Composer<_$AppDb, $BookTable> {
  $$BookTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<DateTime> get publishingDate => $composableBuilder(
    column: $table.publishingDate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Language, String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  $$AuthorTableAnnotationComposer get authorId {
    final $$AuthorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.author,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorTableAnnotationComposer(
            $db: $db,
            $table: $db.author,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> bookGenreRefs<T extends Object>(
    Expression<T> Function($$BookGenreTableAnnotationComposer a) f,
  ) {
    final $$BookGenreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookGenre,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookGenreTableAnnotationComposer(
            $db: $db,
            $table: $db.bookGenre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BookTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $BookTable,
          BookData,
          $$BookTableFilterComposer,
          $$BookTableOrderingComposer,
          $$BookTableAnnotationComposer,
          $$BookTableCreateCompanionBuilder,
          $$BookTableUpdateCompanionBuilder,
          (BookData, $$BookTableReferences),
          BookData,
          PrefetchHooks Function({bool authorId, bool bookGenreRefs})
        > {
  $$BookTableTableManager(_$AppDb db, $BookTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> pageCount = const Value.absent(),
                Value<DateTime> publishingDate = const Value.absent(),
                Value<Language> language = const Value.absent(),
                Value<int> authorId = const Value.absent(),
              }) => BookCompanion(
                id: id,
                title: title,
                description: description,
                pageCount: pageCount,
                publishingDate: publishingDate,
                language: language,
                authorId: authorId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required int pageCount,
                required DateTime publishingDate,
                required Language language,
                required int authorId,
              }) => BookCompanion.insert(
                id: id,
                title: title,
                description: description,
                pageCount: pageCount,
                publishingDate: publishingDate,
                language: language,
                authorId: authorId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BookTable, BookData>(table),
                  $$BookTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({authorId = false, bookGenreRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (bookGenreRefs) db.bookGenre],
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
                    if (authorId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.authorId,
                        referencedTable: $$BookTableReferences._authorIdTable(
                          db,
                        ),
                        referencedColumn: $$BookTableReferences
                            ._authorIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookGenreRefs)
                    await $_getPrefetchedDataByColumns<
                      BookData,
                      $BookTable,
                      BookGenreData,
                      $BookGenreTable
                    >(
                      currentTable: table,
                      referencedTable: $$BookTableReferences
                          ._bookGenreRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BookTableReferences(db, table, p0).bookGenreRefs,
                      currentColumn: 'id',
                      referencedColumn: 'book_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BookTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $BookTable,
      BookData,
      $$BookTableFilterComposer,
      $$BookTableOrderingComposer,
      $$BookTableAnnotationComposer,
      $$BookTableCreateCompanionBuilder,
      $$BookTableUpdateCompanionBuilder,
      (BookData, $$BookTableReferences),
      BookData,
      PrefetchHooks Function({bool authorId, bool bookGenreRefs})
    >;
typedef $$GenreTableCreateCompanionBuilder = GenreCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$GenreTableUpdateCompanionBuilder = GenreCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$GenreTableReferences
    extends BaseReferences<_$AppDb, $GenreTable, GenreData> {
  $$GenreTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BookGenreTable, List<BookGenreData>>
  _bookGenreRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.bookGenre,
    aliasName: 'genre__id__book_genre__genre_id',
  );

  $$BookGenreTableProcessedTableManager get bookGenreRefs {
    final manager = $$BookGenreTableTableManager(
      $_db,
      $_db.bookGenre,
    ).filter((f) => f.genreId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookGenreRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GenreTableFilterComposer extends Composer<_$AppDb, $GenreTable> {
  $$GenreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bookGenreRefs(
    Expression<bool> Function($$BookGenreTableFilterComposer f) f,
  ) {
    final $$BookGenreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookGenre,
      getReferencedColumn: (t) => t.genreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookGenreTableFilterComposer(
            $db: $db,
            $table: $db.bookGenre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GenreTableOrderingComposer extends Composer<_$AppDb, $GenreTable> {
  $$GenreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GenreTableAnnotationComposer extends Composer<_$AppDb, $GenreTable> {
  $$GenreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> bookGenreRefs<T extends Object>(
    Expression<T> Function($$BookGenreTableAnnotationComposer a) f,
  ) {
    final $$BookGenreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookGenre,
      getReferencedColumn: (t) => t.genreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookGenreTableAnnotationComposer(
            $db: $db,
            $table: $db.bookGenre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GenreTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $GenreTable,
          GenreData,
          $$GenreTableFilterComposer,
          $$GenreTableOrderingComposer,
          $$GenreTableAnnotationComposer,
          $$GenreTableCreateCompanionBuilder,
          $$GenreTableUpdateCompanionBuilder,
          (GenreData, $$GenreTableReferences),
          GenreData,
          PrefetchHooks Function({bool bookGenreRefs})
        > {
  $$GenreTableTableManager(_$AppDb db, $GenreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) => GenreCompanion(id: id, name: name),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) => GenreCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GenreTable, GenreData>(table),
                  $$GenreTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bookGenreRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (bookGenreRefs) db.bookGenre],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookGenreRefs)
                    await $_getPrefetchedDataByColumns<
                      GenreData,
                      $GenreTable,
                      BookGenreData,
                      $BookGenreTable
                    >(
                      currentTable: table,
                      referencedTable: $$GenreTableReferences
                          ._bookGenreRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GenreTableReferences(db, table, p0).bookGenreRefs,
                      currentColumn: 'id',
                      referencedColumn: 'genre_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GenreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $GenreTable,
      GenreData,
      $$GenreTableFilterComposer,
      $$GenreTableOrderingComposer,
      $$GenreTableAnnotationComposer,
      $$GenreTableCreateCompanionBuilder,
      $$GenreTableUpdateCompanionBuilder,
      (GenreData, $$GenreTableReferences),
      GenreData,
      PrefetchHooks Function({bool bookGenreRefs})
    >;
typedef $$BookGenreTableCreateCompanionBuilder = BookGenreCompanion Function({
  required int bookId,
  required int genreId,
  Value<int> rowid,
});
typedef $$BookGenreTableUpdateCompanionBuilder = BookGenreCompanion Function({
  Value<int> bookId,
  Value<int> genreId,
  Value<int> rowid,
});

final class $$BookGenreTableReferences
    extends BaseReferences<_$AppDb, $BookGenreTable, BookGenreData> {
  $$BookGenreTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BookTable _bookIdTable(_$AppDb db) =>
      db.book.createAlias('book_genre__book_id__book__id');

  $$BookTableProcessedTableManager get bookId {
    final $_column = $_itemColumn<int>('book_id')!;

    final manager = $$BookTableTableManager(
      $_db,
      $_db.book,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GenreTable _genreIdTable(_$AppDb db) =>
      db.genre.createAlias('book_genre__genre_id__genre__id');

  $$GenreTableProcessedTableManager get genreId {
    final $_column = $_itemColumn<int>('genre_id')!;

    final manager = $$GenreTableTableManager(
      $_db,
      $_db.genre,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_genreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BookGenreTableFilterComposer
    extends Composer<_$AppDb, $BookGenreTable> {
  $$BookGenreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$BookTableFilterComposer get bookId {
    final $$BookTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableFilterComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GenreTableFilterComposer get genreId {
    final $$GenreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genreId,
      referencedTable: $db.genre,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenreTableFilterComposer(
            $db: $db,
            $table: $db.genre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookGenreTableOrderingComposer
    extends Composer<_$AppDb, $BookGenreTable> {
  $$BookGenreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$BookTableOrderingComposer get bookId {
    final $$BookTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableOrderingComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GenreTableOrderingComposer get genreId {
    final $$GenreTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genreId,
      referencedTable: $db.genre,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenreTableOrderingComposer(
            $db: $db,
            $table: $db.genre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookGenreTableAnnotationComposer
    extends Composer<_$AppDb, $BookGenreTable> {
  $$BookGenreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$BookTableAnnotationComposer get bookId {
    final $$BookTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableAnnotationComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GenreTableAnnotationComposer get genreId {
    final $$GenreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genreId,
      referencedTable: $db.genre,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenreTableAnnotationComposer(
            $db: $db,
            $table: $db.genre,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookGenreTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $BookGenreTable,
          BookGenreData,
          $$BookGenreTableFilterComposer,
          $$BookGenreTableOrderingComposer,
          $$BookGenreTableAnnotationComposer,
          $$BookGenreTableCreateCompanionBuilder,
          $$BookGenreTableUpdateCompanionBuilder,
          (BookGenreData, $$BookGenreTableReferences),
          BookGenreData,
          PrefetchHooks Function({bool bookId, bool genreId})
        > {
  $$BookGenreTableTableManager(_$AppDb db, $BookGenreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookGenreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookGenreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookGenreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> bookId = const Value.absent(),
                Value<int> genreId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookGenreCompanion(
                bookId: bookId,
                genreId: genreId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int bookId,
                required int genreId,
                Value<int> rowid = const Value.absent(),
              }) => BookGenreCompanion.insert(
                bookId: bookId,
                genreId: genreId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BookGenreTable, BookGenreData>(table),
                  $$BookGenreTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bookId = false, genreId = false}) {
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
                    if (bookId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.bookId,
                        referencedTable: $$BookGenreTableReferences
                            ._bookIdTable(db),
                        referencedColumn: $$BookGenreTableReferences
                            ._bookIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (genreId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.genreId,
                        referencedTable: $$BookGenreTableReferences
                            ._genreIdTable(db),
                        referencedColumn: $$BookGenreTableReferences
                            ._genreIdTable(db)
                            .id,
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

typedef $$BookGenreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $BookGenreTable,
      BookGenreData,
      $$BookGenreTableFilterComposer,
      $$BookGenreTableOrderingComposer,
      $$BookGenreTableAnnotationComposer,
      $$BookGenreTableCreateCompanionBuilder,
      $$BookGenreTableUpdateCompanionBuilder,
      (BookGenreData, $$BookGenreTableReferences),
      BookGenreData,
      PrefetchHooks Function({bool bookId, bool genreId})
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$AuthorTableTableManager get author =>
      $$AuthorTableTableManager(_db, _db.author);
  $$BookTableTableManager get book => $$BookTableTableManager(_db, _db.book);
  $$GenreTableTableManager get genre =>
      $$GenreTableTableManager(_db, _db.genre);
  $$BookGenreTableTableManager get bookGenre =>
      $$BookGenreTableTableManager(_db, _db.bookGenre);
}
