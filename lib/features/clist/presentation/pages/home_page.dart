import 'package:cached_network_image/cached_network_image.dart';
import 'package:clist/features/clist/presentation/pages/home_glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../clist_resource/presentation/bloc/bloc.dart' as res;
import '../../domain/entities/clist_entity.dart';
import '../bloc/bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Gradient pastel color.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://clist.by/static/img/logo-48.png?1647735928',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 74.0),
            child: BlocBuilder<ClistBloc, ClistState>(
                builder: (context, clistState) {
              if (clistState is Empty) {
                BlocProvider.of<ClistBloc>(context).add(GetClist());
                BlocProvider.of<res.ClistResourceBloc>(context)
                    .add(res.GetClistR());
              }
              if (clistState is Loaded) {
                return BlocBuilder<res.ClistResourceBloc,
                    res.ClistResourceState>(builder: (context, resState) {
                  if (resState is res.Loaded) {
                    return GlassHome(
                      list: clistState.clist,
                      start: 0.9,
                      end: 0.1,
                      clistRes: resState.cListResources,
                    );
                  }
                  return Container();
                });
              }
              return Center(
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.white)),
              );
            }),
          ),
        ],
      ),
    );
  }

  _returnIdsFromClist(List<CList> clist) {
    return clist.map((e) => e.resourceId.toString()).toList();
  }
}
