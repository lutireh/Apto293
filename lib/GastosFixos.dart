import 'package:flutter/material.dart';
import 'Moveis.dart';
import 'MyApp.dart';
import 'GastosVariaveis.dart';

class GastosFixos extends StatelessWidget {
  const GastosFixos({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Gastos Fixos',
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
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.money),
                labelText: 'Valor Aluguel',
              ),
            ),
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

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Opa, você clicou em mim'),
            action: SnackBarAction(
              label: 'Fechar',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Clique em mim'),
      ),
    );
  }
}
