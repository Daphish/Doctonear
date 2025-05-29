import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/singleton.dart';

class CommentsScreen extends StatefulWidget {
  final Map<String, dynamic> doctor;
  final Function(Map<String, dynamic>) backPress;
  const CommentsScreen({super.key, required this.doctor, required this.backPress});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool isLoading = false;
  Singleton singleton = Singleton();
  final TextEditingController _controller = TextEditingController();
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
                      controller: _controller,
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
                      onPressed: () async {
                        if (_controller.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Haz un comentario válido por favor', style: TextStyle(color: Colors.white),), backgroundColor: con.Prussian_Blue,),
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          await singleton.makeComment(_controller.text, widget.doctor['id']);
                          widget.doctor['comentarios'].add({
                            'Comentario': _controller.text,
                            'NombrePaciente': singleton.userData['Nombre']
                          });
                          _controller.clear();
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Comentario agregado', style: TextStyle(color: Colors.white),), backgroundColor: con.Prussian_Blue,),
                          );
                          widget.backPress(widget.doctor);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.Prussian_Blue,
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
                        elevation: 5,
                      ),
                      child: isLoading ? CircularProgressIndicator(color: Colors.white) : Text(
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
