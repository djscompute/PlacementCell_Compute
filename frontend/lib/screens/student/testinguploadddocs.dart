import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PdfUploadScreen extends StatefulWidget {
  @override
  _PdfUploadScreenState createState() => _PdfUploadScreenState();
}

class _PdfUploadScreenState extends State<PdfUploadScreen> {
  File _selectedFile = File('');

  Future<void> _selectFile() async {
    // Use a file picker or any method to select a PDF file
    // For simplicity, we'll use the file picker package in this example
    // Make sure to add the file_picker package to your pubspec.yaml
    // dependencies: file_picker: ^3.0.0
    // Also, don't forget to import it: import 'package:file_picker/file_picker.dart';

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadPdf() async {
    if (_selectedFile == null) {
      // Handle the case where no file is selected
      return;
    }

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.242.65:3000/student/uploadpdf'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'pdf',
          _selectedFile.path,
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        // Handle the successful response
        print('File uploaded successfully');
      } else {
        // Handle the error response
        print('Error uploading file: ${response.reasonPhrase}');
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (error) {
      // Handle other errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_selectedFile != null)
              Text('Selected File: ${_selectedFile.path}'),
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Select PDF'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadPdf,
              child: Text('Upload PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PdfUploadScreen(),
  ));
}
