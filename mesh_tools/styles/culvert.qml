<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Fields|Forms" version="3.44.14-Solothurn">
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" referencescale="-1" type="RuleRenderer">
    <rules key="{41f5c106-9571-45f4-be0c-b5c71f0ad906}">
      <rule key="{39a52237-9aa3-49f0-ac7f-4ef06a94868e}" label="Not valid (node or height)" filter="&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0" symbol="0"/>
      <rule key="{605aac6b-0c82-4df9-ad30-f94854d634b6}" label="No valve (1 &lt;-> 2)" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 0" symbol="1"/>
      <rule key="{2cbca9b0-364f-4e91-bf5a-ac9caf6abb19}" label="Valve, flow 1 -> 2" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 1" symbol="2"/>
      <rule key="{d68939df-ffd3-4de8-be9f-2e8c36359535}" label="Valve, flow 2 -> 1" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 2" symbol="3"/>
      <rule key="{03b3e911-3855-414f-b68c-18364d9a830c}" label="Closed (no flow)" filter="NOT (&quot;N1&quot; IS NULL OR &quot;N2&quot; IS NULL OR coalesce(&quot;HAUT&quot;, 0) &lt;= 0) AND to_int(&quot;CLAP&quot;) = 3" symbol="4"/>
      <rule key="{90a73f08-0731-4549-a740-7cf271f6ffeb}" label="Other" filter="ELSE" symbol="5"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="0" type="line" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" id="{0cdc50aa-184e-46e4-bc04-eb0e20b7c60e}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{20cef130-d739-42fc-87c5-4d6a3601925d}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@0@1" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{b0184dd1-e2a9-49f5-88a4-33a4e76ed300}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{453a7dd5-4a75-43b4-a5e2-38a6c8927229}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@0@2" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{db7306c0-fb70-4029-b6e2-c885a4fea083}" locked="0" pass="0">
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
      <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="1" type="line" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" id="{1f104f94-1286-47ff-bd3d-dc54dd26fc4b}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{7f3f4133-bb8f-4491-b4a5-48828d48d527}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@1@1" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{05e2f5b8-67e3-4743-b89b-1a82bc4a2bb2}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{1aa5b084-7d90-4a9d-8219-207c5f34e0cb}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@1@2" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{5fdcba65-c3c4-4a31-8024-65fb284bf951}" locked="0" pass="0">
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
      <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="2" type="line" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" id="{a0ea2167-05de-406e-9f09-972fbc88f119}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{d95bfccb-556f-4dde-bf70-7298cf54415e}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@2@1" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{6c22099d-e0dd-4a4e-8ad8-5a3ba14b24ac}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{16ec5cc7-a747-498e-9d90-eaec0a6e5edd}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@2@2" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{46c09995-8cd2-4514-8e60-e0dd57da2897}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{94e96dff-ba3d-401e-9f39-56cff4340113}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@2@3" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{8951936e-07fa-440e-920c-450d7af23c70}" locked="0" pass="0">
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
      <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="3" type="line" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" id="{5a9bdaa1-6871-4029-94ea-fc8a6a0504c2}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{78611bb8-5ad2-46fc-8c91-d3bcc40650b9}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@3@1" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{98e91d66-6485-4ec7-ba1e-c04697a00a58}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{fa909590-6096-4d24-bee0-574211207055}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@3@2" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{b950ae8c-7279-41fc-8050-9e23e25d7629}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{32ca4e44-1358-42b9-8802-784c8f7bfe89}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@3@3" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{3c01e8f2-81e9-49b4-8564-1e37ce180c9f}" locked="0" pass="0">
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
      <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="4" type="line" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" id="{c62fdc64-942e-4077-82d7-5a33f5b9d801}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{667b3cc1-6c13-44bb-ae3c-dbdf0ee10784}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@4@1" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{f42eba20-1b6f-4bae-8f30-ea322af464ca}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{eaa0b340-7c57-4b26-b7b2-069ec4f118b5}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@4@2" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{c8951293-b4e2-4e12-a245-a687201a2a73}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{975defde-ee7b-4060-994c-2c67b6f4a533}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@4@3" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{0a049793-5a56-45a3-b1f9-182f2103e375}" locked="0" pass="0">
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
      <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="5" type="line" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" id="{1290fce6-58d9-44e5-9922-6f82dde3170d}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{7d2e9021-1263-4501-84cf-63950139b7a8}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@5@1" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{9cca5e80-7b6d-4ef0-9e19-aaee31c16462}" locked="0" pass="0">
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
        <layer enabled="1" class="MarkerLine" id="{4fc44998-db8c-4eed-bea0-fffca6a59151}" locked="0" pass="0">
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
          <symbol force_rhr="0" is_animated="0" alpha="1" clip_to_extent="1" name="@5@2" type="marker" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" class="SimpleMarker" id="{02ef4665-ae1a-4474-8c48-eb92f3a12e74}" locked="0" pass="0">
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
            <Option value="1" name="CheckedState" type="QString"/>
            <Option value="0" name="UncheckedState" type="QString"/>
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
    <alias index="1" field="N1" name="Node 1"/>
    <alias index="2" field="N2" name="Node 2"/>
    <alias index="3" field="CE1" name="Head loss coef. inflow 1"/>
    <alias index="4" field="CE2" name="Head loss coef. inflow 2"/>
    <alias index="5" field="CS1" name="Head loss coef. outflow 1"/>
    <alias index="6" field="CS2" name="Head loss coef. outflow 2"/>
    <alias index="7" field="LARG" name="Width"/>
    <alias index="8" field="HAUT" name="Height 1"/>
    <alias index="9" field="CLAP" name="Valve"/>
    <alias index="10" field="L12" name="Linear head loss"/>
    <alias index="11" field="Z1" name="Elevation 1"/>
    <alias index="12" field="Z2" name="Elevation 2"/>
    <alias index="13" field="CV" name="Valve head loss coef."/>
    <alias index="14" field="C56" name="Flow type 5/6 coef."/>
    <alias index="15" field="CV5" name="Flow type 5 correction"/>
    <alias index="16" field="C5" name="Flow type 5 coef."/>
    <alias index="17" field="CT" name="Trash screen head loss coef."/>
    <alias index="18" field="HAUT2" name="Height 2 (0: = height 1)"/>
    <alias index="19" field="FRIC" name="Manning coef."/>
    <alias index="20" field="LENGTH" name="Length"/>
    <alias index="21" field="CIRC" name="Circular"/>
    <alias index="22" field="d1" name="Angle with vertical 1"/>
    <alias index="23" field="d2" name="Angle with vertical 2"/>
    <alias index="24" field="a1" name="Angle with x axis 1"/>
    <alias index="25" field="a2" name="Angle with x axis 2"/>
    <alias index="26" field="AA" name="Automatic angles"/>
    <alias index="27" field="NB_in_//" name="Number in parallel (Uhaina)"/>
    <alias index="28" field="AL" name="Automatic length"/>
    <alias index="29" field="AZ" name="Automatic elevations"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="NAME"/>
    <default expression="with_variable('i', eval('mesh_vertex_index(@culvert_mesh, start_point($geometry))'), if(@i IS NULL, &quot;N1&quot;, if(@i &lt; 0, NULL, @i + 1)))" applyOnUpdate="1" field="N1"/>
    <default expression="with_variable('i', eval('mesh_vertex_index(@culvert_mesh, end_point($geometry))'), if(@i IS NULL, &quot;N2&quot;, if(@i &lt; 0, NULL, @i + 1)))" applyOnUpdate="1" field="N2"/>
    <default expression="0.5" applyOnUpdate="0" field="CE1"/>
    <default expression="0.5" applyOnUpdate="0" field="CE2"/>
    <default expression="1.0" applyOnUpdate="0" field="CS1"/>
    <default expression="1.0" applyOnUpdate="0" field="CS2"/>
    <default expression="if(&quot;CIRC&quot; = 1, &quot;HAUT&quot;, &quot;LARG&quot;)" applyOnUpdate="1" field="LARG"/>
    <default expression="0" applyOnUpdate="0" field="HAUT"/>
    <default expression="'0'" applyOnUpdate="0" field="CLAP"/>
    <default expression="1.0" applyOnUpdate="0" field="L12"/>
    <default expression="if(&quot;AZ&quot; = 1, coalesce(eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, start_point($geometry))'), &quot;Z1&quot;), &quot;Z1&quot;)" applyOnUpdate="1" field="Z1"/>
    <default expression="if(&quot;AZ&quot; = 1, coalesce(eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, end_point($geometry))'), &quot;Z2&quot;), &quot;Z2&quot;)" applyOnUpdate="1" field="Z2"/>
    <default expression="0" applyOnUpdate="0" field="CV"/>
    <default expression="0" applyOnUpdate="0" field="C56"/>
    <default expression="0" applyOnUpdate="0" field="CV5"/>
    <default expression="0" applyOnUpdate="0" field="C5"/>
    <default expression="0" applyOnUpdate="0" field="CT"/>
    <default expression="0" applyOnUpdate="0" field="HAUT2"/>
    <default expression="0" applyOnUpdate="0" field="FRIC"/>
    <default expression="if(&quot;AL&quot; = 1, coalesce(length(transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs'))), &quot;LENGTH&quot;), &quot;LENGTH&quot;)" applyOnUpdate="1" field="LENGTH"/>
    <default expression="0" applyOnUpdate="0" field="CIRC"/>
    <default expression="0" applyOnUpdate="0" field="d1"/>
    <default expression="0" applyOnUpdate="0" field="d2"/>
    <default expression="if(&quot;AA&quot; = 1, coalesce(with_variable('g', transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs')), ((450 - degrees(azimuth(point_n(@g, 1), point_n(@g, 2)))) % 360 + 180) % 360), &quot;a1&quot;), &quot;a1&quot;)" applyOnUpdate="1" field="a1"/>
    <default expression="if(&quot;AA&quot; = 1, coalesce(with_variable('g', transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs')), (450 - degrees(azimuth(point_n(@g, num_points(@g) - 1), point_n(@g, num_points(@g))))) % 360), &quot;a2&quot;), &quot;a2&quot;)" applyOnUpdate="1" field="a2"/>
    <default expression="0" applyOnUpdate="0" field="AA"/>
    <default expression="1" applyOnUpdate="0" field="NB_in_//"/>
    <default expression="0" applyOnUpdate="0" field="AL"/>
    <default expression="0" applyOnUpdate="0" field="AZ"/>
  </defaults>
  <constraints>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="NAME" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="N1" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="N2" exp_strength="0"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CE1" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CE2" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CS1" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CS2" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="LARG" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="HAUT" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CLAP" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="L12" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="Z1" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="Z2" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CV" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="C56" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CV5" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="C5" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CT" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="HAUT2" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="FRIC" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="LENGTH" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="CIRC" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="d1" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="d2" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="a1" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="a2" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="AA" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="NB_in_//" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="AL" exp_strength="2"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="AZ" exp_strength="2"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="NAME"/>
    <constraint desc="" exp="" field="N1"/>
    <constraint desc="" exp="" field="N2"/>
    <constraint desc="Required." exp="&quot;CE1&quot; IS NOT NULL" field="CE1"/>
    <constraint desc="Required." exp="&quot;CE2&quot; IS NOT NULL" field="CE2"/>
    <constraint desc="Required." exp="&quot;CS1&quot; IS NOT NULL" field="CS1"/>
    <constraint desc="Required." exp="&quot;CS2&quot; IS NOT NULL" field="CS2"/>
    <constraint desc="The width must be greater than 0 (rectangular culvert or option 2)." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2 OR coalesce(&quot;CIRC&quot;, 0) = 0) OR coalesce(&quot;LARG&quot;, 0) > 0" field="LARG"/>
    <constraint desc="The height must be greater than 0." exp="coalesce(&quot;HAUT&quot;, 0) > 0" field="HAUT"/>
    <constraint desc="Required." exp="&quot;CLAP&quot; IS NOT NULL" field="CLAP"/>
    <constraint desc="Required with culvert option 1." exp="to_int(coalesce(@culvert_option, 1)) = 2 OR &quot;L12&quot; IS NOT NULL" field="L12"/>
    <constraint desc="Required." exp="&quot;Z1&quot; IS NOT NULL" field="Z1"/>
    <constraint desc="Required." exp="&quot;Z2&quot; IS NOT NULL" field="Z2"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CV&quot; IS NOT NULL" field="CV"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;C56&quot; IS NOT NULL" field="C56"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CV5&quot; IS NOT NULL" field="CV5"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;C5&quot; IS NOT NULL" field="C5"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;CT&quot; IS NOT NULL" field="CT"/>
    <constraint desc="Required." exp="&quot;HAUT2&quot; IS NOT NULL" field="HAUT2"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;FRIC&quot; IS NOT NULL" field="FRIC"/>
    <constraint desc="Required with culvert option 2." exp="NOT (to_int(coalesce(@culvert_option, 1)) = 2) OR &quot;LENGTH&quot; IS NOT NULL" field="LENGTH"/>
    <constraint desc="Required." exp="&quot;CIRC&quot; IS NOT NULL" field="CIRC"/>
    <constraint desc="Required." exp="&quot;d1&quot; IS NOT NULL" field="d1"/>
    <constraint desc="Required." exp="&quot;d2&quot; IS NOT NULL" field="d2"/>
    <constraint desc="Required." exp="&quot;a1&quot; IS NOT NULL" field="a1"/>
    <constraint desc="Required." exp="&quot;a2&quot; IS NOT NULL" field="a2"/>
    <constraint desc="Required." exp="&quot;AA&quot; IS NOT NULL" field="AA"/>
    <constraint desc="Required." exp="&quot;NB_in_//&quot; IS NOT NULL" field="NB_in_//"/>
    <constraint desc="Required." exp="&quot;AL&quot; IS NOT NULL" field="AL"/>
    <constraint desc="Required." exp="&quot;AZ&quot; IS NOT NULL" field="AZ"/>
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
    <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
      <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
    </labelStyle>
    <attributeEditorContainer columnCount="1" collapsed="0" collapsedExpression="" horizontalStretch="0" showLabel="1" collapsedExpressionEnabled="0" verticalStretch="0" groupBox="1" visibilityExpression="" name="Culvert" type="GroupBox" visibilityExpressionEnabled="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
        <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" index="0" showLabel="1" verticalStretch="0" name="NAME">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="1" showLabel="1" verticalStretch="0" name="N1">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="2" showLabel="1" verticalStretch="0" name="N2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="9" showLabel="1" verticalStretch="0" name="CLAP">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="21" showLabel="1" verticalStretch="0" name="CIRC">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="27" showLabel="1" verticalStretch="0" name="NB_in_//">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" collapsed="0" collapsedExpression="" horizontalStretch="0" showLabel="1" collapsedExpressionEnabled="0" verticalStretch="0" groupBox="1" visibilityExpression="" name="Elevations and section" type="GroupBox" visibilityExpressionEnabled="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
        <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" index="11" showLabel="1" verticalStretch="0" name="Z1">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="12" showLabel="1" verticalStretch="0" name="Z2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="29" showLabel="1" verticalStretch="0" name="AZ">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="7" showLabel="1" verticalStretch="0" name="LARG">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="8" showLabel="1" verticalStretch="0" name="HAUT">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="18" showLabel="1" verticalStretch="0" name="HAUT2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="22" showLabel="1" verticalStretch="0" name="d1">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="23" showLabel="1" verticalStretch="0" name="d2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" collapsed="0" collapsedExpression="" horizontalStretch="0" showLabel="1" collapsedExpressionEnabled="0" verticalStretch="0" groupBox="1" visibilityExpression="" name="Angles" type="GroupBox" visibilityExpressionEnabled="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
        <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" index="24" showLabel="1" verticalStretch="0" name="a1">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="25" showLabel="1" verticalStretch="0" name="a2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="26" showLabel="1" verticalStretch="0" name="AA">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" collapsed="0" collapsedExpression="" horizontalStretch="0" showLabel="1" collapsedExpressionEnabled="0" verticalStretch="0" groupBox="1" visibilityExpression="" name="Head losses" type="GroupBox" visibilityExpressionEnabled="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
        <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" index="3" showLabel="1" verticalStretch="0" name="CE1">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="4" showLabel="1" verticalStretch="0" name="CE2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="5" showLabel="1" verticalStretch="0" name="CS1">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="6" showLabel="1" verticalStretch="0" name="CS2">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" collapsed="0" collapsedExpression="" horizontalStretch="0" showLabel="1" collapsedExpressionEnabled="0" verticalStretch="0" groupBox="1" visibilityExpression="NOT (to_int(coalesce(@culvert_option, 1)) = 2)" name="Option 1" type="GroupBox" visibilityExpressionEnabled="1">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
        <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" index="10" showLabel="1" verticalStretch="0" name="L12">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" collapsed="0" collapsedExpression="" horizontalStretch="0" showLabel="1" collapsedExpressionEnabled="0" verticalStretch="0" groupBox="1" visibilityExpression="to_int(coalesce(@culvert_option, 1)) = 2" name="Option 2" type="GroupBox" visibilityExpressionEnabled="1">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
        <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" index="13" showLabel="1" verticalStretch="0" name="CV">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="14" showLabel="1" verticalStretch="0" name="C56">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="15" showLabel="1" verticalStretch="0" name="CV5">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="16" showLabel="1" verticalStretch="0" name="C5">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="17" showLabel="1" verticalStretch="0" name="CT">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="19" showLabel="1" verticalStretch="0" name="FRIC">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="20" showLabel="1" verticalStretch="0" name="LENGTH">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" index="28" showLabel="1" verticalStretch="0" name="AL">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="">
          <labelFont underline="0" bold="0" strikethrough="0" style="" description="DejaVu LGC Sans,12,-1,5,50,0,0,0,0,0" italic="0"/>
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
    <field name="a1">
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
    <field name="a2">
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
  </dataDefinedFieldProperties>
  <widgets/>
  <layerGeometryType>1</layerGeometryType>
</qgis>
