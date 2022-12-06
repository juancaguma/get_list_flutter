// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.addres,
    required this.phone,
    required this.password,
    required this.confirmPass,
    required this.status,
    required this.profilePath,
    required this.typeUser,
    required this.usuarioAlta,
    required this.fechaAlta,
    required this.fechaUpdate,
    required this.borradoLogico,
    this.fechaBorrado,
    this.usuarioBorra,
  });

  int id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String addres;
  String phone;
  String password;
  String confirmPass;
  int status;
  String profilePath;
  String typeUser;
  String usuarioAlta;
  DateTime fechaAlta;
  DateTime fechaUpdate;
  int borradoLogico;
  dynamic fechaBorrado;
  dynamic usuarioBorra;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userName: json["user_name"],
        email: json["email"],
        addres: json["addres"],
        phone: json["phone"],
        password: json["password"],
        confirmPass: json["confirm_pass"],
        status: json["status"],
        profilePath: json["profile_path"],
        typeUser: json["type_user"],
        usuarioAlta: json["usuario_alta"],
        fechaAlta: DateTime.parse(json["fecha_alta"]),
        fechaUpdate: DateTime.parse(json["fecha_update"]),
        borradoLogico: json["borrado_logico"],
        fechaBorrado: json["fecha_borrado"],
        usuarioBorra: json["usuario_borra"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "user_name": userName,
        "email": email,
        "addres": addres,
        "phone": phone,
        "password": password,
        "confirm_pass": confirmPass,
        "status": status,
        "profile_path": profilePath,
        "type_user": typeUser,
        "usuario_alta": usuarioAlta,
        "fecha_alta": fechaAlta.toIso8601String(),
        "fecha_update": fechaUpdate.toIso8601String(),
        "borrado_logico": borradoLogico,
        "fecha_borrado": fechaBorrado,
        "usuario_borra": usuarioBorra,
      };
}
