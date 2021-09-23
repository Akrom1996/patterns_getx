import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

class UpdatePageModel extends GetxController {
  Post? post;
  var res;
  Future updateItemProvider(id, text1, text2, userId) async {
    print("update provider");
    res = await Network.PUT(
      Network.API_UPDATE,
      Network.paramsUpdate(
        new Post(id:  id, title: text1, body: text2, userId: userId),
      ),
    );
    print("provider res: $res");
    update();
    return res;
  }
}
