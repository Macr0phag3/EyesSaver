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
```
alert.sh
init.lua
start.sh
stop.sh
```
4. 将 `alert.sh` 加入 crontab：
`#*/1 * * * * bash saverpath/eyessaver/alert.sh >> saverpath/eyessaver/log 2>&1`
同样，需要注意修改这里的 `saverpath`。
5. 安心工作 🕶~