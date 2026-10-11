<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Fields|Forms" version="3.44.14-Solothurn">
  <renderer-v2 enableorderby="0" referencescale="-1" type="RuleRenderer" forceraster="0" symbollevels="0">
    <rules key="{b7c79d9c-2e15-45e7-8b00-9c0cd1cb2024}">
      <rule label="Not valid (node or height)" filter="&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0" key="{c6664ff7-5111-4722-887c-67d3bc1cc897}" symbol="0"/>
      <rule label="No valve (1 &lt;-> 2)" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 0" key="{629fc275-7f0a-4701-9bd9-76608109fce1}" symbol="1"/>
      <rule label="Valve, flow 1 -> 2" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 1" key="{b34f4b45-e7eb-4e86-9b5b-f74dcd46403d}" symbol="2"/>
      <rule label="Valve, flow 2 -> 1" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 2" key="{09595888-7691-4bb9-89cf-47ed678fe228}" symbol="3"/>
      <rule label="Closed (no flow)" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 3" key="{673d3312-49c7-43b4-8649-527d1497b06c}" symbol="4"/>
      <rule label="Other" filter="ELSE" key="{c2d77dbe-32eb-4b18-8eaa-008eaad22057}" symbol="5"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="line" name="0" is_animated="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{a2d98c1a-e02f-4d0c-a300-cb3b187e4ea0}">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
            <Option type="QString" name="line_style" value="dash"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{acd7d323-261f-4845-85f1-4d5c63186653}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="FirstVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@0@1" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{3e9d8ae1-031d-4840-b81d-5dc8ae25ded1}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{64efc2e8-a958-49c5-b8b2-7b398a65d43f}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="LastVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@0@2" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{6eaa989d-6f9e-4755-ba5e-e730a4aa97d7}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="line" name="1" is_animated="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{2eb9dbf1-88a2-441d-806f-11934cff76d7}">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{bccbf856-c4ad-4d35-a8aa-18d9b853246f}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="FirstVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@1@1" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{59053f42-d7d4-4931-8c3c-411295f404ce}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{362c9ca6-80f0-4e4b-87b8-b0bcd1c16459}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="LastVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@1@2" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{ae4324c5-5f7f-499e-8b78-ead2ec9c9724}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="line" name="2" is_animated="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{847cdb1e-a25e-4483-9ba6-5b8c0baff821}">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{9c0f4e75-3793-4c79-af74-576fdaf271ab}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="FirstVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@2@1" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{0c9a4b06-a508-4799-af3c-99285c2f0649}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{be27c0b9-4e82-472b-8aa3-9fac54190cb7}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="LastVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@2@2" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{742b0f51-4059-48d0-b3eb-8f22ae727a1b}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{5096a05e-4361-47ca-aa89-c43d98061769}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@2@3" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{30b312e7-668c-4ab8-9694-e1673f3a1b31}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="3"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="line" name="3" is_animated="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{85e8b475-043a-4ca6-b00f-d09257eb89dd}">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{d930a690-1b56-45f8-8581-3cc95865f245}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="FirstVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@3@1" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{1f904692-6e98-4035-82ef-27da48a753a9}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{a38a6ab2-2025-461c-90f3-c0efc0c36992}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="LastVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@3@2" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{59d828cb-d25a-4daa-961b-7fa0504c54b7}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{606ab05e-6a4e-4fff-bef2-27a917f129c1}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@3@3" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{f807e859-73d4-44cf-842b-731e2634fe0d}">
              <Option type="Map">
                <Option type="QString" name="angle" value="180"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="3"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="line" name="4" is_animated="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{2d0eb967-d177-4bbd-b6e2-53cc17f0a5c4}">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{c648d439-7aa4-43cd-b852-8eb085521576}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="FirstVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@4@1" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{df8c9d87-77c4-49ec-9ecf-59d4e3a01335}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{0f176212-9611-4ffe-a877-3d91266a27b9}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="LastVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@4@2" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{b94957d8-18fb-42fc-ad68-c9ac82afda4b}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{80ffdc36-d6de-4ab2-8af2-280fb810a643}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@4@3" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{2d121f19-af3d-4a8a-9766-33c395c82b8f}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="line"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="227,26,28,255,rgb:0.8901961,0.1019608,0.1098039,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0.8"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="3"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="line" name="5" is_animated="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b62cedf1-bd15-4b30-b146-29ade5d09f1d}">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{e7d8ad91-0b29-4a0e-aa1e-9438e913ed48}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="FirstVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@5@1" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{53340dff-3310-4887-857f-ca11321328ba}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{5fa862ef-1339-45dc-8113-e171c9b32540}">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="LastVertex"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="@5@2" is_animated="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{8fdb8729-d194-40e5-b021-7140160a523b}">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="31,120,180,255,rgb:0.1215686,0.4705882,0.7058824,1"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="circle"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
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
    <field configurationFlags="NoFlag" name="N1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="N2">
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
    <field configurationFlags="NoFlag" name="LARG">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="HAUT">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="CLAP">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" name="No valve (1 &lt;-> 2)" value="0"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Valve, flow 1 -> 2" value="1"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Valve, flow 2 -> 1" value="2"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Closed (no flow)" value="3"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="L12">
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
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="d1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="d2">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="a1">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="a2">
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
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
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
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="AZ">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="NAME" name="Name"/>
    <alias index="1" field="N1" name="Node 1"/>
    <alias index="2" field="N2" name="Node 2"/>
    <alias index="3" field="CE1" name="Head loss coef. inflow 1"/>
    <alias index="4" field="CE2" name="Head loss coef. inflow 2"/>
    <alias index="5" field="CS1" name="Head loss coef. outflow 1"/>
    <alias index="6" field="CS2" name="Head loss coef. outflow 2"/>
    <alias index="7" field="LARG" name="Width (m)"/>
    <alias index="8" field="HAUT" name="Height 1 (m)"/>
    <alias index="9" field="CLAP" name="Valve"/>
    <alias index="10" field="L12" name="Linear head loss coef."/>
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
    <alias index="22" field="d1" name="Angle with the vertical 1 (°)"/>
    <alias index="23" field="d2" name="Angle with the vertical 2 (°)"/>
    <alias index="24" field="a1" name="Angle with the x axis 1 (°)"/>
    <alias index="25" field="a2" name="Angle with the x axis 2 (°)"/>
    <alias index="26" field="AA" name="Automatic angles"/>
    <alias index="27" field="NB_in_//" name="Number in parallel"/>
    <alias index="28" field="AL" name="Automatic length"/>
    <alias index="29" field="AZ" name="Automatic elevations"/>
  </aliases>
  <defaults>
    <default field="NAME" expression="" applyOnUpdate="0"/>
    <default field="N1" expression="with_variable('i', eval('mesh_vertex_index(@culvert_mesh, start_point($geometry))'), if(@i IS NULL, &quot;N1&quot;, if(@i &lt; 0, NULL, @i + 1)))" applyOnUpdate="1"/>
    <default field="N2" expression="with_variable('i', eval('mesh_vertex_index(@culvert_mesh, end_point($geometry))'), if(@i IS NULL, &quot;N2&quot;, if(@i &lt; 0, NULL, @i + 1)))" applyOnUpdate="1"/>
    <default field="CE1" expression="0.5" applyOnUpdate="0"/>
    <default field="CE2" expression="0.5" applyOnUpdate="0"/>
    <default field="CS1" expression="1.0" applyOnUpdate="0"/>
    <default field="CS2" expression="1.0" applyOnUpdate="0"/>
    <default field="LARG" expression="if(&quot;CIRC&quot; = 1, &quot;HAUT&quot;, &quot;LARG&quot;)" applyOnUpdate="1"/>
    <default field="HAUT" expression="0" applyOnUpdate="0"/>
    <default field="CLAP" expression="'0'" applyOnUpdate="0"/>
    <default field="L12" expression="1.0" applyOnUpdate="0"/>
    <default field="Z1" expression="if(&quot;AZ&quot; = 1, coalesce(eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, start_point($geometry))'), &quot;Z1&quot;), &quot;Z1&quot;)" applyOnUpdate="1"/>
    <default field="Z2" expression="if(&quot;AZ&quot; = 1, coalesce(eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, end_point($geometry))'), &quot;Z2&quot;), &quot;Z2&quot;)" applyOnUpdate="1"/>
    <default field="CV" expression="0" applyOnUpdate="0"/>
    <default field="C56" expression="0" applyOnUpdate="0"/>
    <default field="CV5" expression="0" applyOnUpdate="0"/>
    <default field="C5" expression="0" applyOnUpdate="0"/>
    <default field="CT" expression="0" applyOnUpdate="0"/>
    <default field="HAUT2" expression="0" applyOnUpdate="0"/>
    <default field="FRIC" expression="0" applyOnUpdate="0"/>
    <default field="LENGTH" expression="if(&quot;AL&quot; = 1, coalesce(length(transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs'))), &quot;LENGTH&quot;), &quot;LENGTH&quot;)" applyOnUpdate="1"/>
    <default field="CIRC" expression="0" applyOnUpdate="0"/>
    <default field="d1" expression="0" applyOnUpdate="0"/>
    <default field="d2" expression="0" applyOnUpdate="0"/>
    <default field="a1" expression="if(&quot;AA&quot; = 1, coalesce(with_variable('g', transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs')), ((450 - degrees(azimuth(point_n(@g, 1), point_n(@g, 2)))) % 360 + 180) % 360), &quot;a1&quot;), &quot;a1&quot;)" applyOnUpdate="1"/>
    <default field="a2" expression="if(&quot;AA&quot; = 1, coalesce(with_variable('g', transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs')), (450 - degrees(azimuth(point_n(@g, num_points(@g) - 1), point_n(@g, num_points(@g))))) % 360), &quot;a2&quot;), &quot;a2&quot;)" applyOnUpdate="1"/>
    <default field="AA" expression="0" applyOnUpdate="0"/>
    <default field="NB_in_//" expression="1" applyOnUpdate="0"/>
    <default field="AL" expression="0" applyOnUpdate="0"/>
    <default field="AZ" expression="0" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" exp_strength="0" field="NAME" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="N1" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="N2" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CE1" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CE2" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CS1" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CS2" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="LARG" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="HAUT" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CLAP" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="L12" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="Z1" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="Z2" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CV" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="C56" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CV5" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="C5" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CT" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="HAUT2" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="FRIC" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="LENGTH" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="CIRC" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="d1" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="d2" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="a1" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="a2" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="AA" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="NB_in_//" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="AL" constraints="4" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="2" field="AZ" constraints="4" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="NAME" exp=""/>
    <constraint desc="" field="N1" exp=""/>
    <constraint desc="" field="N2" exp=""/>
    <constraint desc="Required." field="CE1" exp="&quot;CE1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CE2" exp="&quot;CE2&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CS1" exp="&quot;CS1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="CS2" exp="&quot;CS2&quot; IS NOT NULL"/>
    <constraint desc="The width must be greater than 0 (rectangular culvert or option 2)." field="LARG" exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2 OR coalesce(&quot;CIRC&quot;, 0) = 0) OR coalesce(&quot;LARG&quot;, 0) > 0"/>
    <constraint desc="The height must be greater than 0." field="HAUT" exp="coalesce(&quot;HAUT&quot;, 0) > 0"/>
    <constraint desc="Required." field="CLAP" exp="&quot;CLAP&quot; IS NOT NULL"/>
    <constraint desc="Required with culvert option 1." field="L12" exp="to_int(coalesce(@culvert_option, 1)) = 2 OR &quot;L12&quot; IS NOT NULL"/>
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
    <constraint desc="Required." field="d1" exp="&quot;d1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="d2" exp="&quot;d2&quot; IS NOT NULL"/>
    <constraint desc="Required." field="a1" exp="&quot;a1&quot; IS NOT NULL"/>
    <constraint desc="Required." field="a2" exp="&quot;a2&quot; IS NOT NULL"/>
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
    <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
      <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
    </labelStyle>
    <attributeEditorContainer showLabel="1" visibilityExpression="" collapsed="0" collapsedExpression="" collapsedExpressionEnabled="0" groupBox="1" horizontalStretch="0" type="GroupBox" visibilityExpressionEnabled="0" verticalStretch="0" name="Culvert" columnCount="1">
      <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
        <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField showLabel="1" index="0" horizontalStretch="0" verticalStretch="0" name="NAME">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="1" horizontalStretch="0" verticalStretch="0" name="N1">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="2" horizontalStretch="0" verticalStretch="0" name="N2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="9" horizontalStretch="0" verticalStretch="0" name="CLAP">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="21" horizontalStretch="0" verticalStretch="0" name="CIRC">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="27" horizontalStretch="0" verticalStretch="0" name="NB_in_//">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="" collapsed="0" collapsedExpression="" collapsedExpressionEnabled="0" groupBox="1" horizontalStretch="0" type="GroupBox" visibilityExpressionEnabled="0" verticalStretch="0" name="Elevations and section" columnCount="1">
      <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
        <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField showLabel="1" index="11" horizontalStretch="0" verticalStretch="0" name="Z1">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="12" horizontalStretch="0" verticalStretch="0" name="Z2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="29" horizontalStretch="0" verticalStretch="0" name="AZ">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="7" horizontalStretch="0" verticalStretch="0" name="LARG">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="8" horizontalStretch="0" verticalStretch="0" name="HAUT">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="18" horizontalStretch="0" verticalStretch="0" name="HAUT2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="22" horizontalStretch="0" verticalStretch="0" name="d1">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="23" horizontalStretch="0" verticalStretch="0" name="d2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="" collapsed="0" collapsedExpression="" collapsedExpressionEnabled="0" groupBox="1" horizontalStretch="0" type="GroupBox" visibilityExpressionEnabled="0" verticalStretch="0" name="Angles" columnCount="1">
      <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
        <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField showLabel="1" index="24" horizontalStretch="0" verticalStretch="0" name="a1">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="25" horizontalStretch="0" verticalStretch="0" name="a2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="26" horizontalStretch="0" verticalStretch="0" name="AA">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="" collapsed="0" collapsedExpression="" collapsedExpressionEnabled="0" groupBox="1" horizontalStretch="0" type="GroupBox" visibilityExpressionEnabled="0" verticalStretch="0" name="Head losses" columnCount="1">
      <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
        <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField showLabel="1" index="3" horizontalStretch="0" verticalStretch="0" name="CE1">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="4" horizontalStretch="0" verticalStretch="0" name="CE2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="5" horizontalStretch="0" verticalStretch="0" name="CS1">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="6" horizontalStretch="0" verticalStretch="0" name="CS2">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="NOT (to_int(coalesce(@culvert_option, 1)) = 2)" collapsed="0" collapsedExpression="" collapsedExpressionEnabled="0" groupBox="1" horizontalStretch="0" type="GroupBox" visibilityExpressionEnabled="1" verticalStretch="0" name="Option 1" columnCount="1">
      <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
        <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField showLabel="1" index="10" horizontalStretch="0" verticalStretch="0" name="L12">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" visibilityExpression="to_int(coalesce(@culvert_option, 1)) = 2" collapsed="0" collapsedExpression="" collapsedExpressionEnabled="0" groupBox="1" horizontalStretch="0" type="GroupBox" visibilityExpressionEnabled="1" verticalStretch="0" name="Option 2" columnCount="1">
      <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
        <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField showLabel="1" index="13" horizontalStretch="0" verticalStretch="0" name="CV">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="14" horizontalStretch="0" verticalStretch="0" name="C56">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="15" horizontalStretch="0" verticalStretch="0" name="CV5">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="16" horizontalStretch="0" verticalStretch="0" name="C5">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="17" horizontalStretch="0" verticalStretch="0" name="CT">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="19" horizontalStretch="0" verticalStretch="0" name="FRIC">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="20" horizontalStretch="0" verticalStretch="0" name="LENGTH">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" index="28" horizontalStretch="0" verticalStretch="0" name="AL">
        <labelStyle overrideLabelColor="0" labelColor="" overrideLabelFont="0">
          <labelFont style="" underline="0" bold="0" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="0" name="N1"/>
    <field editable="0" name="N2"/>
  </editable>
  <labelOnTop/>
  <reuseLastValue/>
  <dataDefinedFieldProperties>
    <field name="LARG">
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="dataDefinedEditable">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="expression" value="&quot;CIRC&quot; IS NULL OR &quot;CIRC&quot; != 1"/>
            <Option type="int" name="type" value="3"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </field>
    <field name="LENGTH">
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="dataDefinedEditable">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="expression" value="&quot;AL&quot; IS NULL OR &quot;AL&quot; != 1"/>
            <Option type="int" name="type" value="3"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </field>
    <field name="Z1">
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="dataDefinedEditable">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="expression" value="&quot;AZ&quot; IS NULL OR &quot;AZ&quot; != 1"/>
            <Option type="int" name="type" value="3"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </field>
    <field name="Z2">
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="dataDefinedEditable">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="expression" value="&quot;AZ&quot; IS NULL OR &quot;AZ&quot; != 1"/>
            <Option type="int" name="type" value="3"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </field>
    <field name="a1">
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="dataDefinedEditable">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="expression" value="&quot;AA&quot; IS NULL OR &quot;AA&quot; != 1"/>
            <Option type="int" name="type" value="3"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </field>
    <field name="a2">
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="dataDefinedEditable">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="expression" value="&quot;AA&quot; IS NULL OR &quot;AA&quot; != 1"/>
            <Option type="int" name="type" value="3"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </field>
  </dataDefinedFieldProperties>
  <widgets/>
  <layerGeometryType>1</layerGeometryType>
</qgis>
