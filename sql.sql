## 视频表
CREATE TABLE `video` (
                         `id` int NOT NULL AUTO_INCREMENT, #主键id
                         `length` varchar(50) DEFAULT NULL,  #视频时长
                         `url` varchar(100) DEFAULT NULL,    #视频在minio中存储路径
                         `cover` varchar(100) DEFAULT NULL,   #视频封面在minio中存储路径
                         `name` varchar(200) DEFAULT NULL,   #视频名称
                         `intro` varchar(200) DEFAULT NULL,  #视频介绍
                         `user_id` int DEFAULT NULL,    #作者id
                         `create_time` datetime DEFAULT NULL,  #创建时间
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 视频数据表
CREATE TABLE `video_data` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `video_id` int DEFAULT NULL,  #视频id
                              `comment_count` int DEFAULT NULL,  #该视频评论数
                              `play_count` int DEFAULT NULL,   #该视频播放量
                              `like_count` int DEFAULT NULL,  #点赞量
                              `danmaku_count` int DEFAULT NULL,  #弹幕量
                              `collect_count` int DEFAULT NULL,  #收藏量
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 视频、评论点赞表
CREATE TABLE `likes` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `video_id` int DEFAULT NULL,  #点赞所在的视频id
                         `user_id` int DEFAULT NULL,  #点赞者用户id
                         `comment_id` int DEFAULT NULL,  #点赞的评论id，若点赞的是视频则该值为null
                         `create_time` datetime DEFAULT NULL,  #点赞创建时间
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 评论表
CREATE TABLE `comment` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `video_id` int DEFAULT NULL,  #评论所在的视频id
                           `user_id` int DEFAULT NULL,  #发表评论的用户id
                           `parent_id` int DEFAULT NULL,  #父级评论id
                           `top_id` int DEFAULT NULL,  #顶层评论id
                           `content` varchar(1000) DEFAULT NULL,  #评论内容
                           `create_time` datetime DEFAULT NULL,  #评论创建时间
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 弹幕表
CREATE TABLE `danmaku` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `video_id` int DEFAULT NULL,  #所在视频id
                           `user_id` int DEFAULT NULL,  #发表弹幕的用户id
                           `content` varchar(1000) DEFAULT NULL,  #弹幕内容
                           `create_time` datetime DEFAULT NULL,  #弹幕创建时间
                           `place` int DEFAULT NULL,  #弹幕所处视频中的位置
                           `type` int DEFAULT NULL,  #弹幕显现方式，由左至右还是直接显现
                           `color` int DEFAULT NULL,  #弹幕颜色
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 评论消息表
CREATE TABLE `comment_notice` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `sender_id` int DEFAULT NULL,  #评论消息的发送者id
                                  `receiver_id` int DEFAULT NULL,  #评论消息的接收者id
                                  `create_time` datetime DEFAULT NULL,  #评论消息的创建时间
                                  `video_id` int DEFAULT NULL,  #评论所在的视频id
                                  `status` int DEFAULT NULL,  #消息已读状态
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 收藏表
CREATE TABLE `collect` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `video_id` int DEFAULT NULL,  #收藏的视频id
                           `collect_group_id` int DEFAULT NULL,  #所属收藏夹id
                           `create_time` datetime DEFAULT NULL,  #收藏的创建时间
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 收藏夹表
CREATE TABLE `collect_group` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `name` varchar(100) DEFAULT NULL,  #收藏夹名称
                                 `user_id` int DEFAULT NULL,  #收藏夹所属用户id
                                 `create_time` datetime DEFAULT NULL,  #收藏夹创建时间
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 历史播放表
CREATE TABLE `play` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `video_id` int DEFAULT NULL,  #播放的视频id
                        `user_id` int DEFAULT NULL,  #播放视频的用户id
                        `create_time` datetime DEFAULT NULL,  #播放的创建时间
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 用户表
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `username` varchar(100) DEFAULT NULL,  #用户名
                        `password` varchar(100) DEFAULT NULL,  #密码
                        `cover` varchar(100) DEFAULT NULL,  #头像
                        `nickname` varchar(100) DEFAULT NULL,  #昵称
                        `intro` varchar(200) DEFAULT NULL,  #简介
                        `phone_number` varchar(50) DEFAULT NULL,  #手机号
                        `mail_number` varchar(50) DEFAULT NULL,  #邮箱
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## 用户权限表
CREATE TABLE `privilege` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `user_id` int DEFAULT NULL,  #用户id
                             `collect_group` int DEFAULT NULL,  #收藏夹是否开放
                             `remotely_like` int DEFAULT NULL,  #最近点赞是否开放
                             `fans_list` int DEFAULT NULL,  #粉丝列表
                             `idol_list` int DEFAULT NULL,  #偶像列表
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;