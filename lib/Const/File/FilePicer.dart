// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';
//
//
// class pickerdoc{
//
//
//   static Future<String?> pickDocument() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: [
//         "pdf",
//         "doc",
//         "docx"
//       ], // Modify extensions as per your requirement
//     );
//     if (result != null) {
//       String? filePath = result.files.single.path;
//       return filePath;
//     }
//     return null;
//   }
//
//
//
//   static Future<String> copyDocument(String sourcePath) async {
//     final Directory appDir = await getApplicationDocumentsDirectory();
//     final String fileName = path.basename(sourcePath);
//     final String destPath = path.join(appDir.path, fileName);
//
//     final File sourceFile = File(sourcePath);
//     final File destFile = await sourceFile.copy(destPath);
//
//     return fileName;
//   }
//
//
//
// }