import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  late String email;

  @HiveField(1)
  late String firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  late String access;

  @HiveField(4)
  late String refresh;
}
