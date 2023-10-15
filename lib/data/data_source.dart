// import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:projectfirebase/data/listclass.dart';
class ImageDataSource{
  Future uploadImage() async{
    final img= ImagePicker();
    XFile? image;
   image= await img.pickImage(source: ImageSource.gallery,
   maxHeight: 900,
   maxWidth: 1000);
   if(image?.path!=null){
   // ignore: unused_local_variable
   final String filename = path.basename(image!.path);
   return image;
   }
  //  imageFile = image.path;  
  }
String result="";
   Future<List<Product>> getobjectdetect(XFile imageFile) async{
    List<Product> list=[];
    final inputImage = InputImage.fromFilePath(imageFile.path);
    ObjectDetector detector =ObjectDetector(options: ObjectDetectorOptions(
    mode:DetectionMode.single,
    classifyObjects: true, 
    multipleObjects: true
    ));
    final List<DetectedObject> objdetect = await detector.processImage(inputImage);
    for (DetectedObject object in objdetect) {
      // String confi;
      final rect=object.boundingBox;
      final trackingId=object.trackingId;
      for(Label label in object.labels){
    String text = label.text;
    double confidence = label.confidence;
    // String confi=confidence.toString();
    int index = label.index;
    list.add(Product(text: text, confi: confidence.toStringAsFixed(2)));
    result += "Category: $text\n$rect\nTrackinId: $trackingId\nConfidence: ${confidence.toStringAsFixed(2)}\nIndex: $index";
      detector.close();
    
}
 }
   return list;
   }
  Future<List<Product>> getImagelabel(XFile imageFile) async{
    List<Product> list=[];
    final inputImage = InputImage.fromFilePath(imageFile.path);
    ImageLabeler imageLabeler=ImageLabeler(options: ImageLabelerOptions());
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    for (ImageLabel label in labels) {
    String text = label.label;
    double confidence = label.confidence;
    int index = label.index;
    result+= "$text :: $confidence :: $index\n";
    list.add(Product(text: text));
  }
  imageLabeler.close();
  return list.toList(); 
  }
 


  }