class VideoUtils {
  VideoUtils._();

  static bool isYouTubeUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }

    return url.contains('youtube.com') || url.contains('youtu.be');
  }
}
