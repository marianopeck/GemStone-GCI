tests
testGciExecuteString2
	| session resultOopType |
	session := GsGciSession login: GsGciSessionDescription testingSessionDescription.
	[ resultOopType := session gciExecuteString: 'nil' ]
		ensure: [ session logout ].
	self assert: resultOopType = GsGciOopType oopNil