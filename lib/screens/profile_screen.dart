import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:con.Cerulean,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/icono.png',width: 48,height: 47,),
              Text(
                'Perfil',
                style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: 36,
                    color: Colors.white
                ),
              )
            ],
          ),
      ),
       body: SafeArea(
         child: Container(
             color: Colors.white,
             child:Padding(
               padding: EdgeInsets.all(15),
               child: SingleChildScrollView(
                 child: Column(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Stack(
                       children: [
                         Container(
                           padding: EdgeInsets.all(15),
                           child:ClipRRect(
                             borderRadius: BorderRadius.circular(100),
                             child: Image.asset(
                               "assets/images/doctor_avatar.jpg",
                               height: 150,
                               width: 150,
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                         Positioned(
                           bottom: 0,
                           right: 0,
                           child:IconButton(
                             onPressed: (){},
                             icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                             hoverColor: Colors.transparent,
                             highlightColor: Colors.transparent,
                           ) ,
                         )

                       ],
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'Alberto Lopez',
                           style: TextStyle(
                               fontFamily: 'bold',
                               fontSize: 30
                           ),
                         ),
                         IconButton(
                           onPressed: (){},
                           icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                           hoverColor: Colors.transparent,
                           highlightColor: Colors.transparent,
                         )
                       ],
                     ),
                     //correo
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Correo electrónico',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         'alberto.lopez@gmail.com',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                           Expanded(
                               flex: 1,
                               child:Column(
                                 children: [
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                                     hoverColor: Colors.transparent,
                                     highlightColor: Colors.transparent,
                                   )
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     //contraseña
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Contraseña',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         'alberto123',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                           Expanded(
                               flex: 1,
                               child:Column(
                                 children: [
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                                     hoverColor: Colors.transparent,
                                     highlightColor: Colors.transparent,
                                   )
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     //edad
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Edad',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         '22',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                           Expanded(
                               flex: 1,
                               child:Column(
                                 children: [
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                                     hoverColor: Colors.transparent,
                                     highlightColor: Colors.transparent,
                                   )
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     //genero
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Género',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         'Masculino',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                           Expanded(
                               flex: 1,
                               child:Column(
                                 children: [
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                                     hoverColor: Colors.transparent,
                                     highlightColor: Colors.transparent,
                                   )
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     //telefono
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Correo electrónico',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         'alberto.lopez@gmail.com',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                           Expanded(
                               flex: 1,
                               child:Column(
                                 children: [
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                                     hoverColor: Colors.transparent,
                                     highlightColor: Colors.transparent,
                                   )
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     ///rol
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Rol',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         'Médico',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                         ],
                       ),
                     ),
                     ///medico---> cedula
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Cédula profesional',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         '51594584156156',
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'bold',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                           Expanded(
                               flex: 1,
                               child:Column(
                                 children: [
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Icons.edit,color: con.Prussian_Blue,size: 30,),
                                     hoverColor: Colors.transparent,
                                     highlightColor: Colors.transparent,
                                   )
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     Divider(
                       color: con.Cerulean,
                     ),



                   ],
                 ),
               )
             )
         ),
       ),
    );
  }
}
