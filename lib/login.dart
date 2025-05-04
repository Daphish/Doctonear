import "package:flutter/material.dart";
import 'package:medichub/const.dart' as cons;
import 'package:medichub/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passIcon=true;
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
                cons.Cerulean

              ]
            )
          ),
          child:Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
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
                      onPressed: (){},
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            fontFamily: 'butLOg',
                            fontSize: 22,
                            color: Colors.white
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cons.Prussian_Blue,
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
                        elevation: 5,
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder:
                                (context)=>Signup()));
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
                ),
              )
          ),
        ),
      ),
    );
  }
}
