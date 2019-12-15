class Chat{
    String member1;
    String member2;
    List<String> members;

    Chat(String member1, String member2){
      this.member1 = member1;

      this.member2 = member2;
      this.members = [member1,member2];
    }

    toMap(){
      return {
        "member1":{
          "username":this.member1,
        "is_typing":false,
        "is_read":true
        },
        "member2":{
          "username":this.member2,
        "is_typing":false,
        "is_read":false
        },
        "members": this.members
      };
    }
}
