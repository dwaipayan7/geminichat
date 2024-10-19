import 'package:flutter/material.dart';
import 'package:geminichat/message.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

final TextEditingController _controller = TextEditingController();

final List<Message> _messages = [

  Message(text: 'HI', isUser: true),
  Message(text: "Hello what's up?", isUser: false),
  Message(text: 'Great and you?', isUser: true),
  Message(text: "I'm fine", isUser: false),

];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/gpt-robot.png'),
                SizedBox(width: 10,),
                Text("Gemini", style: TextStyle(
                  color: Colors.black
                ),)
              ],
            ),
            Image.asset('assets/volume-high.png', color: Colors.blue[800],)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
                itemBuilder: (context, index){
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser ? Alignment.centerRight :
                      Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message.isUser ?Colors.blue[300] : Colors.grey[300],
                            borderRadius: message.isUser?
                            BorderRadius.only(
                                topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)
                            ) :
                            BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            )

                          ),
                          child: Text(message.text,
                          style: TextStyle(
                            color: message.isUser ? Colors.white : Colors.black87
                          ),),
                      ),
                    ),
                  );
                }
            ),
          ),

          //user input

          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 16, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0,3)
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Write Your Message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.send)
                  )
                ],
              ),
            ),
          ),


        ],
      ),




    );
  }
}
