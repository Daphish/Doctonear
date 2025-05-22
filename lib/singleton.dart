import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<User?> registerPatient(String email, String password, int edad, String name, String gender, int telephone, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Usuario registrado exitosamente.");
      User? user = userCredential.user;

      if (user != null) {
        String uid = user.uid;

        try {
          await FirebaseFirestore.instance.collection('Pacientes').doc(uid).set({
            'Edad': edad,
            'Genero': gender,
            'Nombre': name,
            'Telefono': telephone,
          });
          print("Paciente registrado en Firestore");
        } catch (e) {
          print("Error al registrar paciente en Firestore: $e");
          messageLogin = 'Error al registrar paciente en Firestore.';
          return null;
        }

        print("Paciente registrado en Firestore");
      }
      return user;

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

  Future<User?> registerDoctor(String email, String password, int edad, String name, String gender, int telephone, String cedula, String description, String direction, String services, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Usuario registrado exitosamente.");
      User? user = userCredential.user;

      if (user != null) {
        String uid = user.uid;

        try {
          await FirebaseFirestore.instance.collection('Doctores').doc(uid).set({
            'Cedula': cedula,
            'Descripcion': description,
            'Direccion': direction,
            'Edad': edad,
            'Genero': gender,
            'Nombre': name,
            'Servicios': services,
            'Telefono': telephone,
          });
          print("Doctor registrado en Firestore");
        } catch (e) {
          print("Error al registrar doctor en Firestore: $e");
          messageLogin = 'Error al registrar doctor en Firestore.';
          return null;
        }

        print("Doctor registrado en Firestore");
      }
      return user;

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