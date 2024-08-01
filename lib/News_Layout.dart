import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/cubit/cubit.dart';
import 'package:newssapp/cubit/states.dart';
import 'package:provider/provider.dart';

import 'Search_Screen.dart';
import 'Shared/components.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getheadphones()..getMacBookPro(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) => {} ,
        builder: (context, state)
        {
          var cubit =NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:  Center(
            child: Text(
              'NewsApp Screen',
            ),
          ),
              actions: [
                IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen(),);
                    }
                    , icon: Icon(
                  Icons.search,
                )
                ),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return IconButton(
                      icon: Icon(themeProvider.themeMode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode),
                      onPressed: () {
                        themeProvider.toggleTheme();
                      },
                    );
                  },
                ),
              ],
          ),
            bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) =>cubit.changeBottom(index) ,
            ),
            body: cubit.Screens[cubit.currentIndex],
          );
          },
      ),
    );
  }
}

  class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
  _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  notifyListeners();
  }
  }

