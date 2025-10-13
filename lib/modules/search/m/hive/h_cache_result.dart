import 'package:hive/hive.dart';

part 'h_cache_result.g.dart';

@HiveType(typeId: 0)
class CachedResult extends HiveObject {
  @HiveField(0)
  final String json;

  @HiveField(1)
  final DateTime timestamp;

  CachedResult({required this.json, required this.timestamp});
}

// flutter packages pub run build_runner build
