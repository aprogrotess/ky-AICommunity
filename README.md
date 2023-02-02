## 项目描述

> 2023.2.2 tacom

此仓库用于记录每个人的踩坑经历(`:)`), 希望能给后续学习计算机的人
提供一个能够参考的学习路径

## 启动方式

### 电子书

1. 进入ky_doc/online_book
2. 使用node -v查看当前node是否 > 16, 否则更新node
3. `npm install` 安装依赖
4. `vuepress dev . --host 127.0.0.1`启动在线电子书

## 代码提交
> github [token登录](https://cloud.tencent.com/developer/article/1861466#:~:text=As%20previously%20announced%2C%20starting%20%EE%80%80on%20August%EE%80%81%20%EE%80%8013%EE%80%81%2C%20%EE%80%802021%EE%80%81%2C,will%20be%20required%20for%20all%20authenticated%20Git%20operations.)

1. 通常建议先使用`git branch`创建以某个具体目标命名的分支
2. 然后将代码提交到`git push origin 分支名`上
3. 全部更新完成后，切换到主分支`git checkout master`
4. 合并分支： `git merge 分支名`
5. 合并可以交给管理员完成
