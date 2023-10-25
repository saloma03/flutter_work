import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:test3/shared/cubit/cubit.dart';

Widget defaultButtom({
  double width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback function,
  required String text,
  bool Uppercase = true,
  double radius = 0.0,


}) => Container(
  height: 40.0,
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: Colors.blue,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(Uppercase ? text.toUpperCase(): text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onPressed,
  Function? onChange,
  Function? onTap,
  required String? Function(String?)? validate,
  required String label,
  required Icon prefix,
  bool isPassword = false,
  IconData ?suffix,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword ? true : false,
  onTap: onTap != null ? () => onTap() : null,
  onFieldSubmitted: onSubmit != null ? (value) => onSubmit(value) : null,
  onChanged: onChange != null ? (value) => onChange(value) : null,
  decoration: InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),

    prefixIcon: prefix,
    suffixIcon: suffix != null
        ? IconButton(
      icon: Icon(suffix),
      onPressed: onPressed != null ? () => onPressed() : null,
    ) : null,

  ),
  validator: validate,

);
Widget buildTaskItem(Map model,context, List<Map> tasks,) => Dismissible(
  key: UniqueKey(),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row
      (
      children:
      [
        CircleAvatar
          (
          radius: 40.0,
          child: Text('${model['time']}'),
        ),
        SizedBox
          (
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text('${model['title']}',
                style: TextStyle
                  (
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('${model['date']}',
                style: TextStyle
                  (
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox
          (
          width: 20.0,
        ),
        IconButton(
            onPressed: (){
              AppCubit.get(context).updateData(status: 'Done', id: model['id']);
            },
            icon: Icon(
              Icons. check_box,
              color: Colors.green,
            )
        ),
        IconButton(
            onPressed: (){
              AppCubit.get(context).updateData(status: 'Archived', id: model['id']);

            },
            icon: Icon(
              Icons.archive_outlined,
              color: Colors.black54,
            )
        ),

      ],


    ),
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id'],);
    tasks.removeWhere((task) => task['id'] == model['id']);

  },

);

Widget tasksBuilder(
    @required List<Map> tasks,
    ) => ConditionalBuilder(
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,
          size: 200,
          color: Colors.grey,
        ),
        Text('No tasks yet, please add some tasks'
          ,style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),),
      ],
    ),
  ),
  condition: tasks.length>0,
  builder: (context) => ListView.separated(
      itemBuilder:
          (context, index) => buildTaskItem(tasks[index],context,tasks),
      separatorBuilder: (context,index) => myDivider(),
      itemCount: tasks.length
  ),
);
void removeTask(int taskId) {


}
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only( start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],),
);
Widget buildArticleItem(article) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(width: 20.0,),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),)
            ],
          ),
        ),
      )
    ],
  ),
);