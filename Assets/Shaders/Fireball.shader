// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32901,y:32712,varname:node_3138,prsc:2|emission-8226-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31997,y:32855,ptovrint:False,ptlb:Colour1,ptin:_Colour1,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8455882,c2:0.1989619,c3:0.1989619,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2431,x:31989,y:32652,ptovrint:False,ptlb:CloudSpite,ptin:_CloudSpite,varname:node_2431,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6a72d4f23d5a5a74593bc05557482117,ntxv:0,isnm:False|UVIN-6974-OUT,MIP-6186-OUT;n:type:ShaderForge.SFN_OneMinus,id:6326,x:32187,y:32664,varname:node_6326,prsc:2|IN-2431-RGB;n:type:ShaderForge.SFN_Color,id:3326,x:32003,y:33026,ptovrint:False,ptlb:Colour2,ptin:_Colour2,varname:node_3326,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9632353,c2:0.9397894,c3:0.1133218,c4:1;n:type:ShaderForge.SFN_Multiply,id:2455,x:32431,y:32949,varname:node_2455,prsc:2|A-6326-OUT,B-3326-RGB;n:type:ShaderForge.SFN_Multiply,id:3646,x:32410,y:32786,varname:node_3646,prsc:2|A-2431-RGB,B-7241-RGB;n:type:ShaderForge.SFN_Add,id:8226,x:32624,y:32860,varname:node_8226,prsc:2|A-3646-OUT,B-2455-OUT;n:type:ShaderForge.SFN_TexCoord,id:8509,x:31215,y:32594,varname:node_8509,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:3113,x:30860,y:32845,varname:node_3113,prsc:2;n:type:ShaderForge.SFN_Sin,id:6536,x:31157,y:32761,varname:node_6536,prsc:2|IN-3113-T;n:type:ShaderForge.SFN_Cos,id:1344,x:31154,y:32893,varname:node_1344,prsc:2|IN-3113-T;n:type:ShaderForge.SFN_Multiply,id:5976,x:31583,y:32893,varname:node_5976,prsc:2|A-8509-V,B-6483-OUT;n:type:ShaderForge.SFN_Multiply,id:6186,x:31577,y:32753,varname:node_6186,prsc:2|A-8509-U,B-8689-OUT;n:type:ShaderForge.SFN_RemapRange,id:8689,x:31357,y:32751,varname:node_8689,prsc:2,frmn:-1,frmx:1,tomn:0.5,tomx:1.5|IN-6536-OUT;n:type:ShaderForge.SFN_RemapRange,id:6483,x:31360,y:32914,varname:node_6483,prsc:2,frmn:-1,frmx:1,tomn:0.5,tomx:1.5|IN-1344-OUT;n:type:ShaderForge.SFN_Append,id:6974,x:31790,y:32815,varname:node_6974,prsc:2|A-6186-OUT,B-5976-OUT;proporder:7241-2431-3326;pass:END;sub:END;*/

Shader "Shader Forge/Fireball" {
    Properties {
        _Colour1 ("Colour1", Color) = (0.8455882,0.1989619,0.1989619,1)
        _CloudSpite ("CloudSpite", 2D) = "white" {}
        _Colour2 ("Colour2", Color) = (0.9632353,0.9397894,0.1133218,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Colour1;
            uniform sampler2D _CloudSpite; uniform float4 _CloudSpite_ST;
            uniform float4 _Colour2;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_3113 = _Time;
                float node_6186 = (i.uv0.r*(sin(node_3113.g)*0.5+1.0));
                float node_5976 = (i.uv0.g*(cos(node_3113.g)*0.5+1.0));
                float2 node_6974 = float2(node_6186,node_5976);
                float4 _CloudSpite_var = tex2Dlod(_CloudSpite,float4(TRANSFORM_TEX(node_6974, _CloudSpite),0.0,node_6186));
                float3 emissive = ((_CloudSpite_var.rgb*_Colour1.rgb)+((1.0 - _CloudSpite_var.rgb)*_Colour2.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
