part of 'reels_video_bloc.dart';

@immutable
sealed class ReelsVideoEvent {}

class ReelsVideoData extends ReelsVideoEvent {
  final int page;

  ReelsVideoData({this.page = 1});
}
