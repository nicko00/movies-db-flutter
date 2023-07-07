import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'session_manager.dart';

abstract class ImagesManagerProtocol {
  void initialize();
  Future<void> getGalleryPhoto({
    required VoidCallback onSuccess,
    required void Function(String errorMessage) onFailure,
  });
  Future<void> getCameraPhoto({
    required VoidCallback onSuccess,
    required void Function(String errorMessage) onFailure,
  });
  Future<void> getPhotoFromFirebase({
    required void Function(String url) onSuccess,
    required void Function(FirebaseException error) onFailure,
  });
}

class ImagesManager extends ImagesManagerProtocol {
  late final FirebaseStorage _storage;
  late final ImagePicker _imagePicker;
  late final SessionManagerProtocol _sessionManager;

  ImagesManager._();

  static final instance = ImagesManager._();

  @override
  Future<void> initialize() async {
    _storage = FirebaseStorage.instance;
    _imagePicker = ImagePicker();
    _sessionManager = SessionManager.instance;
  }

  @override
  Future<void> getGalleryPhoto({
    required VoidCallback onSuccess,
    required void Function(String errorMessage) onFailure,
  }) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await _uploadPhoto(onSuccess: onSuccess, pickedFile: File(pickedFile.path), onFailure: onFailure);
    }
  }

  @override
  Future<void> getCameraPhoto({
    required VoidCallback onSuccess,
    required void Function(String errorMessage) onFailure,
  }) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      await _uploadPhoto(onSuccess: onSuccess, pickedFile: File(pickedFile.path), onFailure: onFailure);
    }
  }

  @override
  Future<void> getPhotoFromFirebase({
    required void Function(String url) onSuccess,
    required void Function(FirebaseException error) onFailure,
  }) async {
    final userName = _sessionManager.user?.name;
    final reference = _storage.ref('files/$userName/image');

    try {
      final downloadUrl = await reference.getDownloadURL();

      onSuccess.call(downloadUrl);
    } on FirebaseException catch (error) {
      onFailure.call(error);
    }
  }

  Future<void> _uploadPhoto({
    required File pickedFile,
    required VoidCallback onSuccess,
    required void Function(String errorMessage) onFailure,
  }) async {
    final userName = _sessionManager.user?.name;
    final reference = _storage.ref('files/$userName/image');

    await reference.putFile(pickedFile)
      .whenComplete(() => onSuccess.call())
      .catchError((error) {
        onFailure.call(error);
        throw error;
      });
  }
}
