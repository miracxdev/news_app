import 'package:http/http.dart' as http;
import 'package:new_app/app/models/response/home_response.dart';

class Services {
  Future<List<Article>?> getHomeData() async {
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=tr&apiKey=0d07abe2d673410fb65d8cba63b67e1b');
    var response = await http.get(url);

    print('Response body: ${response.body}');

    return homeResponseFromJson(response.body).articles;
  }
}
