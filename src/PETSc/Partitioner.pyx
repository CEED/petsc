# --------------------------------------------------------------------

class PartitionerType(object):
    CHACO    = S_(PETSCPARTITIONERCHACO)
    PARMETIS = S_(PETSCPARTITIONERPARMETIS)
    SHELL    = S_(PETSCPARTITIONERSHELL)

# --------------------------------------------------------------------

cdef class Partitioner(Object):

    Type = PartitionerType

    def __cinit__(self):
        self.obj = <PetscObject*> &self.part
        self.part = NULL

    def view(self, Viewer viewer=None):
        cdef PetscViewer vwr = NULL
        if viewer is not None: vwr = viewer.vwr
        CHKERR( PetscPartitionerView(self.part, vwr) )

    def destroy(self):
        CHKERR( PetscPartitionerDestroy(&self.part) )
        return self

    def create(self, comm=None):
        cdef MPI_Comm ccomm = def_Comm(comm, PETSC_COMM_DEFAULT)
        cdef PetscPartitioner newpart = NULL
        CHKERR( PetscPartitionerCreate(ccomm, &newpart) )
        PetscCLEAR(self.obj); self.part = newpart
        return self

    def setType(self, part_type):
        cdef const_char *cval = NULL
        part_type = str2bytes(part_type, &cval)
        CHKERR( PetscPartitionerSetType(self.part, cval) )

    def getType(self):
        cdef PetscPartitionerType cval = NULL
        CHKERR( PetscPartitionerGetType(self.part, &cval) )
        return bytes2str(cval)

    def setFromOptions(self):
        CHKERR( PetscPartitionerSetFromOptions(self.part) )

    def setUp(self):
        CHKERR( PetscPartitionerSetUp(self.part) )

    def setShellPartition(self, numProcs, sizes, points):
        cdef PetscInt cnumProcs = asInt(numProcs)
        cdef PetscInt *csizes
        cdef PetscInt *cpoints
        sizes = iarray_i(sizes, NULL, &csizes)
        points = iarray_i(points, NULL, &cpoints)
        CHKERR( PetscPartitionerShellSetPartition(self.part, cnumProcs,
                                                  csizes, cpoints) )
