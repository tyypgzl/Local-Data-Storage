import 'dart:convert';

class Student {
  final int id;
  final String name;
  final String schoolName;
  final int age;

  Student({required this.id, required this.name, required this.schoolName, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schoolName': schoolName,
      'age': age,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      schoolName: map['schoolName'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'id: $id, name: $name, schoolName: $schoolName, age: $age';
  }
}
