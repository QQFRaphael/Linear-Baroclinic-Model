load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/calendar_decode2.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

datafile = addfile("../all_nc/linear.t42l20.qqf.nc","r")

f_time = datafile->time
f_lat  = datafile->lat
f_lon  = datafile->lon
f_lev  = datafile->lev
f_z    = datafile->z
f_u    = datafile->u
f_v    = datafile->v

level = 700
mylev = ind(f_lev.eq.level)
mylat = ind(f_lat.ge.-30.and.f_lat.le.90)

z = dim_avg_n_Wrap(f_z(15:19,mylev,mylat,:),0)
u = dim_avg_n_Wrap(f_u(15:19,mylev,mylat,:),0)
v = dim_avg_n_Wrap(f_v(15:19,mylev,mylat,:),0)

ntime = dimsizes(f_time)

res = True
res@gsnDraw=False
res@gsnFrame=False
res@gsnSpreadColors=True
res@gsnAddCyclic=True


res@cnFillOn=True
res@cnLinesOn=False
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels=fspan(-3, 3, 13)
;res@cnLevels=(/-16,-8,-4,-2,0,2,4,8,16/)
;;;res@cnLevels=(/-140,-105,-70,-35,0,35,70,105,140/)  ;(/-4,-3,-2,-1,0,1,2,3,4/)
;res@cnLevels=(/-20,-15,-10,-5,0,5,10,15,20/)
;res@cnLevels=(/-80,-60,-40,-20,0,20,40,60,80/)
;res@cnFillColors=(/2,4,6,8,0,0,13,15,17,19/)


res@lbOrientation="Vertical"

res@gsnMaximize=True
res@vpWidthF      = 0.4
res@vpHeightF     = 0.6

res@gsnLeftString=""
res@gsnRightString=""
res@tiMainString=""

;res@mpCenterLonF=180
res@mpMinLatF=0
res@mpMaxLatF=60
res@mpMinLonF=60
res@mpMaxLonF=150

res@tmXBLabelFontHeightF=0.01
res@tmYLLabelFontHeightF=0.01
res@gsnRightStringFontHeightF=8


resp = True
resp@gsLineColor      = "black" ; polylines color
resp@gsLineThicknessF = 2    ; polylines thickness
f=asciiread("tibet_shape",(/2066,2/),"float")


resvc                  = True                      ; plot mods desired
resvc@gsnDraw=False
resvc@gsnFrame=False

resvc@gsnLeftString=""
resvc@gsnRightString=""

resvc@vcMinDistanceF=0.018

resvc@vcRefMagnitudeF  = 0.5
resvc@vcRefLengthF     = 0.015

resvc@vcGlyphStyle="LineArrow"
resvc@vcLineArrowThicknessF=2.6

resvc@vcRefAnnoOn               = True
resvc@vcRefAnnoString1          = "0.5"
resvc@vcRefAnnoSide             = "Top"
resvc@vcRefAnnoString2On        = False
resvc@vcRefAnnoPerimOn          = False
resvc@vcRefAnnoOrthogonalPosF   = -0.09
resvc@vcRefAnnoParallelPosF     = 0.999
resvc@vcRefAnnoBackgroundColor  = "green"
resvc@vcVectorDrawOrder         = "PostDraw"

;spd = wind_speed(u,v)
;u = mask(u, spd.le.0.1, False)
;v = mask(v, spd.le.0.1, False)

wks = gsn_open_wks("png", "700")
gsn_define_colormap(wks,"BlueDarkRed18")

map = gsn_csm_contour_map(wks, z, res)
map1 = gsn_csm_vector(wks,u,v,resvc)
overlay(map,map1)

poli=gsn_add_polyline(wks,map,f(:,0),f(:,1),resp)

draw(map)
frame(wks)

