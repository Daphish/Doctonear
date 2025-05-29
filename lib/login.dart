import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:medichub/const.dart' as cons;
import 'package:medichub/layout/layout.dart';
import 'package:medichub/signup.dart';
import 'package:medichub/singleton.dart';
import 'package:medichub/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:medichub/widgets/snackbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Singleton singleton = Singleton();
  bool passIcon=true;
  User? _user;
  bool _checkingSession = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    // Verificar si hay un usuario autenticado
    final currentUser = singleton.currentUser;

    if (currentUser != null) {
      // Cargar los datos del usuario desde Firestore
      try {
        await singleton.loadUserData(currentUser.uid);

        // Navegar a la pantalla principal
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainLayout()),
          );
        }
      } catch (e) {
        print('Error cargando datos del usuario: $e');
        // Mostrar login normalmente si hay error
      }
    }

    if (mounted) {
      setState(() {
        _checkingSession = false;
      });
    }
  }

  void login() async {
    setState(() {
      singleton.loader = true;
    });

    bool siHayInternet = false;
    if(!kIsWeb) {
      if (await Utils.tieneConexionInternet()) {
        siHayInternet = true;
      } else {
        showSnackbar(3, 'Sin conexión a internet', 'Favor de revisar tu conexión a internet', context);
      }
    } else {
      siHayInternet = true;
    }

    String email = emailController.text.trim();
    String password = passController.text.trim();

    if(siHayInternet) {
      if(email.isNotEmpty && password.isNotEmpty) {
        if (isValidEmail(email.trim())) {
          if (password.length >= 6) {
            _user = await singleton.signIn(email, password);
            if(_user != null) {
              setState(() {
                singleton.loader = false;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context)=>MainLayout()));
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
            showSnackbar(2, 'Inicio de Sesión', singleton.messageLogin, context);
          }
        } else {
          showSnackbar(3, 'Inicio de Sesión', 'El correo no tiene el formato directo', context);
        }
      } else {
        showSnackbar(3, 'Inicio de Sesión', 'Todos los campos deben de estar llenos', context);
      }
    }

    setState(() {
      singleton.loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _checkingSession ? Center(child: CircularProgressIndicator(color: cons.Cerulean)) : SafeArea(
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
                cons.Cerulean

              ]
            )
          ),
          child:Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child:Column(
                    children: [
                      SizedBox(height: 90,),
                      Image.asset('assets/images/icono.png',height:100, width: 102, fit: BoxFit.contain,),
                      Text(
                        'Doctonear',
                        style: TextStyle(
                            fontFamily: 'titulo',
                            fontSize: 64,
                            color: Colors.white
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          fontFamily: 'cuerpo',
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText:'Correo electrónico',
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
                        controller: passController,
                        style: TextStyle(
                          fontFamily: 'cuerpo',
                          fontSize: 16,
                        ),
                        obscureText: passIcon,
                        decoration: InputDecoration(
                          hintText:'Contraseña',
                          hintStyle:TextStyle(
                              fontFamily: 'cuerpo',
                              fontSize: 16,
                              color: Color(0x80000000)
                          ) ,
                          suffixIcon: IconButton(
                            icon:passIcon?
                            Icon(Icons.visibility_off,size: 20, color: Color(0xff007EA7)) : Icon(Icons.visibility,size:20,color: Color(0xff007EA7)),
                            onPressed: (){
                              setState((){
                                passIcon=!passIcon;
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
                      SizedBox(height: 40,),
                      ElevatedButton(
                        onPressed: (){
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cons.Prussian_Blue,
                          padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
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
                          'Iniciar sesión',
                          style: TextStyle(
                              fontFamily: 'butLOg',
                              fontSize: 22,
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Text(
                        '¿No tienes una cuenta aún?',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'body'
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
                        },
                        child: Text(
                          'Regístrate',
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
                  ) ,
                )
              )
          ),
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
