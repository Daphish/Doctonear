import "package:flutter/material.dart";
import 'package:medichub/const.dart' as cons;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool arrowText=true;
  bool genderIcon=true;
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
                        onPressed: (){},
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
                        'Ya cuentas con una cuenta?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'body'
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
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
}
