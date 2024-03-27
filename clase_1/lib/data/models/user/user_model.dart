import 'dart:convert';

class Usuario {
    String nombre;
    String email;
    String ubicacion;
    int edad;

    Usuario({
        required this.nombre,
        required this.email,
        required this.ubicacion,
        required this.edad,
    });

    Usuario copyWith({
        String? nombre,
        String? email,
        String? ubicacion,
        int? edad,
    }) => 
        Usuario(
            nombre: nombre ?? this.nombre,
            email: email ?? this.email,
            ubicacion: ubicacion ?? this.ubicacion,
            edad: edad ?? this.edad,
        );

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        email: json["email"],
        ubicacion: json["ubicacion"],
        edad: json["edad"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "ubicacion": ubicacion,
        "edad": edad,
    };
}
