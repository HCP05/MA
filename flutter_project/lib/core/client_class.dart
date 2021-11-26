class Client {
  int id;
  String name;
  String email;
  String phoneNumber;
  String adress;
  String package;

  // constructor
  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.adress,
    required this.package,
  });

  copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? adress,
    String? package,
  }) {
    if (name != null) {
      this.name = name;
    }
    if (email != null) {
      this.email = email;
    }
    if (phoneNumber != null) {
      this.phoneNumber = phoneNumber;
    }
    if (adress != null) {
      this.adress = adress;
    }
    if (package != null) {
      this.package = package;
    }
  }
}

List<Client> clients = [
  Client(
    id: 0,
    name: 'Rares Pop',
    email: 'raresPop@yahoo.com',
    adress: 'Cluj-Napoca, str. Horea, no. 13',
    phoneNumber: '07888888888',
    package: 'Package 1',
  ),
  Client(
    id: 1,
    name: 'Maria Horea',
    email: 'mariaHorea@yahoo.com',
    adress: 'Cluj-Napoca, str. Horea, no. 31',
    phoneNumber: '07666666666',
    package: 'Package 2',
  ),
];
