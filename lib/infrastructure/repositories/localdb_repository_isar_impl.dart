import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/comics.dart';
import '../../domain/repositories/localdb_repository.dart';

class LocalDbRepositoryIsarImpl extends LocalDbRepository {
  late Future<Isar> db;

  LocalDbRepositoryIsarImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ComicSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> addComic({required String description}) async {
    final Isar isar = await db;
    const uuid = Uuid();
    await isar.writeTxn(() async {
      final newComic = Comic(id: uuid.v4(), description: description, completed: false);
      await isar.comics.put(newComic);
    });
  }

  @override
  Future<void> deleteComic(String id) async {
    final Isar isar = await db;
    final Comic? comic = await isar.comics.filter().idEqualTo(id).findFirst();
    if (comic != null) {
      await isar.writeTxn(() async {
        await isar.comics.delete(comic.isarId);
      });
    }
  }

  @override
  Future<void> toggleComic(String id) async {
    final Isar isar = await db;
    await isar.writeTxn(() async {
      final Comic? comic = await isar.comics.filter().idEqualTo(id).findFirst();

      if (comic != null) {
        comic.completed = !comic.completed;
        await isar.comics.put(comic);
      }
    });
  }

  @override
  Future<List<Comic>> loadComics() async {
    final Isar isar = await db;
    final comics = await isar.comics.where(sort: Sort.desc).anyIsarId().findAll();
    return comics;
  }
}