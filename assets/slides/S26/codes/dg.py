from firedrake import *

mesh = UnitDiskMesh(refinement_level=3)
x, y = SpatialCoordinate(mesh)

V = FunctionSpace(mesh, "DG", 0)  # only this line is changed vs triangles.py
f = Function(V, name="f").interpolate(1.0 - x**2 - y**2)

VTKFile("output.pvd").write(f)
