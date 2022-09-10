import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clistApp/config/constants/app_constants.dart';
import 'package:clistApp/features/clist/presentation/pages/responsive_clist_view.dart/responsive_clist_view.dart';

import '../../../clist_resource/presentation/bloc/bloc.dart' as res;
import '../bloc/bloc.dart';
import '../widgets/alert_dialog_with_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('MyApp state = $state');
      BlocProvider.of<ClistBloc>(context).add(GetClist());

      // app is visible and running.
      // run your App class again
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/logo-48.png',
                    width: 100,
                    height: 100,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 74.0),
            child: BlocBuilder<ClistBloc, ClistState>(
                builder: (context, clistState) {
              if (clistState is Empty) {
                // BlocProvider.of<ClistBloc>(context).add(GetCachedClist());
                BlocProvider.of<ClistBloc>(context).add(GetClist());
                BlocProvider.of<res.ClistResourceBloc>(context)
                    .add(res.GetClistR());
              }
              if (clistState is Loading) {
                Center(
                  child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          AppColors.secondary)),
                );
              }

              if (clistState is Error) {
                print(clistState.message);
                Future.delayed(Duration(seconds: 1)).then((value) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogwithButton(
                            dialogTitle: "An Error Occurred!",
                            width: 0.0,
                            height: 0.0,
                            errorMessage:
                                "An error occurred while loading the data",
                            buttonLabel: "Try Again",
                            onPressed: () {
                              Navigator.pop(context);
                            });
                      });
                });
              }
              if (clistState is Loaded) {
                return BlocBuilder<res.ClistResourceBloc,
                    res.ClistResourceState>(builder: (context, resState) {
                  if (resState is res.Loaded) {
                    return ResponsiveClistView(
                      list: clistState.clist,
                      start: 0.9,
                      end: 0.5,
                      clistRes: resState.cListResources,
                    );
                  }
                  return Container();
                });
              }

              return clistState is! Loaded && clistState is Error
                  ? Center(
                      child: SizedBox(
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 350),
                              child: Text(
                                "No internet connection make sure you're connected to the internet and ",
                                style: AppText.regularStyle,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<ClistBloc>(context)
                                    .add(GetClist());
                                BlocProvider.of<res.ClistResourceBloc>(context)
                                    .add(res.GetClistR());
                                setState(() {});
                              },
                              child: Text(
                                "Try Again!",
                                style: AppText.regularStyle.copyWith(
                                    fontFamily: 'OpenSans-SemiBold',
                                    color: AppColors.secondaryText),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            AppColors.secondary),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
