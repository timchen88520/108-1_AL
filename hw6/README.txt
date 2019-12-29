程式：
先寫出一個c檔，因為習慣的關西我先引入stdio srdlib的函式庫，接下來這main檔裡面先將3x3的kernel初始化成都是1的陣列，inputu也是3x3的全部1的陣列（因為我忘記如何在GDB中輸入值了，如果需要指定input大小，直接把scanf那行解除註解即可），且因為作業五已經做出符合APCS的conv.s了，所以這邊直接使用上次的作業，kernel,input,colum,row會貝當成參數輸入至conv.s，分別對應在r0~r3，最後會將outout的第一個位址的值傳回給r0並且回傳。


編譯： 
arm-none-eabi-gcc -O0 -g --specs=nosys.specs hw6_test.c conv.s -o hw6.exe
arm-none-eabi-insight hw6.exe
因為電腦環境問題必須加上 --specs=nosys.specs這個參數，若會出現錯誤訊息請刪除此參數在試試，並且編譯完直接開啟insight執行除錯，

執行：
開啟insight後，run後在console的地方觀看最後結果。


