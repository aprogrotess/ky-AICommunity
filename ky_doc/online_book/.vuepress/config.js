module.exports = {
    title: 'ky-online-book',
    description: 'online-book dev by 8-305',

    // 配置上侧栏以及左侧栏、底部栏信息
    themeConfig: {
        logo: '/onlinebook.png',

        // 上侧栏
        nav: [
            {
                text: '快捷跳转',
                items: [
                    { text: '主页', link: '/' },
                    { text: '软件开发', link: '/develop/' },
                    { text: '量化投资', link: '/trade/' },
                    { text: '机器人竞赛', link: '/robot/' },
                    { text: '常规资料', link: '/common/' }
                ]
            },
            {
                text: "Github",
                link: "https://github.com/aprogrotess/ky-AICommunity.git"
            }
        ],

        // 左侧栏
        displayAllHeaders: true,

        // 为不同的路由配置具体的显示信息
        sidebar: require('./route/index'),
        // sidebar: [
        //     {
        //         title: '软件开发',
        //         path: '/develop/',
        //         sidebarDepth: 2
        //     },
        //     {
        //         title: '量化投资',
        //         path: '/trade/',
        //         sidebarDepth: 2
        //     },
        //     {
        //         title: '机器人竞赛',
        //         path: '/robot/',
        //         sidebarDepth: 2
        //     },
        //     {
        //         title: '常规资料',
        //         path: '/common/',
        //         sidebarDepth: 2
        //     },
        //     {
        //         title: 'todo',
        //         path: '/todo/',
        //         sidebarDepth: 2
        //     }
        // ],

        lastUpdated: 'Last Updated'
    }


}
