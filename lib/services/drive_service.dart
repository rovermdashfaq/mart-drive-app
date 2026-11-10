import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class DriveService {
  final Dio _dio = Dio();

  static String getThumbnailUrl(String driveFileId, [int size = 1600]) {
    return 'https://drive.google.com/thumbnail?id=$driveFileId&sz=w$size';
  }

  Future<Map<String, dynamic>> uploadFileMultipart({
    required File file,
    required String fileName,
    required String mimeType,
    required String accessToken,
  }) async {
    const uploadUrl = 'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&fields=id,name,mimeType,size';
    // Multipart payload with boundary...
    return {};
  }
}