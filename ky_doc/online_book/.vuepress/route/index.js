/**
 * vuepress提供的左侧栏内容配置方式，无法在yaml中重载，
 * 所以采用针对路由提供左侧栏内容的方式
 * 此处的内容就是用于存储哪个路由需要展示具体的目录
 */

module.exports = {
    '/develop/web': require("./sub/webRoute"),
    '/develop/ai': require('./sub/aiRoute'),
    '/common/cmake': require('./sub/cmakeRoute'),
    '/': require('./sub/mainRoute')
}


