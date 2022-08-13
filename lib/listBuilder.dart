import 'package:demo_app/data.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: 
            ValueListenableBuilder(
                valueListenable: ls,
                builder: ((BuildContext conxt, List<ModelClass> value, Widget?child) => ListView.separated(
                      itemBuilder: (BuildContext cxt, int index) {
                          
                        return ListTile(
                          title: Text(value[index].name),
                          subtitle: Text(ls.value[index].age),
                        );
                      },
                      separatorBuilder: (con, ind) => const Divider(),
                      itemCount: value.length,
                   
                    )))
            )
            ;
  }

}
