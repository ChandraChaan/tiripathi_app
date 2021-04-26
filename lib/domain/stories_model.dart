

class Stories{
final String id;
final String title;
final String sub_title;
final String image;
final String comment;

Stories({
    this.id, 
    this.title, 
    this.sub_title, 
    this.image, 
    this.comment
});

    factory Stories.fromJson(Map<String, dynamic> json) {
        return Stories(
            id :json['id'] as String,
            title: json['title'] as String,
            sub_title : json['sub_title'] as String,
            image: json['image'] as String,
            comment : json['comment'] as String,
        );
    }
}
