import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:learn/cubit/HomeState.dart';
import 'package:tflite/tflite.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List outputs;
  File image;
  bool loading;
  final picker1 = ImagePicker();
  void init() async {
    loading = true;
    loadModel().then((value) {
      loading = false;
    });
  }

  Future getImageUser() async {
    final pickedFile = await picker1.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      print(pickedFile.path);
      classifyImage(image);
      emit(GetImageSuccessful());
    } else {
      print('No image selected.');
      emit(ErrorImage());
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  void classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    loading = false;
    outputs = output;
  }
}
