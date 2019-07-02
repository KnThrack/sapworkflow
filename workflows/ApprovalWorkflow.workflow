{
	"contents": {
		"b6a837b7-4a88-4ef0-8813-d42cb0b9619d": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "approvalworkflow",
			"subject": "ApprovalWorkflow",
			"name": "ApprovalWorkflow",
			"documentation": "Quote Approval Workflow",
			"lastIds": "0f71dbff-9a6f-41d7-a957-518b225187ad",
			"events": {
				"63a407ab-3459-4e4b-ac43-b3cb1c2a4106": {
					"name": "StartEvent1"
				},
				"fb105933-50ff-46c7-81e6-ddcbce8b4684": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"5c174f60-6a2d-4c39-8234-9d9222572e7d": {
					"name": "ApproveQuote"
				},
				"93faaacc-6c29-4034-b5ec-de3782908035": {
					"name": "Retrive Product Info"
				},
				"8ffd63e5-ffb5-40cc-89fd-242d3686c19f": {
					"name": "Configure Context"
				},
				"95a9f774-95be-4e31-b1bc-d224a127d26f": {
					"name": "Stock Decision"
				},
				"8313b121-731e-471c-925e-835d3909b038": {
					"name": "Release Reorder"
				}
			},
			"sequenceFlows": {
				"bdec1876-7604-40af-9d9c-3fe604a8cca8": {
					"name": "SequenceFlow1"
				},
				"6904dbef-5054-46a5-bf53-14fad3ece28e": {
					"name": "SequenceFlow2"
				},
				"01bdcaa1-c816-4a75-8485-c050a9aa63c1": {
					"name": "SequenceFlow3"
				},
				"fd398bee-c8e0-446c-85e0-143d6f5e15bd": {
					"name": "SequenceFlow4"
				},
				"3b1b9b4a-e74c-4387-b85f-55d362105df1": {
					"name": "Stock OK"
				},
				"1ff766f6-1880-411b-83f0-82ff482a4be8": {
					"name": "Reorder needed"
				},
				"819a45c8-eba9-498d-9c5d-c8c98cf63683": {
					"name": "SequenceFlow7"
				}
			},
			"diagrams": {
				"312fa4b4-e97e-4f80-8cbb-def6b54a862a": {}
			}
		},
		"63a407ab-3459-4e4b-ac43-b3cb1c2a4106": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"13e395f4-6632-4de3-8edb-697f45e6b7c4": {}
			}
		},
		"fb105933-50ff-46c7-81e6-ddcbce8b4684": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"5c174f60-6a2d-4c39-8234-9d9222572e7d": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve ${context.quoteID}",
			"description": "Please confirm the order for '${context.stockinfo.ProductName}'.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/genericusertask/webapp/tutorial.genericusertask",
			"recipientUsers": "S0009770433",
			"userInterfaceParams": [],
			"id": "usertask2",
			"name": "ApproveQuote"
		},
		"93faaacc-6c29-4034-b5ec-de3782908035": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Northwind",
			"path": "/V3/Northwind/Northwind.svc/Products(${context.ProductID})?$format=json",
			"httpMethod": "GET",
			"responseVariable": "${context.stockinfo}",
			"id": "servicetask1",
			"name": "Retrive Product Info",
			"documentation": "Call Northwind service for product information"
		},
		"8ffd63e5-ffb5-40cc-89fd-242d3686c19f": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ApprovalWorkflow/configurecontext.js",
			"id": "scripttask1",
			"name": "Configure Context"
		},
		"95a9f774-95be-4e31-b1bc-d224a127d26f": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Stock Decision",
			"default": "3b1b9b4a-e74c-4387-b85f-55d362105df1"
		},
		"8313b121-731e-471c-925e-835d3909b038": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Release reorder for ${context.stockinfo.ProductName}",
			"description": "${context.stockinfo.UnitsOnOrder} units are to be reordered.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/genericusertask/webapp/tutorial.genericusertask",
			"recipientUsers": "S0009770433",
			"id": "usertask3",
			"name": "Release Reorder"
		},
		"bdec1876-7604-40af-9d9c-3fe604a8cca8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "63a407ab-3459-4e4b-ac43-b3cb1c2a4106",
			"targetRef": "93faaacc-6c29-4034-b5ec-de3782908035"
		},
		"6904dbef-5054-46a5-bf53-14fad3ece28e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "5c174f60-6a2d-4c39-8234-9d9222572e7d",
			"targetRef": "fb105933-50ff-46c7-81e6-ddcbce8b4684"
		},
		"01bdcaa1-c816-4a75-8485-c050a9aa63c1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "93faaacc-6c29-4034-b5ec-de3782908035",
			"targetRef": "8ffd63e5-ffb5-40cc-89fd-242d3686c19f"
		},
		"fd398bee-c8e0-446c-85e0-143d6f5e15bd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "8ffd63e5-ffb5-40cc-89fd-242d3686c19f",
			"targetRef": "95a9f774-95be-4e31-b1bc-d224a127d26f"
		},
		"3b1b9b4a-e74c-4387-b85f-55d362105df1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "Stock OK",
			"sourceRef": "95a9f774-95be-4e31-b1bc-d224a127d26f",
			"targetRef": "5c174f60-6a2d-4c39-8234-9d9222572e7d"
		},
		"1ff766f6-1880-411b-83f0-82ff482a4be8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.reorder == true}",
			"id": "sequenceflow6",
			"name": "Reorder needed",
			"sourceRef": "95a9f774-95be-4e31-b1bc-d224a127d26f",
			"targetRef": "8313b121-731e-471c-925e-835d3909b038"
		},
		"819a45c8-eba9-498d-9c5d-c8c98cf63683": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "8313b121-731e-471c-925e-835d3909b038",
			"targetRef": "fb105933-50ff-46c7-81e6-ddcbce8b4684"
		},
		"312fa4b4-e97e-4f80-8cbb-def6b54a862a": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"aade28ca-6501-45a8-a0fe-7bc89b6e680d": {},
				"bac93f62-85f4-45db-8e07-039277c8d8b9": {},
				"58eccc69-edf4-4455-9c9c-85942655564f": {},
				"35a55e79-ecde-40a2-a585-9e105a9f6a24": {},
				"29fa601c-8c1a-4b8c-a3b4-d0112634e5d3": {},
				"f3351055-4f21-495f-b0db-d0099589f504": {},
				"60dd103f-4f49-4e25-a99a-28bc5ce53fc9": {},
				"0af84b58-872d-4875-abce-564c9176ad55": {},
				"800a0037-93b6-4e42-ba27-13d876627fc5": {},
				"5b7b8c82-cbc4-44a7-9bff-4e7b5980b76b": {},
				"9223802e-e2a7-4e36-9723-829d2a726857": {},
				"07220767-4c19-4798-8abb-e7f47cd47efe": {},
				"388638b8-0ff5-4fe7-beef-1314f881807b": {},
				"b8323a92-049d-45f1-a9f6-158289a50f30": {}
			}
		},
		"13e395f4-6632-4de3-8edb-697f45e6b7c4": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/ApprovalWorkflow/Quote.json",
			"id": "default-start-context"
		},
		"aade28ca-6501-45a8-a0fe-7bc89b6e680d": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 81,
			"width": 32,
			"height": 32,
			"object": "63a407ab-3459-4e4b-ac43-b3cb1c2a4106"
		},
		"bac93f62-85f4-45db-8e07-039277c8d8b9": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 675.9999976158142,
			"y": 79.5,
			"width": 35,
			"height": 35,
			"object": "fb105933-50ff-46c7-81e6-ddcbce8b4684"
		},
		"58eccc69-edf4-4455-9c9c-85942655564f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,97 94,97",
			"sourceSymbol": "aade28ca-6501-45a8-a0fe-7bc89b6e680d",
			"targetSymbol": "f3351055-4f21-495f-b0db-d0099589f504",
			"object": "bdec1876-7604-40af-9d9c-3fe604a8cca8"
		},
		"35a55e79-ecde-40a2-a585-9e105a9f6a24": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 505.9999988079071,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "5c174f60-6a2d-4c39-8234-9d9222572e7d"
		},
		"29fa601c-8c1a-4b8c-a3b4-d0112634e5d3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,42 640.9999982118607,42 640.9999982118607,97 675.9999976158142,97",
			"sourceSymbol": "35a55e79-ecde-40a2-a585-9e105a9f6a24",
			"targetSymbol": "bac93f62-85f4-45db-8e07-039277c8d8b9",
			"object": "6904dbef-5054-46a5-bf53-14fad3ece28e"
		},
		"f3351055-4f21-495f-b0db-d0099589f504": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 94,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "93faaacc-6c29-4034-b5ec-de3782908035"
		},
		"60dd103f-4f49-4e25-a99a-28bc5ce53fc9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,97 244,97",
			"sourceSymbol": "f3351055-4f21-495f-b0db-d0099589f504",
			"targetSymbol": "0af84b58-872d-4875-abce-564c9176ad55",
			"object": "01bdcaa1-c816-4a75-8485-c050a9aa63c1"
		},
		"0af84b58-872d-4875-abce-564c9176ad55": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 244,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "8ffd63e5-ffb5-40cc-89fd-242d3686c19f"
		},
		"800a0037-93b6-4e42-ba27-13d876627fc5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,97 394,97",
			"sourceSymbol": "0af84b58-872d-4875-abce-564c9176ad55",
			"targetSymbol": "5b7b8c82-cbc4-44a7-9bff-4e7b5980b76b",
			"object": "fd398bee-c8e0-446c-85e0-143d6f5e15bd"
		},
		"5b7b8c82-cbc4-44a7-9bff-4e7b5980b76b": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 394,
			"y": 76,
			"object": "95a9f774-95be-4e31-b1bc-d224a127d26f"
		},
		"9223802e-e2a7-4e36-9723-829d2a726857": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,97 470.99999940395355,97 470.99999940395355,42 505.9999988079071,42",
			"sourceSymbol": "5b7b8c82-cbc4-44a7-9bff-4e7b5980b76b",
			"targetSymbol": "35a55e79-ecde-40a2-a585-9e105a9f6a24",
			"object": "3b1b9b4a-e74c-4387-b85f-55d362105df1"
		},
		"07220767-4c19-4798-8abb-e7f47cd47efe": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 505.9999988079071,
			"y": 122,
			"width": 100,
			"height": 60,
			"object": "8313b121-731e-471c-925e-835d3909b038"
		},
		"388638b8-0ff5-4fe7-beef-1314f881807b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,97 470.99999940395355,97 470.99999940395355,152 505.9999988079071,152",
			"sourceSymbol": "5b7b8c82-cbc4-44a7-9bff-4e7b5980b76b",
			"targetSymbol": "07220767-4c19-4798-8abb-e7f47cd47efe",
			"object": "1ff766f6-1880-411b-83f0-82ff482a4be8"
		},
		"b8323a92-049d-45f1-a9f6-158289a50f30": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,152 640.9999982118607,152 640.9999982118607,97 675.9999976158142,97",
			"sourceSymbol": "07220767-4c19-4798-8abb-e7f47cd47efe",
			"targetSymbol": "bac93f62-85f4-45db-8e07-039277c8d8b9",
			"object": "819a45c8-eba9-498d-9c5d-c8c98cf63683"
		},
		"0f71dbff-9a6f-41d7-a957-518b225187ad": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 7,
			"startevent": 1,
			"endevent": 1,
			"usertask": 3,
			"servicetask": 1,
			"scripttask": 1,
			"exclusivegateway": 1
		}
	}
}