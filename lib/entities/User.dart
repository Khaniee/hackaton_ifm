import 'package:hackaton_ifm/database/database.dart';
import 'package:sqflite/sqflite.dart';

class User {
  int id;
  String nom;
  String email;
  String password;

  User({
    required this.id,
    required this.nom,
    required this.password,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nom = json["nom"],
        password = json["password"],
        email = json["email"];

  Map<String, Object?> toJson() {
    return {
      "id": id,
      "nom": nom,
      "password": password,
      "email": email,
    };
  }

  Future<User> create(User user) async {
    final db = await AppDatabase.instance.database;

    await db.insert(
      "users",
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return user;
  }

  /// Return list of all [User] from the local database.
  Future<List<User>> getUsers() async {
    final db = await AppDatabase.instance.database;

    final result = await db.query("users", orderBy: "id");
    return result.map((json) => User.fromJson(json)).toList();
  }
}
