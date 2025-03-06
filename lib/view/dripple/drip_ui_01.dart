

import 'package:demouserapp/utils.dart';


class FirstUserList extends StatefulWidget {
  const FirstUserList({super.key});

  @override
  State<FirstUserList> createState() => _FirstUserListState();
}

class _FirstUserListState extends State<FirstUserList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemBuilder: (index,context){
          return const Card(
            child: ListTile(
              title: Text(" dghrtqwwde"),
              subtitle: Text(" njdjj njnjnnjjn njnjnj njnjnjn"),
            
            ),
          );
            
        }),
      
    );

  }
}

