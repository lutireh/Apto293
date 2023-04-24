import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Drawer.dart';
import 'Usuario.dart';
import 'Moveis.dart';
import 'GastosFixos.dart';
import 'GastosVariaveis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

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
          drawer: AppDrawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo293.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  'Apto 293',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'O app perfeito para organizar a vida em um apartamento compartilhado. Cadastre seus móveis, divida os gastos fixos e variáveis, e mantenha um histórico das compras conjuntas. Tudo de forma simples e fácil!',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
