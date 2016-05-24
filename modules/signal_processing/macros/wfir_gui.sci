// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2014 - INRIA - Serge Steer
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.txt

function [ok,values,exprs]=wfir_gui(exprs)
    FT=["lp","hp","bp","sb"]
    WT=["re","tr","hn","hm","kr","ch","ch"]
    //  errcatch(-1,'continue')
    if argn(2)<1 then
        exprs=["""lp""";
        """re"""
        "48";
        "1";
        "0.05"
        "0.45";
        "0.5"]
    end
    ftype=exprs(1)
    wtype=exprs(2)
    if execstr("forder="+exprs(3)+";freq_ech="+exprs(4)+";low="+exprs(5)+";high="+exprs(6)+";fp="+exprs(7),"errcatch")<>0 then
        values=[]
        exprs=[]
        ok=%f
        return
    end
    global ret
    ret=0

    margin_x     = 5;      // Horizontal margin between each elements
    margin_y     = 5;      // Vertical margin between each elements
    button_w     = 70;
    button_h     = 30;
    frame_h     = 300;
    frame_w     = 440;
    label_h      = 20;
    list_h       = 120;
    list_w       = 100;
    list_incr    = list_w;
    axes_w       = 2*margin_x+frame_w;
    axes_h       = 2*margin_y+frame_h;// Frame height
    defaultfont  = "arial"; // Default Font

    fig_id=max(winsid())+1
    fig = scf(fig_id)

    // Remove Scilab graphics menus & toolbar
    //  drawlater (bug)
    delmenu(fig.figure_id, gettext("&File"));
    delmenu(fig.figure_id, gettext("&Tools"));
    delmenu(fig.figure_id, gettext("&Edit"));
    delmenu(fig.figure_id, gettext("&?"));
    toolbar(fig.figure_id, "off");
    fig.axes_size       = [axes_w axes_h];


    fig.background      = addcolor([0.8 0.8 0.8]);
    fig.figure_name     = _("WFIR settings");
    ax=fig.children;
    ax.background= fig.background ;

    gui=uicontrol( ...
    "parent"              , fig,...
    "style"               , "frame",...
    "units"               , "pixels",...
    "position"            , [0 0 axes_w axes_h],...
    "background"          , [1 1 1]*0.8, ...
    "visible"             , "on");

    yo=axes_h-button_h;


    yft=frame_h-margin_y-label_h
    xft=margin_x;
    //Filter type selection -----------------------------------------------------------------
    listf_h       = 80;
    listf_w       = 150;
    label_w       = 75;
    uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "string"              , _("Filter type"),...
    "units"               , "pixels",...
    "position"            , [xft yft label_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "visible"             , "on");
    Ftv=uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "string"              , ftype,...
    "units"               , "pixels",...
    "position"            , [xft+label_w+margin_x yft listf_w-label_w-margin_x label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "callback"            , "wfirSetFilterType()", ...
    "visible"             , "on");
    Filtertype=uicontrol( ...
    "parent"              , gui,...
    "style"               , "listbox",...
    "string"              , [_("Low pass");_("High pass");_("Band pass");_("Stop Band")],...
    "value"               , find(FT==evstr(ftype)),...
    "units"               , "pixels",...
    "position"            , [xft,yft-listf_h,listf_w,listf_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "visible"             , "on", ...
    "callback"            , "wfirSetFilterType()");
    set(Ftv,"userdata",list([],Filtertype))

    //Window type selection -----------------------------------------------------------------
    ywt=yft-listf_h-4*margin_y
    xwt=xft
    listw_h       = 140;
    listw_w       = listf_w;
    uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "string"              , _("Window type"),...
    "units"               , "pixels",...
    "position"            , [xwt ywt label_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "visible"             , "on");
    Wtv=uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "string"              , wtype,...
    "units"               , "pixels",...
    "position"            , [xwt+label_w+margin_x ywt listw_w-label_w-margin_x label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "callback"            , "wfirSetWindowType()",...
    "visible"             , "on");



    W=[_("Rectangular");_("Triangular");_("Hanning");
    _("Hamming");_("Kaiser");_("Chebychev main lobe");_("Chebychev side lobe")];
    index=find(WT==evstr(wtype))
    if index==[] then index=1,end//for debug
    Windowtype=uicontrol( ...
    "parent"              , gui,...
    "style"               , "listbox",...
    "string"              , W,...
    "value"               , find(WT==evstr(wtype)),...
    "units"               , "pixels",...
    "position"            , [xwt,ywt-listw_h,listw_w,listw_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "visible"             , "on", ...
    "callback"            , "wfirSetWindowType()");
    set(Wtv,"userdata",list([],Windowtype))

    //Sampling Frequency -----------------------------------------------------------------
    ysf=frame_h-margin_y-label_h
    xsf=xft+listf_w+2*margin_x
    labelsf_w=180
    editsf_w=80
    sfreq=1
    uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "string"              ,  _("Sampling Frequency (Hz)"),...
    "units"               , "pixels",...
    "position"            , [xsf ysf labelsf_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "visible"             , "on");
    Sfreq =uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "string"               , exprs(4),...
    "units"               , "pixels",...
    "position"            , [xsf+margin_x+labelsf_w,ysf,editsf_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "callback"            , "wfirSetSamplingFrequency()", ...
    "userdata"            ,sfreq,...
    "visible"             , "on")
    //Filter order -----------------------------------------------------------------
    yfo=ysf-margin_y-label_h
    xfo=xsf
    labelfo_w=labelsf_w;
    editfo_w= editsf_w;
    scroll_w=160
    uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "string"              ,  _("Filter Order"),...
    "units"               , "pixels",...
    "position"            , [xfo yfo labelfo_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "visible"             , "on");
    Forderv=uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "string"              , exprs(3),...
    "units"               , "pixels",...
    "position"            , [xfo,yfo-label_h-margin_y,editfo_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "callback"            , "wfirValue2Sliderpos()", ...
    "visible"             , "on")

    Forders=uicontrol( ...
    "parent"              , gui,...
    "style"               , "slider",...
    "min"                 , 1,...
    "max"                 , 1000,...
    "sliderstep"          , [1 100],...
    "value"               , forder,...
    "units"               , "pixels",...
    "position"            , [xfo+editfo_w+margin_x,yfo-label_h-margin_y,scroll_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "userdata"            , list(Forderv,1), ...
    "callback"            , "wfirSliderpos2ValueI()",...
    "visible"             , "on")
    set(Forderv,"userdata",Forders);

    //Low cutoff frequency -----------------------------------------------------------------
    ylcf=yfo-2*(margin_y+label_h)
    xlcf=xsf
    labellcf_w=labelsf_w;
    editlcf_w= editsf_w;
    if ftype=="""hp""" then visible="off";else visible="on";end
    Lcfl=uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "visible"             , visible,...
    "string"              ,  _("Low cutoff frequency (Hz)"),...
    "units"               , "pixels",...
    "position"            , [xlcf ylcf labellcf_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8);
    fact=1000;
    Lcfv=uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "visible"             , visible,...
    "units"               , "pixels",...
    "string"              , exprs(5),...
    "position"            , [xlcf,ylcf-label_h-margin_y,editlcf_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "callback"            , "wfirValue2Sliderpos()")
    Lcfs=uicontrol( ...
    "parent"              , gui,...
    "style"               , "slider",...
    "visible"             , visible,...
    "min"                 , 0,...
    "max"                 , 500,...
    "sliderstep"          , [1 10],...
    "value"               , low*fact,...
    "units"               , "pixels",...
    "position"            , [xlcf+editlcf_w+margin_x,ylcf-label_h-margin_y,scroll_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "userdata"            , list(Lcfv,fact), ...
    "callback"            , "wfirSliderpos2Value()")
    set(Lcfv,"userdata",Lcfs);

    //High cutoff frequency -----------------------------------------------------------------
    yhcf=ylcf-2*(margin_y+label_h)
    xhcf=xsf
    labelhcf_w=labelsf_w;
    edithcf_w= editsf_w;
    if ftype=="""lp""" then visible="off";else visible="on";end
    Hcfl=uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "visible"             , visible,...
    "string"              ,  _("High cutoff frequency (Hz)"),...
    "units"               , "pixels",...
    "position"            , [xhcf yhcf labelhcf_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8);
    fact=1000;
    Hcfv=uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "visible"             , visible,...
    "units"               , "pixels",...
    "string"              , exprs(6),...
    "position"            , [xhcf,yhcf-label_h-margin_y,edithcf_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "callback"            , "wfirValue2Sliderpos()")
    Hcfs=uicontrol( ...
    "parent"              , gui,...
    "style"               , "slider",...
    "visible"             , visible,...
    "min"                 , 0,...
    "max"                 , 500,...
    "sliderstep"          , [1 10],...
    "value"               , high*fact,...
    "units"               , "pixels",...
    "position"            , [xhcf+edithcf_w+margin_x,yhcf-label_h-margin_y,scroll_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "userdata"            , list(Hcfv,fact), ...
    "callback"            , "wfirSliderpos2Value()")
    set(Hcfv,"userdata",Hcfs);


    //Chebychev or Kaiser window parameter -----------------------------------------------------------------
    yfp=yhcf-2*(margin_y+label_h)
    xfp=xsf
    labelfp_w=labelsf_w;
    editfp_w= editsf_w;
    if and(wtype<>["""kr""" """ch"""]) then visible="off";else visible="on";end
    Fpl=uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "visible"             , visible,...
    "string"              ,  _("Parameter"),...
    "units"               , "pixels",...
    "position"            , [xfp yfp labelfp_w label_h],....
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8);
    fact=1000;

    Fpv=uicontrol( ...
    "parent"              , gui,...
    "style"               , "edit",...
    "visible"             , visible,...
    "units"               , "pixels",...
    "string"              , exprs(7),...
    "position"            , [xfp,yfp-label_h-margin_y,editfp_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "callback"            , "wfirValue2Sliderpos()")
    Fps=uicontrol( ...
    "parent"              , gui,...
    "style"               , "slider",...
    "visible"             , visible,...
    "min"                 , 0,...
    "max"                 , 500,...
    "sliderstep"          , [1 10],...
    "value"               , fp*fact,...
    "units"               , "pixels",...
    "position"            , [xfp+editfp_w+margin_x,yfp-label_h-margin_y,scroll_w,label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "horizontalalignment" , "left", ...
    "BackgroundColor"     , [1 1 1], ...
    "ForegroundColor"     , [1 1 1]*0, ...
    "userdata"            , list(Fpv,fact), ...
    "callback"            , "wfirSliderpos2Value()")

    set(Fpv,"userdata",Fps);


    set(Filtertype,"userdata",list([Lcfl Lcfv Lcfs;Hcfl Hcfv Hcfs],Ftv))
    set(Windowtype,"userdata",list([Fpl Fpv Fps], Wtv))

    //Display -----------------------------------------------------------------
    yd=yfp-2*(margin_y+label_h)
    xd=xsf
    labeld_w=40
    uicontrol( ...
    "parent"              , gui,...
    "style"               , "text",...
    "string"              ,  _("View"),...
    "units"               , "pixels",...
    "position"            , [xd yd labeld_w label_h],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "left", ...
    "background"          , [1 1 1]*0.8, ...
    "visible"             , "on");
    Fview=uicontrol( ...
    "parent"              , gui,...
    "style"               , "checkbox",...
    "units"               , "pixels",...
    "min"                 , 0, ...
    "max"                 , 1, ...
    "value"               , 0, ...
    "position"            , [xd+margin_x+labeld_w yd label_h label_h],...
    "background"          , [1 1 1]*0.8, ...
    "callback"            , "wfirSetFilterView()",...
    "visible"             , "on");

    ybuttons=margin_y
    xbuttons=xhcf
    Ok = uicontrol( ...
    "parent"              , gui,...
    "relief"              , "groove",...
    "style"               , "pushbutton",...
    "string"              , _("Ok"),...
    "units"               , "pixels",...
    "position"            , [xbuttons,ybuttons,button_w button_h],..
    "fontname"            , "arial",...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "center", ...
    "visible"             , "on", ...
    "callback"            , "global ret;ret=1;");
    xbuttons=xbuttons+margin_x+button_w
    Cancel = uicontrol( ...
    "parent"              , gui,...
    "relief"              , "groove",...
    "style"               , "pushbutton",...
    "string"              , _("Cancel"),...
    "units"               , "pixels",...
    "position"            , [xbuttons,ybuttons,button_w button_h],..
    "fontname"            , "arial",...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "center", ...
    "visible"             , "on", ...
    "callback"            , "global ret;ret=2;");
    xbuttons=xbuttons+margin_x+button_w
    Help = uicontrol( ...
    "parent"              , gui,...
    "relief"              , "groove",...
    "style"               , "pushbutton",...
    "string"              , _("Help"),...
    "units"               , "pixels",...
    "position"            , [xbuttons,ybuttons,button_w button_h],..
    "fontname"            , "arial",...
    "fontunits"           , "points",...
    "fontsize"            , 12,...
    "fontweight"          , "bold", ...
    "horizontalalignment" , "center", ...
    "visible"             , "on", ...
    "callback"            , "help wfir");
    // next used by wfirGetFilterParameters
    set(gui,"userdata",[Fview,Filtertype,Windowtype,Forderv,Forders,Lcfv,Lcfs,Hcfv,Hcfs,Fpv,Fps,Sfreq,Ftv,Wtv])
    realtimeinit(0.1);
    t=0;
    while ret==0&or(winsid()==fig_id) then
        //slow down the waiting loop
        t=t+1;
        realtime(t);
    end
    if ret==1&or(winsid()==fig_id) then
        ok=%t
        [ftype,forder,low,high,wtype,fpar,freq_ech]=wfirGetFilterParameters(gui.userdata)
        values=tlist(["wfir","ftype","forder","low","high","wtype","fpar","freq_ech"],ftype,forder,low,high,wtype,fpar,freq_ech)
        exprs= wfirGetFilterExprs(gui.userdata)
        delete(fig)
    else
        //user had canceled or closed the gui window
        ok=%f
        values=[]
        exprs=[]
    end
    clearglobal ret idle;

endfunction

function wfirSliderpos2Value(hs)
    //hs handle on the slider
    if argn(2)<1 then hs=gcbo,end
    ud=hs.userdata
    hv=ud(1);//handle on edition zone
    fact=ud(2)// scale factor
    hv.string=string(hs.value/fact)
    wfirUpdate(hs)
endfunction
function wfirSliderpos2ValueI(hs)
    //hs handle on the slider
    if argn(2)<1 then hs=gcbo,end
    hs.value=round(hs.value)
    ud=hs.userdata
    hv=ud(1);//handle on edition zone
    fact=ud(2)// scale factor
    hv.string=string(hs.value/fact)
    wfirUpdate(hs)
endfunction

function wfirValue2Sliderpos(hv)
    // hv handle on edition zone
    if argn(2)<1 then hv=gcbo,end
    if execstr("v="+hv.string,"errcatch")==0 then
        hs=hv.userdata //handle on the slider
        ud=hs.userdata
        fact=ud(2)// scale factor
        hs.value=fact*v
        hv.ForegroundColor=[0 0 0];
        wfirUpdate(hv)
    else
        hv.ForegroundColor=[1 0 0];
    end
endfunction

function wfirSetFilterType()
    FT=["lp","hp","bp","sb"]
    ud=gcbo.userdata

    if gcbo.style=="edit" then
        he=gcbo //handle on the edit area
        hl=ud(2) //handle on the list area

        ok=execstr("k=find("+he.string+"==FT)","errcatch")==0
        if ~ok|k==[] then
            he.ForegroundColor=[1 0 0];
            return
        else
            he.ForegroundColor=[0 0 0];
            hl.value=k
        end
    else
        hl=gcbo //handle on the list area
        he=ud(2) //handle on the edit area
        he.string=sci2exp(FT(hl.value),0)
    end
    ud=hl.userdata
    Handles=ud(1)
    select hl.value
    case 1 then //low pass
        Handles(1,:).visible="on";
        Handles(2,:).visible="off";
    case 2 then //high pass
        Handles(1,:).visible="off";
        Handles(2,:).visible="on";
    case 3 then //band pass
        Handles(1,:).visible="on";
        Handles(2,:).visible="on";
    case 4 then //stop band
        Handles(1,:).visible="on";
        Handles(2,:).visible="on";
    end
    wfirUpdate(gcbo)
endfunction

function wfirSetWindowType()
    WT=["re","tr","hn","hm","kr","ch","ch"]
    ud=gcbo.userdata
    if gcbo.style=="edit" then
        he=gcbo //handle on the edit area
        hl=ud(2) //handle on the list area
        ok=execstr("k=find("+he.string+"==WT)","errcatch")==0

        if ~ok|k==[] then
            he.ForegroundColor=[1 0 0];
            return
        else
            he.ForegroundColor=[0 0 0];
            hl.value=k
        end
    else
        hl=gcbo //handle on the list area
        he=ud(2) //handle on the edit area
        he.string=sci2exp(WT(hl.value),0)
    end

    ud=hl.userdata
    Handles=ud(1)
    k=hl.value
    if and(k<>[5 6 7]) then
        Handles.visible="off"
    else
        label=Handles(1)
        value=Handles(2)
        scroll=Handles(3)

        if k==5 then //Kaiser
            label.string="Beta"
            label.visible="on";
            value.visible="on";

            init=2.5;fact=100;
            value.string=string(init)
            scroll.min=0
            scroll.max=10*fact
            scroll.value=init*fact
            d=scroll.userdata;d(2)=fact
            set(scroll,"userdata",d)
            scroll.visible="on";
        elseif k==6 then //Chebychev, main lobe constraint df in [0 0.5]
            label.string=_("Window main lobe width")
            label.visible="on";
            value.visible="on";
            init=0.2;fact=1000;
            value.string=string(init)
            scroll.min=1d-10*fact
            scroll.max=0.5*fact
            scroll.value=init*fact
            d=scroll.userdata;d(2)=fact
            set(scroll,"userdata",d)
            scroll.visible="on";

        elseif k==7 then //Chebychev, side lobe constraint dp>0
            label.string=_("maximum side-lobe height")
            label.visible="on";
            value.visible="on";
            init=0.001;fact=1000;
            value.string=string(init)
            scroll.min=1d-10*fact
            scroll.max=1*fact
            scroll.value=init*fact
            d=scroll.userdata;d(2)=fact
            set(scroll,"userdata",d)
            scroll.visible="on";
        end
    end
    wfirUpdate(gcbo)
endfunction

function wfirSetFilterView()
    h=gcbo //handle on the view check box
    if h.value==0 //disable
        fig=h.userdata
        execstr("delete(fig)","errcatch")
        h.userdata=[]
    else //enable
        nwin=size(winsid(),"*")
        if nwin==0 then win=1;else win=max(winsid())+1;end
        fig=scf(win)
        a=gca();
        a.x_label.text=_("frequency (Hz)")
        a.y_label.text=_("Magnitude (dB)")
        a.axes_visible="on"
        a.grid=ones(1,2)*color("gray");
        xpoly([],[])
        set(h,"userdata",fig)
        clearglobal idle
        wfirUpdate(gcbo)
    end
endfunction

function wfirSetSamplingFrequency()
    Sfreq=gcbo
    ok=execstr("newfreq="+Sfreq.string,"errcatch")==0
    ok=ok&newfreq>0

    if ok then
        Sfreq.ForegroundColor=[0 0 0];
        curfreq=Sfreq.userdata
        gui=gcbo.parent
        H=gui.userdata
        //H=[Fview,Filtertype,Windowtype,Forderv,Forders,Lcfv,Lcfs,Hcfv,Hcfs,Fpv,Fps,Sfreq,Ftv,Wtv]
        //update low and high cutoff frequencies
        r=newfreq/curfreq
        Lcfv=H(6),Lcfs=H(7),Hcfv=H(8),Hcfs=H(9)

        Lcfs.min=Lcfs.min*r
        Lcfs.max=Lcfs.max*r
        Lcfs.value=Lcfs.value*r
        Lcfv.string=string(evstr(Lcfv.string)*r)

        Hcfs.min=Hcfs.min*r
        Hcfs.max=Hcfs.max*r
        Hcfs.value=Hcfs.value*r
        Hcfv.string=string(evstr(Hcfv.string)*r)

        Sfreq.userdata=newfreq
        wfirUpdate(gcbo)
    else
        Sfreq.ForegroundColor=[1 0 0];
    end

endfunction

function [ftype,forder,low,high,wtype,fpar,freq_ech]=wfirGetFilterParameters(H)
    //  low,high,freq_ech are returned in Hz
    //H=[Fview,Filtertype,Windowtype,Forderv,Forders,Lcfv,Lcfs,Hcfv,Hcfs,Fpv,Fps,Sfreq,Ftv,Wtv]
    FT=["lp","hp","bp","sb"]
    WT=["re","tr","hn","hm","kr","ch","ch"]
    Filtertype=H(2);
    Windowtype=H(3);
    Forderv=H(4);
    Lcfv=H(6);
    Hcfv=H(8);
    Fpv=H(10);
    Sfreq=H(12)
    ftype=FT(Filtertype.value)
    wtype=WT(Windowtype.value)
    forder=evstr(Forderv.string)
    if or(ftype==["hp" "sb"]) then
        //force odd ordrer
        if 2*int(forder/2)==forder then forder=forder+1,end
    end
    freq_ech=evstr(Sfreq.string)
    if ftype=="lp" then
        low=evstr(Lcfv.string)
        high=0
    elseif ftype=="hp" then
        low=evstr(Hcfv.string)
        high=0
    else
        low=evstr(Lcfv.string)
        high=evstr(Hcfv.string)
    end
    if Windowtype.value==5 //Kaiser
        fpar=[evstr(Fpv.string) 0]
    elseif Windowtype.value==6 //Chebychev, main lobe constraint df in [0 0.5]
        fpar=[-1 evstr(Fpv.string)]
    elseif Windowtype.value==7  //Chebychev, side lobe constraint dp>0
        fpar=[evstr(Fpv.string) -1]
    else
        fpar=[-1 -1]
    end
endfunction

function  wfirUpdate(h)
    global idle
    if ~idle then return,end
    idle=%f
    gui=h.parent
    H=gui.userdata
    //  H=[Fview,Filtertype,Windowtype,Forderv,Forders,Lcfv,Lcfs,Hcfv,Hcfs,Fpv,Fps,Sfreq,Ftv,Wtv]
    if H(1).value==1 then
        old=gcf()
        [ftype,forder,low,high,wtype,fpar,freq_ech]= ...
        wfirGetFilterParameters(H)
        cfreq=[low,high]/freq_ech;
        [filt,wfm,fr]=wfir(ftype,forder,cfreq,wtype,fpar);
        fig=H(1).userdata
        if ~is_handle_valid(fig) then
            //the window has been closed by user
            fig=scf(max(winsid())+1)
            a=gca();
            a.x_label.text=_("frequency (Hz)")
            a.y_label.text=_("Magnitude (dB)")
            a.axes_visible="on"
            a.grid=ones(1,2)*color("gray");
            xpoly([],[])
            set(H(1),"userdata",fig)
        end
        eps=1d-6;
        frq=linspace(eps,0.5-eps,10*size(filt,"*"))
        [frq,repf]=repfreq(syslin("d",poly(filt,"z","c"),1),frq)
        scf(fig);drawlater()
        a=gca();p=a.children
        frq=frq(:)*freq_ech
        m=20*log10(abs(repf(:)))
        a.data_bounds=[min(frq) min(m);max(frq) max(m)]
        p.data=[frq m];
        drawnow()
        scf(old)
        clearglobal idle
    end
endfunction

function exprs= wfirGetFilterExprs(H)
    // H=[Fview,Filtertype,Windowtype,Forderv,Forders,Lcfv,Lcfs,Hcfv,Hcfs,Fpv,Fps,Sfreq,Ftv,Wtv]
    FT=["lp","hp","bp","sb"]
    WT=["re","tr","hn","hm","kr","ch","ch"]
    Filtertype=H(2);
    Windowtype=H(3);
    Forderv=H(4);
    Lcfv=H(6);
    Hcfv=H(8);
    Fpv=H(10);
    Sfreq=H(12)
    exprs=[Ftv.string;
    Wtv.string;
    Forderv.string;
    Sfreq.string;
    Lcfv.string
    Hcfv.string;
    Fpv.string]
endfunction
