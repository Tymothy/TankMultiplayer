///Display Properties
//randomize();

curWindowWidth = os_browser == browser_not_a_browser ? BASE_W * 2 : browser_width;
curWindowHeight = os_browser == browser_not_a_browser ? BASE_H * 2 : browser_height;
display_set_gui_size(curWindowWidth, curWindowHeight)
window_set_size(curWindowWidth, curWindowHeight);
surface_resize(application_surface, curWindowWidth, curWindowHeight);
camera_set_view_size(VIEW, curWindowWidth / 2, curWindowHeight / 2);

zoomLevel = 4;

updateViewSize = function(){
  var _ww = os_browser == browser_not_a_browser ? WIN_W : browser_width;
  var _wh = os_browser == browser_not_a_browser ? WIN_H : browser_height;
  display_set_gui_size(_ww, _wh)
  window_set_size(_ww, _wh);
  surface_resize(application_surface, _ww, _wh);
  //camera_set_view_size(VIEW, (_ww / 2)* zoomLevel, (_wh / 2) * zoomLevel);
  curWindowWidth = _ww;
  curWindowHeight = _wh;
}

alarm[0] = 1;


view_w_half = camera_get_view_width(VIEW)*0.5;
view_h_half = camera_get_view_height(VIEW)*0.5;

xTo = 0;
yTo = 0;
xOld = 0;
yOld = 0;