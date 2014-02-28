#  Jasper den Ouden 02-08-2012
# Placed in public domain.

const OPENGL_VERSIONS = "1.0", "2.1", "3.2", "3.3", "4.2", "4.3"
if isdefined(:OpenGLver) && OpenGLver in OPENGL_VERSIONS
    OpenGLmod = string("gl", replace(OpenGLver, ".", ""))
    require("OpenGL/src/$OpenGLmod/$OpenGLmod")
    require("OpenGL/src/$OpenGLmod/$(OpenGLmod)aux")

    require("OpenGL/src/glu/glu")
    using GLU
    using OpenGLStd
end
