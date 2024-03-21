import 'dart:io';

import 'package:flutter/material.dart';

class OpcionesMenu extends StatefulWidget {
  const OpcionesMenu({Key? key}) : super(key: key);

  @override
  State<OpcionesMenu> createState() => _OpcionesMenuState();
}

class _OpcionesMenuState extends State<OpcionesMenu> {
  int _navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final os = Platform.isAndroid;
    final vs = Platform.operatingSystemVersion;
    print('Los datos estan aqui');
    print(
      'Android: ' + os.toString(),
    );
    print('Version SO :' + vs);

//     if (Activity.isFinishing()) {
//   print('La aplicación se está cerrando');
// } else {
//   print('La aplicación está abierta');
// }

    return NavigationDrawer(
        selectedIndex: _navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            _navDrawerIndex = value;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 30, 16, 10),
            child: Text('test1'),
          ),
          NavigationDrawerDestination(
              icon: const Icon(Icons.person), label: const Text('Perfil')),
          NavigationDrawerDestination(
              icon: const Icon(Icons.home), label: const Text('Casa')),
          NavigationDrawerDestination(
              icon: const Icon(Icons.add), label: const Text('Perfil')),
          NavigationDrawerDestination(
              icon: const Icon(Icons.add), label: const Text('Perfil')),
        ]);
  }
}
