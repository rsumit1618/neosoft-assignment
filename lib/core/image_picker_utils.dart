import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  ImagePickerUtil._privateConstructor();

  static final ImagePickerUtil instance = ImagePickerUtil._privateConstructor();

  final _imagePicker = ImagePicker();

  Future<String> getImage(
      {ImageSource source = ImageSource.gallery,
      CameraDevice cameraSide = CameraDevice.front,
      bool isCropperRequired = true}) async {
    final image = await _imagePicker.pickImage(
        source: source, preferredCameraDevice: cameraSide, imageQuality: 100);
    if (isCropperRequired) {
      if (image != null) {
        final cropped = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 90,
          maxWidth: 400,
          maxHeight: 400,
          compressFormat: ImageCompressFormat.png,
          uiSettings: [
            AndroidUiSettings(
              toolbarColor: Colors.blue.shade900,
              toolbarTitle: "Edit",
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: false,
              initAspectRatio: CropAspectRatioPreset.original,
              cropStyle: CropStyle.circle,
            ),
            IOSUiSettings(
              title: "Edit",
              cropStyle: CropStyle.circle,
            ),
          ],
        );

        return cropped != null ? cropped.path : '';
      }
    } else {
      return image!.path;
    }
    return '';
  }

  Future<String> getCompressedImage(
      {ImageSource source = ImageSource.gallery,
      CameraDevice cameraSide = CameraDevice.front}) async {
    final image = await _imagePicker.pickImage(
        source: source, preferredCameraDevice: cameraSide, imageQuality: 50);

    return image?.path ?? '';
  }
}
