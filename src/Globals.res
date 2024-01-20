external atob: string => string = "atob"

external btoa: string => string = "btoa"

external alert: string => unit = "alert"

external confirm: string => bool = "confirm"

external prompt: string => option<string> = "prompt"

module EventTarget = {
  type t
  @send
  external addEventListener: (t, string, 'a, ~options: bool=?) => unit = "addEventListener"
  @send
  external removeEventListener: (t, string, 'a, bool) => unit = "removeEventListener"
  @send external dispatchEvent: (t, 'a) => bool = "dispatchEvent"
}
module Event = {
  type t
  @get external bubbles: t => bool = "bubbles"
  @get external cancelBubble: t => bool = "cancelBubble"
  @get external cancelable: t => bool = "cancelable"
  @get external composed: t => bool = "composed"
  @get external target: t => EventTarget.t = "target"
  @get external currentTarget: t => EventTarget.t = "currentTarget"
  @get external defaultPrevented: t => bool = "defaultPrevented"
  @get external eventPhase: t => int = "eventPhase"
  @get external isTrusted: t => bool = "isTrusted"
  @get external timeStamp: t => float = "timeStamp"
  @get external type_: t => string = "type"
  @get external _AT_TARGET: t => int = "AT_TARGET"
  @get external _BUBBLING_PHASE: t => int = "BUBBLING_PHASE"
  @get external _CAPTURING_PHASE: t => int = "CAPTURING_PHASE"
  @get external _NONE: t => int = "NONE"

  @send external composedPath: t => Belt.Array.t<EventTarget.t> = "composedPath"
  @send external preventDefault: t => unit = "preventDefault"
  @send external stopImmediatePropagation: t => unit = "stopImmediatePropagation"
  @send external stopPropagation: t => unit = "stopPropagation"
}

module TextEncoder = {
  type t
  @send external encode: (t, string) => Uint8Array.t = "encode"
  @new external new: unit => t = "TextEncoder"
}

module AbortSignal = {
  type t
  @get external aborted: t => bool = "aborted"
  @get external reason: t => 'a = "reason"
  external onabort: (t, (t, Event.t) => unit) => unit = "onabort"
}

module AbortController = {
  type t
  @new external new: unit => t = "AbortController"
  @get external signal: t => AbortSignal.t = "signal"
  @send external abort: (t, ~reason: 'a) => unit = "abort"
}

module DOMException = {
  type t
  @get external name: t => string = "name"
  @get external message: t => string = "message"
  @get external code: t => int = "code"
  @get external _INDEX_SIZE_ERR: t => int = "INDEX_SIZE_ERR"
  @get external _DOMSTRING_SIZE_ERR: t => int = "DOMSTRING_SIZE_ERR"
  @get external _HIERARCHY_REQUEST_ERR: t => int = "HIERARCHY_REQUEST_ERR"
  @get external _WRONG_DOCUMENT_ERR: t => int = "WRONG_DOCUMENT_ERR"
  @get external _INVALID_CHARACTER_ERR: t => int = "INVALID_CHARACTER_ERR"
  @get external _NO_DATA_ALLOWED_ERR: t => int = "NO_DATA_ALLOWED_ERR"
  @get external _NO_MODIFICATION_ALLOWED_ERR: t => int = "NO_MODIFICATION_ALLOWED_ERR"
  @get external _NOT_FOUND_ERR: t => int = "NOT_FOUND_ERR"
  @get external _NOT_SUPPORTED_ERR: t => int = "NOT_SUPPORTED_ERR"
  @get external _INUSE_ATTRIBUTE_ERR: t => int = "INUSE_ATTRIBUTE_ERR"
  @get external _INVALID_STATE_ERR: t => int = "INVALID_STATE_ERR"
  @get external _SYNTAX_ERR: t => int = "SYNTAX_ERR"
  @get external _INVALID_MODIFICATION_ERR: t => int = "INVALID_MODIFICATION_ERR"
  @get external _NAMESPACE_ERR: t => int = "NAMESPACE_ERR"
  @get external _INVALID_ACCESS_ERR: t => int = "INVALID_ACCESS_ERR"
  @get external _VALIDATION_ERR: t => int = "VALIDATION_ERR"
  @get external _TYPE_MISMATCH_ERR: t => int = "TYPE_MISMATCH_ERR"
  @get external _SECURITY_ERR: t => int = "SECURITY_ERR"
  @get external _NETWORK_ERR: t => int = "NETWORK_ERR"
  @get external _ABORT_ERR: t => int = "ABORT_ERR"
  @get external _URL_MISMATCH_ERR: t => int = "URL_MISMATCH_ERR"
  @get external _QUOTA_EXCEEDED_ERR: t => int = "QUOTA_EXCEEDED_ERR"
  @get external _TIMEOUT_ERR: t => int = "TIMEOUT_ERR"
  @get external _INVALID_NODE_TYPE_ERR: t => int = "INVALID_NODE_TYPE_ERR"
  @get external _DATA_CLONE_ERR: t => int = "DATA_CLONE_ERR"
}

module ImageData = {
  type t
  @get external colorSpace: t => string = "colorSpace"
  @get external data: t => Uint8ClampedArray.t = "data"
  @get external width: t => int = "width"
  @get external height: t => int = "height"
}

module DOMStringList = {
  type t
  @get external length: t => int = "length"
  @send external contains: (t, string) => bool = "contains"
  @send external item: (t, int) => option<string> = "item"
}

module Location = {
  type t

  @get external ancestorOrigins: t => DOMStringList.t = "ancestorOrigins"
  @get external hash: t => string = "hash"
  @get external host: t => string = "host"
  @get external hostname: t => string = "hostname"
  @get external href: t => string = "href"
  @get external origin: t => string = "origin"
  @get external pathname: t => string = "pathname"
  @get external port: t => string = "port"
  @get external protocol: t => string = "protocol"
  @get external search: t => string = "search"

  @send external toString: t => string = "toString"
  @send external assign: (t, string) => unit = "assign"
  @send external reload: (t, bool) => unit = "reload"
  @send external replace: (t, string) => unit = "replace"
}

module GPURequestAdapterOptions = {
  type t
  @get external powerPreference: t => string = "powerPreference"
  @get external forceFallbackAdapter: t => bool = "forceFallbackAdapter"
}

module GPUAdapterFeatures = {
  type t
  @get external size: t => int = "size"
  @send external entries: t => 'a = "entries"
  @send external forEach: (t, (string, string, 'b) => unit, ~thisArg: 'c=?) => unit = "forEach"
  @send external has: (t, string) => bool = "has"
  @send external keys: t => 'a = "keys"
  @send external values: t => 'a = "values"
}

module GPUSupportedLimits = {
  type t
  @get external maxBindGroups: t => int = "maxBindGroups"
  @get external maxBindingsPerBindGroup: t => int = "maxBindingsPerBindGroup"
  @get external maxBufferSize: t => int = "maxBufferSize"
  @get external maxComputeInvocationsPerWorkgroup: t => int = "maxComputeInvocationsPerWorkgroup"
  @get external maxComputeWorkgroupSizeX: t => int = "maxComputeWorkgroupSizeX"
  @get external maxComputeWorkgroupSizeY: t => int = "maxComputeWorkgroupSizeY"
  @get external maxComputeWorkgroupSizeZ: t => int = "maxComputeWorkgroupSizeZ"
  @get external maxComputeWorkgroupsPerDimension: t => int = "maxComputeWorkgroupsPerDimension"
  @get external maxComputeWorkgroupStorageSize: t => int = "maxComputeWorkgroupStorageSize"
  @get
  external maxDynamicStorageBuffersPerPipelineLayout: t => int =
    "maxDynamicStorageBuffersPerPipelineLayout"
  @get
  external maxDynamicUniformBuffersPerPipelineLayout: t => int =
    "maxDynamicUniformBuffersPerPipelineLayout"
  @get external maxInterStageShaderComponents: t => int = "maxInterStageShaderComponents"
  @get external maxSampledTexturesPerShaderStage: t => int = "maxSampledTexturesPerShaderStage"
  @get external maxSamplersPerShaderStage: t => int = "maxSamplersPerShaderStage"
  @get external maxStorageBufferBindingSize: t => int = "maxStorageBufferBindingSize"
  @get external maxStorageBuffersPerShaderStage: t => int = "maxStorageBuffersPerShaderStage"
  @get external maxStorageTexturesPerShaderStage: t => int = "maxStorageTexturesPerShaderStage"
  @get external maxTextureArrayLayers: t => int = "maxTextureArrayLayers"
  @get external maxTextureDimension1D: t => int = "maxTextureDimension1D"
  @get external maxTextureDimension2D: t => int = "maxTextureDimension2D"
  @get external maxTextureDimension3D: t => int = "maxTextureDimension3D"
  @get external maxUniformBufferBindingSize: t => int = "maxUniformBufferBindingSize"
  @get external maxUniformBuffersPerShaderStage: t => int = "maxUniformBuffersPerShaderStage"
  @get external maxVertexAttributes: t => int = "maxVertexAttributes"
  @get external maxVertexBufferArrayStride: t => int = "maxVertexBufferArrayStride"
  @get external maxVertexBuffers: t => int = "maxVertexBuffers"
  @get external minStorageBufferOffsetAlignment: t => int = "minStorageBufferOffsetAlignment"
  @get external minUniformBufferOffsetAlignment: t => int = "minUniformBufferOffsetAlignment"
}

module GPUDeviceDescriptor = {
  type t
  @get external requiredFeatures: t => Belt.Array.t<string> = "extensions"
  @get external requiredLimits: t => 'a = "requiredLimits"
}

module GPUAdapterInfo = {
  type t
  @get external architecture: t => string = "architecture"
  @get external description: t => string = "description"
  @get external device: t => string = "device"
  @get external vendor: t => string = "vendor"
}

module GPUSupportedFeatures = {
  type t
  @get external size: t => int = "size"
  @send external entries: t => 'a = "entries"
  @send external forEach: (t, (string, string, 'b) => unit, ~thisArg: 'c=?) => unit = "forEach"
  @send external has: (t, string) => bool = "has"
  @send external keys: t => 'a = "keys"
  @send external values: t => 'a = "values"
}

module GPUDeviceLostInfo = {
  type t
  @get external reason: t => string = "reason"
  @get external message: t => string = "message"
}

module GPUDevice = {
  type t
  @get external features: t => GPUSupportedFeatures.t = "features"
  @get external limits: t => GPUSupportedLimits.t = "limits"
  @get external lost: t => Promise.t<GPUDeviceLostInfo.t> = "lost"
}

module GPUAdapter = {
  type t
  @get external name: t => string = "name"
  @get external features: t => GPUAdapterFeatures.t = "features"
  @get external limits: t => GPUSupportedLimits.t = "limits"
  @get external isFallbackAdapter: t => bool = "isFallbackAdapter"
  @send
  external requestAdapterInfo: (
    t,
    ~unmaskHints: Belt.Array.t<string>=?,
  ) => Promise.t<GPUAdapterInfo.t> = "requestAdapterInfo"
  @send
  external requestDevice: (t, ~descriptor: GPUDeviceDescriptor.t=?) => Promise.t<GPUDevice.t> =
    "requestDevice"
}

module GPU = {
  type t
  @send
  external requestAdapter: (t, ~options: GPURequestAdapterOptions.t=?) => Promise.t<GPUAdapter.t> =
    "requestAdapter"
}

module Navigator = {
  type t
  @get external gpu: t => GPU.t = "gpu"
  @get external hardwareConcurrency: t => int = "hardwareConcurrency"
  @get external userAgent: t => string = "userAgent"
  @get external language: t => string = "language"
  @get external languages: t => Belt.Array.t<string> = "languages"
}

module URLSearchParams = {
  type t
  @new external new: 'a => t = "URLSearchParams"
  @get external size: t => int = "size"
  @send external append: (t, string, string) => unit = "append"
  @send external delete: (t, string) => unit = "delete"
  @send external getAll: (t, string) => Belt.Array.t<string> = "getAll"
  @send external entries: t => 'a = "entries"
  @send external forEach: (t, (string, string, 'b) => unit, ~thisArg: 'c=?) => unit = "forEach"
  @send external get: (t, string) => string = "get"
  @send external getAll: (t, string) => Belt.Array.t<string> = "getAll"
  @send external has: (t, string) => bool = "has"
  @send external keys: t => 'a = "keys"
  @send external set: (t, string, string) => unit = "set"
  @send external sort: t => unit = "sort"
  @send external toString: t => string = "toString"
  @send external values: t => 'a = "values"
}

module URL = {
  type t
  @new external new: string => t = "URL"
  @get external hash: t => string = "hash"
  @get external host: t => string = "host"
  @get external hostname: t => string = "hostname"
  @get external href: t => string = "href"
  @get external origin: t => string = "origin"
  @get external password: t => string = "password"
  @get external pathname: t => string = "pathname"
  @get external port: t => string = "port"
  @get external protocol: t => string = "protocol"
  @get external search: t => string = "search"
  @get external searchParams: t => URLSearchParams.t = "searchParams"
  @get external username: t => string = "username"
  @send external toString: t => string = "toString"
  @send external toJSON: t => string = "toJSON"
}
module URLPatternInit = {
  type t = {
    protocol?: string,
    username?: string,
    password?: string,
    hostname?: string,
    port?: string,
    pathname?: string,
    search?: string,
    hash?: string,
    baseURL?: string,
  }
}

module URLPatternInput = {
  type t = String(string) | URLPatternInit(URLPatternInit.t)
}

module URLPattern = {
  type t

  @new external makeFromString: (string, ~baseURL: 'b=?) => t = "URLPattern"
  @new external makeFromURL: (URLPatternInit.t, ~baseURL: 'b=?) => t = "URLPattern"

  @new
  let new = (input: URLPatternInput.t, ~baseURL: 'b=?) => {
    switch input {
    | String(s) => makeFromString(s, ~baseURL)
    | URLPatternInit(init) => makeFromURL(init, ~baseURL)
    }
  }

  @get external protocol: t => string = "protocol"
  @get external username: t => string = "username"
  @get external password: t => string = "password"
  @get external hostname: t => string = "hostname"
  @get external port: t => string = "port"
  @get external pathname: t => string = "pathname"
  @get external search: t => string = "search"
  @get external hash: t => string = "hash"

  @send external test: (t, URLPatternInput.t, ~baseURL: string=?) => bool = "test"
  @send
  external exec: (t, URLPatternInput.t, ~baseURL: string=?) => option<Belt.Array.t<string>> = "exec"
}

module ErrorEventInit = {
  type t<'a> = {
    message?: string,
    filename?: string,
    lineno?: int,
    colno?: int,
    error?: 'a,
  }
}

module ErrorEvent = {
  type t
  @get external message: t => string = "message"
  @get external filename: t => string = "filename"
  @get external lineno: t => int = "lineno"
  @get external colno: t => int = "colno"
  @get external error: t => 'a = "error"
  @new external new: (string, ~eventInitDict: ErrorEventInit.t<'a>=?) => t = "ErrorEvent"
}

module Window = {
  type t

  @get external window: t => t = "window"
  @get external self: t => t = "self"
  @get external onerror: t => (t, ErrorEvent.t) => 'a = "onerror"
  @get external onload: t => (t, Event.t) => 'a = "onload"
  @get external onbeforeunload: t => (t, Event.t) => 'a = "onbeforeunload"
  @get external onunload: t => (t, Event.t) => 'a = "onunload"
  @get external close: t => t => unit = "close"
  @get external closed: t => bool = "closed"
  @get external alert: t => (~message: string=?) => unit = "alert"
  @get external confirm: t => (~message: string=?) => bool = "confirm"
  @get
  external prompt: t => (~message: string=?, ~defaultValue: string=?) => option<string> = "prompt"
  @get external name: t => string = "name"

  @send external addEventListener: (t, string, 'a, ~options: bool=?) => unit = "addEventListener"
  @send external removeEventListener: (t, string, 'a, bool) => unit = "removeEventListener"
}
