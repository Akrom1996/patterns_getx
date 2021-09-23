import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

class ViewModel extends GetxController {
  bool isLoading = false;

  List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    print(items);
    isLoading = false;
    update();
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    update();
    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading = false;
    update();
    return response != null;
  }
}
