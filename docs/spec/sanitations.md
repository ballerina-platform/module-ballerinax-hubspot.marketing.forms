_Author_: @Pasindu599\
_Created_: 22/12/2024 \
_Updated_: 22/12/2024 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from HubSpot Marketing Forms. 
The OpenAPI specification is obtained from (TODO: Add source link).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

[//]: # (TODO: Add sanitation details)
1. **Removed Circular References**:
   - Eliminated recursive references in the `allOf` clauses by removing `$ref: "#/components/schemas/FormDefinitionBase"` and `$ref: "#/components/schemas/FormDefinitionCreateRequestBase"`.
   - **Reason**: Prevented processing errors in tools that struggle with circular dependencies.


## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
# TODO: Add OpenAPI CLI command used to generate the client
```
Note: The license year is hardcoded to 2024, change if necessary.
