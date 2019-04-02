# 将定时器设置为当前时间

### location
saverpath="eyessaver's path"
###

rawtime=$(cat $saverpath/eyessaver/lockedtimer)
delta=$[$(date +%s)-$rawtime]
logtime=$(date +"%Y-%m-%d %H:%M:%S")

thetime=$delta
unit="秒"
if [[ $delta -gt 60 ]]; then
    unit="分钟"
    thetime=`echo $(($delta/60))|awk '{printf("%.1f", $1)}'`
fi

if [ "$delta" -ge $[3*60] ];then # 锁屏超过 3 分钟，说明是在休息，否则视为临时有事
    # 休息结束，重置工作计时器
    date +%s > $saverpath/eyessaver/resttimer
    echo $logtime "检测到解锁事件，休息时长 $thetime $unit""，休息结束，开始工作，重置工作计时器" >> $saverpath/eyessaver/log
else
    echo $logtime "检测到解锁事件，休息时长 $thetime $unit""，视为临时打断工作，不重置工作计时器" >> $saverpath/eyessaver/log
fi

echo 0 > $saverpath/eyessaver/islocked 

