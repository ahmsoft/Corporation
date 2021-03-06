(function(a,b,h){if(!b.RadTab.Views){b.RadTab.Views={};
}b.RadTab.Views.Lite=function(i){this._owner=i;
};
b.RadTab.Views.Lite.prototype={_renderTab:function(i){var j=this._owner;
i[i.length]="<li class='";
i[i.length]=j._getElementCssClass();
if(j.get_tabStrip().get_enableAriaSupport()){i[i.length]="' role='tab' aria-level='"+j.get_level()+"' >";
}else{i[i.length]="'>";
}if(j.get_navigateUrl()){j._renderLink(i);
}else{this._renderSpan(i);
}i[i.length]="</li>";
},_renderSpan:function(i){var j=this._owner;
i[i.length]="<span class='";
i[i.length]=j._getLinkCssClass();
i[i.length]="'>";
this._renderContent(i);
i[i.length]="</span>";
},_renderContent:function(i){this._owner._renderInnerContent(i);
},_replaceSpanElement:function(k){var j=this._owner.get_linkElement(),i=a("<a href='"+k+"' class='"+j.className+"'></a>");
this._replaceElement(i);
},_replaceLinkElement:function(){var j=this._owner.get_linkElement(),i=a("<span class='"+j.className+"' tabindex='"+j.tabIndex+"'></span>");
this._replaceElement(i);
},_replaceElement:function(i){var k=this._owner;
var j=a(k.get_linkElement());
i.html(j.html());
i.attr("accesskey",j.attr("accesskey"));
j.replaceWith(i);
k._linkElement=i.get(0);
},_setHighlight:function(j){var k=this._owner;
var i=a(k.get_element());
i.toggleClass("rtsHovered",j);
if(k.get_hoveredCssClass()){i.toggleClass(k.get_hoveredCssClass(),j);
}},_getElementCssClass:function(){var j=this._owner;
var i=["rtsLI"];
i=i.concat(j._determineStateCssClass());
if(a(j.get_element()).hasClass("rtsFocused")){i[i.length]="rtsFocused";
}if(j.get_outerCssClass()){i[i.length]=j.get_outerCssClass();
}return i;
},_getLinkCssClass:function(){var k=this._owner;
var i=["rtsLink"];
var j=k.get_linkElement()?k.get_linkElement().className:"";
if(j.search("rtsClicked")!=-1){i[i.length]="rtsClicked";
}return i;
},scrollIntoView:function(){var j=this._owner;
var i=j.get_parent();
if(i&&i._scroller){i._scroller._scrollTabIntoView(j);
}},scrollIntoViewWhenNeeded:function(){this.scrollIntoView();
},get_outerWrapElement:function(){return this._owner.get_linkElement();
},get_innerWrapElement:function(){return this._owner.get_linkElement();
},set_navigateUrl:function(k){var j=this._owner;
var i=j.get_linkElement();
if(!i){return;
}if(k&&k!=="#"){if(i.nodeName==="A"){i.href=k;
}else{this._replaceSpanElement(k);
}}else{this._replaceLinkElement();
}},select:function(){var i=function(k){if(k.get_tabs().get_count()>0){a(k.get_levelElement()).removeClass("rtsHidden");
}var j=k.get_selectedTab();
if(j){i(j);
}};
i(this._owner);
},unselect:function(){var i=function(k){a(k.get_levelElement()).addClass("rtsHidden");
var j=k.get_selectedTab();
if(j){i(j);
}};
i(this._owner);
}};
if(!b.RadTabStrip.Views){b.RadTabStrip.Views={};
}b.RadTabStrip.Views.Lite=function(i){this._tabstrip=i;
};
b.RadTabStrip.Views.Lite.prototype={_click:function(i){if(i.get_isEnabled()){i.scrollIntoViewWhenNeeded();
}},_initScrolling:function(){var k=this._tabstrip;
var j=k;
var i;
while(j){i=j._scroller;
if(k._tabContainerRequiresScrolling(j)){if(i){k._updateScroller(j);
}else{k._initScrollingForTabContainer(j);
}}else{if(i){i.dispose();
}}j=j.get_selectedTab();
}},_initScrollingForTabContainer:function(i){i._scroller=new b.TabScroller(i);
i._scroller.initialize();
},_updateScroller:function(k){var j=k._scroller;
var i=j._scrolledElement[j._scrollSizeField]-j._scrolledElement[j._offsetSizeField];
j.setScrollingLimits(0,i);
}};
var f="rtsScroll";
var e="rtsDisabled";
var d=["rtsButtonsStart","rtsButtonsMiddle","rtsButtonsEnd"];
var c=Telerik.Web.Browser;
var g=function(i,j,k){if(k!==h){if(j&&c.webkit){i.scrollLeft=i.scrollWidth-i.clientWidth-k;
}else{if(j&&c.ff){i.scrollLeft=-k;
}else{i.scrollLeft=k;
}}}else{if(j&&c.webkit){return i.scrollWidth-i.clientWidth-i.scrollLeft;
}else{return Math.abs(i.scrollLeft);
}}};
b.TabScroller=function(i){this._owner=i;
this._tabStrip=this._owner.get_tabStrip?this._owner.get_tabStrip():this._owner;
this._levelElement=i.get_levelElement();
this._isRtl=this._tabStrip._rightToLeft;
this._sizeProperty="width";
this._scrollSizeField="scrollWidth";
this._offsetField="offsetLeft";
this._offsetSizeField="clientWidth";
this._disabled=!(this._tabStrip.get_enabled()&&this._owner.get_enabled());
if(this._tabStrip._isVertical){this._sizeProperty="height";
this._scrollSizeField="scrollHeight";
this._offsetField="offsetTop";
this._offsetSizeField="clientHeight";
}b.TabScroller.initializeBase(this,[i.get_childListElement(),this._levelElement,this._tabStrip._isVertical?b.ScrollerOrientation.Vertical:b.ScrollerOrientation.Horizontal]);
};
b.TabScroller.prototype={initialize:function(){var k=this;
var i=this._owner._perTabScrolling?this._scrollTab:this._scroll;
var j=function(){if(k._orientation==b.ScrollerOrientation.Vertical){k._currentPosition=k._scrolledElement.scrollTop;
}else{k._currentPosition=g(k._scrolledElement,k._isRtl);
}k._updateArrows();
k._owner._getControl()._updateScrollState(k._owner,k._currentPosition);
};
this._toggleMargin(true);
this._nextArrow=this._createArrow("rtsNextArrow");
this._previousArrow=this._createArrow("rtsPrevArrow");
a(this._levelElement).addClass(f+" "+d[this._tabStrip._scrollButtonsPosition]).append(this._nextArrow).append(this._previousArrow).onEvent("up",".rtsNextArrow, .rtsPrevArrow",a.proxy(this._stopScroll,this)).onEvent("down",".rtsNextArrow:not('.rtsDisabled'), .rtsPrevArrow:not('.rtsDisabled')",a.proxy(i,this));
a(this._scrolledElement).on("scroll",function(l){if(k._disabled){l.preventDefault();
return;
}clearTimeout(k.scrollTimeout);
k.scrollTimeout=setTimeout(function(){j();
},300);
});
b.TabScroller.callBaseMethod(this,"initialize");
this._positionChangedDelegate=Function.createDelegate(this,this._updateArrows);
this.add_positionChanged(this._positionChangedDelegate);
this.setScrollingLimits(0,this._scrolledElement[this._scrollSizeField]-this._scrolledElement[this._offsetSizeField]);
this._scrollTo(Math.abs(this._tabStrip._scrollPosition));
},dispose:function(){b.TabScroller.callBaseMethod(this,"dispose");
a(this._scrolledElement).off("scroll");
a(this._levelElement).removeClass(f+" "+d[this._tabStrip._scrollButtonsPosition]).offEvent("up").offEvent("down");
this._toggleMargin(false);
this._positionChangedDelegate=null;
this._nextArrow.remove();
this._nextArrow=null;
this._previousArrow.remove();
this._previousArrow=null;
this._levelElement=null;
this._scrolledElement=null;
this._owner._scroller=null;
},isAtMinPosition:function(i){if(!i){return this._currentPosition<=this._minPosition;
}else{return i<=this._minPosition;
}},isAtMaxPosition:function(i){if(!i){return this._currentPosition>=this._maxPosition;
}else{return i>=this._maxPosition;
}},_toggleMargin:function(l){var i="marginBottom";
var k=$telerik.getMarginBox(this._scrolledElement);
var j=k.vertical;
if(this._orientation==b.ScrollerOrientation.Vertical){i="marginRight";
j=k.right;
if(this._tabStrip._rightToLeft){i="marginLeft";
j=k.left;
}}if(l){j-=c.scrollBarWidth;
}else{j+=c.scrollBarWidth;
}a(this._scrolledElement).css(i,j);
},_createArrow:function(i){return a("<span>").addClass(i);
},_updateArrows:function(){this._previousArrow.toggleClass(e,this.isAtMinPosition()||this._disabled);
this._nextArrow.toggleClass(e,this.isAtMaxPosition()||this._disabled);
},_scroll:function(j){var i=a(j.target).is(".rtsNextArrow")?1:-1;
this.startScroll(b.ScrollerSpeed.Fast,i);
},_scrollTab:function(i){var o=this;
var k=1;
var p=this._currentPosition+this._scrolledElement[this._offsetSizeField];
var l;
var n=this._owner.get_tabs().toArray();
var j;
var m=0;
if(a(i.target).is(".rtsNextArrow")){p+=k;
a.each(n,function(q,r){if($telerik.isIE8){m+=parseFloat(a(r.get_element()).css(o._sizeProperty));
}else{m+=parseFloat($telerik.getComputedStyle(r.get_element(),o._sizeProperty));
}return Math.floor(m)<=p;
});
j=m-this._scrolledElement[this._offsetSizeField];
}else{l=this._scrolledElement[this._scrollSizeField]+k;
a.each(n.reverse(),function(q,r){if($telerik.isIE8){m+=parseFloat(a(r.get_element()).css(o._sizeProperty));
}else{m+=parseFloat($telerik.getComputedStyle(r.get_element(),o._sizeProperty));
}return p<=(l-Math.floor(m));
});
j=l-(m+this._scrolledElement[this._offsetSizeField]);
}j=Math.round(Math.max(j,this._minPosition));
j=Math.round(Math.min(j,this._maxPosition));
this._scrollTo(j);
},_scrollTabIntoView:function(l){var m=this;
var k;
var i=function(){var r=m._currentPosition+m._scrolledElement[m._offsetSizeField];
var n=l.get_element();
var p=n[m._offsetField];
var o=p+n[m._offsetSizeField];
var q=m._currentPosition;
if(o>r){q+=o-r;
}else{q=Math.min(m._currentPosition,p);
}return q;
};
var j=function(){var n=l.get_element();
var p=n.offsetLeft;
var q=n.offsetWidth;
var o=m._currentPosition;
var r=m._scrolledElement[m._offsetSizeField];
var s=Math.abs(m._currentPosition-r);
if(p<0){if(o+p+q>r){o-=(o+p+q)-r;
}else{o=Math.max(Math.abs(p),m._currentPosition);
}}if(p>0&&p+q>s){o-=p+q-s;
}return o;
};
if(this._orientation==b.ScrollerOrientation.Horizontal&&this._isRtl){k=j();
}else{k=i();
}k=Math.max(k,this._minPosition);
k=Math.min(k,this._maxPosition);
this._scrollTo(k);
},_stopScroll:function(){clearTimeout(this.scrollTimeout);
this.stopScroll();
this._owner._getControl()._updateScrollState(this._owner,this._currentPosition);
},_scrollTo:function(i){this._currentPosition=i;
if(this._orientation==b.ScrollerOrientation.Vertical){this._scrolledElement.scrollTop=i;
}else{g(this._scrolledElement,this._isRtl,i);
}this._raiseEvent("positionChanged",Sys.EventArgs.Empty);
},_getElementSize:function(){return this._scrolledElement[this._scrollSizeField]-this._scrolledElement[this._offsetSizeField];
},_toggleEnabled:function(){this._disabled=!(this._tabStrip.get_enabled()&&this._owner.get_enabled());
this._previousArrow.toggleClass(e,this._disabled);
this._nextArrow.toggleClass(e,this._disabled);
}};
b.TabScroller.registerClass("Telerik.Web.UI.TabScroller",b.Scroller);
})($telerik.$,Telerik.Web.UI);
