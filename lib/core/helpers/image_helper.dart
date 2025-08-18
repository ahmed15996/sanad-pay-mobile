import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../di/di.dart';

enum PickImageFromEnum { camera, gallery }

@injectable
class DocumentHelper {
  static final ImagePicker _imagePicker = getIt<ImagePicker>();

  Future<File> compressFile({required XFile xFile}) async {
    Uint8List? uint8list = await FlutterImageCompress.compressWithFile(
      xFile.path,
      quality: 90,
      minWidth: 800,
      minHeight: 600,
    );
    final tempDir = await getTemporaryDirectory();
    final compressedFilePath = join(
      tempDir.path,
      'compressed_${basename(xFile.path)}',
    );
    File compressedFile = File(compressedFilePath);
    await compressedFile.writeAsBytes(uint8list!);

    return compressedFile;
  }

  Future<File?> pickImage({required PickImageFromEnum type}) async {
    XFile? photo;
    if (type == PickImageFromEnum.camera) {
      photo = await _imagePicker.pickImage(source: ImageSource.camera);
    } else {
      photo = await _imagePicker.pickImage(source: ImageSource.gallery);
    }
    if (photo != null) {
      return await compressFile(xFile: photo);
    } else {
      return null;
    }
  }

  Future<File?> pickVideo() async {
     XFile? video = await _imagePicker.pickVideo(source: ImageSource.gallery);

    return video != null ? File(video.path) : null;
  }

  Future<List<File>> pickImages({int? limit}) async {
    List<File> compressedImages = [];
    var images = await _imagePicker.pickMultiImage(limit: limit);

    for (var image in images) {
      compressedImages.add(await compressFile(xFile: image));
    }

    return compressedImages;
  }
}
