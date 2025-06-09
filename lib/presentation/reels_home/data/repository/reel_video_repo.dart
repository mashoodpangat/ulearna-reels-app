import 'package:ulearna/core/utils/networks.dart';
import 'package:ulearna/presentation/reels_home/data/models/reel_video_response_model.dart';

class ReelVideoRepo {
  Future<ReelVideoResponse?> getReelVideo({int page = 1}) {
    String url = "https://backend-cj4o057m.fctl.app/bytes/scroll?page=$page&limit=10";
    return getApiResponse(
      endpoint: url,
      fromJson: (json) => ReelVideoResponse.fromJson(json),
    );
  }
}
