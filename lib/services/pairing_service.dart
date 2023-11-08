import 'dart:ffi';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pillowtalk/api/apis.dart';
import 'package:share_plus/share_plus.dart';

class PairingManager {
  Future<void> initDynamicLinks(
      Function(PendingDynamicLinkData openLink) dataObj) async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      dataObj(dynamicLinkData);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  Future<void> createDynamicLink(String uid) async {
    final String link =
        'https://pillowtalk.page.link/?id=$uid';
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://pillowtalk.page.link',
      link: Uri.parse(link), // Append UID to the link
      androidParameters: AndroidParameters(
        packageName: 'com.pillowtalk.gamesforcouples',minimumVersion: 1 // Android package name
      ),
      // Add more parameters as needed for iOS, navigation, etc.
    );
    print(uid);
    final ShortDynamicLink dynamicUrl =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    final String shortUrl = dynamicUrl.shortUrl.toString();
    print(shortUrl);
    Share.share(shortUrl); // Share the short URL containing the UID
    // return shortUrl;
  }

  Future<String?> handleDynamicLink() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null && deepLink.queryParameters['id'] != null) {
      return deepLink.queryParameters['id'];
    }
    return null;
  }

  Future<bool> verifyAndPairUsers(String user1Uid, String user2Uid) async {
    bool isPairingVerified = await checkPairingInFirebase(user1Uid);

    if (isPairingVerified) {
      await FirebaseFirestore.instance.collection('pairs').add({
        'user1Uid': user1Uid,
        'user2Uid': user2Uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkPairingInFirebase(String user1Uid) async {
    // Implement logic to check if user1Uid exists in your Firebase database
    // Return true if pairing is verified, false otherwise
    return true; // Placeholder logic, replace it with actual verification logic
  }

  Future<void> sendMessage(
      String senderUid, String receiverUid, String message) async {
    await FirebaseFirestore.instance.collection('chats').add({
      'senderUid': senderUid,
      'receiverUid': receiverUid,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
