if(!settings.multipleView) settings.batchView=false;
defaultfilename="review_markov-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(5inches);

real myfontsize = 12; real mylineskip = 1.2*myfontsize; pen
mypen = fontsize(myfontsize, mylineskip); defaultpen(mypen);

real r = 0.10;

path cR0 = circle( (0,1), r); pair cR0a = relpoint(cR0, 0);
draw(cR0); label("R", (0,1));

path cR1 = circle( (1,1), r); pair cR1a = relpoint(cR1, 0);
pair cR1z = relpoint(cR1, 0.5); draw(cR1); label("R", (1, 1));
path cN1 = circle( (1,0), r); pair cN1a = relpoint(cN1, 0);
pair cN1z = relpoint(cN1, 0.5); draw(cN1); label("N", (1, 0));
path cS1 = circle( (1,-1), r); pair cS1a = relpoint(cS1, 0);
pair cS1z = relpoint(cS1, 0.5); draw(cS1); label("S", (1, -1));

draw("\( 1/2 \)", cR0a -- cR1z, Arrow); draw("\( 1/4 \)",
cR0a -- cN1z, Arrow); draw("\( 1/4 \)", cR0a -- cS1z, Arrow);

path cN2 = circle( (2,0), r); pair cN2z = relpoint(cN2, 0.5);
draw(cN2); label("N", (2,0));

draw("1/4", cR1a -- cN2z, Arrow); draw("0", cN1a -- cN2z,
Arrow); draw("1/4", cS1a -- cN2z, Arrow);
