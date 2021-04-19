class stories{

int id;
String title;
String sub_title;
String image;
String comment;

stories({
    this.id, 
    this.title, 
    this.sub_title, 
    this.image, 
    this.comment
});
// stories.fromJson(Map<String, dynamic> json){
//     id = json['id'] as int;
//     title = json['title'] as String;
//     sub_title = json['sub_title'] as String;
//     image = json['image'] as String;
//     comment = json['comment'] as String;
// }
}