#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec2 u_resomouse;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main(){
  
  int val = int(u_resomouse.y * 150.0 + 20.0);
  
  int si = int(vertTexCoord.s * val);
  int sj = int(vertTexCoord.t * val);
  
  gl_FragColor = texture2D(texture, vec2(float(si) / val, float(sj) / val)) * vec4(vertColor[0], vertColor[1], vertColor[2], (u_resomouse.x/2.0) + 0.5);
}
