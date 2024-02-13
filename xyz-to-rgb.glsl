#pragma glslify: hsluv_fromLinear = require('./hsluv-from-linear')

vec3 xyzToRgb(vec3 tuple) {
  const mat3 m = mat3( 
      3.2409699419045214  ,-1.5373831775700935 ,-0.49861076029300328 ,
     -0.96924363628087983 , 1.8759675015077207 , 0.041555057407175613,
      0.055630079696993609,-0.20397695888897657, 1.0569715142428786  );
  
  return hsluv_fromLinear(tuple*m);
}

vec4 xyzToRgb(vec4 c) {
  return vec4(xyzToRgb(vec3(c.x,c.y,c.z)), c.a);
}

#pragma glslify: export(xyzToRgb)