# EyesSaver
## 它的特点有哪些？
1. 你可以认为它是一个番茄钟
2. 无界面，只利用通知来提醒。提醒休息的时候，如果没有理它，它会自动延迟休息。你也可以指定延迟一段时间
3. **自启动**
4. 出现息屏事件的时候视为休息。息屏事件包括：锁屏、睡眠等等。结束息屏事件的时候会提醒是否要提前结束休息。
5. **目前只支持 MacOS**

## 为什么要做它？
市面上的番茄钟都没有自启动的功能，对于经常用电脑的我来说，常常看到眼睛酸涩才想起要休息了。而 EyesSaver 在亮屏的时候自动进入工作计时，就不怕忘记启动番茄钟了。并且息屏事件超过 5 分钟视为休息，解锁唤醒后重新开始工作计时。

## 如何使用它？
### 自动配置
1. 安装 alerter：https://github.com/vjeantet/alerter
2. 安装 hammerspoon：http://www.hammerspoon.org/ ，并确保配置如下：
![](https://github.com/Macr0phag3/EyesSaver/blob/master/pics/hammer.png)
3. 执行 `chmod +x install.sh`，然后运行 `./install.sh`
4. 根据提示进行配置：
```
» ./install.sh
> 输入 EyesSaver 的文件路径：
(如：/home/macr0phag3/EyesSaver/ 那么你需要输入 /home/macr0phag3/EyesSaver/)
> /Users/macr0phag3/Tr0y/.scripts/EyesSaver
确定路径是 /Users/macr0phag3/Tr0y/.scripts/EyesSaver ? [y]/n
> y
> 执行 crontab -e, 并将以下命令插入
*/1 * * * * bash /Users/macr0phag3/Tr0y/.scripts/EyesSaver/alert.sh >> /Users/macr0phag3/Tr0y/.scripts/EyesSaver/log 2>&1
> 完成? [y]/n
> y
> 配置 crontab: 完成

> 替换完成路径: 完成

> 初始化工作时间: 完成

> 初始化 HammerSpoon 脚本: 完成

> 记得启动一下 hammerspoon
```

5. 启动 hammerspoon

### 手动配置
1. 安装 alerter：https://github.com/vjeantet/alerter
2. 安装 hammerspoon：http://www.hammerspoon.org/ ，并确保配置如下：
![](https://github.com/Macr0phag3/EyesSaver/blob/master/pics/hammer.png)

3. 由于每个人放置 EyesSaver 的位置不同，你需要修改以下脚本中的 `saverpath`：
    - alert.sh
    - init.lua
    - start.sh
    - stop.sh
4. 初始化配置：`date +%s > saverpath/eyessaver/resttimer`。注意修改这里的 `saverpath`
5. 将 `alert.sh` 加入 crontab：
```
*/1 * * * * bash saverpath/eyessaver/alert.sh >> saverpath/eyessaver/log 2>&1
```
同样，需要注意修改这里的 `saverpath`

6. 将 `init.lua` 链接到 hammerspoon 指定的目录：`ln init.lua ~/.hammerspoon/`
7. 启动 hammerspoon
8. 安心工作去吧 🕶~

## 它长啥样？
日志：
```
2019-04-02 21:40:21 检测到锁屏事件，暂停工作计时器，开始休息计时器
2019-04-02 21:40:23 检测到解锁事件，休息时长 2 秒，视为临时打断工作，不重置工作计时器
2019-04-02 21:47:31 检测到锁屏事件，暂停工作计时器，开始休息计时器
2019-04-02 22:12:59 检测到解锁事件，休息时长 25.0 分钟，休息结束，开始工作，重置工作计时器
```


通知：

![](https://github.com/Macr0phag3/EyesSaver/blob/master/pics/rest.png)

![](https://github.com/Macr0phag3/EyesSaver/blob/master/pics/postpone.png)

![](https://github.com/Macr0phag3/EyesSaver/blob/master/pics/cancel.png)


## 自定义
`alert.sh` 中的 `自定义` 或许是你想要的


## 不一定会 DO 的 TODO
- [ ] install 脚本，直接配置路径













