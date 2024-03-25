import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class OpcionesMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  // const OpcionesMenu({Key? key}) : super(key: key);
  const OpcionesMenu({super.key, required this.scaffoldKey});

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
//-------------------------------------------------------------------------
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    print('Android $hasNotch');

    return NavigationDrawer(
        selectedIndex: _navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            _navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 40 : 24, 16, 10),
            // padding: EdgeInsets.fromLTRB(28, true ? 24 : 40, 16, 10),// si tiene notch por que el valor del meia cuquery es mayor
            // child: Text('test1'),
          ),
          ...appMenuItems.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child:
                Divider(), //1era. division--------------------------------------------
          ),
          ...appMenuItems.sublist(3, 5).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child:
                Divider(), //2da. division--------------------------------------------
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
                'Mas opciones'), //2da. division--------------------------------------------
          ),
          ...appMenuItems.sublist(5).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
        ]);
  }
}
