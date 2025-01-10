_Author_: @Pasindu599\
_Created_: 18/12/2024 \
_Updated_: 18/12/2024 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from HubSpot Marketing Forms. 
The OpenAPI specification is obtained from ([Hubspot Marketing Forms](https://developers.hubspot.com/docs/reference/api/marketing/forms)).

[//]: # (TODO: Add sanitation details)
1. **Removed Circular References**:
   - Eliminated recursive references in the `allOf` clauses by removing
   - `$ref: "#/components/schemas/FormDefinitionBase"`
     and
   - `$ref: "#/components/schemas/FormDefinitionCreateRequestBase"`.
   - **Reason**: Prevented processing errors in tools that struggle with circular dependencies.


2. **Updated `EmailField`, `PhoneField`, `MobilePhoneField`, `SingleLineTextField`, `MultiLineTextField`, `NumberField`, `SingleCheckboxField`, `MultipleCheckboxesField`, `DropdownField`, `RadioField`, `DatepickerField`, `FileField` and `PaymentLinkRadioField` Definitions**:
   - The `dependentFields` property was removed from the `required` list in the above objects.
   - **Previous Definition:**
     ```json
     "EmailField": {
         "title": "email",
         "required": ["dependentFields", "fieldType", "hidden", "label", "name", "objectTypeId", "required", "validation"],
         "type": "object"
     }
     ```
   - **Updated Definition:**
     ```json
     "EmailField": {
         "title": "email",
         "required": ["fieldType", "hidden", "label", "name", "objectTypeId", "required", "validation"],
         "type": "object"
     }
     ```
   - **Reason**: The `dependentFields` property is not required when creating forms or retrieving responses.

3. **Change the `url` property of the `servers` object**:
   - **Original**: `https://api.hubapi.com`
   - **Updated**: `https://api.hubapi.com/marketing/v3/forms`
   - **Reason**: This change is made to ensure that all API paths are relative to the versioned base URL (`/marketing/v3/forms`), which improves the consistency and usability of the APIs.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yaml --mode client  --license docs/license.txt -o ballerina/ --nullable
```
Note: The license year is hardcoded to 2024, change if necessary.
