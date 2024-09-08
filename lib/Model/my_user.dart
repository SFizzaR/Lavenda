class myUser {
  String? uid;
  String? username;
  String? password;
  String? email;
  String? bio;
  String? name;
  String? avatarUrl;
  DateTime? AccountCreated;

  // Named parameters constructor
  myUser({
    this.AccountCreated,
    this.avatarUrl,
    this.bio,
    this.email,
    this.name,
    this.password,
    this.uid,
    this.username,
  });
}
