import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/News_Builder.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =  NewsCubit.get(context).science;
        return NewsCoditonal(cubit);
      },
    );
  }
}
