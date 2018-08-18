GITEA=/var/lib/gitea/custom

mkdir -p $GITEA/public/img

# 1 替换默认用户头像为灰色 Android 头像
cp -f gitapk-default-avatar.png $GITEA/public/img/avatar_default.png

# 2 渲染生成将会在 apks/ 下呈现，由 WebHooks 驱动 Gekyll 在本机渲染并部署到本地
# Please use custom HTTP WebHook listener

# 3 添加三个额外链接，分别指向应用树渲染生成视图、关于、Telegram 频道
mkdir -p $GITEA/templates/custom/
cp -f extra_links.tmpl $GITEA/templates/custom/
mkdir -p $GITEA/public/about/
cp -f about.html $GITEA/public/about/index.html

# 4 让 header 默认呈现绿色
cp -f head.tmpl $GITEA/templates/base

# 5 替换主页
mkdir -p $GITEA/templates
cp -f home.tmpl $GITEA/templates/

# 6 提供 GeekApk 用户信息和包树预览额外 tab
# WIP

# 7 将 Gitea 默认图标替换为 Android 版的 Gitea 图标
cp -f gitapk-sm.png $GITEA/public/img

unset GITEA
