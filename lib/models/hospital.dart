class Hospital {
   String abrv ;
   String emailName ;
   String name ;
   String adresse ;
   String nbrPbaces ;
   String nbrMedecins ;


   Hospital({this.abrv, this.emailName, this.name, this.adresse,
   this.nbrPbaces, this.nbrMedecins});

   Map toJson() => {
     "abrv": this.abrv,
     "emailName": this.emailName,
     "name" : this.name,
     "adresse" : this.adresse,
     "nbrPbaces" : this.nbrPbaces,
     "nbrMedecins" : this.nbrMedecins,
   };

   factory Hospital.fromJson(Map<String, dynamic> json) {
   return Hospital(
       abrv: json["abrv"],
       emailName: json["emailName"],
       name : json["name"],
       adresse : json["adresse"],
       nbrPbaces : json["nbrPlaces"],
       nbrMedecins : json["nbrMedecins"],
   );


   }
   }
