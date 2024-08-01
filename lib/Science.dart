import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class getMacBookProo extends StatelessWidget {
  const getMacBookProo({super.key});

  @override
  Widget build(BuildContext context ) {
    return  BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).MacBookPro;

        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(list[index] , context),
          separatorBuilder: (context, index) => myDivider() ,
          itemCount: list.length,
        );
      },
    );
  }
}
