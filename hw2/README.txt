1.先用mov將r0~r5初始化，在用mul兩兩相乘至r0 r5，在將r0 r5使用add相加即成。
2.編譯方法：arm-none-eabi-gcc -g -O3 --specs=nosys.specs hw2.s -o  hw2.exe ->因為不知名原因，必須加上 --specs=nosys.specs這個參數才能成功執行。
3.在linux 19.04中 gcc版本為9.1.0（但是arm-none-eabi.gcc 的gcc的版本是7.3.1，應該是arm-none-eabi-gcc的gcc版本是它安裝時自帶的，跟原本系統的gcc版本無關），重灌編譯環境及重新設定PATH在加上--specs=nosys.specs此指令才成功編譯。
4.使用arm-none-eabi-insight hw2.exe執行，選擇hw2.s，先固定在開始的第一行，接下來一路執行下去，最後檢查r0是否為我要的數字，但是若需要執行exe檔案，還是必須安裝wine才能執行

