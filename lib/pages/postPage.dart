import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/pages/postPageModel.dart';
import 'package:patterns_getx/services/http_service.dart';
import 'package:patterns_getx/viewModel/viewModel.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    Key? key,
  }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Post? post;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  final PostPageModel postPageModel = Get.put(PostPageModel());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
  }

  postItem() async {
    var res = await postPageModel.PostItem(
        textEditingController1.text, textEditingController2.text, 1);
    print("res post: $res");
    if (res != null) {
      // Navigator.pop(context, true);
      Get.back(result: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new item"),
      ),
      body:GetBuilder<PostPageModel>(
        init: postPageModel,
        builder: (_)=>Container(
         padding: EdgeInsets.symmetric(horizontal: 24),
         child: Column(
           children: [
             SizedBox(
               height: 20,
             ),
             TextFormField(
               maxLines: 3,

               controller: textEditingController1,
               // initialValue: "${post.title}",
               decoration: InputDecoration(
                 hintText: "Title",
                 border: OutlineInputBorder(
                   borderSide: BorderSide(width: 1, color: Colors.grey),
                 ),
               ),
             ),
             SizedBox(
               height: 20,
             ),
             TextFormField(
               maxLines: 3,
               // initialValue: "${post.body}",
               controller: textEditingController2,
               decoration: InputDecoration(
                 hintText: "Body",
                 border: OutlineInputBorder(
                   borderSide: BorderSide(width: 1, color: Colors.grey),
                 ),
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Container(
               width: double.infinity,
               height: 48,
               child: ElevatedButton(
                 onPressed: postItem,
                 child: Text("Post item"),
               ),
             )
           ],
         ),
          ),
      ),
    );
  }
}
