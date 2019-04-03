# Powered by
#  _____      ___
# |_   _| __ / _ \ _   _
#   | || '__| | | | | | |
#   | || |  | |_| | |_| |
#   |_||_|   \___/ \__, |
#                  |___/
#
# 利用通知来提醒休息


### 自定义
worktime=45 # 工作时间(分)
resttime=10 # 默认休息时间(分)
postpone=10 # 推迟时间(分)

### location
saverpath="eyessaver's path"
### 


rawtime=$(cat $saverpath/eyessaver/resttimer)
delta=$[$(date +%s)-$rawtime]
islocked=$(cat $saverpath/eyessaver/islocked)
logtime=$(date +"%Y-%m-%d %H:%M:%S")

if [ "$islocked" == 0 ];then # 未锁定
    if [ "$delta" -ge $[$worktime*60] ];then
        result=$(/usr/local/bin/alerter -title "护眼助手🕶" -message "眼睛累了吗? 歇会吧 🤔" -timeout 10s -actions "我在忙呢 😒" -closeLabel "好的 ☺️")
        logtime=$(date +"%Y-%m-%d %H:%M:%S")
        if [ "$result" == '好的 ☺️' ]; then
            echo $logtime "开始休息 $resttime 分钟"
            newtimer=$[$rawtime+($resttime+$worktime)*60]
            echo $newtimer > $saverpath/eyessaver/resttimer
            
            # 启动屏保
            open -a ScreenSaverEngine
            blackhole=$(sleep $[$resttime*60]"eyesaver") # 特殊标记，方便 kill 定位；利用变量屏蔽 kill 事件的输出
            /usr/local/bin/alerter -title "护眼助手🕶" -message "休息结束，干活去咯 👊" > /dev/null
        else
            # 推迟休息
            result=$(/usr/local/bin/alerter -title "护眼助手🕶" -message "那推迟 $postpone 分钟? 👀" -timeout 10s -actions "不用 😒","推迟 5 分钟 🌕","推迟 10 分钟 🌗","推迟 15 分钟 🌘","推迟 30 分钟 🌚" -dropdownLabel "其他时长" -closeLabel "好的 ☺️")
            logtime=$(date +"%Y-%m-%d %H:%M:%S")
            if [[ "$result" == '好的 ☺️' ]] || [[ "$result" ==  '@TIMEOUT' ]]; then
                echo $logtime "本轮休息已推迟 $postpone 分钟"
                newtimer=$[$rawtime+$postpone*60]

            elif  [ "$result" == '推迟 5 分钟 🌕' ]; then 
                echo $logtime "本轮休息已推迟 5 分钟"
                newtimer=$[$rawtime+5*60]

            elif  [ "$result" == '推迟 10 分钟 🌗' ]; then 
                echo $logtime "本轮休息已推迟 10 分钟"
                newtimer=$[$rawtime+10*60]

            elif  [ "$result" == '推迟 15 分钟 🌘' ]; then 
                echo $logtime "本轮休息已推迟 15 分钟"
                newtimer=$[$rawtime+15*60]

            elif  [ "$result" == '推迟 30 分钟 🌚' ]; then 
                echo $logtime "本轮休息已推迟 30 分钟"
                newtimer=$[$rawtime+30*60]

            else
                echo $logtime "已取消本轮休息"
                newtimer=$[$rawtime+$worktime*60]
            fi

            echo $newtimer > $saverpath/eyessaver/resttimer
            
        fi

        
    else
        unit="秒"

        if [ "$delta" -ge 0 ];then # 大于 0 说明在工作状态
            delta=$[$worktime*60-$delta]
            tip="工作" 
        else
            delta=$[0-$delta]
            tip="休息"
        fi

        if [[ $delta -gt 60 ]]; then
            unit="分钟"
            delta=`echo $(($delta/60))|awk '{printf("%.1f", $1)}'`
        fi
        
        echo $logtime $tip"倒计时: $delta $unit"

    fi
else
    echo $logtime "已启动屏保，休息中"
fi




