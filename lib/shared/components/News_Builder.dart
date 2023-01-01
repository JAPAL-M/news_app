import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'News_Container.dart';

class NewsCoditonal extends StatelessWidget {
   NewsCoditonal(this.cubit);
   dynamic cubit;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: cubit.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: NewsContainer(
              data: cubit[index],
            ),
          );
        },
        itemCount: cubit.length,
        separatorBuilder: (context,index) {
          return Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[400],
          );
        },
      ),
      fallback: (context) =>  Center(child: CircularProgressIndicator()),
    );
  }
}
