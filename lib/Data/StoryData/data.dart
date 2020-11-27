

import 'story_model.dart';
import 'user_model.dart';

final User user = User(
  name: 'John Doe',
  profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
);
final List<Story> stories = [
  Story(
    url:
        'https://images.pexels.com/photos/5974498/pexels-photo-5974498.jpeg?cs=srgb&dl=pexels-arstist-5974498.jpg&fm=jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 10),
    user: user,
  ),
  Story(
    url: 'https://media.giphy.com/media/moyzrwjUIkdNe/giphy.gif',
    media: MediaType.image,
    user: User(
      name: 'John Doe',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
    ),
    duration: const Duration(seconds: 7),
  ),
  Story(
    url:
        'https://vod-progressive.akamaized.net/exp=1606348833~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F553%2F15%2F377769527%2F1578621905.mp4~hmac=0053bb59d51c499b9e126069689a3d2521fda0eeecf2a45772e379d83f5adb79/vimeo-prod-skyfire-std-us/01/553/15/377769527/1578621905.mp4?download=1&filename=video.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url:
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    url:
        'https://vod-progressive.akamaized.net/exp=1606347238~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2266%2F18%2F461332465%2F2042833534.mp4~hmac=a5a45f700aba239ce8682ec66120ccbcb0604d8a393eb722440ebcb489a5b9f2/vimeo-prod-skyfire-std-us/01/2266/18/461332465/2042833534.mp4?download=1&filename=pexels-cottonbro-5435292.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url: 'https://media2.giphy.com/media/M8PxVICV5KlezP1pGE/giphy.gif',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: user,
  ),
];
