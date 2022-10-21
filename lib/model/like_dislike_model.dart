class LikeDislikeModel {
  String? id;
  String? userId;
  String? profileId;
  String? likeStatus;
  String? strtotime;
  String? result;

  LikeDislikeModel(
      {this.id,
        this.userId,
        this.profileId,
        this.likeStatus,
        this.strtotime,
        this.result});

  LikeDislikeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    profileId = json['profile_id'];
    likeStatus = json['like_status'];
    strtotime = json['strtotime'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['profile_id'] = this.profileId;
    data['like_status'] = this.likeStatus;
    data['strtotime'] = this.strtotime;
    data['result'] = this.result;
    return data;
  }
}
