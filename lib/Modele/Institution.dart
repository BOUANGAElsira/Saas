class Institution {
  /* String sigle = "";
  String nom = "";
  String type = "";

  Institution(String sigle, String nom, String type) {
    this.sigle;
    this.nom;
    this.type;
  } */

  void display() async {
    String sigle = await Future.delayed(Duration(seconds: 2), () {
      String sigle = "LG";
      return sigle;
    });

    String nom = await Future.delayed(Duration(seconds: 2), () {
      String nom = "Louis-Grégory";
      return nom;
    });

    String type = await Future.delayed(Duration(seconds: 2), () {
      String type = "Ecole";
      String fisrtInstitution = "$sigle - $nom - $type";
      return fisrtInstitution;
    });

    print("Les institutions disponibles s'affichent ici...");
    print("\nfirstInstitution");
  }

  Institution() {
    display();
  }
}
