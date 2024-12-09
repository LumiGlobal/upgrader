import 'package:http/http.dart' as http;
import 'dart:convert';

const appGalleryListingUrl = 'https://appgallery.huawei.com/app/C106856271';
const appGalleryEndpoint = 'https://api.luminews.my/app-gallery-version';

class AppGallerySearchAPI {
  AppGallerySearchAPI({http.Client? client}) : client = client ?? http.Client();

  final http.Client? client;

  bool debugEnabled = false;

  Future<Map<String, dynamic>?> getAppGalleryInfo() async {
    final response = await client!.get(Uri.parse(appGalleryEndpoint));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      if (debugEnabled) {
        print(
            'upgrader: Get app gallery version failure, status code: ${response.statusCode}');
      }
      return null;
    }

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }
}

class AppGalleryResults {
  static String version(Map<String, dynamic> response) {
    return response['versionNumber'];
  }

  static String listingUrl() {
    return appGalleryListingUrl;
  }

  static String releaseNotes(Map<String, dynamic> response) {
    return response['releaseNotes'];
  }
}
