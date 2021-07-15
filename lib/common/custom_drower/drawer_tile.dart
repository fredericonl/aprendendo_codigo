import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    this.iconData,
    this.tile,
    this.page,
  });

  final IconData iconData;
  final String tile;
  final int page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('cliquei $page');
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: Colors.grey[700],
              ),
            ),
            Text(
              '$tile',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
