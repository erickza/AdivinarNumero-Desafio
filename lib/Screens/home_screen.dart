import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double valor = 50.0;

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
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Aquí puedes agregar la lógica para cuando se presione el ítem del Drawer
              },
            ),
            ListTile(
              title: const Text('Item 2'),
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
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                  height: 50,
                  child: Column(
                    children: [
                      Text(
                        "Intentos",
                        style: TextStyle(fontSize: 18),
                      ),
                      Expanded(
                        child: Text(
                          " 0 ",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
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
                value: valor,
                max: 100,
                divisions: 4,
                label: "${valor.round()}",
                onChanged: (double value) {
                  setState(() => valor = value);
                })
          ],
        ),
      ),
    );
  }
}
