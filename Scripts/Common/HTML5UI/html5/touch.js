(function(b,a){a(["./kendo.core","./kendo.userevents"],b);
})(function(){(function(){(function(a,g){var c=window.kendo,h=c.ui.Widget,e=a.proxy,b=Math.abs,d=20;
var f=h.extend({init:function(i,l){var m=this;
h.fn.init.call(m,i,l);
l=m.options;
i=m.element;
m.wrapper=i;
function j(n){return function(o){m._triggerTouch(n,o);
};
}function k(n){return function(o){m.trigger(n,{touches:o.touches,distance:o.distance,center:o.center,event:o.event});
};
}m.events=new c.UserEvents(i,{filter:l.filter,surface:l.surface,minHold:l.minHold,multiTouch:l.multiTouch,allowSelection:true,press:j("touchstart"),hold:j("hold"),tap:e(m,"_tap"),gesturestart:k("gesturestart"),gesturechange:k("gesturechange"),gestureend:k("gestureend")});
if(l.enableSwipe){m.events.bind("start",e(m,"_swipestart"));
m.events.bind("move",e(m,"_swipemove"));
}else{m.events.bind("start",e(m,"_dragstart"));
m.events.bind("move",j("drag"));
m.events.bind("end",j("dragend"));
}c.notify(m);
},events:["touchstart","dragstart","drag","dragend","tap","doubletap","hold","swipe","gesturestart","gesturechange","gestureend"],options:{name:"Touch",surface:null,global:false,multiTouch:false,enableSwipe:false,minXDelta:30,maxYDelta:20,maxDuration:1000,minHold:800,doubleTapTimeout:800},cancel:function(){this.events.cancel();
},_triggerTouch:function(j,i){if(this.trigger(j,{touch:i.touch,event:i.event})){i.preventDefault();
}},_tap:function(i){var k=this,j=k.lastTap,l=i.touch;
if(j&&(l.endTime-j.endTime<k.options.doubleTapTimeout)&&c.touchDelta(l,j).distance<d){k._triggerTouch("doubletap",i);
k.lastTap=null;
}else{k._triggerTouch("tap",i);
k.lastTap=l;
}},_dragstart:function(i){this._triggerTouch("dragstart",i);
},_swipestart:function(i){if(b(i.x.velocity)*2>=b(i.y.velocity)){i.sender.capture();
}},_swipemove:function(k){var m=this,l=m.options,n=k.touch,j=k.event.timeStamp-n.startTime,i=n.x.initialDelta>0?"right":"left";
if(b(n.x.initialDelta)>=l.minXDelta&&b(n.y.initialDelta)<l.maxYDelta&&j<l.maxDuration){m.trigger("swipe",{direction:i,touch:k.touch});
n.cancel();
}}});
c.ui.plugin(f);
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});