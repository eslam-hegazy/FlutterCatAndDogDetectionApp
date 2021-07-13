import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/cubit/HomeCubit.dart';
import 'package:learn/cubit/HomeState.dart';
import 'package:tflite/tflite.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.getImageUser();
              },
              child: Icon(Icons.image),
            ),
            appBar: AppBar(),
            body: Column(
              children: [
                cubit.loading == false
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        alignment: Alignment.center,
                        child: Text("Select Image"),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(cubit.image),
                          ),
                        ),
                      ),
                cubit.outputs != null
                    ? Container(
                        child: Text("${cubit.outputs[0]['labels']}"),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
