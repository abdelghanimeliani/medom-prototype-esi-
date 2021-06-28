import '../constants.dart';

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
     kabrv: this.abrv,
     kemailName: this.emailName,
     kname : this.name,
     kadresse : this.adresse,
     knbrplaces : this.nbrPbaces,
     knbrMedecin: this.nbrMedecins,
   };

   factory Hospital.fromJson(Map<String, dynamic> json) {
   return Hospital(
       abrv: json[kabrv],
       emailName: json[kemailName],
       name : json[kname],
       adresse : json[kadresse],
       nbrPbaces : json[knbrplaces],
       nbrMedecins : json[knbrMedecin],
   );


   }
   }
