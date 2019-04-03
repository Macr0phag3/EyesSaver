set -o errexit

echo "> 输入 EyesSaver 的文件路径：\n(如：/home/macr0phag3/EyesSaver/ 那么你需要输入 /home/macr0phag3/EyesSaver/)\n> \c"
read saverpath
echo "确定路径是 $saverpath ? [y]/n\n> \c"
read answer
if [[ $answer == 'n' ]]; then
    echo "已取消安装"
    exit 1
fi

echo "> 执行 crontab -e, 并将以下命令插入"
echo "*/1 * * * * bash $saverpath/alert.sh >> $saverpath/log 2>&1"

echo "> 完成? [y]/n\n> \c"
read answer
if [[ $answer == 'n' ]]; then
    echo "> 已取消安装"
    exit 1
fi

echo "> 配置 crontab: 完成\n"

# ----------
changepath=(
    "alert.sh"
    "init.lua"
    "start.sh"
    "stop.sh"
)

for filename in ${changepath[@]}; do
    sed -i '' "s\$eyessaver's path\$$saverpath\$" $filename
done

echo "> 替换完成路径: 完成\n"
# ----------

date +%s > $saverpath/resttimer

echo "> 初始化工作时间: 完成\n"
# ----------

ln init.lua ~/.hammerspoon/
echo "> 初始化 HammerSpoon 脚本: 完成\n"
# ----------





