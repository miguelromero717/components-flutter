import 'package:flutter/material.dart';

import 'package:components/src/utils/icon_string_util.dart';
import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {

        return ListView(
          children: _createListItems(snapshot.data, context),
        );

      },
    );
  }

  List<Widget> _createListItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> options = [];

    data.forEach( (opt) {

      final widgetTmp = ListTile(
        title: Text( opt['texto'] ),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      options..add(widgetTmp)
            ..add(Divider());

    });

    return options;
  }

}