// ignore_for_file: unused_local_variable

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:projectfirebase/data/listclass.dart';
import 'package:google_ml_kit/google_ml_kit.dart';


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

// 1. ---------- object detection---------------

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

// 2. --------- image Label ------------

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
 
// 3. -------------------barcode scanning-----------------------

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

  // 4. ----------------------smartreply----------------------------
   
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

// 5. -----------------Translation-----------------

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

  // 6. ------------ digital ink -------------

    Future recogniseText(language, ink) async {
    final digitalInkRecognizer = DigitalInkRecognizer(languageCode: 'en');
    String recognizedText = '';
    // final String language = 'en';
    // final Ink ink = Ink();
    final modelManager = DigitalInkRecognizerModelManager();
    final bool response = await modelManager.downloadModel(language);
    final candidates = await digitalInkRecognizer.recognize(ink);
    recognizedText = '';
    for (final candidate in candidates) {
      recognizedText += '\n${candidate.text}';
    }
    return recognizedText;
  }

  //. --------------------language id -----------------

   Future<List<Product>> detectLanguage(String text) async {
    String result = '';
    String result1 = '';
    List<Product> list = [];
    final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);

    final List<IdentifiedLanguage> possibleLanguages =
        await languageIdentifier.identifyPossibleLanguages(text);

    for (IdentifiedLanguage identify in possibleLanguages) {
      String language = identify.languageTag;
      var confidence = identify.confidence;
      // result += '$language';
      // result1 += '$confidence';
print(language);
      switch (language) {
        case 'en':
          {
            result = 'en(English)';
            result1 = confidence.toStringAsFixed(2);
            //list.add(Data(result: 'en(English)', result1: '$confidence'));
          }
          break;
        case 'ja-Latn':
          {
            result = 'ja(Japanade)';
            result1 = confidence.toStringAsFixed(2);
            //list.add(Data(result: 'ja(Japanade)', result1: '$confidence'));
          }
          break;
        case 'zh-Latn':
          {
            result = 'ch(Chinese)';
            result1 = confidence.toStringAsFixed(2);
            
          }
          break;
        case 'ko':
          {
            result = 'ko(Korean)';
            result1 = confidence.toStringAsFixed(2);
    
          }
          case 'und':
          {
            result = 'Undefined';
            result1 = confidence.toStringAsFixed(2);
    
          }
          case 'hi-Latn':
          {
            result = 'hi(Hindi)';
            result1 = confidence.toStringAsFixed(2);
    
          }
      }
      list.add(Product(text: result, confi: result1));
    }
    return list;
  }

  // 8. ------------Text Recognition------------------

  Future detectText(XFile imageFile) async {
  String text="";
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final inputImage = InputImage.fromFilePath(imageFile.path);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    for (TextBlock block in recognizedText.blocks) {
        text += "${block.text}";
    }
    textRecognizer.close();
    return text;
  }

  // 9.-----------------------Face Detect----------------------

  Future<List<Product>> detectFace(XFile image) async {
  bool isFaceDetected = false;
  String headRotationX = '';
  String headRotationY = '';
  bool isSmiling = false;
  List<Product> list=[];
    final inputImage = InputImage.fromFilePath(image.path);

    final faceDetector = FaceDetector(
        options: FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
      enableContours: true,
      enableTracking: true,
    ));
    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (faces.isNotEmpty) {
      isFaceDetected = true;
    for (Face face in faces) {
      final double? rotX =
          face.headEulerAngleX; // Head is tilted up and down rotX degrees
      final double? rotY =
          face.headEulerAngleY; // Head is rotated to the right rotY degrees
        headRotationX = rotX.toString();
        headRotationY = rotY.toString();
      double? smileProb;
      if (face.smilingProbability != null) {
        smileProb = face.smilingProbability;

        if (smileProb! > 0.5) {
            isSmiling = true;
        }
      }
    }
  }
  list.add(Product(text: headRotationX,confi: headRotationY,face: isFaceDetected,smile: isSmiling));
  return list;
  }
}