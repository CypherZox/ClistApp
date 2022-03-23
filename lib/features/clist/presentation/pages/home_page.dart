import 'package:clist/features/clist/presentation/changenotifiers/clist_states.dart';
import 'package:clist/features/clist/presentation/changenotifiers/list_change_notifiers.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final clistProvider = sl<ClistProvider>();
    return StreamBuilder<ClistState>(
        stream: clistProvider.getClistState(),
        builder: (context, state) {
          if (state.data is Loading) {
            return Center(
              child: Text("loading"),
            );
          } else if (state.data is Loaded) {
            return Center(
              child: MaterialButton(
                color: Colors.black12,
                onPressed: () {
                  print(state.data!.props);
                },
              ),
            );
          } else if (state.data is Error) {
            return Text("${state.data!.props}");
          } else {
            return Text("${state.data}");
          }
        });
  }
}
