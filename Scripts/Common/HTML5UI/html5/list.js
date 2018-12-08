(function(b,a){a(["./kendo.data","./kendo.popup"],b);
})(function(){(function(){(function(a,F){var o=window.kendo,E=o.ui,G=E.Widget,p=o.keys,D=o.support,k=o.htmlEncode,b=o._activeElement,s=o.data.ObservableArray,l="id",e="change",i="k-state-focused",j="k-state-hover",r="k-loading",t="open",f="close",z="select",A="selected",y="requestStart",x="requestEnd",H="width",g=a.extend,u=a.proxy,m=a.isArray,d=D.browser,n=d.msie&&d.version<9,v=/"/g,c={ComboBox:"DropDownList",DropDownList:"ComboBox"};
var q=o.ui.DataBoundWidget.extend({init:function(I,L){var M=this,K=M.ns,J;
G.fn.init.call(M,I,L);
I=M.element;
L=M.options;
M._isSelect=I.is(z);
if(M._isSelect&&M.element[0].length){if(!L.dataSource){L.dataTextField=L.dataTextField||"text";
L.dataValueField=L.dataValueField||"value";
}}M.ul=a('<ul unselectable="on" class="k-list k-reset"/>').attr({tabIndex:-1,"aria-hidden":true});
M.list=a("<div class='k-list-container'/>").append(M.ul).on("mousedown"+K,u(M._listMousedown,M));
J=I.attr(l);
if(J){M.list.attr(l,J+"-list");
M.ul.attr(l,J+"_listbox");
}M._header();
M._accessors();
M._initValue();
},options:{valuePrimitive:false,headerTemplate:""},setOptions:function(I){G.fn.setOptions.call(this,I);
if(I&&I.enable!==F){I.enabled=I.enable;
}},focus:function(){this._focused.focus();
},readonly:function(I){this._editable({readonly:I===F?true:I,disable:false});
},enable:function(I){this._editable({readonly:false,disable:!(I=I===F?true:I)});
},_listOptions:function(J){var I=this.options;
J=J||{};
J={height:J.height||I.height,dataValueField:J.dataValueField||I.dataValueField,dataTextField:J.dataTextField||I.dataTextField,groupTemplate:J.groupTemplate||I.groupTemplate,fixedGroupTemplate:J.fixedGroupTemplate||I.fixedGroupTemplate,template:J.template||I.template};
if(!J.template){J.template="#:"+o.expr(J.dataTextField,"data")+"#";
}return J;
},_initList:function(){var M=this;
var L=M.options;
var O=L.virtual;
var I=!!O;
var N=L.value;
var J=u(M._listBound,M);
var K={autoBind:false,selectable:true,dataSource:M.dataSource,click:u(M._click,M),change:u(M._listChange,M),activate:u(M._activateItem,M),deactivate:u(M._deactivateItem,M),dataBinding:function(){M.trigger("dataBinding");
M._angularItems("cleanup");
},dataBound:J,listBound:J,selectedItemChange:u(M._listChange,M)};
K=a.extend(M._listOptions(),K,typeof O==="object"?O:{});
if(!I){M.listView=new o.ui.StaticList(M.ul,K);
}else{M.listView=new o.ui.VirtualList(M.ul,K);
}if(N!==F){M.listView.value(N).done(function(){var P=L.text;
if(!M.listView.filter()&&M.input){if(M.selectedIndex===-1){if(P===F||P===null){P=N;
}M._accessor(N);
M.input.val(P);
M._placeholder();
}else{if(M._oldIndex===-1){M._oldIndex=M.selectedIndex;
}}}});
}},_listMousedown:function(I){if(!this.filterInput||this.filterInput[0]!==I.target){I.preventDefault();
}},_filterSource:function(K,L){var O=this;
var M=O.options;
var I=O.dataSource;
var J=g({},I.filter()||{});
var N=w(J,M.dataTextField);
if((K||N)&&O.trigger("filtering",{filter:K})){return;
}if(K){J={filters:J.filters||[],logic:"and"};
J.filters.push(K);
}if(!L){I.filter(J);
}else{I.read({filter:J});
}},_header:function(){var K=this;
var J=K.options.headerTemplate;
var I;
if(a.isFunction(J)){J=J({});
}if(J){K.list.prepend(J);
I=K.ul.prev();
K.header=I[0]?I:null;
if(K.header){K.angular("compile",function(){return{elements:K.header};
});
}}},_initValue:function(){var I=this,J=I.options.value;
if(J!==null){I.element.val(J);
}else{J=I._accessor();
I.options.value=J;
}I._old=J;
},_ignoreCase:function(){var K=this,J=K.dataSource.reader.model,I;
if(J&&J.fields){I=J.fields[K.options.dataTextField];
if(I&&I.type&&I.type!=="string"){K.options.ignoreCase=false;
}}},_focus:function(I){return this.listView.focus(I);
},current:function(I){return this._focus(I);
},items:function(){return this.ul[0].children;
},destroy:function(){var J=this;
var I=J.ns;
G.fn.destroy.call(J);
J._unbindDataSource();
J.listView.destroy();
J.list.off(I);
J.popup.destroy();
if(J._form){J._form.off("reset",J._resetHandler);
}},dataItem:function(I){var J=this;
if(I===F){return J.listView.selectedDataItems()[0];
}if(typeof I!=="number"){I=a(J.items()).index(I);
}return J.dataSource.flatView()[I];
},_activateItem:function(){var I=this.listView.focus();
if(I){this._focused.add(this.filterInput).attr("aria-activedescendant",I.attr("id"));
}},_deactivateItem:function(){this._focused.add(this.filterInput).removeAttr("aria-activedescendant");
},_accessors:function(){var M=this;
var I=M.element;
var K=M.options;
var J=o.getter;
var L=I.attr(o.attr("text-field"));
var N=I.attr(o.attr("value-field"));
if(!K.dataTextField&&L){K.dataTextField=L;
}if(!K.dataValueField&&N){K.dataValueField=N;
}M._text=J(K.dataTextField);
M._value=J(K.dataValueField);
},_aria:function(J){var L=this,K=L.options,I=L._focused.add(L.filterInput);
if(K.suggest!==F){I.attr("aria-autocomplete",K.suggest?"both":"list");
}J=J?J+" "+L.ul[0].id:L.ul[0].id;
I.attr("aria-owns",J);
L.ul.attr("aria-live",!K.filter||K.filter==="none"?"off":"polite");
},_blur:function(){var I=this;
I._change();
I.close();
},_change:function(){var K=this;
var I=K.selectedIndex;
var J=K.options.value;
var M=K.value();
var L;
if(K._isSelect&&!K.listView.isBound()&&J){M=J;
}if(M!==K._old){L=true;
}else{if(I!==F&&I!==K._oldIndex){L=true;
}}if(L){K._old=M;
K._oldIndex=I;
if(!K._typing){K.element.trigger(e);
}K.trigger(e);
}K.typing=false;
},_data:function(){return this.dataSource.view();
},_enable:function(){var K=this,J=K.options,I=K.element.is("[disabled]");
if(J.enable!==F){J.enabled=J.enable;
}if(!J.enabled||I){K.enable(false);
}else{K.readonly(K.element.is("[readonly]"));
}},_dataValue:function(I){var J=this._value(I);
if(J===F){J=this._text(I);
}return J;
},_offsetHeight:function(){var I=0;
var J=this.listView.content.prevAll(":visible");
J.each(function(){var K=a(this);
if(K.hasClass("k-list-filter")){I+=K.children().outerHeight();
}else{I+=K.outerHeight();
}});
return I;
},_height:function(J){var N=this;
var K=N.list;
var I=N.options.height;
var O=N.popup.visible();
var L;
var M;
if(J){M=K.add(K.parent(".k-animation-container")).show();
I=N.listView.content[0].scrollHeight>I?I:"auto";
M.height(I);
if(I!=="auto"){L=N._offsetHeight();
if(L){I-=L;
}}N.listView.content.height(I);
if(!O){M.hide();
}}return I;
},_adjustListWidth:function(){var K=this.list,L=K[0].style.width,M=this.wrapper,I,J;
if(!K.data(H)&&L){return;
}I=window.getComputedStyle?window.getComputedStyle(M[0],null):0;
J=I?parseFloat(I.width):M.outerWidth();
if(I&&d.msie){J+=parseFloat(I.paddingLeft)+parseFloat(I.paddingRight)+parseFloat(I.borderLeftWidth)+parseFloat(I.borderRightWidth);
}if(K.css("box-sizing")!=="border-box"){L=J-(K.outerWidth()-K.width());
}else{L=J;
}K.css({fontFamily:M.css("font-family"),width:L}).data(H,L);
return true;
},_openHandler:function(I){this._adjustListWidth();
if(this.trigger(t)){I.preventDefault();
}else{this._focused.attr("aria-expanded",true);
this.ul.attr("aria-hidden",false);
}},_closeHandler:function(I){if(this.trigger(f)){I.preventDefault();
}else{this._focused.attr("aria-expanded",false);
this.ul.attr("aria-hidden",true);
}},_focusItem:function(){var K=this.listView;
var I=K.focus();
var J=K.select();
J=J[J.length-1];
if(J===F&&this.options.highlightFirst&&!I){J=0;
}if(J!==F){K.focus(J);
}else{K.scrollToIndex(0);
}},_calculateGroupPadding:function(J){var K=this.ul.children(".k-first:first");
var I=this.listView.content.prev(".k-group-header");
var L=0;
if(I[0]&&I[0].style.display!=="none"){if(J!=="auto"){L=o.support.scrollbar();
}L+=parseFloat(K.css("border-right-width"),10)+parseFloat(K.children(".k-group").css("padding-right"),10);
I.css("padding-right",L);
}},_firstOpen:function(){var I=this._height(this.dataSource.flatView().length);
this._calculateGroupPadding(I);
},_popup:function(){var I=this;
I.popup=new E.Popup(I.list,g({},I.options.popup,{anchor:I.wrapper,open:u(I._openHandler,I),close:u(I._closeHandler,I),animation:I.options.animation,isRtl:D.isRtl(I.wrapper)}));
if(!I.options.virtual){I.popup.one(t,u(I._firstOpen,I));
}},_makeUnselectable:function(){if(n){this.list.find("*").not(".k-textbox").attr("unselectable","on");
}},_toggleHover:function(I){a(I.currentTarget).toggleClass(j,I.type==="mouseenter");
},_toggle:function(I,J){var K=this;
var L=D.mobileOS&&(D.touch||D.MSPointers||D.pointers);
I=I!==F?I:!K.popup.visible();
if(!J&&!L&&K._focused[0]!==b()){K._prevent=true;
K._focused.focus();
K._prevent=false;
}K[I?t:f]();
},_triggerCascade:function(){var I=this;
if(!I._cascadeTriggered||I._old!==I.value()||I._oldIndex!==I.selectedIndex){I._cascadeTriggered=true;
I.trigger("cascade",{userTriggered:I._userTriggered});
}},_unbindDataSource:function(){var I=this;
I.dataSource.unbind(y,I._requestStartHandler).unbind(x,I._requestEndHandler).unbind("error",I._errorHandler);
}});
g(q,{inArray:function(K,L){var I,J,M=L.children;
if(!K||K.parentNode!==L){return -1;
}for(I=0,J=M.length;
I<J;
I++){if(K===M[I]){return I;
}}return -1;
}});
o.ui.List=q;
E.Select=q.extend({init:function(I,J){q.fn.init.call(this,I,J);
this._initial=this.element.val();
},setDataSource:function(I){var K=this;
var J;
K.options.dataSource=I;
K._dataSource();
K.listView.setDataSource(K.dataSource);
if(K.options.autoBind){K.dataSource.fetch();
}J=K._parentWidget();
if(J){K._cascadeSelect(J);
}},close:function(){this.popup.close();
},select:function(I){var J=this;
if(I===F){return J.selectedIndex;
}else{J._select(I);
J._old=J._accessor();
J._oldIndex=J.selectedIndex;
}},search:function(O){O=typeof O==="string"?O:this.text();
var N=this;
var L=O.length;
var M=N.options;
var K=M.ignoreCase;
var J=M.filter;
var I=M.dataTextField;
clearTimeout(N._typingTimeout);
if(!L||L>=M.minLength){N._state="filter";
N.listView.filter(true);
if(J==="none"){N._filter(O);
}else{N._open=true;
N._filterSource({value:K?O.toLowerCase():O,field:I,operator:J,ignoreCase:K});
}}},_accessor:function(J,I){return this[this._isSelect?"_accessorSelect":"_accessorInput"](J,I);
},_accessorInput:function(J){var I=this.element[0];
if(J===F){return I.value;
}else{if(J===null){J="";
}I.value=J;
}},_accessorSelect:function(M,J){var I=this.element[0];
var L=I.selectedIndex;
var K;
if(M===F){if(L>-1){K=I.options[L];
}if(K){M=K.value;
}return M||"";
}else{if(L>-1){I.options[L].removeAttribute(A);
}if(J===F){J=-1;
}if(M!==null&&M!==""&&J==-1){this._custom(M);
}else{if(M){I.value=M;
}else{I.selectedIndex=J;
}if(I.selectedIndex>-1){K=I.options[I.selectedIndex];
}if(K){K.setAttribute(A,A);
}}}},_custom:function(L){var K=this;
var J=K.element;
var I=K._customOption;
if(!I){I=a("<option/>");
K._customOption=I;
J.append(I);
}I.text(L);
I[0].setAttribute(A,A);
I[0].selected=true;
},_hideBusy:function(){var I=this;
clearTimeout(I._busy);
I._arrow.removeClass(r);
I._focused.attr("aria-busy",false);
I._busy=null;
},_showBusy:function(){var I=this;
I._request=true;
if(I._busy){return;
}I._busy=setTimeout(function(){if(I._arrow){I._focused.attr("aria-busy",true);
I._arrow.addClass(r);
}},100);
},_requestEnd:function(){this._request=false;
this._hideBusy();
},_dataSource:function(){var M=this,J=M.element,L=M.options,I=L.dataSource||{},K;
I=a.isArray(I)?{data:I}:I;
if(M._isSelect){K=J[0].selectedIndex;
if(K>-1){L.index=K;
}I.select=J;
I.fields=[{field:L.dataTextField},{field:L.dataValueField}];
}if(M.dataSource){M._unbindDataSource();
}else{M._requestStartHandler=u(M._showBusy,M);
M._requestEndHandler=u(M._requestEnd,M);
M._errorHandler=u(M._hideBusy,M);
}M.dataSource=o.data.DataSource.create(I).bind(y,M._requestStartHandler).bind(x,M._requestEndHandler).bind("error",M._errorHandler);
},_firstItem:function(){this.listView.focusFirst();
},_lastItem:function(){this.listView.focusLast();
},_nextItem:function(){this.listView.focusNext();
},_prevItem:function(){this.listView.focusPrev();
},_move:function(M){var P=this;
var N=M.keyCode;
var L=N===p.DOWN;
var K;
var O;
var J;
if(N===p.UP||L){if(M.altKey){P.toggle(L);
}else{if(!P.listView.isBound()){if(!P._fetch){P.dataSource.one(e,function(){P._fetch=false;
P._move(M);
});
P._fetch=true;
P._filterSource();
}M.preventDefault();
return true;
}J=P._focus();
if(!P._fetch&&(!J||J.hasClass("k-state-selected"))){if(L){P._nextItem();
if(!P._focus()){P._lastItem();
}}else{P._prevItem();
if(!P._focus()){P._firstItem();
}}}if(P.trigger(z,{item:P.listView.focus()})){P._focus(J);
return;
}P._select(P._focus(),true);
if(!P.popup.visible()){P._blur();
}}M.preventDefault();
O=true;
}else{if(N===p.ENTER||N===p.TAB){if(P.popup.visible()){M.preventDefault();
}J=P._focus();
K=P.dataItem();
if(!P.popup.visible()&&(!K||P.text()!==P._text(K))){J=null;
}var I=P.filterInput&&P.filterInput[0]===b();
if(J){if(P.trigger(z,{item:J})){return;
}P._select(J);
}else{if(P.input){P._accessor(P.input.val());
P.listView.value(P.input.val());
}}if(P._focusElement){P._focusElement(P.wrapper);
}if(I&&N===p.TAB){P.wrapper.focusout();
}else{P._blur();
}P.close();
O=true;
}else{if(N===p.ESC){if(P.popup.visible()){M.preventDefault();
}P.close();
O=true;
}}}return O;
},_fetchData:function(){var J=this;
var I=!!J.dataSource.view().length;
if(J._request||J.options.cascadeFrom){return;
}if(!J.listView.isBound()&&!J._fetch&&!I){J._fetch=true;
J.dataSource.fetch().done(function(){J._fetch=false;
});
}},_options:function(I,Q,T){var S=this,M=S.element,O=I.length,R="",P,J,K,L,N=0;
if(Q){R=Q;
}for(;
N<O;
N++){P="<option";
J=I[N];
K=S._text(J);
L=S._value(J);
if(L!==F){L+="";
if(L.indexOf('"')!==-1){L=L.replace(v,"&quot;");
}P+=' value="'+L+'"';
}P+=">";
if(K!==F){P+=k(K);
}P+="</option>";
R+=P;
}M.html(R);
if(T!==F){M[0].value=T;
if(M[0].value&&!T){M[0].selectedIndex=-1;
}}},_reset:function(){var L=this,I=L.element,K=I.attr("form"),J=K?a("#"+K):I.closest("form");
if(J[0]){L._resetHandler=function(){setTimeout(function(){L.value(L._initial);
});
};
L._form=J.on("reset",L._resetHandler);
}},_parentWidget:function(){var I=this.options.name;
var K=a("#"+this.options.cascadeFrom);
var J=K.data("kendo"+I);
if(!J){J=K.data("kendo"+c[I]);
}return J;
},_cascade:function(){var L=this,J=L.options,I=J.cascadeFrom,K;
if(I){K=L._parentWidget();
if(!K){return;
}J.autoBind=false;
K.first("cascade",function(M){L._userTriggered=M.userTriggered;
if(L.listView.isBound()){L._clearSelection(K,true);
}L._cascadeSelect(K);
});
if(K.listView.isBound()){L._cascadeSelect(K);
}else{if(!K.value()){L.enable(false);
}}}},_cascadeChange:function(I){var J=this;
var K=J._accessor();
if(J._userTriggered){J._clearSelection(I,true);
}else{if(K){if(K!==J.listView.value()[0]){J.value(K);
}if(!J.dataSource.view()[0]||J.selectedIndex===-1){J._clearSelection(I,true);
}}else{if(J.dataSource.flatView().length){J.select(J.options.index);
}}}J.enable();
J._triggerCascade();
J._userTriggered=false;
},_cascadeSelect:function(N){var O=this;
var I=N.dataItem();
var L=I?N._value(I):null;
var P=O.options.cascadeFromField||N.options.dataValueField;
var J,K;
if(L||L===0){J=O.dataSource.filter()||{};
w(J,P);
K=J.filters||[];
K.push({field:P,operator:"eq",value:L});
var M=function(){O.unbind("dataBound",M);
O._cascadeChange(N);
};
O.first("dataBound",M);
O.dataSource.filter(K);
}else{O.enable(false);
O._clearSelection(N);
O._triggerCascade();
O._userTriggered=false;
}}});
var B=".StaticList";
var C=o.ui.DataBoundWidget.extend({init:function(I,J){G.fn.init.call(this,I,J);
this.element.attr("role","listbox").on("click"+B,"li",u(this._click,this)).on("mouseenter"+B,"li",function(){a(this).addClass(j);
}).on("mouseleave"+B,"li",function(){a(this).removeClass(j);
});
this.content=this.element.wrap("<div unselectable='on'></div>").parent().css({overflow:"auto",position:"relative"});
this.header=this.content.before('<div class="k-group-header" style="display:none"></div>').prev();
this._bound=false;
this._optionID=o.guid();
this._selectedIndices=[];
this._view=[];
this._dataItems=[];
this._values=[];
var K=this.options.value;
if(K){this._values=a.isArray(K)?K.slice(0):[K];
}this._getter();
this._templates();
this.setDataSource(this.options.dataSource);
this._onScroll=u(function(){var L=this;
clearTimeout(L._scrollId);
L._scrollId=setTimeout(function(){L._renderHeader();
},50);
},this);
},options:{name:"StaticList",dataValueField:null,valuePrimitive:false,selectable:true,template:null,groupTemplate:null,fixedGroupTemplate:null},events:["click","change","activate","deactivate","dataBinding","dataBound","selectedItemChange"],setDataSource:function(J){var K=this;
var I=J||{};
var L;
I=a.isArray(I)?{data:I}:I;
I=o.data.DataSource.create(I);
if(K.dataSource){K.dataSource.unbind(e,K._refreshHandler);
L=K.value();
K.value([]);
K._bound=false;
K.value(L);
}else{K._refreshHandler=u(K.refresh,K);
}K.dataSource=I.bind(e,K._refreshHandler);
K._fixedHeader();
},setOptions:function(I){G.fn.setOptions.call(this,I);
this._getter();
this._templates();
this._render();
},destroy:function(){this.element.off(B);
if(this._refreshHandler){this.dataSource.unbind(e,this._refreshHandler);
}G.fn.destroy.call(this);
},scrollToIndex:function(I){var J=this.element[0].children[I];
if(J){this.scroll(J);
}},scroll:function(M){if(!M){return;
}if(M[0]){M=M[0];
}var J=this.content[0],O=M.offsetTop,N=M.offsetHeight,L=J.scrollTop,K=J.clientHeight,I=O+N;
if(L>O){L=O;
}else{if(I>(L+K)){L=(I-K);
}}J.scrollTop=L;
},selectedDataItems:function(I){var J=this._valueGetter;
if(I===F){return this._dataItems.slice();
}this._dataItems=I;
this._values=a.map(I,function(K){return J(K);
});
},focusNext:function(){var I=this.focus();
if(!I){I=0;
}else{I=I.next();
}this.focus(I);
},focusPrev:function(){var I=this.focus();
if(!I){I=this.element[0].children.length-1;
}else{I=I.prev();
}this.focus(I);
},focusFirst:function(){this.focus(this.element[0].children[0]);
},focusLast:function(){this.focus(this.element[0].children[this.element[0].children.length-1]);
},focus:function(I){var L=this;
var K=L._optionID;
var J;
if(I===F){return L._current;
}I=L._get(I);
I=I[I.length-1];
I=a(this.element[0].children[I]);
if(L._current){L._current.removeClass(i).removeAttr("aria-selected").removeAttr(l);
L.trigger("deactivate");
}J=!!I[0];
if(J){I.addClass(i);
L.scroll(I);
I.attr("id",K);
}L._current=J?I:null;
L.trigger("activate");
},focusIndex:function(){return this.focus()?this.focus().index():F;
},filter:function(I){if(I===F){return this._filtered;
}this._filtered=I;
},skipUpdate:function(I){this._skipUpdate=I;
},select:function(J){var P=this;
var M=P.options.selectable;
var O=M!=="multiple"&&M!==false;
var N=P._selectedIndices;
var I=[];
var K=[];
var L;
if(J===F){return N.slice();
}J=P._get(J);
if(J.length===1&&J[0]===-1){J=[];
}if(P._filtered&&!O&&P._deselectFiltered(J)){return;
}if(O&&!P._filtered&&a.inArray(J[J.length-1],N)!==-1){if(P._dataItems.length&&P._view.length){P._dataItems=[P._view[N[0]].item];
}return;
}L=P._deselect(J);
K=L.removed;
J=L.indices;
if(J.length){if(O){J=[J[J.length-1]];
}I=P._select(J);
}if(I.length||K.length){P._valueComparer=null;
P.trigger("change",{added:I,removed:K});
}},removeAt:function(I){this._selectedIndices.splice(I,1);
this._values.splice(I,1);
this._valueComparer=null;
return{position:I,dataItem:this._dataItems.splice(I,1)[0]};
},setValue:function(I){I=a.isArray(I)||I instanceof s?I.slice(0):[I];
this._values=I;
this._valueComparer=null;
},value:function(L){var K=this;
var I=K._valueDeferred;
var J;
if(L===F){return K._values.slice();
}K.setValue(L);
if(!I||I.state()==="resolved"){K._valueDeferred=I=a.Deferred();
}if(K.isBound()){J=K._valueIndices(K._values);
if(K.options.selectable==="multiple"){K.select(-1);
}K.select(J);
I.resolve();
}K._skipUpdate=false;
return I;
},items:function(){return this.element.children(".k-item");
},_click:function(I){if(!I.isDefaultPrevented()){if(!this.trigger("click",{item:a(I.currentTarget)})){this.select(I.currentTarget);
}}},_valueExpr:function(N,P){var M=this;
var O;
var K=0;
var I;
var J;
var L=[];
if(!M._valueComparer||M._valueType!==N){M._valueType=N;
for(;
K<P.length;
K++){O=P[K];
if(O!==F&&O!==""&&O!==null){if(N==="boolean"){O=Boolean(O);
}else{if(N==="number"){O=Number(O);
}else{if(N==="string"){O=O.toString();
}}}}L.push(O);
}I="for (var idx = 0; idx < "+L.length+"; idx++) { if (current === values[idx]) {   return idx; }} return -1;";
J=new Function(["current","values"],I);
M._valueComparer=function(Q){return J(Q,L);
};
}return M._valueComparer;
},_dataItemPosition:function(I,L){var J=this._valueGetter(I);
var K=this._valueExpr(typeof J,L);
return K(J);
},_getter:function(){this._valueGetter=o.getter(this.options.dataValueField);
},_deselect:function(M){var T=this;
var I=T.element[0].children;
var Q=T.options.selectable;
var S=T._selectedIndices;
var J=T._dataItems;
var U=T._values;
var O=[];
var K=0;
var N;
var L,R;
var P=0;
M=M.slice();
if(Q===true||!M.length){for(;
K<S.length;
K++){a(I[S[K]]).removeClass("k-state-selected");
O.push({position:K,dataItem:J[K]});
}T._values=[];
T._dataItems=[];
T._selectedIndices=[];
}else{if(Q==="multiple"){for(;
K<M.length;
K++){L=M[K];
if(!a(I[L]).hasClass("k-state-selected")){continue;
}for(N=0;
N<S.length;
N++){R=S[N];
if(R===L){a(I[R]).removeClass("k-state-selected");
O.push({position:N+P,dataItem:J.splice(N,1)[0]});
S.splice(N,1);
M.splice(K,1);
U.splice(N,1);
P+=1;
K-=1;
N-=1;
break;
}}}}}return{indices:M,removed:O};
},_deselectFiltered:function(M){var I=this.element[0].children;
var J,L,N;
var O=[];
var K=0;
for(;
K<M.length;
K++){L=M[K];
J=this._view[L].item;
N=this._dataItemPosition(J,this._values);
if(N>-1){O.push(this.removeAt(N));
a(I[L]).removeClass("k-state-selected");
}}if(O.length){this.trigger("change",{added:[],removed:O});
return true;
}return false;
},_select:function(O){var P=this;
var J=P.element[0].children;
var K=P._view;
var L,N;
var I=[];
var M=0;
if(O[O.length-1]!==-1){P.focus(O);
}for(;
M<O.length;
M++){N=O[M];
L=K[N];
if(N===-1||!L){continue;
}L=L.item;
P._selectedIndices.push(N);
P._dataItems.push(L);
P._values.push(P._valueGetter(L));
a(J[N]).addClass("k-state-selected").attr("aria-selected",true);
I.push({dataItem:L});
}return I;
},_get:function(I){if(typeof I==="number"){I=[I];
}else{if(!m(I)){I=a(I).data("offset-index");
if(I===F){I=-1;
}I=[I];
}}return I;
},_template:function(){var K=this;
var I=K.options;
var J=I.template;
if(!J){J=o.template('<li tabindex="-1" role="option" unselectable="on" class="k-item">${'+o.expr(I.dataTextField,"data")+"}</li>",{useWithBlock:false});
}else{J=o.template(J);
J=function(L){return'<li tabindex="-1" role="option" unselectable="on" class="k-item">'+J(L)+"</li>";
};
}return J;
},_templates:function(){var J;
var K={template:this.options.template,groupTemplate:this.options.groupTemplate,fixedGroupTemplate:this.options.fixedGroupTemplate};
for(var I in K){J=K[I];
if(J&&typeof J!=="function"){K[I]=o.template(J);
}}this.templates=K;
},_normalizeIndices:function(J){var K=[];
var I=0;
for(;
I<J.length;
I++){if(J[I]!==F){K.push(J[I]);
}}return K;
},_valueIndices:function(M,L){var I=this._view;
var J=0;
var K;
L=L?L.slice():[];
if(!M.length){return[];
}for(;
J<I.length;
J++){K=this._dataItemPosition(I[J].item,M);
if(K!==-1){L[K]=J;
}}return this._normalizeIndices(L);
},_firstVisibleItem:function(){var J=this.element[0];
var I=this.content[0];
var O=I.scrollTop;
var M=a(J.children[0]).height();
var N=Math.floor(O/M)||0;
var L=J.children[N]||J.lastChild;
var K=L.offsetTop<O;
while(L){if(K){if((L.offsetTop+M)>O||!L.nextSibling){break;
}L=L.nextSibling;
}else{if(L.offsetTop<=O||!L.previousSibling){break;
}L=L.previousSibling;
}}return this._view[a(L).data("offset-index")];
},_fixedHeader:function(){if(this.isGrouped()&&this.templates.fixedGroupTemplate){this.header.show();
this.content.scroll(this._onScroll);
}else{this.header.hide();
this.content.off("scroll",this._onScroll);
}},_renderHeader:function(){var I=this.templates.fixedGroupTemplate;
if(!I){return;
}var J=this._firstVisibleItem();
if(J){this.header.html(I(J.group));
}},_renderItem:function(I){var K='<li tabindex="-1" role="option" unselectable="on" class="k-item';
var J=I.item;
var L=I.index!==0;
var M=I.selected;
if(L&&I.newGroup){K+=" k-first";
}if(M){K+=" k-state-selected";
}K+='"'+(M?' aria-selected="true"':"")+' data-offset-index="'+I.index+'">';
K+=this.templates.template(J);
if(L&&I.newGroup){K+='<div class="k-group">'+this.templates.groupTemplate(I.group)+"</div>";
}return K+"</li>";
},_render:function(){var L="";
var M=0;
var N=0;
var I;
var J=[];
var S=this.dataSource.view();
var R=this.value();
var K,Q,P;
var O=this.isGrouped();
if(O){for(M=0;
M<S.length;
M++){K=S[M];
Q=true;
for(P=0;
P<K.items.length;
P++){I={selected:this._selected(K.items[P],R),item:K.items[P],group:K.value,newGroup:Q,index:N};
J[N]=I;
N+=1;
L+=this._renderItem(I);
Q=false;
}}}else{for(M=0;
M<S.length;
M++){I={selected:this._selected(S[M],R),item:S[M],index:M};
J[M]=I;
L+=this._renderItem(I);
}}this._view=J;
this.element[0].innerHTML=L;
if(O&&J.length){this._renderHeader();
}},_selected:function(I,K){var J=!this._filtered||this.options.selectable==="multiple";
return J&&this._dataItemPosition(I,K)!==-1;
},refresh:function(K){var L=this;
var J;
var I=K&&K.action;
L.trigger("dataBinding");
L._fixedHeader();
L._render();
L._bound=true;
if(I==="itemchange"){J=h(L._dataItems,K.items);
if(J.length){L.trigger("selectedItemChange",{items:J});
}}else{if(L._filtered||L._skipUpdate){L.focus(0);
if(L._skipUpdate){L._skipUpdate=false;
L._selectedIndices=L._valueIndices(L._values,L._selectedIndices);
}}else{if(!I||I==="add"){L.value(L._values);
}}}if(L._valueDeferred){L._valueDeferred.resolve();
}L.trigger("dataBound");
},isBound:function(){return this._bound;
},isGrouped:function(){return(this.dataSource.group()||[]).length;
}});
E.plugin(C);
function h(O,I){var J=I.length;
var N=[];
var K;
var L,M;
for(L=0;
L<O.length;
L++){K=O[L];
for(M=0;
M<J;
M++){if(K===I[M]){N.push({index:L,item:K});
}}}return N;
}function w(I,J){var K;
var L=false;
if(I.filters){K=a.grep(I.filters,function(M){L=w(M,J);
if(M.filters){return M.filters.length;
}else{return M.field!=J;
}});
if(!L&&I.filters.length!==K.length){L=true;
}I.filters=K;
}return L;
}})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});