import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Singleton {
  // singleton
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() => _singleton;

  Singleton._internal();

  String emailGmail = '';
  String nameGmail = '';
  String emailUser = '';
  String uidGmail = '';
  bool loader = false;
  String messageLogin = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Obtener el usuario actual
  User? get currentUser => _auth.currentUser;

  // Obtener el nombre del usuario
  String? get userName => currentUser?.displayName;

  // Obtener el correo del usuario
  String? get userEmail => currentUser?.email;

  Future<User?> signIn(String email, String password) async {
    try {
      List<String> methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      print(methods);

      FirebaseAuth.instance.setLanguageCode('es');

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await userCredential.user?.reload();

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("Usuario no encontrado. Intentando registrarlo...");
        //return await registerUser(email, password);
      } else if (e.code == 'wrong-password') {
        print("Contraseña incorrecta.");
        messageLogin = 'Contraseña incorrecta';
      } else if (e.code == 'invalid-email') {
        print("El formato del correo es incorrecto.");
        messageLogin = 'El formato del correo es incorrecto';
      } else if (e.code == 'too-many-requests') {
        print("Demasiados intentos fallidos. Inténtalo más tarde.");
        messageLogin = 'Demasiados intentos fallidos. Inténtalo más tarde';
      } else if (e.code == 'invalid-credential') {
        print("La credencial de autenticación suministrada es incorrecta.");
        messageLogin = 'Correo o contraseña incorrectos';
      } else {
        print('Error: ${e.code} - ${e.message}');
      }
      return null;
    }
  }

  Future<User?> registerUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Usuario registrado exitosamente.");
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("El correo ya está en uso por otra cuenta.");
        messageLogin = 'El correo ya está en uso por otra cuenta.';
        return await signIn(email, password);
      } else if (e.code == 'weak-password') {
        print("La contraseña es demasiado débil.");
      } else {
        print("Error en el registro: ${e.message}");
      }
      return null;
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Sesión cerrada exitosamente.");
    } catch (e) {
      print("Error al cerrar sesión: $e");
    }
    //await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}