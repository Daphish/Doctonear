import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as cons;
import 'package:medichub/singleton.dart';

class HomeScreen extends StatefulWidget {
  final Function(String) onSearchPressed;

  const HomeScreen({super.key, required this.onSearchPressed});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool arrowText = true;
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();
  final Singleton singleton = Singleton();

  @override
  void initState() {
    super.initState();
    _loadDoctorsInBackground();
  }

  Future<void> _loadDoctorsInBackground() async {
    if (singleton.doctors.isEmpty) {
      await singleton.getDoctors();
    }
  }

  Future<void> _handleSearch() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (singleton.doctors.isEmpty) {
        await singleton.getDoctors();
      }

      widget.onSearchPressed(_controller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar doctores: $e'))
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
                    colors: [
                      Color(0xffFFFFFF),
                      cons.Cerulean
                    ]
                )
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/icono.png', height: 40, width: 40, fit: BoxFit.contain,),
                          Text(
                            'Doctonear',
                            style: TextStyle(
                                fontFamily: 'titulo',
                                fontSize: 40,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/doctor_image.png', height: 350, fit: BoxFit.contain,),
                      SizedBox(height: 20,),
                      Text(
                        'Encuentra el doctor más confiable y cercano',
                        style: TextStyle(
                          fontFamily: 'titulo',
                          fontSize: 30,
                          color: cons.Prussian_Blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _controller,
                        enabled: !isLoading,
                        style: TextStyle(
                          fontFamily: 'cuerpo',
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Especialidad o nombre',
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
                      SizedBox(height: 30,),
                      ElevatedButton(
                        onPressed: isLoading ? null : _handleSearch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cons.Prussian_Blue,
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                          elevation: 5,
                        ),
                        child: isLoading
                            ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text(
                          'Buscar',
                          style: TextStyle(
                              fontFamily: 'butLOg',
                              fontSize: 22,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}