import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/News_Layout.dart';
import 'package:newssapp/cubit/cubit.dart';
import 'package:newssapp/themes/thems.dart';
import 'package:provider/provider.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';


void main() async{
  DioHelper.init();
  CacheHelper.init();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => NewsCubit(),
              ),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode: themeProvider.themeMode,
                    theme: lighttheme,
                    darkTheme: darktheme,
                    home: NewsLayout() ,

                  );
                }
            ),
          );
  }
}