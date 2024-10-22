import 'package:flutter/material.dart';
import 'package:geminichat/model/message.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/gpt-robot.png'),
                SizedBox(width: 10,),
                Text("Gemini", style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            Image.asset('assets/volume-high.png', color: Colors.blue[800],)
          ],
        ),
        elevation: 1,
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
                            color: message.isUser ? Theme.of(context).colorScheme.primary :
                            Theme.of(context).colorScheme.secondary,
                            borderRadius: message.isUser?
                            const BorderRadius.only(
                                topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)
                            ) :
                            const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            )

                          ),
                          child: Text(
                              message.text,
                              style: message.isUser ? Theme.of(context).textTheme.bodyMedium :
                              Theme.of(context).textTheme.bodySmall
                          )
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
                      decoration:  InputDecoration(
                        hintText: 'Write Your Message',
                          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.grey
                          ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: GestureDetector(
                     child: Image.asset('assets/send.png'),
                     onTap: (){},
                   ),
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
