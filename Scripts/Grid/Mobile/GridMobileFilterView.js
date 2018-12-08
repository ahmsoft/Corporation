(function(){Type.registerNamespace("Telerik.Web.UI");
var b=Telerik.Web.UI,a=$telerik.$;
Telerik.Web.UI.GridMobileFilterView=function(c){b.GridMobileFilterView.initializeBase(this,[c]);
this._titleFormat=null;
this._column=null;
this._$values=null;
this._$inputs=null;
};
b.GridMobileFilterView.prototype={initialize:function(){b.GridMobileFilterView.callBaseMethod(this,"initialize");
this._$values=this.get_$element().find(".rgValue").on("change keydown",a.proxy(this._change,this));
this._$inputs=this._$values.filter("input");
},dispose:function(){b.GridMobileFilterView.callBaseMethod(this,"dispose");
},show:function(c){this._column=c;
this._setFilterControls(c._data);
this._setFilterFunctions();
this._setFilterValues();
this.set_title(String.format(this._titleFormat,c._data.HeaderText||c._data.DataField));
b.GridMobileFilterView.callBaseMethod(this,"show");
},onInit:function(){this._$element.find(".rgClear").onEvent("down",a.proxy(this._down,this));
},onShown:function(c){},onApplyChanges:function(){var e=[this._column._data.UniqueName];
var c="";
var d=true;
this._$values.each(function(){var f=a(this);
var g=f.attr("type");
if(g=="checkbox"){e.push(f.prop("checked"));
}else{e.push(f.val());
}});
e.forEach(function(f){c+=f+(d?"|?":"|");
d=!d;
});
this._column._owner.fireCommand("HeaderContextMenuFilter",c);
},_down:function(){var c=this._column._data.UniqueName+"|?NoFilter||?NoFilter|";
this.get_owner().fireCommand("HeaderContextMenuFilter",c);
},_change:function(c){this.changed();
},_setFilterControls:function(c){var f=c.ColumnType;
var e=c.PickerType;
var d=true;
switch(e){case"DatePicker":this._setInputsType("date");
break;
case"TimePicker":this._setInputsType("time");
break;
case"DateTimePicker":this._setInputsType("datetime-local");
break;
default:d=false;
break;
}if(!d){switch(f){case"GridCheckBoxColumn":this._setInputsType("checkbox");
break;
case"GridNumericColumn":this._setInputsType("number");
break;
default:this._setInputsType("text");
break;
}}},_setInputsType:function(c){this._$inputs.attr("type",c);
},_setFilterFunctions:function(){var d=this._column;
var e=d._data.DataTypeName;
var f=d.get_filterFunction();
var c;
var g;
this._$element.find("select.rgValue").children().each(function(){c=a(this);
g=c.val();
this.style.display="";
if(e=="System.Boolean"){if(g=="GreaterThan"||g=="LessThan"||g=="GreaterThanOrEqualTo"||g=="LessThanOrEqualTo"){this.style.display="none";
}}if(e!="System.String"){if(g=="StartsWith"||g=="EndsWith"||g=="Contains"||g=="DoesNotContain"||g=="IsEmpty"||g=="NotIsEmpty"){this.style.display="none";
}}if(g=="Custom"){this.style.display="none";
}if(g==f){a(this).parent().val(g);
f=d._data.AndCurrentFilterFunctionName;
}});
},_setFilterValues:function(){var c=this._column._data;
this._$element.find("input.rgValue").eq(0).val(c.CurrentFilterValue).end().eq(1).val(c.AndCurrentFilterValue);
}};
b.GridMobileFilterView.registerClass("Telerik.Web.UI.GridMobileFilterView",Telerik.Web.UI.GridMobileView);
})();
