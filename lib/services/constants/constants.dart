//Colors
import 'package:flutter/material.dart';
import '../size_config/size_config.dart';

const Color canvasColor = Color(0xFFFAFAFA);
List<String> locations = ['Palm Springs, CA','Seoul, Korea', 'Amsterdam, Netherlands','Chicago, Illinois','Paris, France','Cairo, Egypt'];
List<String> nftCollections = ['Outdoorsy', 'The Mandarin', 'EuroWalkers', 'Sailrz', 'Asgradians','Nightwalkers'];
List<int> nftCount = [5,15,8,6];
double defaultPadding = SizeConfig.screenWidth/8;

const String earthImage = 'assets/images/earth.PNG';
const String error = 'assets/images/error.jpg';
const String xrpIcon = 'assets/images/xrp_icon.svg';

const String artist = 'Artist Name';
const String description = 'Terentia currēbat. Nox Rōmae erat et Terentia per obscūrās '
    'urbis viās currēbat. Celeriter currēbat. Ante sē umbram vidēbat. Eam '
    'sequēbātur. Sed umbra celerius currēbat quam Terentia. Terentia subitō '
    'cōnstitit. Via erat vacua et obscūra. Nōnvidēbat umbram quam sequēbātur. '
    'Īrāta exclāmāvit: “Ubi es?!”Terentia currere volēbat, umbram sequī volēbat.'
    ' Sed urbset via nimis obscūrae erant. Terentia circumspexit. Viās et aedēs '
    'vidēbat, sed obscūraeerant. Umbrās vidēbat, multās umbrās, sed umbram quam '
    'sequēbātur iam nōn vidēbat. Nox erat obscūra. Perīculōsum erat noctū Rōmae '
    'forīsesse; Terentia erat sōla et via erat vacua. Terentia conversa rediit '
    'eādem viā quā vēnerat.';

const String quantity = 'quantity';
const String owners = 'owners';
const String price = 'price';

const Duration animationDuration = Duration(milliseconds: 500);
const Duration animationDuration2 = Duration(milliseconds: 1000);

const String version = '0.1';

double appBarDefaultPadding = SizeConfig.screenWidth*.1;

LinearGradient gradient = const LinearGradient(
  colors: <Color>[
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.blueAccent,
    Colors.green
  ],
);

// Mint Form
List<String> mintType = ['Keychain', 'Experience', 'Event'];
List<int> qty = [1,2,3,4,5,6,7,8,9,10];
