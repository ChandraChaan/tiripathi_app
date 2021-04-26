import 'dart:convert';
import 'package:http/http.dart';
import 'package:tirumala_app/domain/stories_model.dart';
class HttpService {
  static String main_url = 'https://cc.unitedoriginals.in/';
  static String get_posts = main_url + 'api_post/posts';
  Future<List<Stories>> getData() async {
    var url = Uri.parse(get_posts);
    print('just entered to hit URL');
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Stories> stories_list = body.map((dynamic item) => Stories.fromJson(item),).toList();
      return stories_list;
    } else {
      throw Exception('Failed to load album');
    }
  }

}
