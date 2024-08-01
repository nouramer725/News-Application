import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HeadPhones extends StatelessWidget {
  const HeadPhones({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).headphones;

        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(list[index],context),
          separatorBuilder: (context, index) => myDivider() ,
          itemCount: list.length,
        );
      },
    );
  }
}
