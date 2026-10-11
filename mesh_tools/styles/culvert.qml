<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Fields|Forms" version="3.44.14-Solothurn">
  <renderer-v2 forceraster="0" symbollevels="0" type="RuleRenderer" enableorderby="0" referencescale="-1">
    <rules key="{a0ea8e3d-e50f-42fc-a01e-32f1e8c3bc66}">
      <rule filter="&quot;I1&quot; IS NULL OR &quot;I2&quot; IS NULL OR coalesce(&quot;HAUT1&quot;, 0) &lt;= 0" label="Not valid (node or height)" symbol="0" key="{b473d3e2-10f9-4039-8250-9fc5e0ad32ef}"/>
      <rule filter="NOT (&quot;I1&quot; IS NULL OR &quot;I2&quot; IS NULL OR coalesce(&quot;HAUT1&quot;, 0) &lt;= 0) AND to_int(&quot;CLP&quot;) = 0" label="No valve (1 &lt;-> 2)" symbol="1" key="{0502b6e6-3be5-4700-8c43-6d391b9f4070}"/>
      <rule filter="NOT (&quot;I1&quot; IS NULL OR &quot;I2&quot; IS NULL OR coalesce(&quot;HAUT1&quot;, 0) &lt;= 0) AND to_int(&quot;CLP&quot;) = 1" label="Valve, flow 1 -> 2" symbol="2" key="{defbdd5f-d114-463a-b8b9-f103ff1364fc}"/>
      <rule filter="NOT (&quot;I1&quot; IS NULL OR &quot;I2&quot; IS NULL OR coalesce(&quot;HAUT1&quot;, 0) &lt;= 0) AND to_int(&quot;CLP&quot;) = 2" label="Valve, flow 2 -> 1" symbol="3" key="{b9a84292-c8f2-496d-8e9a-5759b9cb9abc}"/>
      <rule filter="NOT (&quot;I1&quot; IS NULL OR &quot;I2&quot; IS NULL OR coalesce(&quot;HAUT1&quot;, 0) &lt;= 0) AND to_int(&quot;CLP&quot;) = 3" label="Closed (no flow)" symbol="4" key="{b249f656-1b14-439f-888d-a89a4595ca03}"/>
      <rule filter="ELSE" label="Other" symbol="5" key="{b6d1f823-1a88-40ff-96c1-7c34188ff4d1}"/>
    </rules>
    <symbols>
      <symbol is_animated="0" force_rhr="0" name="0" clip_to_extent="1" frame_rate="10" type="line" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1" id="{7f779a92-5ad9-4bb3-9060-8bf32997b2bf}">
          <Option type="Map">
            <Option value="0" name="align_dash_pattern" type="QString"/>
            <Option value="square" name="capstyle" type="QString"/>
            <Option value="5;2" name="customdash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
            <Option value="MM" name="customdash_unit" type="QString"/>
            <Option value="0" name="dash_pattern_offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
            <Option value="0" name="draw_inside_polygon" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="line_color" type="QString"/>
            <Option value="dash" name="line_style" type="QString"/>
            <Option value="0.5" name="line_width" type="QString"/>
            <Option value="MM" name="line_width_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="0" name="trim_distance_end" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_end_unit" type="QString"/>
            <Option value="0" name="trim_distance_start" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_start_unit" type="QString"/>
            <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
            <Option value="0" name="use_custom_dash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{9fcac26a-d95a-4360-a4e5-381616c3dea6}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="FirstVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@0@1" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{e4f68ae3-147d-46f8-8123-1c6c387b5b02}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{063e27af-666a-4f4f-b328-1ff8df0a2904}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="LastVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@0@2" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{1a262ae2-a2be-499b-9569-300179eeb2b6}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol is_animated="0" force_rhr="0" name="1" clip_to_extent="1" frame_rate="10" type="line" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1" id="{4fc428f9-975c-4ccf-b3b7-5ae71560c07f}">
          <Option type="Map">
            <Option value="0" name="align_dash_pattern" type="QString"/>
            <Option value="square" name="capstyle" type="QString"/>
            <Option value="5;2" name="customdash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
            <Option value="MM" name="customdash_unit" type="QString"/>
            <Option value="0" name="dash_pattern_offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
            <Option value="0" name="draw_inside_polygon" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="line_color" type="QString"/>
            <Option value="solid" name="line_style" type="QString"/>
            <Option value="0.5" name="line_width" type="QString"/>
            <Option value="MM" name="line_width_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="0" name="trim_distance_end" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_end_unit" type="QString"/>
            <Option value="0" name="trim_distance_start" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_start_unit" type="QString"/>
            <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
            <Option value="0" name="use_custom_dash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{0f9513d7-c0d5-4ee3-98be-ba4ed06c4bfe}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="FirstVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@1@1" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{1e010252-643b-44c0-97e2-b6e1ac008639}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{7fd4d0b2-7fae-4c2a-a47e-01876b31d538}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="LastVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@1@2" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{e841c68f-97f4-47c7-89b0-65e3cd27cf55}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol is_animated="0" force_rhr="0" name="2" clip_to_extent="1" frame_rate="10" type="line" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1" id="{69a53503-33cf-4b35-81a7-eaeab842cc20}">
          <Option type="Map">
            <Option value="0" name="align_dash_pattern" type="QString"/>
            <Option value="square" name="capstyle" type="QString"/>
            <Option value="5;2" name="customdash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
            <Option value="MM" name="customdash_unit" type="QString"/>
            <Option value="0" name="dash_pattern_offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
            <Option value="0" name="draw_inside_polygon" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="line_color" type="QString"/>
            <Option value="solid" name="line_style" type="QString"/>
            <Option value="0.5" name="line_width" type="QString"/>
            <Option value="MM" name="line_width_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="0" name="trim_distance_end" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_end_unit" type="QString"/>
            <Option value="0" name="trim_distance_start" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_start_unit" type="QString"/>
            <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
            <Option value="0" name="use_custom_dash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{eaa98236-b04f-445a-be4e-17ea8dbc7c9a}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="FirstVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@2@1" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{493e1457-bf3a-47b1-8f64-416bdd62ffa6}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{ebc89aa1-7109-41cd-b225-b898925f40c4}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="LastVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@2@2" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{edf38b74-b6ea-4b4c-91e0-a3e814bcf013}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{234d38a8-9f8f-4016-b257-162d2a86ec00}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="CentralPoint" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@2@3" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{d16775ea-9de4-457b-9e71-ef524d02b5f2}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="filled_arrowhead" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="3" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol is_animated="0" force_rhr="0" name="3" clip_to_extent="1" frame_rate="10" type="line" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1" id="{e340abae-5930-4b90-95ef-7351f530156f}">
          <Option type="Map">
            <Option value="0" name="align_dash_pattern" type="QString"/>
            <Option value="square" name="capstyle" type="QString"/>
            <Option value="5;2" name="customdash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
            <Option value="MM" name="customdash_unit" type="QString"/>
            <Option value="0" name="dash_pattern_offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
            <Option value="0" name="draw_inside_polygon" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="line_color" type="QString"/>
            <Option value="solid" name="line_style" type="QString"/>
            <Option value="0.5" name="line_width" type="QString"/>
            <Option value="MM" name="line_width_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="0" name="trim_distance_end" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_end_unit" type="QString"/>
            <Option value="0" name="trim_distance_start" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_start_unit" type="QString"/>
            <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
            <Option value="0" name="use_custom_dash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{0a343b48-a638-4cc5-8d80-9102248b2f9a}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="FirstVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@3@1" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{13c9376d-a0ea-4f89-ab0a-49fd606c68c2}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{51c6550f-8705-4600-b444-9113792c0c37}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="LastVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@3@2" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{6502e976-13e5-4afe-baeb-929b6523780a}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{abef1758-4d2b-4706-81dd-d4ab0c03f467}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="CentralPoint" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@3@3" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{5ecf3f20-3f17-468f-8e82-fe46961258ee}">
              <Option type="Map">
                <Option value="180" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="filled_arrowhead" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="3" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol is_animated="0" force_rhr="0" name="4" clip_to_extent="1" frame_rate="10" type="line" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1" id="{f052b125-ce03-4840-93bf-13e9cb532764}">
          <Option type="Map">
            <Option value="0" name="align_dash_pattern" type="QString"/>
            <Option value="square" name="capstyle" type="QString"/>
            <Option value="5;2" name="customdash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
            <Option value="MM" name="customdash_unit" type="QString"/>
            <Option value="0" name="dash_pattern_offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
            <Option value="0" name="draw_inside_polygon" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="line_color" type="QString"/>
            <Option value="solid" name="line_style" type="QString"/>
            <Option value="0.5" name="line_width" type="QString"/>
            <Option value="MM" name="line_width_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="0" name="trim_distance_end" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_end_unit" type="QString"/>
            <Option value="0" name="trim_distance_start" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_start_unit" type="QString"/>
            <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
            <Option value="0" name="use_custom_dash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{b4976328-f450-4d2e-8eba-edad7520a1a0}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="FirstVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@4@1" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{934b2615-6810-417c-b54f-48a56ba2201f}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{27d0a076-ac85-42fe-8901-73f9b125ad48}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="LastVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@4@2" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{2b79eab7-e44d-426a-b286-34745e752beb}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{8bb0cb4f-04ea-4b91-817b-5c972883b663}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="CentralPoint" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@4@3" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{fbd62bee-a106-4b78-b5eb-2a3c5c0484fe}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="line" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0.8" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="3" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol is_animated="0" force_rhr="0" name="5" clip_to_extent="1" frame_rate="10" type="line" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1" id="{ed7cb062-473b-4ed1-9f2e-4ca48aac4525}">
          <Option type="Map">
            <Option value="0" name="align_dash_pattern" type="QString"/>
            <Option value="square" name="capstyle" type="QString"/>
            <Option value="5;2" name="customdash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
            <Option value="MM" name="customdash_unit" type="QString"/>
            <Option value="0" name="dash_pattern_offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
            <Option value="0" name="draw_inside_polygon" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="line_color" type="QString"/>
            <Option value="solid" name="line_style" type="QString"/>
            <Option value="0.5" name="line_width" type="QString"/>
            <Option value="MM" name="line_width_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="0" name="trim_distance_end" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_end_unit" type="QString"/>
            <Option value="0" name="trim_distance_start" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
            <Option value="MM" name="trim_distance_start_unit" type="QString"/>
            <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
            <Option value="0" name="use_custom_dash" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{4e82e72b-2815-4193-8294-52991ec2f0f2}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="FirstVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@5@1" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{b47810f7-e0fa-4591-8841-4d47a174c0cd}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" pass="0" class="MarkerLine" enabled="1" id="{be4ddce1-5d05-4c7a-b464-f943104e36fa}">
          <Option type="Map">
            <Option value="4" name="average_angle_length" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale" type="QString"/>
            <Option value="MM" name="average_angle_unit" type="QString"/>
            <Option value="3" name="interval" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="interval_map_unit_scale" type="QString"/>
            <Option value="MM" name="interval_unit" type="QString"/>
            <Option value="0" name="offset" type="QString"/>
            <Option value="0" name="offset_along_line" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_along_line_unit" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="true" name="place_on_every_part" type="bool"/>
            <Option value="LastVertex" name="placements" type="QString"/>
            <Option value="0" name="ring_filter" type="QString"/>
            <Option value="1" name="rotate" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol is_animated="0" force_rhr="0" name="@5@2" clip_to_extent="1" frame_rate="10" type="marker" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer locked="0" pass="0" class="SimpleMarker" enabled="1" id="{0d337a3a-8108-4733-aa66-1039944f012a}">
              <Option type="Map">
                <Option value="0" name="angle" type="QString"/>
                <Option value="square" name="cap_style" type="QString"/>
                <Option value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1" name="color" type="QString"/>
                <Option value="1" name="horizontal_anchor_point" type="QString"/>
                <Option value="bevel" name="joinstyle" type="QString"/>
                <Option value="circle" name="name" type="QString"/>
                <Option value="0,0" name="offset" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
                <Option value="MM" name="offset_unit" type="QString"/>
                <Option value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color" type="QString"/>
                <Option value="solid" name="outline_style" type="QString"/>
                <Option value="0" name="outline_width" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
                <Option value="MM" name="outline_width_unit" type="QString"/>
                <Option value="diameter" name="scale_method" type="QString"/>
                <Option value="2" name="size" type="QString"/>
                <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
                <Option value="MM" name="size_unit" type="QString"/>
                <Option value="1" name="vertical_anchor_point" type="QString"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <data-defined-properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </data-defined-properties>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
  </selection>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <fieldConfiguration>
    <field configurationFlags="NoFlag" name="NAME">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="I1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="I2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CE1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CE2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CS1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CS2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="LRG">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="HAUT1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CLP">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option value="0" name="No valve (1 &lt;-> 2)" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="1" name="Valve, flow 1 -> 2" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="2" name="Valve, flow 2 -> 1" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="3" name="Closed (no flow)" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="LBUS">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="Z1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="Z2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CV">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="C56">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CV5">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="C5">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CT">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="HAUT2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="FRIC">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="LENGTH">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CIRC">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" name="CheckedState" type="QString"/>
            <Option value="0" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="D1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="D2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="A1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="A2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="AA">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" name="CheckedState" type="QString"/>
            <Option value="0" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="NB_in_//">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="AL">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" name="CheckedState" type="QString"/>
            <Option value="0" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="AZ">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" name="CheckedState" type="QString"/>
            <Option value="0" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="NAME" name="Name"/>
    <alias index="1" field="I1" name="Node 1"/>
    <alias index="2" field="I2" name="Node 2"/>
    <alias index="3" field="CE1" name="Head loss coef. inflow 1"/>
    <alias index="4" field="CE2" name="Head loss coef. inflow 2"/>
    <alias index="5" field="CS1" name="Head loss coef. outflow 1"/>
    <alias index="6" field="CS2" name="Head loss coef. outflow 2"/>
    <alias index="7" field="LRG" name="Width (m)"/>
    <alias index="8" field="HAUT1" name="Height 1 (m)"/>
    <alias index="9" field="CLP" name="Valve"/>
    <alias index="10" field="LBUS" name="Linear head loss coef."/>
    <alias index="11" field="Z1" name="Elevation 1 (m)"/>
    <alias index="12" field="Z2" name="Elevation 2 (m)"/>
    <alias index="13" field="CV" name="Valve head loss coef."/>
    <alias index="14" field="C56" name="Flow type 5/6 coef."/>
    <alias index="15" field="CV5" name="Flow type 5 correction coef."/>
    <alias index="16" field="C5" name="Flow type 5 coef."/>
    <alias index="17" field="CT" name="Trash screen head loss coef."/>
    <alias index="18" field="HAUT2" name="Height 2 (0: same as height 1) (m)"/>
    <alias index="19" field="FRIC" name="Manning coef."/>
    <alias index="20" field="LENGTH" name="Length (m)"/>
    <alias index="21" field="CIRC" name="Circular"/>
    <alias index="22" field="D1" name="Angle with the vertical 1 (°)"/>
    <alias index="23" field="D2" name="Angle with the vertical 2 (°)"/>
    <alias index="24" field="A1" name="Angle with the x axis 1 (°)"/>
    <alias index="25" field="A2" name="Angle with the x axis 2 (°)"/>
    <alias index="26" field="AA" name="Automatic angles"/>
    <alias index="27" field="NB_in_//" name="Number in parallel"/>
    <alias index="28" field="AL" name="Automatic length"/>
    <alias index="29" field="AZ" name="Automatic elevations"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" field="NAME" expression=""/>
    <default applyOnUpdate="1" field="I1" expression="with_variable('i', eval('mesh_vertex_index(@culvert_mesh, start_point($geometry))'), if(@i IS NULL, &quot;I1&quot;, if(@i &lt; 0, NULL, @i + 1)))"/>
    <default applyOnUpdate="1" field="I2" expression="with_variable('i', eval('mesh_vertex_index(@culvert_mesh, end_point($geometry))'), if(@i IS NULL, &quot;I2&quot;, if(@i &lt; 0, NULL, @i + 1)))"/>
    <default applyOnUpdate="0" field="CE1" expression="0.5"/>
    <default applyOnUpdate="0" field="CE2" expression="0.5"/>
    <default applyOnUpdate="0" field="CS1" expression="1.0"/>
    <default applyOnUpdate="0" field="CS2" expression="1.0"/>
    <default applyOnUpdate="1" field="LRG" expression="if(&quot;CIRC&quot; = 1, &quot;HAUT1&quot;, &quot;LRG&quot;)"/>
    <default applyOnUpdate="0" field="HAUT1" expression="0"/>
    <default applyOnUpdate="0" field="CLP" expression="0"/>
    <default applyOnUpdate="0" field="LBUS" expression="1.0"/>
    <default applyOnUpdate="1" field="Z1" expression="if(&quot;AZ&quot; = 1, coalesce(eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, start_point($geometry))'), &quot;Z1&quot;), &quot;Z1&quot;)"/>
    <default applyOnUpdate="1" field="Z2" expression="if(&quot;AZ&quot; = 1, coalesce(eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, end_point($geometry))'), &quot;Z2&quot;), &quot;Z2&quot;)"/>
    <default applyOnUpdate="0" field="CV" expression="0"/>
    <default applyOnUpdate="0" field="C56" expression="0"/>
    <default applyOnUpdate="0" field="CV5" expression="0"/>
    <default applyOnUpdate="0" field="C5" expression="0"/>
    <default applyOnUpdate="0" field="CT" expression="0"/>
    <default applyOnUpdate="0" field="HAUT2" expression="0"/>
    <default applyOnUpdate="0" field="FRIC" expression="0"/>
    <default applyOnUpdate="1" field="LENGTH" expression="if(&quot;AL&quot; = 1, coalesce(length(transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs'))), &quot;LENGTH&quot;), &quot;LENGTH&quot;)"/>
    <default applyOnUpdate="0" field="CIRC" expression="0"/>
    <default applyOnUpdate="0" field="D1" expression="0"/>
    <default applyOnUpdate="0" field="D2" expression="0"/>
    <default applyOnUpdate="1" field="A1" expression="if(&quot;AA&quot; = 1, coalesce(with_variable('g', transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs')), ((450 - degrees(azimuth(point_n(@g, 1), point_n(@g, 2)))) % 360 + 180) % 360), &quot;A1&quot;), &quot;A1&quot;)"/>
    <default applyOnUpdate="1" field="A2" expression="if(&quot;AA&quot; = 1, coalesce(with_variable('g', transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs')), (450 - degrees(azimuth(point_n(@g, num_points(@g) - 1), point_n(@g, num_points(@g))))) % 360), &quot;A2&quot;), &quot;A2&quot;)"/>
    <default applyOnUpdate="0" field="AA" expression="0"/>
    <default applyOnUpdate="0" field="NB_in_//" expression="1"/>
    <default applyOnUpdate="0" field="AL" expression="0"/>
    <default applyOnUpdate="0" field="AZ" expression="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" field="NAME" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="I1" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="I2" exp_strength="0" unique_strength="0" constraints="0"/>
    <constraint notnull_strength="0" field="CE1" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CE2" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CS1" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CS2" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="LRG" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="HAUT1" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CLP" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="LBUS" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="Z1" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="Z2" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CV" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="C56" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CV5" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="C5" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CT" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="HAUT2" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="FRIC" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="LENGTH" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="CIRC" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="D1" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="D2" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="A1" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="A2" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="AA" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="NB_in_//" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="AL" exp_strength="2" unique_strength="0" constraints="4"/>
    <constraint notnull_strength="0" field="AZ" exp_strength="2" unique_strength="0" constraints="4"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="NAME" exp=""/>
    <constraint desc="" field="I1" exp=""/>
    <constraint desc="" field="I2" exp=""/>
    <constraint desc="Required." field="CE1" exp="&quot;CE1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CE2" exp="&quot;CE2&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CS1" exp="&quot;CS1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CS2" exp="&quot;CS2&quot; IS NOT NULL"/>
    <constraint desc="The width must be greater than 0 (rectangular culvert or option 2)." field="LRG" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2 OR coalesce(&quot;CIRC&quot;, 0) = 0) OR coalesce(&quot;LRG&quot;, 0) > 0"/>
    <constraint desc="The height must be greater than 0." field="HAUT1" exp="coalesce(&quot;HAUT1&quot;, 0) > 0"/>
    <constraint desc="Required." field="CLP" exp="&quot;CLP&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 1." field="LBUS" exp="to_int(coalesce(@culvert_option, 1)) = 2 OR &quot;LBUS&quot; IS NOT NULL"/>
    <constraint desc="Required." field="Z1" exp="&quot;Z1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="Z2" exp="&quot;Z2&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="CV" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CV&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="C56" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;C56&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="CV5" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CV5&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="C5" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;C5&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="CT" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CT&quot; IS NOT NULL"/>
    <constraint desc="Required." field="HAUT2" exp="&quot;HAUT2&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="FRIC" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;FRIC&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 2." field="LENGTH" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;LENGTH&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CIRC" exp="&quot;CIRC&quot; IS NOT NULL"/>
    <constraint desc="Required." field="D1" exp="&quot;D1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="D2" exp="&quot;D2&quot; IS NOT NULL"/>
    <constraint desc="Required." field="A1" exp="&quot;A1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="A2" exp="&quot;A2&quot; IS NOT NULL"/>
    <constraint desc="Required." field="AA" exp="&quot;AA&quot; IS NOT NULL"/>
    <constraint desc="Required." field="NB_in_//" exp="&quot;NB_in_//&quot; IS NOT NULL"/>
    <constraint desc="Required." field="AL" exp="&quot;AL&quot; IS NOT NULL"/>
    <constraint desc="Required." field="AZ" exp="&quot;AZ&quot; IS NOT NULL"/>
  </constraintExpressions>
  <expressionfields/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
      <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
    </labelStyle>
    <attributeEditorContainer collapsedExpression="" verticalStretch="0" showLabel="1" visibilityExpressionEnabled="0" name="Culvert" horizontalStretch="0" type="GroupBox" collapsed="0" columnCount="1" collapsedExpressionEnabled="0" groupBox="1" visibilityExpression="">
      <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
      </labelStyle>
      <attributeEditorField index="0" verticalStretch="0" showLabel="1" name="NAME" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="1" verticalStretch="0" showLabel="1" name="I1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="2" verticalStretch="0" showLabel="1" name="I2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="9" verticalStretch="0" showLabel="1" name="CLP" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="21" verticalStretch="0" showLabel="1" name="CIRC" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="27" verticalStretch="0" showLabel="1" name="NB_in_//" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer collapsedExpression="" verticalStretch="0" showLabel="1" visibilityExpressionEnabled="0" name="Elevations and section" horizontalStretch="0" type="GroupBox" collapsed="0" columnCount="1" collapsedExpressionEnabled="0" groupBox="1" visibilityExpression="">
      <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
      </labelStyle>
      <attributeEditorField index="11" verticalStretch="0" showLabel="1" name="Z1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="12" verticalStretch="0" showLabel="1" name="Z2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="29" verticalStretch="0" showLabel="1" name="AZ" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="7" verticalStretch="0" showLabel="1" name="LRG" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="8" verticalStretch="0" showLabel="1" name="HAUT1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="18" verticalStretch="0" showLabel="1" name="HAUT2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="22" verticalStretch="0" showLabel="1" name="D1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="23" verticalStretch="0" showLabel="1" name="D2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer collapsedExpression="" verticalStretch="0" showLabel="1" visibilityExpressionEnabled="0" name="Angles" horizontalStretch="0" type="GroupBox" collapsed="0" columnCount="1" collapsedExpressionEnabled="0" groupBox="1" visibilityExpression="">
      <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
      </labelStyle>
      <attributeEditorField index="24" verticalStretch="0" showLabel="1" name="A1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="25" verticalStretch="0" showLabel="1" name="A2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="26" verticalStretch="0" showLabel="1" name="AA" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer collapsedExpression="" verticalStretch="0" showLabel="1" visibilityExpressionEnabled="0" name="Head losses" horizontalStretch="0" type="GroupBox" collapsed="0" columnCount="1" collapsedExpressionEnabled="0" groupBox="1" visibilityExpression="">
      <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
      </labelStyle>
      <attributeEditorField index="3" verticalStretch="0" showLabel="1" name="CE1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="4" verticalStretch="0" showLabel="1" name="CE2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="5" verticalStretch="0" showLabel="1" name="CS1" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="6" verticalStretch="0" showLabel="1" name="CS2" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer collapsedExpression="" verticalStretch="0" showLabel="1" visibilityExpressionEnabled="1" name="Option 1" horizontalStretch="0" type="GroupBox" collapsed="0" columnCount="1" collapsedExpressionEnabled="0" groupBox="1" visibilityExpression="NOT (to_int(coalesce(@culvert_option, 1)) = 2)">
      <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
      </labelStyle>
      <attributeEditorField index="10" verticalStretch="0" showLabel="1" name="LBUS" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer collapsedExpression="" verticalStretch="0" showLabel="1" visibilityExpressionEnabled="1" name="Option 2" horizontalStretch="0" type="GroupBox" collapsed="0" columnCount="1" collapsedExpressionEnabled="0" groupBox="1" visibilityExpression="to_int(coalesce(@culvert_option, 1)) = 2">
      <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
      </labelStyle>
      <attributeEditorField index="13" verticalStretch="0" showLabel="1" name="CV" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="14" verticalStretch="0" showLabel="1" name="C56" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="15" verticalStretch="0" showLabel="1" name="CV5" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="16" verticalStretch="0" showLabel="1" name="C5" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="17" verticalStretch="0" showLabel="1" name="CT" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="19" verticalStretch="0" showLabel="1" name="FRIC" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="20" verticalStretch="0" showLabel="1" name="LENGTH" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField index="28" verticalStretch="0" showLabel="1" name="AL" horizontalStretch="0">
        <labelStyle labelColor="" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont bold="0" style="" strikethrough="0" italic="0" underline="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="0" name="I1"/>
    <field editable="0" name="I2"/>
  </editable>
  <labelOnTop/>
  <reuseLastValue/>
  <dataDefinedFieldProperties>
    <field name="A1">
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="dataDefinedEditable" type="Map">
            <Option value="true" name="active" type="bool"/>
            <Option value="&quot;AA&quot; IS NULL OR &quot;AA&quot; != 1" name="expression" type="QString"/>
            <Option value="3" name="type" type="int"/>
          </Option>
        </Option>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </field>
    <field name="A2">
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="dataDefinedEditable" type="Map">
            <Option value="true" name="active" type="bool"/>
            <Option value="&quot;AA&quot; IS NULL OR &quot;AA&quot; != 1" name="expression" type="QString"/>
            <Option value="3" name="type" type="int"/>
          </Option>
        </Option>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </field>
    <field name="LENGTH">
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="dataDefinedEditable" type="Map">
            <Option value="true" name="active" type="bool"/>
            <Option value="&quot;AL&quot; IS NULL OR &quot;AL&quot; != 1" name="expression" type="QString"/>
            <Option value="3" name="type" type="int"/>
          </Option>
        </Option>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </field>
    <field name="LRG">
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="dataDefinedEditable" type="Map">
            <Option value="true" name="active" type="bool"/>
            <Option value="&quot;CIRC&quot; IS NULL OR &quot;CIRC&quot; != 1" name="expression" type="QString"/>
            <Option value="3" name="type" type="int"/>
          </Option>
        </Option>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </field>
    <field name="Z1">
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="dataDefinedEditable" type="Map">
            <Option value="true" name="active" type="bool"/>
            <Option value="&quot;AZ&quot; IS NULL OR &quot;AZ&quot; != 1" name="expression" type="QString"/>
            <Option value="3" name="type" type="int"/>
          </Option>
        </Option>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </field>
    <field name="Z2">
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="dataDefinedEditable" type="Map">
            <Option value="true" name="active" type="bool"/>
            <Option value="&quot;AZ&quot; IS NULL OR &quot;AZ&quot; != 1" name="expression" type="QString"/>
            <Option value="3" name="type" type="int"/>
          </Option>
        </Option>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </field>
  </dataDefinedFieldProperties>
  <widgets/>
  <layerGeometryType>1</layerGeometryType>
</qgis>
