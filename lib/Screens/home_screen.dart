import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adivinarnumero_desafio/services/game_programaing.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final game = Game();
  double valorSlider = 0;
  final List<String> NivelDificultad = [
    'Facil',
    'Medio',
    'Avanzado',
    'Extremo'
  ];

  List<int> historial = [];
  List<int> mayoresque = [];
  List<int> menoresque = [];

  @override
  void initState() {
    super.initState();
    game.startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Adivina el número"),
        ),
        //actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 62, 147, 216),
              ),
              child: Text(
                'Adivina el número',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                // Aquí puedes agregar la lógica para cuando se presione el ítem del Drawer
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                // Aquí puedes agregar la lógica para cuando se presione el ítem del Drawer
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        labelText: "Ingresa el número",
                        hintText: "####",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onSubmitted: (String value) {
                        final game = Provider.of<Game>(context, listen: false);
                        final input = int.tryParse(value);
                        if (input != null) {
                          final result = game.verificacionNum(input);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Column(
                    children: [
                      const Text(
                        "Intentos",
                        style: TextStyle(fontSize: 18),
                      ),
                      Consumer<Game>(builder: (context, game, child) {
                        return Text(
                          "${game.numeroIntentos}",
                          style: const TextStyle(fontSize: 18),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    children: [
                      Text("Mayor que"),
                    ],
                  ),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    children: [
                      Text("Menor que"),
                    ],
                  ),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    children: [
                      Text("Historial"),
                    ],
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Slider(
              value: valorSlider,
              min: 0,
              max: NivelDificultad.length.toDouble() - 1,
              divisions: NivelDificultad.length - 1,
              label: NivelDificultad[valorSlider.toInt()],
              onChanged: (double value) {
                setState(() {
                  game.setDificult(value);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
