#  Jasper den Ouden 02-08-2012
# Placed in public domain.

module OpenGL

macro version(v)
    quote
        local v = replace($v, ".", "")
        local file = "OpenGL/src/gl$(v)/gl$(v)"
        local aux = "OpenGL/src/gl$(v)/gl$(v)aux"
        local glu = "OpenGL/src/glu/glu"

        # These two Base library calls are being used instead of just
        # require()-ing the file because the require() function itself has a
        # hardcoded context value of 'Main' when it evals the file contents.
        #
        # The only workaround I can think of is to make the same call that
        # the require function makes, ourselves, in the context of our module.
        OpenGL.eval(:(Base.include_from_node1(Base.find_in_path($file))))
        # Unlike the require() function, the `using` builtin accepts a module
        # context to operate within.
        OpenGL.eval(Expr(:using, :OpenGL, :OpenGLStd))

        # Same operations as above, for the auxiliary functions.
        OpenGL.eval(:(Base.include_from_node1(Base.find_in_path($aux))))
        OpenGL.eval(Expr(:using, :OpenGL, :OpenGLAux))

        # GLU.
        OpenGL.eval(:(Base.include_from_node1(Base.find_in_path($glu))))
        OpenGL.eval(Expr(:using, :OpenGL, :GLU))

    end
end

macro load()
    quote
        OpenGL.eval(Expr(:export, names(OpenGL.eval(:OpenGLStd))...))
        OpenGL.eval(Expr(:export, names(OpenGL.eval(:OpenGLAux))...))
        OpenGL.eval(Expr(:export, names(OpenGL.eval(:GLU))...))
    end
end

end # module OpenGL
