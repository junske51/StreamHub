# StreamHub


StreamHub是一个基于Spring Cloud微服务架构构建的视频分享平台，模仿B站核心功能实现的全栈项目。支持用户视频上传、观看、互动、社交等功能。

## 项目架构

项目采用前后端分离架构，后端使用Spring Cloud微服务体系，前端采用Vue框架。

### 微服务模块

- **gateway**: API网关服务，统一请求入口和路由
- **user_center**: 用户管理服务，负责登录注册、权限控制
- **video**: 视频处理服务，管理视频上传、转码、播放等
- **chat**: 即时通讯服务，支持用户私聊
- **notice**: 通知服务，处理评论、点赞等通知消息
- **search**: 搜索服务，提供内容搜索功能
- **common**: 公共组件，封装通用工具和配置

## 技术栈

### 后端技术
- **Spring Boot**: 构建微服务应用
- **Spring Cloud**: 微服务架构支持
- **MyBatis-Plus**: 持久层框架
- **MySQL**: 关系型数据库
- **Redis**: 缓存和分布式锁
- **RocketMQ**: 消息队列
- **ElasticSearch**: 搜索引擎
- **Minio**: 对象存储，用于视频和图片存储
- **JWT**: 用户认证
- **XXL-JOB**: 分布式任务调度

### 前端技术
- **Vue.js**: 前端框架
- **Element UI**: UI组件库
- **Axios**: HTTP客户端

## 核心功能

### 用户系统
- 多种方式登录注册（账号密码、邮箱、手机号）
- 基于Spring Security+JWT的认证授权
- 用户个人空间与信息管理

### 视频系统
- 视频上传（分片上传、断点续传）
- 视频转码与处理
- 视频播放与弹幕
- 点赞、收藏、评论功能

### 社交系统
- 关注与粉丝
- 视频动态
- 私信聊天
- 通知推送

### 搜索系统
- 基于ElasticSearch的全文搜索
- 关键词高亮与补全
- 多条件复合搜索

## 项目亮点

- 基于Spring Cloud Gateway构建的统一网关
- 双JWT token实现无感刷新认证
- 基于布隆过滤器和Redis的缓存优化
- RocketMQ实现消息可靠投递和顺序消费
- 文件分片上传和断点续传技术
- ElasticSearch与MySQL数据同步机制
- 使用WebSocket实现实时通信

## 部署指南

### 环境要求
- JDK 1.8+
- Maven 3.6+
- MySQL 8.0+
- Redis 6.0+
- RocketMQ 4.9+
- ElasticSearch 7.0+
- Minio

