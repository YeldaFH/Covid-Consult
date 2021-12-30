import 'dart:convert';
import 'package:forum/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:covid_consult/common/network_service.dart';
// import 'package:provider/provider.dart';

class PostForum {
  Future<List<Post>> getForumCategory(
      NetworkService request, String category) async {
    // print(category);
    if (category == 'All Category') {
      category = 'all';
    } else if (category == 'General Discussion') {
      category = 'general';
    } else if (category == 'Covid Info') {
      category = 'covid';
    } else if (category == 'Drug Info') {
      category = 'drug';
    } else {
      // category = 'user';

      String url = "http://covid-consult.herokuapp.com/forum/api/user/";
      final response = await request.get(url);
      List<Post> post = [];
      for (var d in response) {
        if (d != null) {
          post.add(Post.fromJson(d));
        }
      }
      return post;
    }

    String url = "http://covid-consult.herokuapp.com/forum/api/$category/";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Post> post = [];
    for (var d in data) {
      if (d != null) {
        post.add(Post.fromJson(d));
      }
    }
    return post;
  }

  String baseUrl = "http://covid-consult.herokuapp.com/apis/forum/?format=json";
  Future<List> getAllForum() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      // print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        return data;
      } else {
        // print(response.statusCode);
        return Future.error("Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // Future<dynamic> addNewForum(Post forum) async {
  //   var url = Uri.parse('http://127.0.0.1/8000/forum/postNewForum/');
  //   var response = await http.post(url,
  //       headers: {
  //         "Access-Control_Allow_Origin": "*",
  //         "Content-Type": "application/json; charset=utf-8",
  //       },
  //       body: jsonEncode(forum));
  //   return jsonDecode(response.body)["success"];
  // }
}

class SearchService {
  static Future<String> searchForum(String query) async {
    String url = 'http://covid-consult.herokuapp.com/apis/forum/?search=$query';
    http.Response response = await http.get(Uri.parse(url));
    // print("search_service.dart: searchDjangoApi: ${response.body}");
    return response.body;
  }
}

class CommentForumService {
  Future<List<Comment>> getComment(int dataForum) async {
    // print(dataForum);
    String url =
        "http://covid-consult.herokuapp.com/forum/commentForum/$dataForum/";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Comment> comment = [];
    for (var d in data) {
      if (d != null) {
        comment.add(Comment.fromJson(d));
      }
    }
    return comment;
  }
}

class ReplyCommentForumService {
  Future<List<Reply>> getReply(int dataForum) async {
    // print(dataForum);
    String url =
        "http://covid-consult.herokuapp.com/forum/replyCommentForum/$dataForum/";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Reply> reply = [];
    for (var d in data) {
      if (d != null) {
        reply.add(Reply.fromJson(d));
      }
    }
    return reply;
  }
}
