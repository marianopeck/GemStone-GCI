tests
testGciNBExecuteString1
	| session resultOopType limit count |
	session := GsGciSession login: GsGciSessionDescription testingSessionDescription.
	resultOopType := nil.
	limit := 10.
	count := 0.
	[ 
	session gciExecuteStringNB: 'String'.
	self assert: session gciCallInProgress.
	[ 
	session
		gciNbEnd_OnNotReady: [ :progress | 
			"continue pollihg"
			false ]
		onReady: [ :gsOopType | 
			"got our result"
			resultOopType := gsOopType.
			true ]
		onError: [ :gci32xErrSType | 
			"not supposed to happen"
			self fail: 'Unexpected error: ' , gci32xErrSType printString ] ]
		whileFalse: [ 
			count > limit
				ifTrue: [ 
					self fail: 'Timed out'.
					count := count + 1 ].
			(Delay forMilliseconds: 250) wait ] ]
		ensure: [ session logout ].
	self assert: resultOopType = GsGciOopType oopClassString