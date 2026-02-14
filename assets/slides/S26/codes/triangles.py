from firedrake import *

mesh = UnitDiskMesh(refinement_level=1)
x, y = SpatialCoordinate(mesh)

V = FunctionSpace(mesh, "CG", 1)
f = Function(V, name="f").interpolate(1.0 - x**2 - y**2)

VTKFile("output.pvd").write(f)
