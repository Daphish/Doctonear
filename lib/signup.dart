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
  bool arrowText=true;
  bool genderIcon=true;
  User? _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
      singleton.messageLogin = '';

      if (email.isNotEmpty && password.isNotEmpty) {
        if (isValidEmail(email.trim())) {
          if (password.length >= 6) {
            _user = await singleton.registerUser(email, password, context);
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
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          obscureText: arrowText,
                          decoration: InputDecoration(
                            hintText:'Rol',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            suffixIcon: IconButton(
                              icon: arrowText?
                              Icon(Icons.keyboard_arrow_down_outlined,size: 20, color: Color(0xff007EA7)) : Icon(Icons.keyboard_arrow_up_outlined,size:20,color: Color(0xff007EA7)),
                              onPressed: (){
                                setState((){
                                  arrowText=arrowText;
                                });
                              },
                            ),
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
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'cuerpo',
                            fontSize: 16,
                          ),
                          obscureText: genderIcon,
                          decoration: InputDecoration(
                            hintText:'Género',
                            hintStyle:TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Color(0x80000000)
                            ) ,
                            suffixIcon: IconButton(
                              icon: genderIcon?
                              Icon(Icons.keyboard_arrow_down_outlined,size: 20, color: Color(0xff007EA7)) : Icon(Icons.keyboard_arrow_up_outlined,size:20,color: Color(0xff007EA7)),
                              onPressed: (){
                                setState((){
                                  genderIcon=!genderIcon;
                                });
                              },
                            ),
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
                        SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: (){
                            register();
                          },
                          child: Text(
                            'Registrarme',
                            style: TextStyle(
                                fontFamily: 'butLOg',
                                fontSize: 22,
                                color: Colors.white
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cons.Prussian_Blue,
                            padding: EdgeInsets.symmetric(horizontal: 105,vertical: 12),
                            elevation: 5,
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
