# EyesSaver
## 它的特点有哪些？
1. 你可以认为它是一个番茄钟
2. 无界面，只利用通知来提醒
3. **自启动**
4. 出现息屏事件的时候视为休息。息屏事件包括：锁屏、睡眠等等

## 为什么要做它？
市面上的番茄钟都没有自启动的功能，对于经常用电脑的我来说，常常看到眼睛酸涩才想起要休息了。而 EyesSaver 在亮屏的时候自动进入工作计时，就不怕忘记启动番茄钟了。并且息屏事件超过 5 分钟视为休息，解锁唤醒后重新开始工作计时。

## 如何使用它？
1. 安装 alerter：https://github.com/vjeantet/alerter
2. 安装 hammerspoon：http://www.hammerspoon.org/
3. 由于每个人放置 EyesSaver 的位置不同，你需要修改以下脚本中的 `saverpath`：
    - alert.sh
    - init.lua
    - start.sh
    - stop.sh
3. 初始化配置：`date +%s > saverpath/resttimer`。注意修改这里的 `saverpath`
4. 将 `alert.sh` 加入 crontab：
```
*/1 * * * * bash saverpath/eyessaver/alert.sh >> saverpath/eyessaver/log 2>&1
```
同样，需要注意修改这里的 `saverpath`

5. 安心工作去吧 🕶~

## 它长啥样？
日志：
```
2019-04-02 21:40:21 检测到锁屏事件，暂停工作计时器，开始休息计时器
2019-04-02 21:40:23 检测到解锁事件，休息时长 2 秒，视为临时打断工作，不重置工作计时器
2019-04-02 21:47:31 检测到锁屏事件，暂停工作计时器，开始休息计时器
2019-04-02 22:12:59 检测到解锁事件，休息时长 25.0 分钟，休息结束，开始工作，重置工作计时器
```


通知：
















