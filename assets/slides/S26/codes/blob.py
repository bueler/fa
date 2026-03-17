from firedrake import *
mesh = Mesh("blob.msh")
Vh = FunctionSpace(mesh, "P", 1)
uh = Function(Vh, name="u_h")
vh = TestFunction(Vh)
f = Constant(1.0)
F = dot(grad(uh), grad(vh)) * dx - f * vh * dx
zero = DirichletBC(Vh, Constant(0.0), (1,))
solve(F == 0, uh, bcs=[zero,])
VTKFile("result.pvd").write(uh)
