import 'package:flutter/material.dart';
import 'Mapas.dart';

class Homes extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Homes> {
  final List _listaViagens = [
    "Cristo Redentor",
    "Grande Muralha da China",
    "Taj Mahal",
    "Machu Picchu",
    "Coliseu"
  ];
  _abrirMapa() {}
  _excluirViagem() {}
  _adicionarLocal() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Mapas()), // CORRETO
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minhas viagens",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            _adicionarLocal();
          }),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _listaViagens.length,
                itemBuilder: (context, index) {
                  String titulo = _listaViagens[index];
                  return GestureDetector(
                    onTap: () {
                      _abrirMapa();
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(titulo),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _excluirViagem();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Mapa {}
