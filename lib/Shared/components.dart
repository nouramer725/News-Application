
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newssapp/Web_view/WebViewScreen.dart';

Widget buildArticleItem(articles,context)=> InkWell(
  onTap: () {
    navigateTo(context, Webviewscreen(articles['url']));
  },
  child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children:
        [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0,),
              image: DecorationImage(
                image: NetworkImage('${articles['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                [
                  Expanded(
                    child: Text(
                     '${articles['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${articles['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list, context, {isSearch = false})
{
  if (list.length > 0)
  {
    return ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  );
  } else {
    return isSearch ? Container() : Center(child: CircularProgressIndicator());
  }
}

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,Function(String)? onSubmit, // Use String type for onSubmit
  Function(String)? onChange, // Use String type for onChange
  VoidCallback? onTap, // Use VoidCallback for onTap
  bool isPassword = false,
  required String? Function(String?) validate, // Specify returntype for validate
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed, // Use VoidCallback for suffixPressed
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),suffixIcon: suffix != null
          ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix),
      )
          : null,
        border: OutlineInputBorder(),
      ),
    );

