if(!settings.multipleView) settings.batchView=false;
defaultfilename="review_markov-2";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(2inches);

real myfontsize = 12; real mylineskip = 1.2*myfontsize;
pen mypen = fontsize(myfontsize, mylineskip); defaultpen
(mypen);

dot("\( E \)", (0,2), N); dot("\( A \)", (0,1), W); dot("\(
C \)", (0,0), S); dot("\( B \)", (1,1), E); dot("\( D \)",
(1,0), S); dot("\( F \)", (2,0), E);

draw((0,2)--(0,0)--(2,0)); draw((0,1)--(1,1)--(1,0));
