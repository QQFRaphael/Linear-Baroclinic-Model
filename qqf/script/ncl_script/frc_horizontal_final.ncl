load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/calendar_decode2.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


fff = addfile("../all_nc/frc.nc", "r")
v = fff->v

vv = v * 1E11
copy_VarMeta(v, vv)


res = True
res@gsnMaximize=True
res@gsnDraw = False
res@gsnFrame = False
res@vpWidthF      = 0.4
res@vpHeightF     = 0.6

res@gsnLeftString=""
res@gsnRightString=""
res@tiMainString=""

;res@mpCenterLonF=180
res@mpMinLatF=0
res@mpMaxLatF=80

res@mpMinLonF=60
res@mpMaxLonF=170

res@mpFillOn = False

res@cnLinesOn = True
res@cnFillOn = True
res@cnInfoLabelOn = False

res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels=fspan(0.5, 3, 6)
res@cnFillColors=(/0,18,34,50,66,82,98,114/)


res@tmXBLabelFontHeightF=0.005
res@tmYLLabelFontHeightF=0.005


resp = True
resp@gsLineColor      = "gray" ; polylines color
resp@gsLineThicknessF = 2    ; polylines thickness
f=asciiread("tibet_shape",(/2066,2/),"float")


wks = gsn_open_wks("eps", "frc_horizontal")
gsn_define_colormap(wks,"MPL_Oranges")

map = gsn_csm_contour_map(wks, vv(0,0,:,:), res)

poli=gsn_add_polyline(wks,map,f(:,0),f(:,1),resp)


draw(map)
frame(wks)

