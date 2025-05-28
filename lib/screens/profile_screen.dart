import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/singleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Singleton singleton = Singleton();

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
           height: MediaQuery.of(context).size.height,
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
                           singleton.userData['Nombre'],
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
                                         singleton.userData['Edad'].toString(),
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
                                         singleton.userData['Genero'],
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
                                         'Teléfono',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         singleton.userData['Telefono'].toString(),
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
                                         singleton.userData['Rol'],
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
                     ...singleton.userData['Rol'] == 'Doctor' ? [
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
                                         singleton.userData['Cedula'],
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
                                           'Consultorio',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           singleton.userData['Consultorio'],
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
                                           'Costo de consulta',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           singleton.userData['Costo'].toString(),
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
                                           'Descripción',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           singleton.userData['Descripcion'],
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
                                           'Dirección',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           singleton.userData['Direccion'],
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
                                           'Especialidad',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           singleton.userData['Especialidad'],
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
                                           'Servicios',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           singleton.userData['Servicios'],
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
                     ] : []
                   ],
                 ),
               )
             )
         ),
       ),
    );
  }
}
