/**********************************************************************
Name: PLM_CTRL_SendProjectToWorkFront_TestMock()
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Mock for test class.
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : Abilash Patha   08/08/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/
global class PLM_CTRL_SendProjectToWorkFront_TestMock implements HttpCalloutMock {
	global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);
        return res;
      
    }
}