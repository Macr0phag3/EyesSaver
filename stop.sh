# 停止工作计时器，并记录休息起始时间点，开始休息计时器

### location
saverpath="eyessaver's path"
###

date +%s > $saverpath/lockedtimer
logtime=$(date +"%Y-%m-%d %H:%M:%S")
echo $logtime "检测到锁屏事件，暂停工作计时器，开始休息计时器" >> $saverpath/log
echo 1 > $saverpath/islocked


# 2019-04-02 18:35:20 bug 记录：
# mac 在长时间锁定之后进入休眠，再次唤醒的时候会出现先 lock 再 unlock 的事件，且时间较短
# 所以会导致 lockedtimer 不更新，那么就会反复提示是否休息
# 或许可以从 islocked 为 1 来下手，在 stop.sh 里加个条件

# 2019-04-02 22:27:58:
# ** 已迁移 api 事件的获取方式，以上 bug 待复现 **