import 'package:flutter/material.dart';
import 'GastosFixos.dart';
import 'MyApp.dart';
import 'Moveis.dart';

class GastosVariaveis extends StatelessWidget {
  const GastosVariaveis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Gastos Variaveis',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff764abc)),
              //Image.assets()
              child: Text('Menu'),
            ),
            ListTile(
              // leading: Icon(),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).push(_page(const MyApp())),
            ),
            ListTile(
              // leading: Icon(),
              title: const Text('Móveis'),
              onTap: () => Navigator.of(context).push(_page(const Moveis())),
            ),
            ListTile(
              //leading: Icon(),
              title: const Text('Gastos Fixos'),
              onTap: () =>
                  Navigator.of(context).push(_page(const GastosFixos())),
            ),
            ListTile(
              //leading: Icon(),
              title: const Text('Gastos Variáveis'),
              onTap: () =>
                  Navigator.of(context).push(_page(const GastosVariaveis())),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ListView(padding: const EdgeInsets.all(8), children: <Widget>[
              Container(
                height: 50,
                color: Colors.purple[100],
                child: const Center(child: Text('Sofá')),
              ),
              Container(
                height: 50,
                color: Colors.purple[300],
                child: const Center(child: Text('Geladeira')),
              ),
              Container(
                height: 50,
                color: Colors.purple[100],
                child: const Center(child: Text('Mesa da cozinha')),
              ),
              Container(
                height: 50,
                color: Colors.purple[300],
                child: const Center(child: Text('Máquina de lavar roupa')),
              ),
              Container(
                height: 50,
                color: Colors.purple[100],
                child: const Center(child: Text('Cama quarto Rhuan')),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class _page extends MaterialPageRoute<void> {
  _page(Widget screen)
      : super(builder: (BuildContext context) {
          return screen;
        });
}
