//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "BRMobile/Avatar/DefaultAvatar" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Ambientlight ("Ambient light", Range(0, 8)) = 0
_AlphaMask ("Alpha Mask", Float) = 0
_CharaSpectatorColor ("SpectatorColor", Color) = (0,0,0,0)
}
SubShader {
 LOD 200
 Tags { "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  ZClip Off
  ZTest Greater
  ZWrite Off
  Stencil {
   Ref 128
   Comp NotEqual
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 47123
}
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  ZClip Off
  Stencil {
   Ref 128
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 73092
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
}
}
 Pass {
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  ZClip Off
  Cull Off
  Stencil {
   Ref 128
   Comp NotEqual
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 160090
}
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  ZClip Off
  GpuProgramID 213471
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  highp vec3 color_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_1);
  tmpvar_3.w = _AlphaMask;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  tmpvar_5.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_5.w;
  mediump float tmpvar_6;
  tmpvar_6 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_6;
  finalRGBA_2.xyz = (mix (tmpvar_5.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  worldNormal_1 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
void main ()
{
  lowp float lum2_1;
  highp vec4 finalRGBA_2;
  highp vec3 color_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_3 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_3);
  highp vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_5;
  tmpvar_6.w = _AlphaMask;
  finalRGBA_2.w = tmpvar_6.w;
  highp float tmpvar_7;
  tmpvar_7 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_5).x;
  lum2_1 = tmpvar_7;
  finalRGBA_2.xyz = mix (vec3(lum2_1), tmpvar_5, vec3(0.25, 0.25, 0.25));
  finalRGBA_2.xyz = (finalRGBA_2.xyz * vec3(1.83, 1.758, 2.04));
  gl_FragData[0] = finalRGBA_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform mediump float _CharaLightIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 worldNormal_1;
  lowp vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = ((max (0.0, 
    dot (worldNormal_1, _WorldSpaceLightPos0.xyz)
  ) * _LightColor0) * _CharaLightIntensity).xyz;
  tmpvar_2 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz));
  tmpvar_3 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = worldNormal_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float _Ambientlight;
uniform lowp float _AlphaMask;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_COLOR;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float dot_value_1;
  lowp float lum2_2;
  highp vec4 finalRGBA_3;
  highp vec3 color_4;
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  color_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = ((xlv_COLOR + (_Ambientlight * 0.23)) * color_4);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_6;
  tmpvar_7.w = _AlphaMask;
  finalRGBA_3.w = tmpvar_7.w;
  highp float tmpvar_8;
  tmpvar_8 = (vec3(0.2125, 0.7154, 0.0721) * tmpvar_6).x;
  lum2_2 = tmpvar_8;
  finalRGBA_3.xyz = mix (vec3(lum2_2), tmpvar_6, vec3(0.25, 0.25, 0.25));
  finalRGBA_3.xyz = (finalRGBA_3.xyz * vec3(1.83, 1.758, 2.04));
  mediump float tmpvar_9;
  tmpvar_9 = dot (xlv_TEXCOORD1, xlv_TEXCOORD2);
  dot_value_1 = tmpvar_9;
  finalRGBA_3.xyz = (mix (finalRGBA_3.xyz, vec3(1.0, 0.89, 0.0), vec3(0.4, 0.4, 0.4)) + ((1.0 - dot_value_1) * abs(
    (fract((_Time.y * 0.5)) - 0.5)
  )));
  gl_FragData[0] = finalRGBA_3;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "BRNIGHT_ON" "BRCHARA_INVINCIBLE" }
""
}
}
}
}
Fallback "BRMobile/VertexLit"
}