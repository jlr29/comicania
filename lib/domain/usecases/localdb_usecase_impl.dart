import '../repositories/localdb_repository.dart';
import '../usecases/localdb_usecase.dart';

import '../entities/comics.dart';

class LocalDbUsecaseImpl extends LocalDbUsecase {
  final LocalDbRepository localDbRepository;

  LocalDbUsecaseImpl(this.localDbRepository);

  @override
  Future<void> addComic({required String description}) {
    return localDbRepository.addComic(description: description);
  }

  @override
  Future<void> deleteComic(String id) {
    return localDbRepository.deleteComic(id);
  }

  @override
  Future<List<Comic>> loadComics() {
    return localDbRepository.loadComics();
  }

  @override
  Future<void> toggleComic(String id) {
    return localDbRepository.toggleComic(id);
  }
}