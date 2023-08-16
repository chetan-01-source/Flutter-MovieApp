import 'package:image_picker/image_picker.dart';
PickImage(ImageSource source)async{
final ImagePicker imagepicker =ImagePicker();
 XFile? file = await imagepicker.pickImage(source: source);
 if(file!=null){
   return await file.readAsBytes();
 }
 else{
   print("No image selected");
 }
}