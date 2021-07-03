import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/constants.dart';
import 'package:medom/screens/login/component/back.dart';

import 'package:medom/screens/root/root.dart';
import 'package:medom/screens/thanks_result/thanks_result.dart';
import 'package:survey_kit/survey_kit.dart';


class DailyQuestion extends StatefulWidget {
  static String id ="id wkhlas 2 ";
  @override
  _DailyQuestionState createState() => _DailyQuestionState();
}

class _DailyQuestionState extends State<DailyQuestion> {

  int state =0 ;
  int etat = 0 ;
  String cons = '';



  @override
  Widget build(BuildContext context) {
    void getData() async {
      try{

        await FirebaseFirestore.instance
            .collection('questions')
            .doc(RootAppPrim.emailName)
            .get()
            .then((DocumentSnapshot documentSnapshot) {

          if (documentSnapshot.exists) {
            print('kayen');
            print('Document data: ${documentSnapshot.data()}');

            if(documentSnapshot.data()[krep]==true){
              state = 2 ;

              try{
                FirebaseFirestore.instance
                    .collection('reponses')
                    .doc(RootAppPrim.emailName)
                    .get()
                    .then((DocumentSnapshot documentSnapshot) {

                  if (documentSnapshot.exists) {
                    print('kayen');
                    print('Document data: ${documentSnapshot.data()}');
                    etat=documentSnapshot.data()['etat'];
                    cons = documentSnapshot.data()['consignes'];
                    //adresse = documentSnapshot.data()[kadresse];

                  } else {
                    print('Document does not exist on the database');
                    //  adresse ='-1';
                  }
                });
              }catch(e){
                print(e.toString());
              }


            }else {
              state = 1 ;
            }

            //adresse = documentSnapshot.data()[kadresse];

          } else {
            print('Document does not exist on the database');
            state=0;
            //  adresse ='-1';
          }
        });
      }catch(e){
        e.message ;
      }
    }

    getData() ;

      if(state==0){
        return questionnaire();
      }else if(state==1){
        return WelcomeScreen();
      }else return ResultPage(
        etat: etat,
        consignes: cons,
      );

  }


  Task getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Salut !! ',
          text: 'Merci de répondre a ce questionnaire ',
          buttonText: 'OK',
        ),

        QuestionStep(
          title: 'Quel age avez vous',
          answerFormat: IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'svp tapez votre age ',
          ),
        ),

        QuestionStep(
          title: 'Medicament ?',
          text: 'Utilisez-vous des medicaments ?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'OUI',
            negativeAnswer: 'NON',
            result: BooleanResult.NEGATIVE,
          ),
        ),
        /**********************************************
         * ******************************************************
         * ******************************************************
         */
        QuestionStep(
          title: 'Toux ?',
          text: 'vous avez la  Toux ?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'OUI',
            negativeAnswer: 'NON',
            result: BooleanResult.NEGATIVE,
          ),
        ),
//***************************


        QuestionStep(
          title: 'difficulté a respirer?',
          text: ' avez-vous un essouflement ou des difficultés a respirer ?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'OUI',
            negativeAnswer: 'NON',
            result: BooleanResult.NEGATIVE,
          ),
        ),

        QuestionStep(
          title: 'Douleurs ?',
          text: ' avez-vous des Douleurs musculaires ou courbatures?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'OUI',
            negativeAnswer: 'NON',
            result: BooleanResult.NEGATIVE,
          ),
        ),

        QuestionStep(
          title: "gout , ordorat ?",
          text: " avez vous perdu le gout ou l'ordorat recement ?",
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'OUI',
            negativeAnswer: 'NON',
            result: BooleanResult.NEGATIVE,
          ),
        )


        ,
       /* QuestionStep(
          title: 'Symptomes',
          text: 'Quel symptome as tu?',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Toux', value: 'toux'),
              TextChoice(text: 'essouflement ou difficulté a respirer',
                  value: 'essouflement'),
              TextChoice(text: ' Douleurs musculaires ou courvatures',
                  value: 'douleurs'),
              TextChoice(
                  text: "nouvelle perte de gout ou d'ordorat", value: 'perte'),
            ],
          ),
        ),*/

        // tempreature
        QuestionStep(
          title: 'votre temperature actuelle',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 36,
            maximumValue: 42,
            defaultValue: 37,
            minimumValueDescription: '36',
            maximumValueDescription: '42',
          ),
        ),

        QuestionStep(
          title: 'description',
          text:
          'Comment tu te sens maintenant ?',
          answerFormat: TextAnswerFormat(
            maxLines: 5,
          ),
        ),
        CompletionStep(
          id: StepIdentifier(id: '321'),
          text: 'MERCI POUR VOTRE TEMPS',
          title: "C'est terminé",
          buttonText: 'envoyer',
        ),
      ],
    );

    /* task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[5].id,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].id;
            case "No":
              return task.steps[7].id;
            default:
              return null;
          }
        },
      ),
    );*/
    return task;
  }




  bool convert ( var param){
    if (param.toString().contains('POS'))
      return true ;
    else return false ;
  }

  Widget questionnaire(){
    return MaterialApp(
      home: Scaffold(
        body: Background(
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: double.infinity,
                width: 600,


                child: SurveyKit(
                  onResult: (SurveyResult result) async {
                    CollectionReference questions = FirebaseFirestore.instance.collection('questions');
                    questions..doc(RootAppPrim.emailName).set(
                        {
                          kage : result.results[1].results[0].result ,
                          kmed : convert(result.results[2].results[0].result) ,
                          ktoux :convert(result.results[3].results[0].result) ,
                          kres : convert(result.results[4].results[0].result) ,
                          kdouleur : convert(result.results[5].results[0].result) ,
                          kgout : convert(result.results[6].results[0].result) ,
                          ktemp : result.results[7].results[0].result.toString(),
                          kdescription : result.results[8].results[0].result,
                          kenv : true,
                          krep : false ,
                          'n':"KA",
                          'idoc' : RootAppPrim.emailName,}
                    )
                        .then((value) => print("User Added"))
                        .catchError((error) => print("Failed to add user: $error"));
                    print(result.results[1].results[0].result);
                    print(convert(result.results[2].results[0].result));
                    print(result.results[3].results[0].result);
                    print(result.results[4].results[0].result);
                    print(result.results[5].results[0].result);
                    setState(() async {
                      try{

                        await FirebaseFirestore.instance
                            .collection('questions')
                            .doc(RootAppPrim.emailName)
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {

                          if (documentSnapshot.exists) {
                            print('kayen');
                            print('Document data: ${documentSnapshot.data()}');
                            if(documentSnapshot.data()[krep]=true){
                              state = 2 ;

                              try{
                                FirebaseFirestore.instance
                                    .collection('reponses')
                                    .doc(RootAppPrim.emailName)
                                    .get()
                                    .then((DocumentSnapshot documentSnapshot) {

                                  if (documentSnapshot.exists) {
                                    print('kayen');
                                    print('Document data: ${documentSnapshot.data()}');
                                    etat=documentSnapshot.data()['etat'];
                                    cons = documentSnapshot.data()['consignes'];
                                    //adresse = documentSnapshot.data()[kadresse];

                                  } else {
                                    print('Document does not exist on the database');
                                    //  adresse ='-1';
                                  }
                                });
                              }catch(e){
                                print(e.toString());
                              }


                            }else {
                              state = 1 ;
                            }

                            //adresse = documentSnapshot.data()[kadresse];

                          } else {
                            print('Document does not exist on the database');
                            state=0;
                            //  adresse ='-1';
                          }
                        });
                      }catch(e){
                        e.message ;
                      }
                    });

                  },
                  task: getSampleTask(),
                  themeData: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.cyan,
                    ).copyWith(
                      onPrimary: Colors.white,
                    ),
                    primaryColor: ksecondaryColor,
                    backgroundColor: Colors.white,

                    appBarTheme: const AppBarTheme(
                      color: kPrimaryColor,
                      iconTheme: IconThemeData(
                        color: kPrimaryColor,
                      ),
                      textTheme: TextTheme(
                        button: TextStyle(
                          color:kPrimaryColor,
                        ),
                      ),
                    ),

                    iconTheme: const IconThemeData(
                      color: kPrimaryColor,
                    ),

                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(150.0, 60.0),
                        ),
                        side: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return BorderSide(
                                color: Colors.grey,
                              );
                            }
                            return BorderSide(
                              color: ksecondaryColor,
                            );
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),

                        textStyle: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return Theme.of(context).textTheme.button?.copyWith(
                                color: ksecondaryColor,
                              );
                            }
                            return Theme.of(context).textTheme.button?.copyWith(
                              color: kPrimaryColor,
                            );
                          },
                        ),
                      ),
                    ),

                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.button?.copyWith(
                            color: ksecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


