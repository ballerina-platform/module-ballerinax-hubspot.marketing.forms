// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;

public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            httpClientConfig.auth = <http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Archive a form definition
    #
    # + formId - The ID of the form to archive.
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function delete marketing/v3/forms/[string formId](map<string|string[]> headers = {}) returns json|error {
        string resourcePath = string `/marketing/v3/forms/${getEncodedUri(formId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    resource isolated function get marketing/v3/forms(map<string|string[]> headers = {}, *GetMarketingV3Forms_getpageQueries queries) returns CollectionResponseFormDefinitionBaseForwardPaging|error {
        string resourcePath = string `/marketing/v3/forms/`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<Encoding> queryParamEncoding = {"formTypes": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Get a form definition
    #
    # + formId - The unique identifier of the form
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get marketing/v3/forms/[string formId](map<string|string[]> headers = {}, *GetMarketingV3FormsFormid_getbyidQueries queries) returns FormDefinitionBase|error {
        string resourcePath = string `/marketing/v3/forms/${getEncodedUri(formId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Partially update a form definition
    #
    # + formId - The ID of the form to update.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function patch marketing/v3/forms/[string formId](HubSpotFormDefinitionPatchRequest payload, map<string|string[]> headers = {}) returns FormDefinitionBase|error {
        string resourcePath = string `/marketing/v3/forms/${getEncodedUri(formId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    resource isolated function post marketing/v3/forms(FormDefinitionCreateRequestBase payload, map<string|string[]> headers = {}) returns FormDefinitionBase|error {
        string resourcePath = string `/marketing/v3/forms/`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Update a form definition
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function put marketing/v3/forms/[string formId](HubSpotFormDefinition payload, map<string|string[]> headers = {}) returns FormDefinitionBase|error {
        string resourcePath = string `/marketing/v3/forms/${getEncodedUri(formId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, httpHeaders);
    }
}
