import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:con.Cerulean,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){},
              icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 35),
            ),
            Text(
              'Comentario',
              style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 26,
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
              padding: EdgeInsets.all(15),
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Agrega un comentario',
                          style: TextStyle(
                              fontFamily: "bold",
                              fontSize: 24
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: null,
                      style: TextStyle(
                        fontFamily: 'cuerpo',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.comment_outlined,color: con.Prussian_Blue,),
                        hintText:'Comentario',
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
                    SizedBox(height: 50,),
                    ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.Prussian_Blue,
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
                        elevation: 5,
                      ),
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                            fontFamily: 'butLOg',
                            fontSize: 22,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}
