import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../models/cat.dart';

part 'database.g.dart';

class CatsTable extends Table {
  TextColumn get id => text()();
  TextColumn get url => text()();
  TextColumn get breedId => text().nullable()();
  TextColumn get breedName => text().nullable()();
  TextColumn get breedDescription => text().nullable()();
  TextColumn get breedTemperament => text().nullable()();
  TextColumn get breedOrigin => text().nullable()();
  TextColumn get breedLifeSpan => text().nullable()();
  IntColumn get adaptability => integer().nullable()();
  IntColumn get affectionLevel => integer().nullable()();
  IntColumn get childFriendly => integer().nullable()();
  IntColumn get dogFriendly => integer().nullable()();
  IntColumn get energyLevel => integer().nullable()();
  IntColumn get healthIssues => integer().nullable()();
  IntColumn get intelligence => integer().nullable()();
  IntColumn get socialNeeds => integer().nullable()();
  IntColumn get strangerFriendly => integer().nullable()();
  DateTimeColumn get likedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CatsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  
  Future<List<CatsTableData>> getLikedCats() => 
      (select(catsTable)..where((tbl) => tbl.likedAt.isNotNull()))
      .get();
  
  Future<int> likeCat(CatsTableCompanion cat) =>
      into(catsTable).insert(cat, mode: InsertMode.insertOrReplace);
  
  Future<int> removeLike(String catId) =>
      (update(catsTable)..where((tbl) => tbl.id.equals(catId)))
      .write(const CatsTableCompanion(likedAt: Value(null)));
      
  Future<int> deleteCat(String catId) =>
      (delete(catsTable)..where((tbl) => tbl.id.equals(catId))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cats.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
