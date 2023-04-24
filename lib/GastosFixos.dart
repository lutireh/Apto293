import 'package:flutter/material.dart';
import 'package:att_2_flutter/drawer.dart';

class GastosFixos extends StatelessWidget {
  const GastosFixos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Gastos Fixos',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gasto fixo atual:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'R\$ 1.500,00',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Detalhamento dos gastos:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.purple[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Luz'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('R\$ 0,00'),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.purple[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Aluguel'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('R\$ 1000,00'),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.purple[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Internet'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('R\$ 500,00'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.money),
                  tooltip: 'Adicionar conta de aluguel',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.wifi),
                  tooltip: 'Adicionar conta de internet',
                ),
                IconButton(
                  onPressed: () {
                    _adicionarLuz(context);
                  },
                  icon: const Icon(Icons.lightbulb),
                  tooltip: 'Adicionar conta de luz',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _adicionarLuz(BuildContext context) {
  double valorLuz = 0;
  final snackBar = SnackBar(
    content: const Text('Conta de luz adicionada com sucesso!'),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 2),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: const Text("Adicionar conta de luz"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Escolha o valor da conta de luz'),
              const SizedBox(height: 20),
              Slider(
                value: valorLuz,
                onChanged: (double value) {
                  setState(() {
                    valorLuz = value;
                  });
                },
                min: 0,
                max: 1000,
                divisions: 100,
                label: 'R\$ $valorLuz',
              ),
            ],
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
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              },
              child: const Text("Adicionar"),
            ),
          ],
        );
      });
    },
  );
}
