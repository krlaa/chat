// This defines a user class that contains a name
class User {
  String _name = '';

  User({required String name}) {
    _name = name;
  }
  User.empty() {
    _name = '';
  }
  get name => _name;
}
