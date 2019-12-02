import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white,
			appBar: AppBar(
				title: Text("Developer"),
				centerTitle: true,
				elevation: 0.0
			),
			body: Center(
				child: Padding(
					padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
					child: Column(
						children: <Widget>[
							CircleAvatar(
			          backgroundImage: AssetImage('assets/akash.jpeg'),
			          radius: 100.0,
			        ),
			        SizedBox(height: 20.0),
							Text(
								"Akash Rajpurohit",
								style: TextStyle(
									color: Colors.red,
									fontSize: 30.0,
									fontWeight: FontWeight.bold
								)
							),
							SizedBox(height: 10.0),
							Text(
								"Software Developer",
								style: TextStyle(
									color: Colors.red[300],
									fontSize: 18.0,
									fontStyle: FontStyle.italic
								)
							),
							SizedBox(height: 20.0),
							Text(
								"Thank you for downloading and using this app. I am planning to keep this app free forever, even without ads. However in return you can support me by sharing you feedback on the playstore ^_^",
								style: TextStyle(
									color: Colors.red[400],
									fontSize: 20.0,
								)
							),
						]
					),
				),
			),
		);
	}
}