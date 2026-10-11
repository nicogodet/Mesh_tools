<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.44.14-Solothurn" styleCategories="Symbology|Fields|Forms">
  <renderer-v2 forceraster="0" type="RuleRenderer" enableorderby="0" referencescale="-1" symbollevels="0">
    <rules key="{9b5c3a78-8c18-4378-8c0b-e8a72423be10}">
      <rule label="Not valid (node or height)" key="{83fa6ee8-2b35-4bb9-9421-d5814bf58caa}" symbol="0" filter="&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0"/>
      <rule label="No valve (1 &lt;-> 2)" key="{2b005979-9725-4177-b3c7-e29379c545a3}" symbol="1" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 0"/>
      <rule label="Valve, flow 1 -> 2" key="{e3f7fcc6-259f-4375-af5d-a6dcdf3812e8}" symbol="2" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 1"/>
      <rule label="Valve, flow 2 -> 1" key="{c7383155-988e-4ac4-8524-4a19dbf38dca}" symbol="3" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 2"/>
      <rule label="Closed (no flow)" key="{ff2ea50e-762f-42f2-b56d-3cc5c20af567}" symbol="4" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 3"/>
      <rule label="Other" key="{e92dae3e-6a15-44e0-9ed9-f1bde3ea8d40}" symbol="5" filter="ELSE"/>
    </rules>
    <symbols>
      <symbol is_animated="0" type="line" name="0" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" id="{08a2f84e-d365-4fbc-929c-ae164f5aea8c}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{928fcd10-fa8f-413e-a182-29e699a8b611}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@0@1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{434166c2-c6f5-419b-8880-95c3e91885b8}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{833e3b9c-b4ca-4490-80d4-5f67ea92a98b}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@0@2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{9055a06e-1e9e-46ac-baad-8f2c01197b1d}" enabled="1" pass="0" locked="0">
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
      <symbol is_animated="0" type="line" name="1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" id="{b1eef0b5-d520-4a37-8e41-e6d6e00a32bd}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{f0d0b1ae-b66a-4613-810e-9144af492d7a}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@1@1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{36c039da-04ee-4ca9-999c-7b14a34fd1de}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{c63bc1ba-e09f-44e3-b399-5d1feb839ec8}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@1@2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{0c24092c-5717-45a1-9d08-d271f9143078}" enabled="1" pass="0" locked="0">
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
      <symbol is_animated="0" type="line" name="2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" id="{2316947a-9fe3-45c4-abed-a09099c7d638}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{73443ea2-dfa3-4104-b5af-2dd8c5e18301}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@2@1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{d27ba36a-ce82-462d-806b-a16520f9df69}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{bab6c497-f6a6-44f6-9d5a-604e635e77b9}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@2@2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{5656bdac-fbfa-4ba5-8ebb-5445cdf480d4}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{6a0de14a-35c1-4245-8633-17855239e1f2}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@2@3" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{a1922798-7be0-4c9a-a6f7-1db45c25086b}" enabled="1" pass="0" locked="0">
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
      <symbol is_animated="0" type="line" name="3" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" id="{7802cc67-b4b4-4c36-bcd4-f89125285676}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{a5f7f833-ea47-4b48-b81b-572d774bab62}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@3@1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{9befe0e9-dd6b-494d-b0da-a2d40d611844}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{d4f9cedd-5d54-49c0-8315-80088e13cf06}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@3@2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{0b9b2e89-5ef6-41a6-a501-d96f37d85d38}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{ce2870f6-1e48-4c37-9fbb-9c8ead440e8d}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@3@3" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{93376630-7e38-4e52-b29d-9af265651a0f}" enabled="1" pass="0" locked="0">
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
      <symbol is_animated="0" type="line" name="4" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" id="{87b3d22c-6505-4b7f-a961-74e69e7e5d9d}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{72957edf-510c-44a9-863d-b2567be94977}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@4@1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{2c5d333f-897f-4420-93aa-a8bff46e3dda}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{9c88b084-2905-4849-ac6f-e5b8cc817b70}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@4@2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{00455e0a-f4a9-4cd9-bfb8-d6be5ef9d692}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{5f7901a6-ac87-4a35-ae5d-72ea7325a5e0}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@4@3" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{54ca8685-c743-493f-8afe-07d08b05f736}" enabled="1" pass="0" locked="0">
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
      <symbol is_animated="0" type="line" name="5" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" id="{c10dcf9e-17db-4363-8a40-d49961e60d04}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{5c5f5ff2-051b-4c36-9678-a5f2ca517b23}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@5@1" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{6d2bec83-9de7-4a70-b959-0170de135541}" enabled="1" pass="0" locked="0">
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
        <layer class="MarkerLine" id="{9cbffa9e-ad74-498d-aa16-eb5f53edb1ed}" enabled="1" pass="0" locked="0">
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
          <symbol is_animated="0" type="marker" name="@5@2" alpha="1" force_rhr="0" clip_to_extent="1" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" id="{88c68fa3-02c1-4da3-ad2e-0aaf88cf2cb1}" enabled="1" pass="0" locked="0">
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
    <field name="NAME" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="N1" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="N2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CE1" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CE2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CS1" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CS2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LARG" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="HAUT" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CLAP" configurationFlags="NoFlag">
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
    <field name="L12" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Z1" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Z2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CV" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="C56" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CV5" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="C5" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CT" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="HAUT2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="FRIC" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LENGTH" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CIRC" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="d1" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="d2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="a1" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="a2" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="AA" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="NB_in_//" configurationFlags="NoFlag">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="AL" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="AZ" configurationFlags="NoFlag">
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
    <alias name="Name" field="NAME" index="0"/>
    <alias name="Node 1" field="N1" index="1"/>
    <alias name="Node 2" field="N2" index="2"/>
    <alias name="Head loss coef. inflow 1" field="CE1" index="3"/>
    <alias name="Head loss coef. inflow 2" field="CE2" index="4"/>
    <alias name="Head loss coef. outflow 1" field="CS1" index="5"/>
    <alias name="Head loss coef. outflow 2" field="CS2" index="6"/>
    <alias name="Width" field="LARG" index="7"/>
    <alias name="Height 1" field="HAUT" index="8"/>
    <alias name="Valve" field="CLAP" index="9"/>
    <alias name="Linear head loss" field="L12" index="10"/>
    <alias name="Elevation 1" field="Z1" index="11"/>
    <alias name="Elevation 2" field="Z2" index="12"/>
    <alias name="Valve head loss coef." field="CV" index="13"/>
    <alias name="Flow type 5/6 coef." field="C56" index="14"/>
    <alias name="Flow type 5 correction" field="CV5" index="15"/>
    <alias name="Flow type 5 coef." field="C5" index="16"/>
    <alias name="Trash screen head loss coef." field="CT" index="17"/>
    <alias name="Height 2 (0: = height 1)" field="HAUT2" index="18"/>
    <alias name="Manning coef." field="FRIC" index="19"/>
    <alias name="Length" field="LENGTH" index="20"/>
    <alias name="Circular" field="CIRC" index="21"/>
    <alias name="Angle with vertical 1" field="d1" index="22"/>
    <alias name="Angle with vertical 2" field="d2" index="23"/>
    <alias name="Angle with x axis 1" field="a1" index="24"/>
    <alias name="Angle with x axis 2" field="a2" index="25"/>
    <alias name="Automatic angles" field="AA" index="26"/>
    <alias name="Number in parallel (Uhaina)" field="NB_in_//" index="27"/>
    <alias name="Automatic length" field="AL" index="28"/>
    <alias name="Automatic elevations" field="AZ" index="29"/>
  </aliases>
  <defaults>
    <default field="NAME" expression="" applyOnUpdate="0"/>
    <default field="N1" expression="" applyOnUpdate="0"/>
    <default field="N2" expression="" applyOnUpdate="0"/>
    <default field="CE1" expression="0.5" applyOnUpdate="0"/>
    <default field="CE2" expression="0.5" applyOnUpdate="0"/>
    <default field="CS1" expression="1.0" applyOnUpdate="0"/>
    <default field="CS2" expression="1.0" applyOnUpdate="0"/>
    <default field="LARG" expression="0" applyOnUpdate="0"/>
    <default field="HAUT" expression="0" applyOnUpdate="0"/>
    <default field="CLAP" expression="'0'" applyOnUpdate="0"/>
    <default field="L12" expression="1.0" applyOnUpdate="0"/>
    <default field="Z1" expression="0" applyOnUpdate="0"/>
    <default field="Z2" expression="0" applyOnUpdate="0"/>
    <default field="CV" expression="0" applyOnUpdate="0"/>
    <default field="C56" expression="0" applyOnUpdate="0"/>
    <default field="CV5" expression="0" applyOnUpdate="0"/>
    <default field="C5" expression="0" applyOnUpdate="0"/>
    <default field="CT" expression="0" applyOnUpdate="0"/>
    <default field="HAUT2" expression="0" applyOnUpdate="0"/>
    <default field="FRIC" expression="0" applyOnUpdate="0"/>
    <default field="LENGTH" expression="0" applyOnUpdate="0"/>
    <default field="CIRC" expression="0" applyOnUpdate="0"/>
    <default field="d1" expression="0" applyOnUpdate="0"/>
    <default field="d2" expression="0" applyOnUpdate="0"/>
    <default field="a1" expression="0" applyOnUpdate="0"/>
    <default field="a2" expression="0" applyOnUpdate="0"/>
    <default field="AA" expression="0" applyOnUpdate="0"/>
    <default field="NB_in_//" expression="1" applyOnUpdate="0"/>
    <default field="AL" expression="0" applyOnUpdate="0"/>
    <default field="AZ" expression="0" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="NAME" unique_strength="0" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint field="N1" unique_strength="0" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint field="N2" unique_strength="0" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint field="CE1" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CE2" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CS1" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CS2" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="LARG" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="HAUT" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CLAP" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="L12" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="Z1" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="Z2" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CV" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="C56" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CV5" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="C5" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CT" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="HAUT2" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="FRIC" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="LENGTH" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="CIRC" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="d1" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="d2" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="a1" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="a2" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="AA" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="NB_in_//" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="AL" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
    <constraint field="AZ" unique_strength="0" constraints="4" exp_strength="2" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="NAME" desc=""/>
    <constraint exp="" field="N1" desc=""/>
    <constraint exp="" field="N2" desc=""/>
    <constraint exp="&quot;CE1&quot; IS NOT NULL" field="CE1" desc="Required."/>
    <constraint exp="&quot;CE2&quot; IS NOT NULL" field="CE2" desc="Required."/>
    <constraint exp="&quot;CS1&quot; IS NOT NULL" field="CS1" desc="Required."/>
    <constraint exp="&quot;CS2&quot; IS NOT NULL" field="CS2" desc="Required."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2 OR coalesce(&quot;CIRC&quot;, 0) = 0) OR coalesce(&quot;LARG&quot;, 0) > 0" field="LARG" desc="The width must be greater than 0 (rectangular culvert or option 2)."/>
    <constraint exp="coalesce(&quot;HAUT&quot;, 0) > 0" field="HAUT" desc="The height must be greater than 0."/>
    <constraint exp="&quot;CLAP&quot; IS NOT NULL" field="CLAP" desc="Required."/>
    <constraint exp="to_int(coalesce(@culvert_option, 1)) = 2 OR &quot;L12&quot; IS NOT NULL" field="L12" desc="Required with culvert option 1."/>
    <constraint exp="&quot;Z1&quot; IS NOT NULL" field="Z1" desc="Required."/>
    <constraint exp="&quot;Z2&quot; IS NOT NULL" field="Z2" desc="Required."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CV&quot; IS NOT NULL" field="CV" desc="Required with culvert option 2."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;C56&quot; IS NOT NULL" field="C56" desc="Required with culvert option 2."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CV5&quot; IS NOT NULL" field="CV5" desc="Required with culvert option 2."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;C5&quot; IS NOT NULL" field="C5" desc="Required with culvert option 2."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CT&quot; IS NOT NULL" field="CT" desc="Required with culvert option 2."/>
    <constraint exp="&quot;HAUT2&quot; IS NOT NULL" field="HAUT2" desc="Required."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;FRIC&quot; IS NOT NULL" field="FRIC" desc="Required with culvert option 2."/>
    <constraint exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;LENGTH&quot; IS NOT NULL" field="LENGTH" desc="Required with culvert option 2."/>
    <constraint exp="&quot;CIRC&quot; IS NOT NULL" field="CIRC" desc="Required."/>
    <constraint exp="&quot;d1&quot; IS NOT NULL" field="d1" desc="Required."/>
    <constraint exp="&quot;d2&quot; IS NOT NULL" field="d2" desc="Required."/>
    <constraint exp="&quot;a1&quot; IS NOT NULL" field="a1" desc="Required."/>
    <constraint exp="&quot;a2&quot; IS NOT NULL" field="a2" desc="Required."/>
    <constraint exp="&quot;AA&quot; IS NOT NULL" field="AA" desc="Required."/>
    <constraint exp="&quot;NB_in_//&quot; IS NOT NULL" field="NB_in_//" desc="Required."/>
    <constraint exp="&quot;AL&quot; IS NOT NULL" field="AL" desc="Required."/>
    <constraint exp="&quot;AZ&quot; IS NOT NULL" field="AZ" desc="Required."/>
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
    <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
      <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
    </labelStyle>
    <attributeEditorContainer horizontalStretch="0" type="GroupBox" collapsed="0" visibilityExpressionEnabled="0" name="Culvert" showLabel="1" verticalStretch="0" visibilityExpression="" collapsedExpression="" columnCount="1" groupBox="1" collapsedExpressionEnabled="0">
      <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="NAME" showLabel="1" verticalStretch="0" index="0">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="N1" showLabel="1" verticalStretch="0" index="1">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="N2" showLabel="1" verticalStretch="0" index="2">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CLAP" showLabel="1" verticalStretch="0" index="9">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CIRC" showLabel="1" verticalStretch="0" index="21">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="NB_in_//" showLabel="1" verticalStretch="0" index="27">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer horizontalStretch="0" type="GroupBox" collapsed="0" visibilityExpressionEnabled="0" name="Elevations and section" showLabel="1" verticalStretch="0" visibilityExpression="" collapsedExpression="" columnCount="1" groupBox="1" collapsedExpressionEnabled="0">
      <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="Z1" showLabel="1" verticalStretch="0" index="11">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="Z2" showLabel="1" verticalStretch="0" index="12">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="AZ" showLabel="1" verticalStretch="0" index="29">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="LARG" showLabel="1" verticalStretch="0" index="7">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="HAUT" showLabel="1" verticalStretch="0" index="8">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="HAUT2" showLabel="1" verticalStretch="0" index="18">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="d1" showLabel="1" verticalStretch="0" index="22">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="d2" showLabel="1" verticalStretch="0" index="23">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer horizontalStretch="0" type="GroupBox" collapsed="0" visibilityExpressionEnabled="0" name="Angles" showLabel="1" verticalStretch="0" visibilityExpression="" collapsedExpression="" columnCount="1" groupBox="1" collapsedExpressionEnabled="0">
      <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="a1" showLabel="1" verticalStretch="0" index="24">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="a2" showLabel="1" verticalStretch="0" index="25">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="AA" showLabel="1" verticalStretch="0" index="26">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer horizontalStretch="0" type="GroupBox" collapsed="0" visibilityExpressionEnabled="0" name="Head losses" showLabel="1" verticalStretch="0" visibilityExpression="" collapsedExpression="" columnCount="1" groupBox="1" collapsedExpressionEnabled="0">
      <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="CE1" showLabel="1" verticalStretch="0" index="3">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CE2" showLabel="1" verticalStretch="0" index="4">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CS1" showLabel="1" verticalStretch="0" index="5">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CS2" showLabel="1" verticalStretch="0" index="6">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer horizontalStretch="0" type="GroupBox" collapsed="0" visibilityExpressionEnabled="1" name="Option 1" showLabel="1" verticalStretch="0" visibilityExpression="NOT (to_int(coalesce(@culvert_option, 1)) = 2)" collapsedExpression="" columnCount="1" groupBox="1" collapsedExpressionEnabled="0">
      <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="L12" showLabel="1" verticalStretch="0" index="10">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer horizontalStretch="0" type="GroupBox" collapsed="0" visibilityExpressionEnabled="1" name="Option 2" showLabel="1" verticalStretch="0" visibilityExpression="to_int(coalesce(@culvert_option, 1)) = 2" collapsedExpression="" columnCount="1" groupBox="1" collapsedExpressionEnabled="0">
      <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="CV" showLabel="1" verticalStretch="0" index="13">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="C56" showLabel="1" verticalStretch="0" index="14">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CV5" showLabel="1" verticalStretch="0" index="15">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="C5" showLabel="1" verticalStretch="0" index="16">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="CT" showLabel="1" verticalStretch="0" index="17">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="FRIC" showLabel="1" verticalStretch="0" index="19">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="LENGTH" showLabel="1" verticalStretch="0" index="20">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="AL" showLabel="1" verticalStretch="0" index="28">
        <labelStyle labelColor="" overrideLabelColor="0" overrideLabelFont="0">
          <labelFont description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
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
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>1</layerGeometryType>
</qgis>
