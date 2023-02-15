---
sidebar: auto
---

# 电子书编写指导

>  这本电子书是采用vuepress架构编写而成，因此需要遵守此框架的编写规范。



## 目录结构

根据框架约定，此子项目的目录结构如下：

- `.vuepress`: 这里面存放网页的各种自定义信息，通常不需要修改，详情见[官网](https://vuepress.vuejs.org/zh/guide/directory-structure.html#%E9%BB%98%E8%AE%A4%E7%9A%84%E9%A1%B5%E9%9D%A2%E8%B7%AF%E7%94%B1)
- `*/assets`: 所有的assets文件夹存放某个主题下，文档需要的资源(图片之类的)
    - 如果使用`.vuepress/public`里的资源则需要使用一些框架语法
    - 举例如下：`<img :src="$withBase('/foo.png')" alt="foo">`
-



## 导航跳转

> 此处的参考[链接](https://vuepress.vuejs.org/zh/guide/markdown.html#%E9%93%BE%E6%8E%A5)

每个文件夹中的`README.md`以及`index.md`会被当作一个默认网页，比如以下网页结构：

- ```
  .
  |- A
  |  |- README.md
  |- B
  |  |- README.md
  |  |- one.md
  ```

- 那么从`B/one.md`跳转到`A/READMD.md`可以直接写成如下格式：

    - `[描述](/A/)`
    - `[描述](/A/README.md)`
    - `[描述](../A/README.md)`
