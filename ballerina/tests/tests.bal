// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.


import ballerina/test;
import ballerina/oauth2;
import  ballerina/time;
import ballerina/io;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;

 OAuth2RefreshTokenGrantConfig auth = {
       clientId,
       clientSecret,
       refreshToken,
       credentialBearer: oauth2:POST_BODY_BEARER // this line should be added to create auth object.

   };

ConnectionConfig config = {auth : auth};
final Client baseClient = check new Client(config, serviceUrl = "https://api.hubapi.com/marketing/v3/forms");

final time:Utc currentUtc = time:utcNow();
string formId = "";

@test:Config {}
isolated function testGetForm() returns  error? {

    CollectionResponseFormDefinitionBaseForwardPaging response = check baseClient->/.get();

    test:assertTrue(response?.results.length() > 0);
}
@test:Config {}
function testCreateForm() returns error? {
    FormDefinitionBase response = check baseClient->/.post(
        {
            formType: "hubspot",
            name: "form" + currentUtc.toString(),
            createdAt: "2024-12-23T07:13:28.102Z",
            updatedAt: "2024-12-23T07:13:28.102Z",
            archived: false,
            fieldGroups: [
                {
                    groupType: "default_group",
                    richTextType: "text",
                    fields: [
                        {
                            objectTypeId: "0-1",
                            name: "email",
                            label: "Email",
                            required: true,
                            hidden: false,
                            fieldType: "email",
                            validation: {
                                blockedEmailDomains: [],
                                useDefaultBlockList: false
                            }
                               
                        }
                    ]
                }
            ],
            configuration: {
                language: "en",
                createNewContactForNewEmail: true,
                editable: true,
                allowLinkToResetKnownValues: true,
                lifecycleStages: [],
                postSubmitAction: {
                    'type: "thank_you",
                    value: "Thank you for subscribing!"
                },
                prePopulateKnownValues: true,
                cloneable: true,
                notifyContactOwner: true,
                recaptchaEnabled: false,
                archivable: true,
                notifyRecipients: ["example@example.com"]
            },
            displayOptions: {
                renderRawHtml: false,
                cssClass: "hs-form stacked",
                theme: "default_style",
                submitButtonText: "Submit",
                style: {
                    labelTextSize: "13px",
                    legalConsentTextColor: "#33475b",
                    fontFamily: "arial, helvetica, sans-serif",
                    legalConsentTextSize: "14px",
                    backgroundWidth: "100%",
                    helpTextSize: "11px",
                    submitFontColor: "#ffffff",
                    labelTextColor: "#33475b",
                    submitAlignment: "left",
                    submitSize: "12px",
                    helpTextColor: "#7C98B6",
                    submitColor: "#ff7a59"
                }
            },
            legalConsentOptions: {
                'type: "none"
            }
        }
    );

    formId = response?.id;

    test:assertTrue(response?.id !is "");
    io:println(response?.id);
}

@test:Config {
    dependsOn: [testCreateForm]
}
function testGetFormById() returns error? {

    io:print("formId: " + formId);

    FormDefinitionBase response = check baseClient->/[formId]();

    test:assertTrue(response?.id == formId);


}

@test:Config {
    dependsOn: [testCreateForm]
}
function testUpdateEntireForm() returns error? {

    FormDefinitionBase response = check baseClient->/[formId].put(
         {
            formType: "hubspot",
            id: formId,
            name: "form" + currentUtc.toString() + "updated",
            createdAt: "2024-12-23T07:13:28.102Z",
            updatedAt: "2024-12-23T07:13:28.102Z",
            archived: true,
            archivedAt: "2024-12-23T07:13:28.102Z",
            fieldGroups: [
                {
                    groupType: "default_group",
                    richTextType: "text",
                    fields: [
                        {
                            objectTypeId: "0-1",
                            name: "email",
                            label: "Email",
                            required: true,
                            hidden: false,
                            fieldType: "email",
                            validation: {
                                blockedEmailDomains: [],
                                useDefaultBlockList: false
                            }
                               
                        }
                    ]
                }
            ],
            configuration: {
                language: "en",
                createNewContactForNewEmail: true,
                editable: true,
                allowLinkToResetKnownValues: true,
                lifecycleStages: [],
                postSubmitAction: {
                    'type: "thank_you",
                    value: "Thank you for subscribing!"
                },
                prePopulateKnownValues: true,
                cloneable: true,
                notifyContactOwner: true,
                recaptchaEnabled: false,
                archivable: true,
                notifyRecipients: ["example@example.com"]
            },
            displayOptions: {
                renderRawHtml: false,
                cssClass: "hs-form stacked",
                theme: "default_style",
                submitButtonText: "Submit",
                style: {
                    labelTextSize: "13px",
                    legalConsentTextColor: "#33475b",
                    fontFamily: "arial, helvetica, sans-serif",
                    legalConsentTextSize: "14px",
                    backgroundWidth: "100%",
                    helpTextSize: "11px",
                    submitFontColor: "#ffffff",
                    labelTextColor: "#33475b",
                    submitAlignment: "left",
                    submitSize: "12px",
                    helpTextColor: "#7C98B6",
                    submitColor: "#ff7a59"
                }
            },
            legalConsentOptions: {
                'type: "none"
            }
        }
    );

    test:assertTrue(response?.id == formId);
    test:assertEquals(response?.archived, true);

}

@test:Config {
    dependsOn: [testCreateForm]
}
function testUpdateForm() returns error? {

    FormDefinitionBase response = check baseClient->/[formId].patch(
        {
            name: "form" + currentUtc.toString() + "updated_form"
        }
    );
    test:assertTrue(response?.id == formId);
}

@test:Config {
    dependsOn: [testCreateForm]
}
function testDeleteForm() returns error? {

    json response = check baseClient->/[formId].delete();

    io:println(response);
    test:assertTrue(response == ());

}