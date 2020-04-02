#define PC
#define IS_VERTEX_SHADER 1
#define IS_PIXEL_SHADER 0
#include <shader_vars.h>

struct VertexInput
{
	float4 position 	: POSITION;
	float4 color 		: COLOR;
};

struct PixelInput
{
    float4 position 	: POSITION;
	float4 color 		: COLOR;
};

PixelInput vs_main( const VertexInput vertex ) 
{
	PixelInput pixel;

	pixel.position = mul( float4( vertex.position.xyz, 1.0f), worldMatrix );
	pixel.position = mul( float4( pixel.position.xyz, 1.0f ), viewProjectionMatrix );

	pixel.color = vertex.color;
	
	return pixel;
}
