import 'package:demouserapp/utils.dart';


class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: user.id % 2 == 0
          // ? const Color.fromRGBO(201, 160, 214, 1)
          // : const Color.fromRGBO(222, 237, 237, 1),
          ? const Color.fromRGBO(156, 237, 254, 1)
          : const Color.fromRGBO(254, 248, 113, 1),
      elevation: 4,
      child: ListTile(
        title: Text(user.title),
        subtitle: Row(
          children: [
            Icon(
              user.completed ? Icons.check_circle : Icons.cancel,
              color: user.completed ? Colors.green : Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            user.completed
                ? Text(
                    'Completed',
                    style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1),
                  )
                : const Text(
                    'Cancelled',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
          ],
        ),
        trailing: Text(
          'ID: ${user.id}',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}

