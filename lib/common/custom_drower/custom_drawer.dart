import 'package:entendo_codigo/common/custom_drower/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerTile(
            iconData: Icons.home,
            tile: 'Inicio',
            page: 0,
          ),
          DrawerTile(
            iconData: Icons.list,
            tile: 'Produto',
            page: 1,
          ),
          DrawerTile(
            iconData: Icons.playlist_add_check,
            tile: 'Meus Pedidos',
            page: 2,
          ),
          DrawerTile(
            iconData: Icons.location_on,
            tile: 'Loja',
            page: 3,
          ),
        ],
      ),
    );
  }
}
