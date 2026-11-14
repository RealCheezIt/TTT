I64 board[9];
I64 player = 1;
I64 w =  0;

U0 DrawIt(CTask *task, CDC *dc) {
I64 i, x, y, cx, cy;

dc -> color = BLACK;
dc -> thick = 3;
GrLine3(dc, 170, 190, 0, 470, 190,0);
GrLine3(dc, 170, 290, 0, 470, 290, 0);
GrLine3(dc, 270, 90, 0, 270, 390, 0);
GrLine3(dc, 370, 90, 0, 370, 390, 0);


for (i=0; i<9; i++){
cx = 220 + (i%3)*100;
cy = 140 + (i/3) * 100;
if (board[i] == 1) {
dc->color = LTCYAN;
dc-> thick = 4;
GrCircle3)(dc, cx, cy, 0, 35);
}
else if (board[i] == 2){
dc->color=LTRED;
dc->thick = 4;
GrLine3(dc, cx-30, cy-30, 0, cx+30, cy+30, 0);
GrLine3(dc, cx+30, cy-30, 0, cx-30, cy+30, 0);
}
}
dc->color = LTRED;
if (w == 1)
GrPrint(dc,220,40,"Player O wins, (ESC to Exit)");
else if (w == 2)
GrPrint(dc,220,40,"Player X wins, (ESC to Exit)");
else if (w == 3)
GrPrint(dc, 250,40, "Draw, (ESC to Exit)");
else if  (player == 1)
GrPrint(dc, 230,40, "Turn: Player O, *Click the Grid*");
else 
GrPrint(dc, 230, 40, "Turn: Player X, *Click the Grid*");

}

I64 CheckWin(){
I64 i;
for (i =0; i<9; i+=3)
if (board[i] && board[i] == board [i+1] && board [i+1]==board[i+2]) return board[i];
for (i=0; i<3;i++)
if (board[i] && board[i] == board[i+3] && board[i+3]==board[i+6]) return board[i];
if (board[0] && board[0] == board[4] && board[4] == board[8]) return board[0];
if (board[2] && board[2] == board[4] && board[4] == board[6]) return board[2];
return 0;


}

U0 TTT(){
I64 i, mx, my, col,row, idx, turn = 0 
Bool clicked = FALSE;

for (i = 0; i <9; i++) board[i]=0;
SettingsPush;
WinMax;
DocClear;
Fs->draw_it = &DrawIt;
while (TRUE){
if (ScanKey (, TRUE) == SC_ESC) break;

if (ms.lb && ! clicked && w == 0){
mx = ms.pos.x - Fs->pix_left;
my = ms.pos.y - Fs->pix_top;
if(mx>= 170 && mx < 470 && my >= 90 && my <390){
col = (mx - 170)/ 100;
row = (my - 90)/100;
idx = row * 3 +col;
if (board[idx] ==0){
board[idx] = player;
if(player == 1) Snd(60); else Snd(50);
Sleep(50);
Snd;
turn++;
w = CheckWin;
if(w == 1 || w == 2){
Snd(60); Sleep(80);
Snd(64); Sleep(80);
Snd(67); Sleep(150);
Snd;
}
if(w==0 && turn == 9) w = 3;
if(player == 1) player = 2; else player =1;
}
}
}

if (!ms.lb)
clicked = FALSE;

Refresh;
}

SettingsPop;
DocClear;
}

TTT;
