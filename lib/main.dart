import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BlockProvider criado para gerenciar o ThemeBloc.
    // Ao ser colocado acima do MaterialAPP, faz com que todos os widgets criados em baixo dele, possam acessar o ThemeBloc.

    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, currentTheme) {
          //Material App que vai utilizar o theme fornecido pelo ThemeBloc
          return MaterialApp(
            theme: currentTheme,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Apto 293'),
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
                      title: const Text('Móveis'),
                      onTap: () {},
                    ),
                    ListTile(
                      //leading: Icon(),
                      title: const Text('Gastos Fixos'),
                      onTap: () {},
                    ),
                    ListTile(
                      //leading: Icon(),
                      title: const Text('Gastos Variáveis'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget(),
                    SizedBox(height: 16),

                    //Botão 1 -> adiciona evento "ThemeEvent.toggleLight" no themebloc
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ThemeEvent.toggleLight);
                      },
                      child: Text('Tema Claro'),
                    ),
                    SizedBox(height: 16),

                    //Botão 2 - > adiciona evento "ThemeEvent.toggleDark no themebloc"
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ThemeEvent.toggleDark);
                      },
                      child: Text('Tema Escuro'),
                    ),
                    SizedBox(height: 16),

                    //Floating Action Button que adiciona evento "ThemeEvent.toggleLightDark"
                    // É o botão que é capaz de ver qual o tema atual e mudar para o oposto
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ThemeEvent.toggleLightDark);
                      },
                      child: Icon(Icons.lightbulb_outline),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Aqui utilizamos o BlocBuilder para que a imagem seja reconstruida sempre que houver uma mudança no tema
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, currentTheme) {
        //A imagem é alternada de acordo com o tema atual
        final imageAsset = currentTheme == ThemeData.dark()
            ? 'assets/dark_mode_image.jpeg'
            : 'assets/light_mode_image.jpeg';
        return Image.asset(
          imageAsset,
          width: 200,
          height: 200,
        );
      },
    );
  }
}

//Eventos disponiveis para alternar o tema

enum ThemeEvent { toggleLight, toggleDark, toggleLightDark }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  bool isDark = false;

  //ThemeBloc é inicializado com o tema "Light"
  ThemeBloc() : super(ThemeData.light()) {
    on<ThemeEvent>((event, emit) {
      //Alternar para o tema Light
      if (event == ThemeEvent.toggleLight) {
        isDark = false;
        emit(ThemeData.light());

        //Alternar para o tema Dark
      } else if (event == ThemeEvent.toggleDark) {
        isDark = true;
        emit(ThemeData.dark());

        // Verificar qual o tema atual e alternar para o oposto
      } else if (event == ThemeEvent.toggleLightDark) {
        isDark = !isDark;
        emit(isDark ? ThemeData.dark() : ThemeData.light());
      }
    });
  }
}
