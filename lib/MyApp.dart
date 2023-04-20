import 'package:flutter/material.dart';
import 'Moveis.dart';
import 'GastosFixos.dart';
import 'GastosVariaveis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Apto 293",
        home: Builder(
          builder: (context) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Apto 293',
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
                      onTap: () =>
                          Navigator.of(context).push(_page(const MyApp())),
                    ),
                    ListTile(
                      // leading: Icon(),
                      title: const Text('Móveis'),
                      onTap: () =>
                          Navigator.of(context).push(_page(const Moveis())),
                    ),
                    ListTile(
                      //leading: Icon(),
                      title: const Text('Gastos Fixos'),
                      onTap: () => Navigator.of(context)
                          .push(_page(const GastosFixos())),
                    ),
                    ListTile(
                      //leading: Icon(),
                      title: const Text('Gastos Variáveis'),
                      onTap: () => Navigator.of(context)
                          .push(_page(const GastosVariaveis())),
                    ),
                  ],
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo293.png', width: 200, height: 200),
                    SelectionContainer.disabled(
                      child: Text(
                          'Apto 293, apartamento onde mora Luiza e Rhuan. A ideia do aplicativo é facilitar essa organização dos dois, que serão os usuários exclusivos do app. As funcionalidades incluem: cadastrar quem comprou os móveis e eletrodomésticos, cadastrar gastos fixos (aluguel, conta de luz e conta de internet) e dividir essas contas, cadastrar compras conjuntas (comida, mantimentos e manutenção) também podendo utilizar a opção de dividir, o foco desta funcionalidade é guardar a informação de quem comprou o que em um histórico.'),
                    )
                  ],
                ),
              )),
        ));
  }
}

class _page extends MaterialPageRoute<void> {
  _page(Widget screen)
      : super(builder: (BuildContext context) {
          return screen;
        });
}
