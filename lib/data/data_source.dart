// import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
// ignore_for_file: avoid_print, unused_local_variable

import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:projectfirebase/data/listclass.dart';


class ImageDataSource{

String result="";

//----------- Upload Image-------------

  Future uploadImage(String s) async{
    final img= ImagePicker();
    XFile? image;
   image= await img.pickImage(source:s=='gallery'? ImageSource.gallery:ImageSource.camera,
   maxHeight: 900,
   maxWidth: 1000,  
   );
   if(image?.path!=null){
   final String filename = path.basename(image!.path);
   return image;
   }
  //  imageFile = image.path;  
  }

//---------- object detection---------------

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
       print(result); 
    }
    }
   return list;
   }

//--------- image Label ------------

  Future<List<Product>> getImagelabel(XFile imageFile) async{
    List<Product> list=[];
    final inputImage = InputImage.fromFilePath(imageFile.path);
    ImageLabeler imageLabeler=ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.5));
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
 
//-------------------barcode scanning-----------------------

   Future<List<Product>> getbarcode(XFile imageFile) async{
    List<Product> list=[];
    final inputImage = InputImage.fromFilePath(imageFile.path);
    final List<BarcodeFormat> formate=[BarcodeFormat.all];
    final barcodescanner = BarcodeScanner( formats: formate);
    final List<Barcode> code = await barcodescanner.processImage(inputImage);
    for (Barcode barcode in code) {
     final type = barcode.type;
    //  final  boundingBox = barcode.boundingBox;
      final String? displayValue = barcode.displayValue;
      // final String? rawValue = barcode.rawValue;

  // See API reference for complete list of supported types
  switch (type) {
    case BarcodeType.wifi:
      final barcodeWifi = barcode.value as BarcodeWifi;
      print("r:$barcodeWifi");
      break;
    case BarcodeType.url:
      final barcodeUrl = barcode.value as BarcodeUrl;
      print("r:$barcodeUrl");
      break;
    default:
      break;
  }
  list.add(Product(text: displayValue));
  }
  barcodescanner.close();
  return list.toList(); 
  }

  //----------------------smartreply----------------------------
   
   Future getsmartreply(String msg) async{
    List reply=[];
    String result1="";
    final SmartReply smartreply =SmartReply();
    smartreply.addMessageToConversationFromLocalUser(msg, DateTime.now().microsecondsSinceEpoch);
    final response= await smartreply.suggestReplies();
    for (final suggestReplies in response.suggestions) {
    String text = suggestReplies;
    reply.add(text);
    result1+= "| $text |";
   
    // list.add(Product(text: text));
  }
   print(reply);
  smartreply.close();
  return reply; 
  }

//-----------------Translation-----------------

  Future texttranslate(String msg,dynamic lang) async{
    String result="";
    // TranslateLanguage language=lang; 
    final modelManager = OnDeviceTranslatorModelManager();
    if(lang=='Hindi'){
    final bool response = await modelManager.isModelDownloaded(TranslateLanguage.hindi.bcpCode);
    if(response==false){
    final bool response1 = await modelManager.downloadModel(TranslateLanguage.hindi.bcpCode);
    }else{
      print("Already downloaded");
    }
    // ignore: non_constant_identifier_names
    final Ondevicetranslator = OnDeviceTranslator(sourceLanguage:TranslateLanguage.english,targetLanguage:TranslateLanguage.hindi);
        final String text= await Ondevicetranslator.translateText(msg);
        result+=text;
        Ondevicetranslator.close();
    // final bool response3 = await modelManager.deleteModel(TranslateLanguage.hindi.bcpCode);
    }

    else if(lang=='Tamil')
    {
    final bool response = await modelManager.isModelDownloaded(TranslateLanguage.tamil.bcpCode);
    if(response==false){
    final bool response1 = await modelManager.downloadModel(TranslateLanguage.tamil.bcpCode);
    }else{
      print("Already downloaded");
    }
    // ignore: non_constant_identifier_names
    final Ondevicetranslator = OnDeviceTranslator(sourceLanguage:TranslateLanguage.english,targetLanguage:TranslateLanguage.tamil);
        final String text= await Ondevicetranslator.translateText(msg);
        result+=text;
        Ondevicetranslator.close();
    // final bool response3 = await modelManager.deleteModel(TranslateLanguage.tamil.bcpCode);
    }
    else if(lang=='Japanese')
    {
    final bool response = await modelManager.isModelDownloaded(TranslateLanguage.japanese.bcpCode);
    if(response==false){
    final bool response1 = await modelManager.downloadModel(TranslateLanguage.japanese.bcpCode);
    }else{
      print("Already downloaded");
    }
    // ignore: non_constant_identifier_names
    final Ondevicetranslator = OnDeviceTranslator(sourceLanguage:TranslateLanguage.english,targetLanguage:TranslateLanguage.japanese);
        final String text= await Ondevicetranslator.translateText(msg);
        result+=text;
        Ondevicetranslator.close();
    // final bool response3 = await modelManager.deleteModel(TranslateLanguage.japanese.bcpCode);
    }
    else 
    {
    final bool response = await modelManager.isModelDownloaded(TranslateLanguage.german.bcpCode);
    if(response==false){
    final bool response1 = await modelManager.downloadModel(TranslateLanguage.german.bcpCode);
    }else{
      print("Already downloaded");
    }
    // ignore: non_constant_identifier_names
    final Ondevicetranslator = OnDeviceTranslator(sourceLanguage:TranslateLanguage.english,targetLanguage:TranslateLanguage.german);
        final String text= await Ondevicetranslator.translateText(msg);
        result+=text;
        Ondevicetranslator.close();
    // final bool response3 = await modelManager.deleteModel(TranslateLanguage.german.bcpCode);
    }
    // final TranslateLanguage sourceLanguage;
    // final TranslateLanguage targetLanguage;
   return result; 
  }

  }