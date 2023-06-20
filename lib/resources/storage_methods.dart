import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    // childName(exc : profilePics).child(which user id)
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    // put image(Uint8List file) in to that user id file
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    // we get this downloadUrl because we wanna show this pp's later on
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
