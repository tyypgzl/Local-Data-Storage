import 'package:floor/floor.dart';

@entity
class Employee {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? name;

  @ignore
  final Gender? gender;

  final int? genderIndex;

  Employee({this.id, this.name, this.gender, this.genderIndex});
}

enum Gender { male, female }
