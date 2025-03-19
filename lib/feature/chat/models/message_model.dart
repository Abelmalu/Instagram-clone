
class Message {
   
    int? id;
  
    String text;
   
   

    Message({
         this.id,
        required this.text,
     
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        text: json["text"]
        
      );
}
