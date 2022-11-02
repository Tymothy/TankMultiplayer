// Generated at 2022-10-25 11:38:39 (438ms) for v2.3.1+
/// @lint nullToAny true
// Feather disable all

function room_pack_store_instances(l_list){
	/// room_pack_store_instances(list:ds_list<instance>)
	/// @param {ds_list<instance>} list
	/// @returns {void}
	room_pack_raw_store_instances=l_list;
}

function room_pack_store_tilemaps(l_list,l_ext){
	/// room_pack_store_tilemaps(list:ds_list<tilemap>, ext:bool = false)
	/// @param {ds_list<tilemap>} list
	/// @param {bool} [ext=false]
	/// @returns {void}
	if(l_ext==undefined)l_ext=false;
	if(false)show_debug_message(argument[1]);
	room_pack_raw_store_tilemaps=l_list;
	room_pack_raw_store_tilemaps_ext=l_ext;
}

function room_pack_store_backgrounds(l_list){
	/// room_pack_store_backgrounds(list:ds_list<layer_background>)
	/// @param {ds_list<layer_background>} list
	/// @returns {void}
	room_pack_raw_store_backgrounds=l_list;
}

function room_pack_store_sprites(l_list){
	/// room_pack_store_sprites(list:ds_list<layer_sprite>)
	/// @param {ds_list<layer_sprite>} list
	/// @returns {void}
	room_pack_raw_store_sprites=l_list;
}

function room_pack_include_layer(l_name){
	/// room_pack_include_layer(name:string)
	/// @param {string} name
	/// @returns {void}
	room_pack_raw_include_layers_on=true;
	room_pack_raw_include_layers[?l_name]=true;
}

function room_pack_exclude_layer(l_name){
	/// room_pack_exclude_layer(name:string)
	/// @param {string} name
	/// @returns {void}
	room_pack_raw_exclude_layers[?l_name]=true;
}

function room_pack_load_map(l_map,l_x,l_y,l_flags){
	/// room_pack_load_map(map:any, x:number = 0, y:number = 0, flags:RoomPackBitFlags = 46)
	/// @param {any} map
	/// @param {number} [x=0]
	/// @param {number} [y=0]
	/// @param {RoomPackBitFlags} [flags=46]
	/// @returns {void}
	if(l_x==undefined)l_x=0;
	if(l_y==undefined)l_y=0;
	if(l_flags==undefined)l_flags=46;
	if(false)show_debug_message(argument[3]);
	room_pack_raw_apply_settings=(l_flags&1)!=0;
	room_pack_raw_apply_instances=(l_flags&2)!=0;
	room_pack_raw_apply_backgrounds=(l_flags&4)!=0;
	room_pack_raw_apply_tiles=(l_flags&8)!=0;
	room_pack_raw_apply_views=(l_flags&16)!=0;
	room_pack_raw_room_x=l_x;
	room_pack_raw_room_y=l_y;
	room_pack_raw_apply_sprites=(l_flags&32)!=0;
	room_pack_raw_run_impl2(l_map);
	room_pack_raw_store_tilemaps=undefined;
	room_pack_raw_store_backgrounds=undefined;
	room_pack_raw_store_sprites=undefined;
	ds_map_clear(room_pack_raw_include_layers);
	room_pack_raw_include_layers_on=false;
	ds_map_clear(room_pack_raw_exclude_layers);
	room_pack_raw_store_instances=undefined;
}

function room_pack_load_string(l_str,l_x,l_y,l_flags){
	/// room_pack_load_string(str:string, x:number = 0, y:number = 0, flags:RoomPackBitFlags = 46)->bool
	/// @param {string} str
	/// @param {number} [x=0]
	/// @param {number} [y=0]
	/// @param {RoomPackBitFlags} [flags=46]
	/// @returns {bool}
	if(l_x==undefined)l_x=0;
	if(l_y==undefined)l_y=0;
	if(l_flags==undefined)l_flags=46;
	if(false)show_debug_message(argument[3]);
	var l_raw1=json_decode(l_str);
	if(l_raw1==-1)return false;
	room_pack_load_map(l_raw1,l_x,l_y,l_flags);
	ds_map_destroy(l_raw1);
	return true;
}

function room_pack_load_file(l_path1,l_x,l_y,l_flags){
	/// room_pack_load_file(path:string, x:number = 0, y:number = 0, flags:RoomPackBitFlags = 46)->bool
	/// @param {string} path
	/// @param {number} [x=0]
	/// @param {number} [y=0]
	/// @param {RoomPackBitFlags} [flags=46]
	/// @returns {bool}
	if(l_x==undefined)l_x=0;
	if(l_y==undefined)l_y=0;
	if(l_flags==undefined)l_flags=46;
	if(false)show_debug_message(argument[3]);
	if(file_exists(l_path1)){
		var l_buf=buffer_load(l_path1);
		if(l_buf==-1)return false;
		var l_z=room_pack_load_string(buffer_read(l_buf,buffer_string),l_x,l_y,l_flags);
		buffer_delete(l_buf);
		return l_z;
	} else return false;
}

function Std_stringify(l_value){
	// Std_stringify(value:any)->string
	if(l_value==undefined)return "null";
	if(is_string(l_value))return l_value;
	var l_n,l_i,l_s;
	if(is_struct(l_value)){
		var l_e=l_value[$"__enum__"];
		if(l_e==undefined)return string(l_value);
		var l_ects=l_e.constructors;
		if(l_ects!=undefined){
			l_i=l_value.__enumIndex__;
			if(l_i>=0&&l_i<array_length(l_ects))l_s=l_ects[l_i]; else l_s="?";
		} else {
			l_s=instanceof(l_value);
			if(string_copy(l_s,1,3)=="mc_")l_s=string_delete(l_s,1,3);
			l_n=string_length(l_e.name);
			if(string_copy(l_s,1,l_n)==l_e.name)l_s=string_delete(l_s,1,l_n+1);
		}
		l_s+="(";
		var l_fields=l_value.__enumParams__;
		l_n=array_length(l_fields);
		for(l_i=-1;++l_i<l_n;l_s+=Std_stringify(l_value[$ l_fields[l_i]])){
			if(l_i>0)l_s+=", ";
		}
		return l_s+")";
	}
	if(is_real(l_value)){
		l_s=string_format(l_value,0,16);
		if(os_browser!=browser_not_a_browser){
			l_n=string_length(l_s);
			l_i=l_n;
			while(l_i>0){
				switch(string_ord_at(l_s,l_i)){
					case 48:
						l_i--;
						continue;
					case 46:l_i--;break;
				}
				break;
			}
		} else {
			l_n=string_byte_length(l_s);
			l_i=l_n;
			while(l_i>0){
				switch(string_byte_at(l_s,l_i)){
					case 48:
						l_i--;
						continue;
					case 46:l_i--;break;
				}
				break;
			}
		}
		return string_copy(l_s,1,l_i);
	}
	return string(l_value);
}

function gml_NativeTypeHelper_isNumber(l_v){
	// gml_NativeTypeHelper_isNumber(v:any)->bool
	return (is_real(l_v)||is_bool(l_v)||is_int32(l_v))||is_int64(l_v);
}

function room_pack_raw_run_cc(l_ccRaw,l_ccPath){
	// room_pack_raw_run_cc(ccRaw:string, ccPath:string)
	var l_scr=room_pack_eval_script;
	if(is_method(l_scr))l_scr=method_get_index(l_scr);
	script_execute(l_scr,l_ccRaw,l_ccPath);
}

function room_pack_raw_init_physics(l_phs){
	// room_pack_raw_init_physics(phs:live_yy_YyRoomPhySettings)
	if(l_phs==undefined)return 0;
	if(l_phs[?"PhysicsWorld"]){
		room_pack_raw_use_physics=true;
		physics_world_create(l_phs[?"PhysicsWorldPixToMeters"]);
		physics_world_gravity(l_phs[?"PhysicsWorldGravityX"],l_phs[?"PhysicsWorldGravityY"]);
	} else room_pack_raw_use_physics=false;
}

function room_pack_raw_anim_speed(l_val,l_type){
	// room_pack_raw_anim_speed(val:number, type:string)->number
	if(l_type=="0")return l_val/room_speed; else return l_val;
}

function room_pack_raw_run_yy_inst_cc(l_inst,l_qinst){
	// room_pack_raw_run_yy_inst_cc(inst:instance, qinst:live_yy_YyRoomInstance)
	with (l_inst) {
		var l_rname=l_qinst[?"name"];
		event_perform(14,0);
		var l_rcc=l_qinst[?"propertyCode"];
		if(l_rcc!=undefined&&l_rcc!="")room_pack_raw_run_cc(l_rcc,l_rname+":Properties");
		event_perform(ev_create,0);
		l_rcc=l_qinst[?"creationCode"];
		if(l_rcc!=undefined&&l_rcc!="")room_pack_raw_run_cc(l_rcc,l_rname+":CreationCode");
	}
}

function room_pack_raw_add_layer(l_ql){
	// room_pack_raw_add_layer(ql:live_yy_YyRoomLayer)
	var l_ql_depth=l_ql[?"depth"];
	var l_ql_name=l_ql[?"name"];
	if(room_pack_raw_include_layers_on&&!ds_map_exists(room_pack_raw_include_layers,l_ql_name))return 0;
	if(ds_map_exists(room_pack_raw_exclude_layers,l_ql_name))return 0;
	var l_ql_sublayers=l_ql[?"layers"];
	var l_ql_sublayer_index,l_rl,l_i,l_n,l_f,l_s,l_aval,l_rx,l_ry;
	var l__g=l_ql[?"modelName"];
	if(l__g==undefined){
		show_debug_message("Unknown layer type "+Std_stringify(l_ql[?"modelName"]));
	} else switch(l__g){
		case "GMRLayer":
			l_rl=layer_get_id(l_ql_name);
			if(l_rl==-1){
				l_rl=layer_create(l_ql_depth,l_ql_name);
				if(l_ql[?"visible"]!=undefined)layer_set_visible(l_rl,l_ql[?"visible"]);
			}
			if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
				l_ql_sublayer_index=0;
				repeat (ds_list_size(l_ql_sublayers)) {
					room_pack_raw_add_layer(l_ql_sublayers[|l_ql_sublayer_index]);
					l_ql_sublayer_index++;
				}
			}
			break;
		case "GMRBackgroundLayer":
			if(room_pack_raw_apply_backgrounds){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(l_ql[?"visible"]!=undefined)layer_set_visible(l_rl,l_ql[?"visible"]);
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					repeat (ds_list_size(l_ql_sublayers)) {
						room_pack_raw_add_layer(l_ql_sublayers[|l_ql_sublayer_index]);
						l_ql_sublayer_index++;
					}
				}
				var l_qb=l_ql;
				l_s=l_qb[?"sprite"];
				var l_rb=layer_background_create(l_rl,(l_s!=undefined?asset_get_index(l_s):-1));
				l_aval=l_qb[?"color"];
				if(l_aval<0)l_aval+=4294967296.;
				if(l_aval!=undefined){
					layer_background_blend(l_rb,(l_aval&16777215));
					layer_background_alpha(l_rb,((l_aval>>24)/255));
				}
				l_aval=l_qb[?"htiled"];
				if(l_aval!=undefined)layer_background_htiled(l_rb,l_aval); else layer_background_htiled(l_rb,true);
				l_aval=l_qb[?"vtiled"];
				if(l_aval!=undefined)layer_background_vtiled(l_rb,l_aval); else layer_background_vtiled(l_rb,true);
				l_aval=l_qb[?"stretch"];
				if(l_aval!=undefined)layer_background_stretch(l_rb,l_aval); else layer_background_stretch(l_rb,false);
				l_aval=l_qb[?"animationFPS"];
				if(l_aval!=undefined)layer_background_speed(l_rb,room_pack_raw_anim_speed(l_aval,l_qb[?"animationSpeedType"]));
				l_aval=l_qb[?"x"];
				if(l_aval==undefined)l_aval=0;
				layer_x(l_rl,room_pack_raw_room_x+l_aval);
				l_aval=l_qb[?"y"];
				if(l_aval==undefined)l_aval=0;
				layer_y(l_rl,room_pack_raw_room_y+l_aval);
				var l_list=room_pack_raw_store_backgrounds;
				if(l_list!=undefined)ds_list_add(l_list,l_rb);
			}
			break;
		case "GMRTileLayer":
			if(room_pack_raw_apply_tiles){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(l_ql[?"visible"]!=undefined)layer_set_visible(l_rl,l_ql[?"visible"]);
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					repeat (ds_list_size(l_ql_sublayers)) {
						room_pack_raw_add_layer(l_ql_sublayers[|l_ql_sublayer_index]);
						l_ql_sublayer_index++;
					}
				}
				var l_qt=l_ql;
				var l_qtt=l_qt[?"tiles"];
				var l_qtb64=l_qtt[?"TileSerialiseDataZL"];
				var l_qtw=l_qtt[?"SerialiseWidth"];
				var l_qth=l_qtt[?"SerialiseHeight"];
				var l_tileset1=(is_string(l_qt[?"tileset"])?asset_get_index(l_qt[?"tileset"]):-1);
				var l_rx=0;
				var l_ry=0;
				var l_rt=undefined;
				var l_checkEmpty=false;
				if(room_pack_reuse_tilemaps){
					var l_els=layer_get_all_elements(l_rl);
					var l_eln=array_length(l_els);
					for(var l_eli=0;l_eli<l_eln;l_eli++){
						if(layer_get_element_type(l_els[l_eli])==5){
							l_checkEmpty=true;
							l_rt=l_els[l_eli];
							l_rx=((room_pack_raw_room_x+l_qt[?"x"]-tilemap_get_x(l_rt)) div tilemap_get_tile_width(l_rt));
							l_ry=((room_pack_raw_room_y+l_qt[?"y"]-tilemap_get_y(l_rt)) div tilemap_get_tile_height(l_rt));
							break;
						}
					}
				}
				if(l_rt==undefined)l_rt=layer_tilemap_create(l_rl,room_pack_raw_room_x+l_qt[?"x"],room_pack_raw_room_y+l_qt[?"y"],l_tileset1,l_qtw,l_qth);
				if(is_string(l_qtb64)){
					var l_qtbz=buffer_base64_decode(l_qtb64);
					if(l_qtbz==-1)throw string("Couldn't decode base64-decoded data");
					var l_qtb=buffer_decompress(l_qtbz);
					if(l_qtb==-1)throw string("Couldn't decompress ZLIB-compressed tile data");
					var l_qti=0;
					var l_y=0;
					for(var l__g1=l_qth;l_y<l__g1;l_y++){
						var l_x=0;
						var l__g3=l_qtw;
						while(l_x<l__g3){
							var l_td=buffer_peek(l_qtb,l_qti*4,buffer_u32);
							l_qti++;
							if(tile_get_empty(l_td)){
								if(l_checkEmpty){
									l_x++;
									continue;
								}
								l_td=0;
							}
							tilemap_set(l_rt,l_td,l_rx+l_x,l_ry+l_y);
							l_x++;
						}
					}
					buffer_delete(l_qtbz);
					buffer_delete(l_qtb);
				} else {
					var l_qtd=l_qtt[?"TileSerialiseData"];
					var l_qti=0;
					var l_y=0;
					for(var l__g1=l_qth;l_y<l__g1;l_y++){
						var l_x=0;
						var l__g3=l_qtw;
						while(l_x<l__g3){
							var l_td=l_qtd[|l_qti++];
							if(tile_get_empty(l_td)){
								if(l_checkEmpty){
									l_x++;
									continue;
								}
								l_td=0;
							}
							tilemap_set(l_rt,l_td,l_rx+l_x,l_ry+l_y);
							l_x++;
						}
					}
				}
				var l_tms=room_pack_raw_store_tilemaps;
				if(l_tms!=undefined){
					if(room_pack_raw_store_tilemaps_ext)ds_list_add(l_tms,[l_rt,l_rl]); else ds_list_add(l_tms,l_rt);
				}
			}
			break;
		case "GMRInstanceLayer":
			if(room_pack_raw_apply_instances){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(l_ql[?"visible"]!=undefined)layer_set_visible(l_rl,l_ql[?"visible"]);
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					repeat (ds_list_size(l_ql_sublayers)) {
						room_pack_raw_add_layer(l_ql_sublayers[|l_ql_sublayer_index]);
						l_ql_sublayer_index++;
					}
				}
				var l_qi=l_ql;
				l_rx=room_pack_raw_room_x;
				l_ry=room_pack_raw_room_y;
				var l_instances=l_qi[?"instances"];
				l_n=ds_list_size(l_instances);
				var l_base=room_pack_blank_object;
				if(l_n!=0){
					if(!object_exists(l_base))throw string("Please add a blank object and set room_pack_blank_object to point at it prior to loading.");
				}
				var l_lco=room_pack_raw_object_cache;
				l_i=l_n;
				while(--l_i>=0){
					var l_qinst=l_instances[|l_i];
					var l_rnext=instance_create_layer((l_rx+l_qinst[?"x"]),(l_ry+l_qinst[?"y"]),l_rl,l_base);
					var l_qid=l_qinst[?"name"];
					room_pack_raw_inst_map_yy[?l_qid]=l_qinst;
					room_pack_raw_inst_map_gml[?l_qid]=l_rnext;
					with (l_rnext) {
						room_pack_const_script(l_qinst[?"name"],self);
						l_aval=l_qinst[?"rotation"];
						if(l_aval!=undefined)self.image_angle=l_aval;
						l_aval=l_qinst[?"scaleX"];
						if(l_aval!=undefined)self.image_xscale=l_aval;
						l_aval=l_qinst[?"scaleY"];
						if(l_aval!=undefined)self.image_yscale=l_aval;
						l_aval=l_qinst[?"imageIndex"];
						if(l_aval!=undefined)self.image_index=l_aval;
						l_aval=l_qinst[?"imageSpeed"];
						if(l_aval!=undefined)self.image_speed=l_aval;
						l_f=l_qinst[?"color"];
						if(l_f<0)l_f+=4294967296.;
						if(l_f!=undefined){
							self.image_blend=(l_f&16777215);
							self.image_alpha=(l_f>>24)/255;
						}
						l_s=l_qinst[?"obj"];
						var l_id=l_lco[?l_s];
						if(l_id==undefined){
							l_id=asset_get_index(l_s);
							l_lco[?l_s]=l_id;
						}
						instance_change(l_id,false);
						var l_list=room_pack_raw_store_instances;
						if(l_list!=undefined)ds_list_add(l_list,self);
					}
				}
			}
			break;
		case "GMRAssetLayer":
			if(room_pack_raw_apply_sprites){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(l_ql[?"visible"]!=undefined)layer_set_visible(l_rl,l_ql[?"visible"]);
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					repeat (ds_list_size(l_ql_sublayers)) {
						room_pack_raw_add_layer(l_ql_sublayers[|l_ql_sublayer_index]);
						l_ql_sublayer_index++;
					}
				}
				var l_sprites=l_ql[?"assets"];
				l_n=ds_list_size(l_sprites);
				var l_lcs=room_pack_raw_sprite_cache;
				l_rx=room_pack_raw_room_x;
				l_ry=room_pack_raw_room_y;
				l_i=-1;
				while(++l_i<l_n){
					var l_qspr=l_sprites[|l_i];
					l_s=l_qspr[?"sprite"];
					var l_rspr=l_rx+l_qspr[?"x"];
					var l_rspr1=l_ry+l_qspr[?"y"];
					var l_id=l_lcs[?l_s];
					if(l_id==undefined){
						l_id=asset_get_index(l_s);
						l_lcs[?l_s]=l_id;
					}
					var l_rspr2=layer_sprite_create(l_rl,l_rspr,l_rspr1,l_id);
					l_aval=l_qspr[?"frameIndex"];
					if(l_aval!=undefined)layer_sprite_index(l_rspr2,l_aval);
					l_aval=l_qspr[?"scaleX"];
					if(l_aval!=undefined)layer_sprite_xscale(l_rspr2,l_aval);
					l_aval=l_qspr[?"scaleY"];
					if(l_aval!=undefined)layer_sprite_yscale(l_rspr2,l_aval);
					l_aval=l_qspr[?"rotation"];
					if(l_aval!=undefined)layer_sprite_angle(l_rspr2,l_aval);
					l_f=l_qspr[?"color"];
					if(l_f<0)l_f+=4294967296.;
					if(l_f!=undefined){
						layer_sprite_blend(l_rspr2,(l_f&16777215));
						layer_sprite_alpha(l_rspr2,((l_f>>24)/255));
					}
					if(l_qspr[?"animationFPS"]!=undefined)layer_sprite_speed(l_rspr2,room_pack_raw_anim_speed(l_qspr[?"animationFPS"],l_qspr[?"animationSpeedType"]));
					var l_list=room_pack_raw_store_sprites;
					if(l_list!=undefined)ds_list_add(l_list,l_rspr2);
				}
			}
			break;
		case "GMREffectLayer":
			if(room_pack_raw_apply_filters){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(l_ql[?"visible"]!=undefined)layer_set_visible(l_rl,l_ql[?"visible"]);
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					repeat (ds_list_size(l_ql_sublayers)) {
						room_pack_raw_add_layer(l_ql_sublayers[|l_ql_sublayer_index]);
						l_ql_sublayer_index++;
					}
				}
				var l_fxl=l_ql;
				l_s=l_fxl[?"effectType"];
				if(l_s==undefined||l_s==pointer_null)return 0;
				var l_fx1=fx_create(l_s);
				var l__g_list=l_fxl[?"properties"];
				var l__g_index=0;
				while(l__g_index<ds_list_size(l__g_list)){
					var l_pp=l__g_list[|l__g_index++];
					switch(l_pp[?"type"]){
						case 1:
							l_s=l_pp[?"value"];
							if(string_ord_at(l_s,1)!=35)continue;
							l_f=real(int64(ptr(string_delete(l_s,1,1))));
							if(l_f<0)l_f+=4294967296.;
							fx_set_parameter(l_fx1,l_pp[?"name"],l_f%256/255,(l_f/256|0)%256/255,(l_f/65536|0)%256/255,(l_f/16777216|0)/255);
							break;
						case 0:
							l_f=real(l_pp[?"value"]);
							fx_set_parameter(l_fx1,l_pp[?"name"],l_f);
							break;
						case 2:
							l_s=l_pp[?"value"];
							if(l_s==undefined||l_s==pointer_null)continue;
							l_f=asset_get_index(l_s);
							if(l_f!=-1)fx_set_parameter(l_fx1,l_pp[?"name"],l_f);
							break;
					}
				}
				layer_set_fx(l_rl,l_fx1);
			}
			break;
		case "GMRPathLayer":break;
		default:show_debug_message("Unknown layer type "+Std_stringify(l_ql[?"modelName"]));
	}
}

function room_pack_raw_run_impl2(l_rm){
	// room_pack_raw_run_impl2(rm:live_yy_YyRoom)
	ds_map_clear(room_pack_raw_inst_map_gml);
	ds_map_clear(room_pack_raw_inst_map_yy);
	if(room_pack_raw_apply_settings){
		room_width=l_rm[?"roomSettings"][?"Width"];
		room_height=l_rm[?"roomSettings"][?"Height"];
		room_pack_raw_init_physics(l_rm[?"physicsSettings"]);
	}
	var l_aval;
	if(room_pack_raw_apply_views){
		l_aval=l_rm[?"viewSettings"][?"enableViews"];
		if(l_aval!=undefined)view_enabled=l_aval; else view_enabled=false;
		var l_qvs=l_rm[?"views"];
		if(l_qvs!=undefined){
			var l_i=0;
			for(var l__g1=ds_list_size(l_qvs);l_i<l__g1;l_i++){
				var l_qv=l_qvs[|l_i];
				if(l_qv==undefined)continue;
				var l_rv=l_i;
				l_aval=l_qv[?"visible"];
				if(l_aval!=undefined)view_visible[l_rv]=l_aval; else view_visible[l_rv]=false;
				l_aval=l_qv[?"xport"];
				if(l_aval!=undefined)view_xport[l_rv]=l_aval; else view_xport[l_rv]=0;
				l_aval=l_qv[?"yport"];
				if(l_aval!=undefined)view_yport[l_rv]=l_aval; else view_yport[l_rv]=0;
				l_aval=l_qv[?"wport"];
				if(l_aval!=undefined)view_wport[l_rv]=l_aval; else view_wport[l_rv]=1024;
				l_aval=l_qv[?"hport"];
				if(l_aval!=undefined)view_hport[l_rv]=l_aval; else view_hport[l_rv]=768;
				var l_rc=view_camera[l_rv];
				var l_vx,l_vy;
				l_vx=l_qv[?"xview"];
				if(l_vx==undefined)l_vx=0;
				l_vy=l_qv[?"yview"];
				if(l_vy==undefined)l_vy=0;
				camera_set_view_pos(l_rc,room_pack_raw_room_x+l_vx,room_pack_raw_room_y+l_vy);
				l_vx=l_qv[?"wview"];
				if(l_vx==undefined)l_vx=1024;
				l_vy=l_qv[?"hview"];
				if(l_vy==undefined)l_vy=768;
				camera_set_view_size(l_rc,l_vx,l_vy);
				l_aval=l_qv[?"obj"];
				if(l_aval!=undefined)camera_set_view_target(l_rc,asset_get_index(l_aval));
				l_vx=l_qv[?"hspeed"];
				if(l_vx==undefined)l_vx=-1;
				l_vy=l_qv[?"vspeed"];
				if(l_vy==undefined)l_vy=-1;
				camera_set_view_speed(l_rc,l_vx,l_vy);
				l_vx=l_qv[?"hborder"];
				if(l_vx==undefined)l_vx=32;
				l_vy=l_qv[?"vborder"];
				if(l_vy==undefined)l_vy=32;
				camera_set_view_border(l_rc,l_vx,l_vy);
			}
		}
	}
	var l_lrs=l_rm[?"layers"];
	var l_lrk=ds_list_size(l_lrs);
	while(--l_lrk>=0){
		room_pack_raw_add_layer(l_lrs[|l_lrk]);
	}
	var l__g_list=l_rm[?"instanceCreationOrderIDs"];
	var l__g_index=0;
	while(l__g_index<ds_list_size(l__g_list)){
		var l_id=l__g_list[|l__g_index++];
		var l_qinst=room_pack_raw_inst_map_yy[?l_id];
		if(l_qinst==undefined)continue;
		room_pack_raw_run_yy_inst_cc(room_pack_raw_inst_map_gml[?l_id],l_qinst);
	}
	ds_map_clear(room_pack_raw_inst_map_gml);
	ds_map_clear(room_pack_raw_inst_map_yy);
	var l_s=l_rm[?"creationCode"];
	if(l_s!=undefined&&l_s!="")room_pack_raw_run_cc(l_s,l_rm[?"name"]+":CreationCode");
}

#macro room_pack_flag_settings 1
#macro room_pack_flag_instances 2
#macro room_pack_flag_backgrounds 4
#macro room_pack_flag_tiles 8
#macro room_pack_flag_views 16
#macro room_pack_flag_sprites 32
#macro room_pack_flag_all 255
globalvar room_pack_blank_object; /// @is {object}
room_pack_blank_object=obj_blank;
globalvar room_pack_eval_script; /// @is {RoomPackEval}
room_pack_eval_script=function(l__,l_s){
	show_debug_message("Can't execute code for "+l_s+" - please assign an evaluator script to room_pack_eval_script (see doc)")
}
globalvar room_pack_const_script; /// @is {RoomPackConst}
room_pack_const_script=function(l_s,l_v){}
globalvar room_pack_reuse_tilemaps; /// @is {bool}
room_pack_reuse_tilemaps=false;
globalvar room_pack_raw_object_cache; /// @is {ds_map<string; object>}
room_pack_raw_object_cache=ds_map_create();
globalvar room_pack_raw_sprite_cache; /// @is {ds_map<string; sprite>}
room_pack_raw_sprite_cache=ds_map_create();
globalvar room_pack_raw_use_physics; /// @is {bool}
room_pack_raw_use_physics=false;
globalvar room_pack_raw_room_x; /// @is {number}
room_pack_raw_room_x=0;
globalvar room_pack_raw_room_y; /// @is {number}
room_pack_raw_room_y=0;
globalvar room_pack_raw_apply_backgrounds; /// @is {bool}
room_pack_raw_apply_backgrounds=true;
globalvar room_pack_raw_apply_instances; /// @is {bool}
room_pack_raw_apply_instances=true;
globalvar room_pack_raw_apply_tiles; /// @is {bool}
room_pack_raw_apply_tiles=true;
globalvar room_pack_raw_apply_views; /// @is {bool}
room_pack_raw_apply_views=true;
globalvar room_pack_raw_apply_settings; /// @is {bool}
room_pack_raw_apply_settings=true;
globalvar room_pack_raw_apply_sprites; /// @is {bool}
room_pack_raw_apply_sprites=true;
globalvar room_pack_raw_apply_filters; /// @is {bool}
room_pack_raw_apply_filters=true;
globalvar room_pack_raw_store_instances; /// @is {ds_list<instance>}
room_pack_raw_store_instances=undefined;
globalvar room_pack_raw_store_backgrounds; /// @is {ds_list<layer_background>}
room_pack_raw_store_backgrounds=undefined;
globalvar room_pack_raw_store_sprites; /// @is {ds_list<layer_sprite>}
room_pack_raw_store_sprites=undefined;
globalvar room_pack_raw_store_tilemaps; /// @is {ds_list<tilemap>}
room_pack_raw_store_tilemaps=undefined;
globalvar room_pack_raw_store_tilemaps_ext; /// @is {bool}
room_pack_raw_store_tilemaps_ext=false;
globalvar room_pack_raw_include_layers; /// @is {ds_map<string; bool>}
room_pack_raw_include_layers=ds_map_create();
globalvar room_pack_raw_include_layers_on; /// @is {bool}
room_pack_raw_include_layers_on=false;
globalvar room_pack_raw_exclude_layers; /// @is {ds_map<string; bool>}
room_pack_raw_exclude_layers=ds_map_create();
globalvar room_pack_raw_inst_map_gml; /// @is {ds_map<string; instance>}
room_pack_raw_inst_map_gml=ds_map_create();
globalvar room_pack_raw_inst_map_yy; /// @is {ds_map<string; live_yy_YyRoomInstance>}
room_pack_raw_inst_map_yy=ds_map_create();


/// @typedef {any} live_yy_YyRoomPhySettings
/// @typedef {any} live_yy_YyRoomLayer
/// @typedef {any} live_yy_YyRoomInstance
/// @typedef {any} live_yy_YyRoom
/// @typedef {function<code:string; name:string; void>} RoomPackEval
/// @typedef {function<name:string; value:any; void>} RoomPackConst
/// @typedef {int} RoomPackBitFlags