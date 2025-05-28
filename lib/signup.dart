import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:medichub/const.dart' as cons;
import 'package:medichub/layout/layout.dart';
import 'package:medichub/login.dart';
import 'package:medichub/singleton.dart';
import 'package:medichub/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:medichub/widgets/snackbar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Singleton singleton = Singleton();
  User? _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController directionController = TextEditingController();
  final TextEditingController servicesController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController officeController = TextEditingController();
  final TextEditingController costsController = TextEditingController();

  String? _selectedRole;
  final List<String> _roles = ['Paciente', 'Doctor'];

  String? _selectedGenre;
  final List<String> _genres = ['Femenino', 'Masculino','No-binario'];

  void register() async {
    setState(() {
      singleton.loader = true;
    });

    bool siHayInternet = false;
    if(!kIsWeb) {
      if (await Utils.tieneConexionInternet()) {
        siHayInternet = true;
      } else {
        showSnackbar(3, 'Sin conexión a internet', 'Favor de revisar tu conexión de internet', context);
      }
    } else {
      siHayInternet = true;
    }

    if (siHayInternet) {
      String email = emailController.text.trim();
      String password = passController.text.trim();
      int edad = int.parse(ageController.text.trim());
      String name = nameController.text.trim();
      String gender = genderController.text.trim();
      int telephone = int.parse(telephoneController.text.trim());
      String cedula = cedulaController.text.trim();
      String description = descriptionController.text.trim();
      String direction = directionController.text.trim();
      String services = servicesController.text.trim();
      String specialty = specialtyController.text.trim();
      String office=officeController.text.trim();
      Float32x4 costs=costsController.text.trim() as Float32x4;

      singleton.messageLogin = '';

      if (email.isNotEmpty && password.isNotEmpty) {
        if (isValidEmail(email.trim())) {
          if (password.length >= 6) {
            if(_selectedRole == "Paciente") {
              _user = await singleton.registerPatient(email, password, edad, name, gender, telephone, context);
              if (_user != null) {
                setState(() {
                  singleton.loader = false;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context)=>Login()));
                });
              } else {
                if (singleton.messageLogin.isNotEmpty) {
                  if (singleton.messageLogin.contains('uso')) {
                    setState(() {
                      singleton.loader = false;
                    });
                  } else {
                    showSnackbar(3, 'Inicio de Sesión', singleton.messageLogin, context);
                  }
                }
              }
            } else if(_selectedRole == "Doctor"){
              _user = await singleton.registerDoctor(email, password, edad, name, gender, telephone, cedula, description, direction, services, specialty,office,costs, context);
              if (_user != null) {
                setState(() {
                  singleton.loader = false;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context)=>Login()));
                });
              } else {
                if (singleton.messageLogin.isNotEmpty) {
                  if (singleton.messageLogin.contains('uso')) {
                    setState(() {
                      singleton.loader = false;
                    });
                  } else {
                    showSnackbar(3, 'Inicio de Sesión', singleton.messageLogin, context);
                  }
                }
              }
            }
          } else {
            showSnackbar(2, 'Inicio de Sesión', 'La contraseña es demasiado débil, min de 6 caracteres', context);
          }
        } else {
          showSnackbar(3, 'Inicio de Sesión', 'El correo no tiene el formato correcto', context);
        }
      } else {
        showSnackbar(3, 'Inicio de Sesión', 'Todos los campos deben de estar llenos', context);
      }
    } else {
      showSnackbar(3, 'Sin conexión a internet', 'Favor revisa tu conexión a internet', context);
    }

    setState(() {
      singleton.loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      0.15,
                      1.0,
                    ],
                    colors: [
                      Color(0xffFFFFFF),
                      Color(0xff007EA7),

                    ]
                )
            ),
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo.png'),
                        Text(
                          'Doctonear',
                          style: TextStyle(
                              fontFamily: 'titulo',
                              fontSize: 64,
                              color: Colors.white
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          iconEnabledColor: cons.Cerulean,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          value: _selectedRole,
                          items: _roles.map((role) {
                            return DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value;
                            });
                          },
                          validator: (value) => value == null ? 'Selecciona un rol' : null,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Rol',
                            hintStyle: TextStyle(
                              fontFamily: 'cuerpo',
                              fontSize: 16,
                              color: Color(0x80000000)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Nombre completo *',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Correo electrónico *',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: telephoneController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Número telefónico',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: ageController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Edad',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        DropdownButtonFormField<String>(
                          iconEnabledColor: cons.Cerulean,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          value: _selectedGenre,
                          items: _genres.map((genre) {
                            return DropdownMenuItem(
                              value: genre,
                              child: Text(genre),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedGenre = value;
                            });
                          },
                          validator: (value) => value == null ? 'Selecciona un género' : null,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Género',
                            hintStyle: TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xff007EA7),
                                  width: 2.0,
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: passController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Contraseña *',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        ..._selectedRole == 'Doctor' ?
                        [SizedBox(height: 7),
                        TextFormField(
                          controller: cedulaController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Cédula',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: descriptionController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Descripción',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: directionController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Dirección',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                          SizedBox(height: 7),
                          TextFormField(
                            controller: officeController,
                            style: TextStyle(
                              fontFamily: 'cuerpo',
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText:'Consultorio. Ej: "Piso 10, Consultorio 14"',
                              hintStyle:TextStyle(
                                  fontFamily: 'cuerpo',
                                  fontSize: 16,
                                  color: Color(0x80000000)
                              ) ,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xff007EA7),
                                  width: 2.0, // grosor
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xff007EA7),
                                  width: 2.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        SizedBox(height: 7),
                        TextFormField(
                          controller: servicesController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Servicios',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                          SizedBox(height: 7),
                          TextFormField(
                            controller: costsController,
                            style: TextStyle(
                              fontFamily: 'cuerpo',
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText:'Costo de la consulta',
                              hintStyle:TextStyle(
                                  fontFamily: 'cuerpo',
                                  fontSize: 16,
                                  color: Color(0x80000000)
                              ) ,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xff007EA7),
                                  width: 2.0, // grosor
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xff007EA7),
                                  width: 2.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        TextFormField(
                          controller: specialtyController,
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:'Especialidad',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0, // grosor
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),] : [],
                        SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: (){
                            register();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cons.Prussian_Blue,
                            padding: EdgeInsets.symmetric(horizontal: 105,vertical: 12),
                            elevation: 5,
                          ),
                          child: singleton.loader ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ) :
                          Text(
                            'Registrarme',
                            style: TextStyle(
                                fontFamily: 'butLOg',
                                fontSize: 22,
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text(
                          '¿Ya cuentas con una cuenta?',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'body'
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text(
                            'Iniciar sesión',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: cons.link,
                                color: cons.link,
                                fontFamily: 'body',
                                fontSize: 16
                            ),
                          ),
                        )

                      ],
                    ),
                  )
              ),
            )
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );
    return emailRegExp.hasMatch(email);
  }
}
