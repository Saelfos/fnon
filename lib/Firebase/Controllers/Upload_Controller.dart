



import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/Constants.dart';


class UploadController extends GetxController{
  static UploadController instance = Get.find();
var selectedImagePath=''.obs;
 File file;

void pickImage()async{
  final pickedFile=await ImagePicker().pickImage(source:ImageSource.gallery);
  file = File( pickedFile.path );
  selectedImagePath.value=pickedFile.path;
}



void uploadImage()async{
  String fileName = selectedImagePath.value;
  Reference firebaseStorageRef =
  FirebaseStorage.instance.ref().child('$fileName');
  UploadTask uploadTask = firebaseStorageRef.putFile(file);
  TaskSnapshot taskSnapshot = await uploadTask;
  taskSnapshot.ref.getDownloadURL().then(
          (value) => foodController.addProductToFirestore(value));


}

}