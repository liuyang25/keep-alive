
-- 循环执行
repeat
    -- 获取当前时间的小时
    set currentHour to hours of (current date)
    set appName to "app name" -- 目标app名字
    if currentHour is greater than or equal to 18 then
        exit repeat -- 如果当前时间晚于等于 18 点，则退出循环
    end if

    -- 检查 app 是否存在
    set isTargetAppRunning to false
    tell application "System Events" to set isTargetAppRunning to (name of processes) contains appName

    -- 获取当前活动窗口的信息
    set currentApp to (path to frontmost application as Unicode text)
    -- log currentApp 
    
    if isTargetAppRunning and (currentApp does not contain appName) then
        tell application appName
            activate
        end tell

        tell application "System Events"
            -- keystroke "a" using {command down} -- 发送 Command+a 键盘事件
            keystroke space
        end tell
        
        tell application currentApp
            activate
        end tell
    end if
    
    -- delay (10 * 60) -- 等待 10 分钟
    delay (50)
end repeat
