from firedrake import *

mesh = UnitDiskMesh(refinement_level=1)  # or ...=3)
x, y = SpatialCoordinate(mesh)

V = FunctionSpace(mesh, "CG", 1)  # or ..., "DG", 0)
f = Function(V, name="f").interpolate(1.0 - x**2 - y**2)

VTKFile("output.pvd").write(f)
