import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemText extends StatelessWidget{
  final bool check;
  final String text;
  final DateTime dueDate;

  ItemText(
      this.check,
      this.text,
      this.dueDate,
      );


  Widget _buildText(BuildContext context) {
    if(check){
     return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 22,
              color:Colors.purple,
              decoration: TextDecoration.lineThrough
            ),
          ),
          _buildDateTimeTexts(context),
        ],

      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          overflow:TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        _buildDateTimeTexts(context),
      ],
    );

  }



  Widget _buildDateText(BuildContext context) {
    return Text(
      DateFormat.yMMMd().format(dueDate).toString(),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        color:check?Colors.purple:Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildDateTimeTexts(BuildContext context){
    if(dueDate!=null){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildDateText(context),
          SizedBox(
            width: 10,
          ),
          _buildDateText(context),
        ],

      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _buildText(context);
  }
}