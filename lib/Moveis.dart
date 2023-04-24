import 'package:flutter/material.dart';
import 'package:att_2_flutter/drawer.dart';
import 'GastosFixos.dart';
import 'MyApp.dart';
import 'GastosVariaveis.dart';

class Moveis extends StatelessWidget {
  const Moveis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Móveis',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Móveis atuais:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
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
          ],
        ),
      ),
      floatingActionButton: PopupMenuButton<String>(
        icon: Icon(Icons.add),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'adicionar',
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('Adicionar'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'pesquisar',
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text('Pesquisar'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'excluir',
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Excluir'),
            ),
          ),
        ],
        onSelected: (String value) {
          if (value == 'adicionar') {
            _adicionarMovel(context);
          } else if (value == 'pesquisar') {
            // Código para pesquisar um móvel
          } else if (value == 'excluir') {
            //Código para excluir o móvel
          }
        },
        tooltip: 'Opções',
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

void _adicionarMovel(BuildContext context) {
  String nomeMovel = "";
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Adicionar Móvel"),
        content: TextFormField(
          onChanged: (value) {
            nomeMovel = value;
          },
          decoration: const InputDecoration(hintText: "Nome do móvel"),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Item adicionado com sucesso!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ));
              Navigator.pop(context);
            },
            child: const Text("Adicionar"),
          ),
        ],
      );
    },
  );
}
