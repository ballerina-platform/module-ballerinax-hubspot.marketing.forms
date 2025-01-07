import ballerinax/hubspot.marketing.forms;
import ballerina/oauth2;
import ballerina/io;




configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;

forms:OAuth2RefreshTokenGrantConfig auth = {
    clientId,
    clientSecret,
    refreshToken,
    credentialBearer: oauth2:POST_BODY_BEARER // this line should be added in to when you are going to create auth object.
};


forms:ConnectionConfig config = {
    auth: auth
};

final forms:Client baseClient = check  new (config); 

public function main() returns error?{
     forms:FormDefinitionCreateRequestBase inputFormDefinition = {
            formType: "hubspot",
            name: "Sign Up Form",
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
        };


    
    forms:FormDefinitionBase response = check baseClient->/.post(
        inputFormDefinition     
    );
    string formId = response?.id;
    io:println("Form is created  with ID:  " + formId);

    forms:FormDefinitionBase updateResponse = check baseClient->/[formId].patch(
        {
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
                },
                 {
      groupType: "default_group",
      richTextType: "text",
      fields: [
        {
          objectTypeId: "0-1",
          name: "firstname",
          label: "First name",
          required: true,
          hidden: false,
          fieldType: "single_line_text"
        },
         {
          objectTypeId: "0-1",
          name: "lastname",
          label: "Last name",
          required: true,
          hidden: false,
          fieldType: "single_line_text"
        }
      ]
    },
      {
      groupType: "default_group",
      richTextType: "text",
      fields: [
        {
          objectTypeId: "0-1",
          name: "phone",
          label: "Phone Number",
          required: true,
          hidden: false,
          fieldType: "phone",
          useCountryCodeSelect:true,
          validation : {
            minAllowedDigits: 10,
            maxAllowedDigits: 10

            
          }
          
        }
      ]
    },
    {

         groupType: "default_group",
      richTextType: "text",
        fields: [
            {
            objectTypeId: "0-1",
            name: "address",
            label: "Address",
            required: true,
            hidden: false,
            fieldType: "single_line_text"
            }
        ]

    }
            ]
        }
    );

    io:println("Form is updated at" + updateResponse?.updatedAt);

    forms:FormDefinitionBase getResponse = check baseClient->/[formId]();
    io:println("Form is created at" + getResponse?.createdAt);

    forms:FormDefinitionBase getResponse = check baseClient->/[formId]();
    io:println("Form is created at" + getResponse?.createdAt);






    json deleteResponse = check baseClient->/[formId].delete();

    if (deleteResponse == null){
        io:println("Form is deleted");} 
};