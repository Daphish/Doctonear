import 'dart:typed_data';

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
  List<Map<String, dynamic>>doctors = [];
  Map<String, dynamic>userData = {};
  List<Map<String, dynamic>>appointments = [];

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
      final uid = userCredential.user?.uid;
      final docSnapshot = await FirebaseFirestore.instance.collection('Doctores').doc(uid).get();
      if (docSnapshot.exists) {
        userData = docSnapshot.data() as Map<String, dynamic>;
      } else {
        final pacienteSnapshot = await FirebaseFirestore.instance.collection('Pacientes').doc(uid).get();
        if (pacienteSnapshot.exists) {
          userData = pacienteSnapshot.data() as Map<String, dynamic>;
        }
      }

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

  Future<User?> registerDoctor(String email, String password, int edad, String name, String gender, int telephone, String cedula, String description, String direction, String services, String specialty,String office,Float32x4 costs, BuildContext context) async {
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
            'Cedula': cedula,///poner mismo orden de la base de datos
            'Consultorio': office,
            'Costo':costs,
            'Descripcion': description,
            'Direccion': direction,
            'Edad': edad,
            'Especialidad': specialty,
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

  Future<void> getDoctors() async {
    try {
      CollectionReference doctores = FirebaseFirestore.instance.collection('Doctores');
      QuerySnapshot querySnapshot = await doctores.get();
      List<Map<String, dynamic>>sessionDoctors = [];

      for (var doc in querySnapshot.docs) {
        var doctor = doc.data() as Map<String, dynamic>;
        doctor['id'] = doc.id;
        QuerySnapshot comentariosSnapshot = await doctores.doc(doc.id).collection('Comentarios').get();
        List<Map<String, dynamic>> comentarios = comentariosSnapshot.docs
            .map((comentarioDoc) => comentarioDoc.data() as Map<String, dynamic>)
            .toList();

        doctor['comentarios'] = comentarios;
        sessionDoctors.add(doctor);
      }
      doctors = sessionDoctors;
    } catch (e) {
      print('Error al obtener los doctores : $e');
    }
    print(doctors);
  }

  Future<void> getAppointments(String doctorId) async {
    try {
      CollectionReference citas = FirebaseFirestore.instance.collection('Citas');
      QuerySnapshot querySnapshot = await citas
          .where('IdDoctor', isEqualTo: doctorId)
          .get();

      appointments = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error al obtener las citas: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getAppointmentsForUser(String userId) async {
    try {
      final citas = await FirebaseFirestore.instance
          .collection('Citas')
          .where('IdPaciente', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();

      return citas.docs
          .map((doc) => {
            'id': doc.id,
            ...doc.data(),
          })
          .toList();
    } catch (e) {
      print('Error al obtener las citas: $e');
      return [];
    }
  }

  Future<void> deleteAppointment(String appointmentId) async {
    try {
      await FirebaseFirestore.instance.collection('Citas').doc(appointmentId).delete();
    } catch (e) {
      print('Error al eliminar la cita: $e');
      rethrow;
    }
  }

  Future<void> makeAppointment(Map<String, dynamic> doctor, DateTime date, String hour) async {
    try {
      final DateTime inicioDateTime = combinarFechaYHora(date, hour);
      final DateTime finalDateTime = inicioDateTime.add(Duration(hours: 1));

      await FirebaseFirestore.instance.collection('Citas').doc().set({
        'Direccion': doctor['Direccion'],
        'Especialidad': doctor['Especialidad'],
        'Final': Timestamp.fromDate(finalDateTime),
        'Inicio': Timestamp.fromDate(inicioDateTime),
        'IdDoctor': doctor['id'],
        'IdPaciente': FirebaseAuth.instance.currentUser?.uid,
        'NombreDoctor': doctor['Nombre']
      });
    } catch (e) {
      print('Error al agendar la cita: $e');
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

  DateTime combinarFechaYHora(DateTime fecha, String horaString) {
    final partes = horaString.split(':');
    final horas = int.parse(partes[0]);
    final minutos = int.parse(partes[1]);
    return DateTime(fecha.year, fecha.month, fecha.day, horas, minutos);
  }
}