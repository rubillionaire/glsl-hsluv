vec3 lchToLuv(vec3 tuple) {
    float hrad = radians(tuple.b);
    return vec3(
        tuple.r,
        cos(hrad) * tuple.g,
        sin(hrad) * tuple.g
    );
}
vec4 lchToLuv(vec4 c) {
  return vec4(lchToLuv(vec3(c.x,c.y,c.z)), c.a);
}


#pragma glslify: export(lchToLuv)