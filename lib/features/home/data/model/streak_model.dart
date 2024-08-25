import 'package:hive/hive.dart';

part 'streak_model.g.dart';

@HiveType(typeId: 2)
class StreakModel extends HiveObject {
  @HiveField(0)
  int streakDays;

  @HiveField(1)
  DateTime lastUpdated;

  StreakModel({required this.streakDays, required this.lastUpdated});
}
