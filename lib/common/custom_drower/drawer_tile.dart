import 'package:entendo_codigo/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
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
                color: context.watch<PageManager>().page == page
                    ? primaryColor
                    : Colors.grey[700],
              ),
            ),
            Text(
              '$tile',
              style: TextStyle(
                color: context.watch<PageManager>().page == page
                    ? primaryColor
                    : Colors.grey[700],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
