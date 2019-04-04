# 将定时器设置为当前时间

### location
saverpath="eyessaver's path"
###

rawtime=$(cat $saverpath/lockedtimer)
delta=$[$(date +%s)-$rawtime]
logtime=$(date +"%Y-%m-%d %H:%M:%S")

thetime=$delta
unit="秒"
if [[ $delta -gt 60 ]]; then
    unit="分钟"
    thetime=`echo $(($delta/60))|awk '{printf("%.1f", $1)}'`
fi

if [ "$delta" -ge $[10] ];then # 锁屏超过 3 分钟，说明是在休息，否则视为临时有事

    # 停止 sleep，弹出工作提醒
    isrested=$(ps -ef|grep "sleep [0-9]*eyesaver")
    if [ -n "$isrested" ]; then 
        result=$(/usr/local/bin/alerter -title "护眼助手🕶" -message "要提前结束休息吗? 🤔" -timeout 10s -actions "不用 😒" -closeLabel "好的 ☺️")
        if [ "$result" == '好的 ☺️' ]; then
            echo $logtime "提前结束休息" >> $saverpath/log
            ps -ef|grep "sleep [0-9]*eyesaver"| awk '{print $2}'| xargs kill -9
            # 休息结束，重置工作计时器
            date +%s > $saverpath/resttimer
        fi

    else
        date +%s > $saverpath/resttimer
        echo $logtime "检测到解锁事件，休息时长 $thetime $unit""，休息结束，开始工作，重置工作计时器" >> $saverpath/log
    fi
else
    echo $logtime "检测到解锁事件，休息时长 $thetime $unit""，视为临时打断工作，不重置工作计时器" >> $saverpath/log
fi

echo 0 > $saverpath/islocked 
