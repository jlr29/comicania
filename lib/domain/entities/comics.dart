import 'package:isar/isar.dart';

part "comics.g.dart";

@collection
class Comic {
  Id isarId = Isar.autoIncrement;
  final String id;
  String description;
  bool completed;

  Comic({
    required this.id,
    required this.description,
    required this.completed,
  });
}