# strengthpassword

A new Flutter package for both android and iOS which helps to find the strength of password and if password is weak it doesnt allow validation

Usuage


## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  strengthpassword: "^0.0.1"
```

In your library add the following import:

```dart
import 'package:strengthpassword/strengthpassword.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).


## Example
  TextEditingController passwordControl = new TextEditingController();
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: PasswordField(textEditingController: passwordControl)),
            
  The result if 'passwordControl' text string is :
  1.  string length < 6 and is common passowrd
      * weak 
  2. string length = 6
      * weak 
            - common password
            - all letter is either character or numeric or uppercase or lowercase
      * fair
            - either two/three of number or letter or special character is present in password string
   3. otherwise
      2. string length = 6
          * weak 
                - common password
                - all letter is either character or numeric or uppercase or lowercase
          * fair
                - either two of number or letter or special character is present in password string
          * strong
                - must consist consists three of number , letterand  special character is present in password string
                
## Preview
![Overview](https://github.com/susantimilsina/strengthPassword/Demo.gif)

