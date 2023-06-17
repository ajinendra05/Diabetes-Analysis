import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../beckend/beckend.dart';
import '../constants/constants.dart';
import '../data/data.dart';

import '../models/project_model.dart';
import 'widget/dropdownButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    String? riverName;
    String? monthName;
    double? disolvedO2;
    double? BOD;
    double? totalCaliform;
    double? fecalColiform;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    kGradient1,
                    kGradient2,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            Center(
                child: Text(
              name,
              style: kTitleText,
            )),
            Center(
                child: Text(
              "@$username",
              style: kSubTitleText,
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: screenSize.width > 1200
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // TextFormField(
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'please enter valid Name';
                                    //     } else {
                                    //       return null;
                                    //     }
                                    //   },
                                    //   onSaved: (newValue) {
                                    //     riverName = newValue;
                                    //   },
                                    //   keyboardType: TextInputType.name,
                                    //   decoration: const InputDecoration(
                                    //       labelText: 'River Name'),
                                    // ),

                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.pregnant =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Number of times Pregnant')),
                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.insulin =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText: 'Insulin (mu U/ml)')),
                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.bmi =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText:
                                                'BMI(Body mass index )')),
                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.age =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText: 'Age')),
                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.glucose =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText: 'Glucose')),
                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.bp =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Blood Pressure (mm Hg)')),
                                    TextFormField(
                                        validator: (value) {
                                          if (isNumericUsing_tryParse(value!)) {
                                            return 'please enter valid Number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          DataModel.pedigree =
                                              double.parse(newValue!);
                                        },
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Diabetes Pedigree Function')),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // if (widget.isloading) const CircularProgressIndicator(),
                                    // if (!(widget.isloading))
                                    // ElevatedButton(
                                    //     onPressed: () {

                                    //     },
                                    //     child: Text('Predict Quality')),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: kGradient2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      onPressed: () async {
                                        final isValid =
                                            _formKey.currentState!.validate();
                                        _formKey.currentState!.save();
                                        await Server.estimateResult();
                                        cancelAlertDialog();
                                      },
                                      child: Text('PREDICT',
                                          style: kTitleText.copyWith(
                                              fontSize: 24,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ))
                          ])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.pregnant =
                                            double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText:
                                              'Number of times Pregnant')),
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.insulin =
                                            double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'Insulin (mu U/ml)')),
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.bmi = double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'BMI(Body mass index )')),
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.age = double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'Age')),
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.glucose =
                                            double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'Glucose')),
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.bp = double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'Blood Pressure (mm Hg)')),
                                  TextFormField(
                                      validator: (value) {
                                        if (isNumericUsing_tryParse(value!)) {
                                          return 'please enter valid Number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        DataModel.pedigree =
                                            double.parse(newValue!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText:
                                              'Diabetes Pedigree Function')),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // if (widget.isloading) const CircularProgressIndicator(),
                                  // if (!(widget.isloading))
                                  // ElevatedButton(
                                  //     onPressed: () {

                                  //     },
                                  //     child: Text('Predict Quality')),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: kGradient2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () async {
                                      final isValid =
                                          _formKey.currentState!.validate();
                                      _formKey.currentState!.save();
                                      await Server.estimateResult();
                                      cancelAlertDialog();
                                    },
                                    child: Text('PREDICT',
                                        style: kTitleText.copyWith(
                                            fontSize: 24, color: Colors.black)),
                                  ),
                                ],
                              ))
                        ],
                      ),
              ),
            ),
            Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: screenSize.width > 1000 ? null : null),
            ),
          ],
        ),
      ),
    );
  }

  bool isNumericUsing_tryParse(String string) {
    if (string == null || string.isEmpty) {
      return true;
    }
    string = string.toString();
    final number = num.tryParse(string);

    if (number == null) {
      return true;
    }

    return false;
  }

  void cancelAlertDialog() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => Container(
        height: height * 0.06,
        width: width,
        child: SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          title: Stack(alignment: Alignment.center, children: [
            Icon(
              Icons.check,
              size: height * 0.05,
              color: Colors.green,
            ),
            Icon(
              Icons.circle_outlined,
              size: height * 0.07,
              color: Colors.green,
            ),
          ]),
          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                DataModel.estimated_result == '1'
                    ? Column(
                        children: [
                          Text(
                            'The person is Diabetic',
                            style: kSubTitleText.copyWith(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Result: POSITIVE',
                            style: kSubTitleText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'probability: ${(DataModel.estimated_Proba)!.toStringAsFixed(3)}',
                            style: kSubTitleText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            'The person is not Diabetic',
                            style: kSubTitleText.copyWith(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Result: NEGETIVE',
                            style: kSubTitleText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'probability: ${(DataModel.estimated_Proba)!.toStringAsFixed(3)}',
                            style: kSubTitleText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       elevation: 0,
                //       backgroundColor: Colors.grey.shade400,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8))),
                //   onPressed: () {},
                //   child: const Text('Am I correct :)',
                //       style: TextStyle(
                //         color: Colors.black26,
                //         fontFamily: 'Manrope',
                //         fontSize: 15.5,
                //         fontWeight: FontWeight.w900,
                //       )),
                // ),
                SizedBox(
                  height: height * 0.04,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
