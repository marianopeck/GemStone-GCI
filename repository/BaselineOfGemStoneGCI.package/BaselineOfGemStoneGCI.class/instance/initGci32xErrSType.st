doits
initGci32xErrSType
   "FFI does not correctly define byteSize for Gci32xErrSType, so this addtional step is needed"

	(Smalltalk at: #GsGci32xErrSType) perform: #compileFields