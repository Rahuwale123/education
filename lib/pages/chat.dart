
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController uprompt = TextEditingController();
  List<ChatMessage> messages = [];
  stt.SpeechToText speech = stt.SpeechToText();
  String currentText = '';
bool isListening=false;
  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        messages.insert(0, ChatMessage(text: message, isUser: true));
      });
      uprompt.clear();
    }
  }

  Future<void> chat() async {
    final prompt = uprompt.text;
    sendMessage(prompt); 

    setState(() {
      messages.insert(0, ChatMessage(text: "Edu is typing...", isUser: false));
    });

    await Future.delayed(Duration(seconds: 2));

    const apiKey = 'AIzaSyBn_b0oJ8Gkg3DTnr18HFXZ2R0UEEpzBys';
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    final responseText = response.text ?? "No response";

    setState(() {
      messages.removeAt(0); 
      messages.insert(0, ChatMessage(text: responseText, isUser: false));
    });
  }

  void startListening() {
    speech.listen(
      onResult: (result) {
        setState(() {
          currentText = result.recognizedWords;
        });
      },
    );
  }

  void stopListening() {
    speech.stop();
    if (currentText.isNotEmpty) {
      uprompt.text = currentText;
      chat();
    }
    currentText = '';
  }

  @override
  void initState() {
    super.initState();
    speech.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.isUser ? Alignment.topRight : Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isUser ? Colors.blueAccent : const Color.fromARGB(255, 61, 56, 56),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: uprompt,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isListening=!isListening;
                    });
                     isListening?startListening(): stopListening();
                  },
                  icon: Icon(isListening?Icons.mic : Icons.mic_off),
                ),
                IconButton(
                  onPressed: chat,
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
