import config.package

class Configure(config.package.GNUPackage):
  def __init__(self, framework):
    config.package.GNUPackage.__init__(self, framework)
    self.download          = ['http://files.salome-platform.org/Salome/other/med-3.1.0.tar.gz']
    self.functions         = ['MEDfileOpen']
    self.includes          = ['med.h']
    self.liblist           = [['libmed.a']]
    self.needsMath         = 1
    return

  def setupDependencies(self, framework):
    config.package.GNUPackage.setupDependencies(self, framework)
    self.mpi   = framework.require('config.packages.MPI', self)
    self.hdf5  = framework.require('config.packages.hdf5', self)
    self.deps  = [self.mpi, self.hdf5]
    return

  def formGNUConfigureArgs(self):
    args = config.package.GNUPackage.formGNUConfigureArgs(self)
    args.append('--disable-python')
    args.append('--with-hdf5-dir=%s' % self.hdf5.directory)
    return args
