import '../entities/comics.dart';

abstract class LocalDbRepository {
  Future<List<Comic>> loadComics();
  Future<void> deleteComic(String id);
  Future<void> addComic({required String description});
  Future<void> toggleComic(String id);
}