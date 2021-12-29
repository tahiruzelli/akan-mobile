import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  double opacityValue = 0.3;
  int index;
  NotificationCard(this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Container(
          decoration: index < 3
              ? BoxDecoration(
                  color: colorRed.withOpacity(opacityValue),
                )
              : null,
          child: const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4D03AQFe883wZOzNDw/profile-displayphoto-shrink_200_200/0/1592940508582?e=1645056000&v=beta&t=n1uJWoEInQjpeP-Q3Mo_54pNcj4rTXCjK4kqX1GX-Zk'),
            ),
            title: Text('Uygun olduğunu düşündüğümüz yeni bir ilan var!'),
            subtitle: Text('AB+ acil kan ihtiyacı'),
            trailing: Text('10dk'),
          ),
        ),
      ),
    );
  }
}
