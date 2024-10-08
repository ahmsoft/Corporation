(function(b,a){a(["./kendo.dataviz.chart","./kendo.drawing"],b);
})(function(){(function(){(function(a,E){var u=window.kendo,k=u.deepExtend,n=a.extend,t=u.isFunction,C=u.template,F=u.util,b=F.append,l=u.drawing,s=u.geometry,j=u.dataviz,h=u.drawing.Color,g=j.ChartElement,w=j.PieChartMixin,x=j.PlotAreaBase,y=j.PlotAreaFactory,z=j.Point2D,e=j.Box2D,A=j.SeriesBinder,D=j.TextBox,c=j.autoFormat,m=j.evalOptions,v=F.limitValue,B=j.seriesTotal;
var f="category",i="color",o="funnel",G="value",d="black",H="white";
var q=x.extend({render:function(){var I=this,J=I.series;
I.createFunnelChart(J);
},createFunnelChart:function(L){var K=this,I=L[0],J=new p(K,{series:L,legend:K.options.legend,neckRatio:I.neckRatio,dynamicHeight:I.dynamicHeight,dynamicSlope:I.dynamicSlope,segmentSpacing:I.segmentSpacing,highlight:I.highlight});
K.appendChart(J);
},appendChart:function(I,J){x.fn.appendChart.call(this,I,J);
b(this.options.legend.items,I.legendItems);
}});
var p=g.extend({init:function(K,J){var I=this;
g.fn.init.call(I,J);
I.plotArea=K;
I.points=[];
I.labels=[];
I.legendItems=[];
I.render();
},options:{neckRatio:0.3,width:300,dynamicSlope:false,dynamicHeight:true,segmentSpacing:0,labels:{visible:false,align:"center",position:"center"}},formatPointValue:function(J,I){return c(I,J.value);
},render:function(){var I=this,P=I.options,J=I.plotArea.options.seriesColors||[],K=J.length,S=P.series[0],Q,M,L=S.data;
if(!L){return;
}var T=B(S),U,N;
for(N=0;
N<L.length;
N++){Q=A.current.bindPoint(S,N);
U=Q.valueFields.value;
if(U===null||U===E){continue;
}M=Q.fields;
if(!t(S.color)){S.color=M.color||J[N%K];
}M=k({index:N,owner:I,series:S,category:M.category,dataItem:L[N],percentage:Math.abs(U)/T,visibleInLegend:M.visibleInLegend,visible:M.visible},M);
var R=I.createSegment(U,M);
var O=I.createLabel(U,M);
if(R&&O){R.append(O);
}}},evalSegmentOptions:function(J,L,I){var K=I.series;
m(J,{value:L,series:K,dataItem:I.dataItem,index:I.index},{defaults:K._defaults,excluded:["data","toggle","visual"]});
},createSegment:function(M,J){var I=this,K;
var L=k({},J.series);
I.evalSegmentOptions(L,M,J);
I.createLegendItem(M,L,J);
if(J.visible!==false){K=new r(M,L,J);
n(K,J);
I.append(K);
I.points.push(K);
return K;
}},createLabel:function(R,L){var J=this,O=L.series,K=L.dataItem,M=k({},J.options.labels,O.labels),P=R,Q;
if(M.visible){if(M.template){var N=C(M.template);
P=N({dataItem:K,value:R,percentage:L.percentage,category:L.category,series:O});
}else{if(M.format){P=c(M.format,P);
}}if(!M.color&&M.align==="center"){var I=new h(O.color).percBrightness();
if(I>180){M.color=d;
}else{M.color=H;
}}J.evalSegmentOptions(M,R,L);
Q=new D(P,k({vAlign:M.position},M));
J.labels.push(Q);
return Q;
}},labelPadding:function(){var L=this.labels,K,I,N,M={left:0,right:0},J;
for(J=0;
J<L.length;
J++){K=L[J];
I=K.options.align;
if(I!=="center"){N=L[J].box.width();
if(I==="left"){M.left=Math.max(M.left,N);
}else{M.right=Math.max(M.right,N);
}}}return M;
},reflow:function(K){var J=this,Y=J.options,ad=J.points,L=ad.length,M=Y.neckRatio<=1,R,Q,S,aa,Z,X,I=K.clone().unpad(J.labelPadding()),ah=I.width(),ab=0,ac=M?0:(ah-ah/Y.neckRatio)/2,ae=Y.segmentSpacing,N=Y.dynamicSlope,ag=I.height()-ae*(L-1),U=M?Y.neckRatio*ah:ah;
if(!L){return;
}if(N){var P=ad[0],T=P;
a.each(ad,function(ai,aj){if(aj.percentage>T.percentage){T=aj;
}});
S=(P.percentage/T.percentage)*ah;
ac=(ah-S)/2;
for(R=0;
R<L;
R++){Z=ad[R].percentage;
var W=ad[R+1],V=(W?W.percentage:Z);
aa=ad[R].points=[];
Q=(Y.dynamicHeight)?(ag*Z):(ag/L);
X=(ah-S*(V/Z))/2;
X=v(X,0,ah);
aa.push(new s.Point(I.x1+ac,I.y1+ab));
aa.push(new s.Point(I.x1+ah-ac,I.y1+ab));
aa.push(new s.Point(I.x1+ah-X,I.y1+Q+ab));
aa.push(new s.Point(I.x1+X,I.y1+Q+ab));
ac=X;
ab+=Q+ae;
S*=V/Z;
S=v(S,0,ah);
}}else{var af=M?ah:ah-ac*2,O=(af-U)/2;
for(R=0;
R<L;
R++){aa=ad[R].points=[];
Z=ad[R].percentage;
X=(Y.dynamicHeight)?(O*Z):(O/L);
Q=(Y.dynamicHeight)?(ag*Z):(ag/L);
aa.push(new s.Point(I.x1+ac,I.y1+ab));
aa.push(new s.Point(I.x1+ah-ac,I.y1+ab));
aa.push(new s.Point(I.x1+ah-ac-X,I.y1+Q+ab));
aa.push(new s.Point(I.x1+ac+X,I.y1+Q+ab));
ac+=X;
ab+=Q+ae;
}}for(R=0;
R<L;
R++){ad[R].reflow(K);
}}});
k(p.fn,w);
var r=g.extend({init:function(L,I,K){var J=this;
g.fn.init.call(J,I);
J.value=L;
J.options.index=K.index;
},options:{color:H,border:{width:1}},reflow:function(I){var L=this,K=L.points,J=L.children[0];
L.box=new e(K[0].x,K[0].y,K[1].x,K[2].y);
if(J){J.reflow(new e(I.x1,K[0].y,I.x2,K[2].y));
}},createVisual:function(){var J=this;
var I=J.options;
var K;
g.fn.createVisual.call(this);
if(I.visual){K=I.visual({category:J.category,dataItem:J.dataItem,value:J.value,series:J.series,percentage:J.percentage,points:J.points,options:I,createVisual:function(){return J.createPath();
}});
}else{K=J.createPath();
}if(K){this.visual.append(K);
}},createPath:function(){var J=this.options;
var I=J.border;
var K=l.Path.fromPoints(this.points,{fill:{color:J.color,opacity:J.opacity},stroke:{color:I.color,opacity:I.opacity,width:I.width}}).close();
return K;
},createHighlight:function(I){return l.Path.fromPoints(this.points,I);
},highlightVisual:function(){return this.visual.children[0];
},highlightVisualArgs:function(){var I=l.Path.fromPoints(this.points).close();
return{options:this.options,path:I};
},highlightOverlay:function(O,M){var N=this.options,L=N.highlight||{};
if(L.visible===false){return;
}var I=L.border||{};
var J=n({},M,{fill:L.color,stroke:I.color,strokeOpacity:I.opacity,strokeWidth:I.width,fillOpacity:L.opacity});
var K=O.createPolyline(this.points,true,J);
return K;
},tooltipAnchor:function(J){var I=this.box;
return new z(I.center().x-(J/2),I.y1);
},formatValue:function(I){var J=this;
return J.owner.formatPointValue(J,I);
}});
k(r.fn,j.PointEventsMixin);
y.current.register(q,[o]);
A.current.register([o],[G],[f,i,"visibleInLegend","visible"]);
k(j,{FunnelChart:p,FunnelSegment:r});
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});
