
import 'package:demouserapp/utils.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()..fetchUsers()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:UserScreen(),
 
      ),
    ),
  );
}

