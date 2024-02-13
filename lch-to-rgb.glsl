#pragma glslify: lchToLuv = require('./lch-to-luv')
#pragma glslify: luvToXyz = require('./luv-to-xyz')
#pragma glslify: xyzToRgb = require('./xyz-to-rgb')

vec3 lchToRgb (vec3 tuple) {
  return xyzToRgb(luvToXyz(lchToLuv(tuple)));
}

vec4 lchToRgb (vec4 c) {
  return vec4(lchToRgb(vec3(c.x,c.y,c.z)), c.a);
}

#pragma glslify: export(lchToRgb)