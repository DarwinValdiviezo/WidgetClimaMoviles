import 'package:flutter/material.dart';
import '../modelo/clima_modelo.dart';
import '../controlador/clima_controlador.dart';
import 'vista_widget.dart';

class ClimaVista extends StatefulWidget {
  @override
  ClimaVistaState createState() => ClimaVistaState();
}

class ClimaVistaState extends State<ClimaVista> {
  final TextEditingController ciudadc = TextEditingController();
  final ClimaControlador climac = ClimaControlador();

  ClimaModelo? climaModelo;

  //anai un indicador como que se esta cargando
  bool cargando = false;

  void obtenerClima() async {
    setState(() {
      cargando = true;
    });
    climaModelo = await climac.obtenerClima(ciudadc.text);
    setState(() {
      cargando = false;
    });
  }

//anadimos un Scaffold para mostrar la app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de Darwin'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 138, 182, 219),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: ciudadc,
              decoration: InputDecoration(
                hintText: 'Ingresa una ciudad',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: obtenerClima,
              child: Text('Buscar'),
            ),

            //usamos el cargado de la app para mostrar un indicador de carga en la app
            SizedBox(height: 20),
            cargando
                ? CircularProgressIndicator()
                : climaModelo != null
                    ? ClimaWidget(
                        ciudad: climaModelo!.ciudad,
                        temperatura: climaModelo!.temperatura,
                        descripcion: climaModelo!.descripcion,
                      )
                    : Text('Ingrese una ciudad para obtener el clima'),
          ],
        ),
      ),
    );
  }
}
