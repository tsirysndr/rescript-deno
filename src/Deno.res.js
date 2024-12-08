// Generated by ReScript, PLEASE EDIT WITH CARE

import * as PervasivesU from "rescript/lib/es6/pervasivesU.js";

var ConsoleSize = {};

var InspectOptions = {};

var SetRawOptions = {};

var SeekMode = {};

var FileInfo = {};

function seek(fs, offset, whence) {
  var whence$1;
  switch (whence) {
    case "Start" :
        whence$1 = 0;
        break;
    case "Current" :
        whence$1 = 1;
        break;
    case "End" :
        whence$1 = 2;
        break;
    
  }
  return fs.seek(offset, whence$1);
}

function seekSync(fs, offset, whence) {
  var whence$1;
  switch (whence) {
    case "Start" :
        whence$1 = 0;
        break;
    case "Current" :
        whence$1 = 1;
        break;
    case "End" :
        whence$1 = 2;
        break;
    
  }
  return fs.seekSync(offset, whence$1);
}

var FsFile = {
  seek: seek,
  seekSync: seekSync
};

var MakeTempOptions = {};

var MkdirOptions = {};

var OpenOptions = {};

var DirEntry = {};

var ReadFileOptions = {};

var RemoveOptions = {};

var SymlinkOptions = {};

var WatchFsOptions = {};

var FsWatcher = {};

var WriteFileOptions = {};

var HttpServer = {};

var NetAddr = {};

var ServeHandlerInfo = {};

var ServeHandler = {};

var ServeHandlerAsync = {};

var ServeUnixOptions = {};

var ServeOptions = {};

var ServeTlsOptions = {};

var ListenOptions = {};

var TcpListenOptions = {};

var ListenTlsOptions = {};

var Listener = {};

var ConnectOptions = {};

var TcpConn = {};

var Conn = {};

var ConnectTlsOptions = {};

var TlsHandshakeInfo = {};

var TlsConn = {};

var NetworkInterfaceInfo = {};

var ResolveDnsOptions = {};

var StartTlsOptions = {};

var CommandOptions = {};

var CommandOutput = {};

var CommandStatus = {};

var ChildProcess = {};

var Command = {};

var Data = {};

function writeTextFile(path, data, options) {
  return Deno.writeTextFile(path, data._0, options);
}

function serve(handler, asyncHandler) {
  if (handler !== undefined) {
    if (asyncHandler !== undefined) {
      return PervasivesU.failwith("serve: invalid arguments");
    } else {
      return Deno.serve(handler);
    }
  } else if (asyncHandler !== undefined) {
    return Deno.serve(asyncHandler);
  } else {
    return PervasivesU.failwith("serve: invalid arguments");
  }
}

function serveWithOptions(options, handler, asyncHandler) {
  if (handler !== undefined) {
    if (asyncHandler !== undefined) {
      return PervasivesU.failwith("serve: invalid arguments");
    } else {
      return Deno.serve(options, handler);
    }
  } else if (asyncHandler !== undefined) {
    return Deno.serve(options, asyncHandler);
  } else {
    return Deno.serve(options, undefined);
  }
}

function serveWithUnixOptions(options, handler, asyncHandler) {
  if (handler !== undefined) {
    if (asyncHandler !== undefined) {
      return PervasivesU.failwith("serve: invalid arguments");
    } else {
      return Deno.serve(options, handler);
    }
  } else if (asyncHandler !== undefined) {
    return Deno.serve(asyncHandler);
  } else {
    return Deno.serve(options, undefined);
  }
}

function serveWithTlsOptions(options, handler, asyncHandler) {
  if (handler !== undefined) {
    if (asyncHandler !== undefined) {
      return PervasivesU.failwith("serve: invalid arguments");
    } else {
      return Deno.serve(options, handler);
    }
  } else if (asyncHandler !== undefined) {
    return Deno.serve(asyncHandler);
  } else {
    return Deno.serve(options, undefined);
  }
}

var Context = {};

var ContextManager = {};

var Attributes = {};

var IArrayValue = {};

var IKeyValueList = {};

var IAnyValue = {};

var IKeyValue = {};

var IResource = {};

var HrTime = {};

var SpanStatusCode = {};

var SpanStatus = {};

var TraceState = {};

var SpanContext = {};

var Link = {};

var SpanKind = {};

var InstrumentationLibrary = {};

var TimedEvent = {};

var ReadableSpan = {};

var SpanExporter = {};

var Telemetry = {
  Context: Context,
  ContextManager: ContextManager,
  Attributes: Attributes,
  IArrayValue: IArrayValue,
  IKeyValueList: IKeyValueList,
  IAnyValue: IAnyValue,
  IKeyValue: IKeyValue,
  IResource: IResource,
  HrTime: HrTime,
  SpanStatusCode: SpanStatusCode,
  SpanStatus: SpanStatus,
  TraceState: TraceState,
  SpanContext: SpanContext,
  Link: Link,
  SpanKind: SpanKind,
  InstrumentationLibrary: InstrumentationLibrary,
  TimedEvent: TimedEvent,
  ReadableSpan: ReadableSpan,
  SpanExporter: SpanExporter
};

var UpgradeWebSocketOptions = {};

var BinaryType = {};

var ArrayBufferLike = {};

var $$Blob = {};

var ArrayBufferView = {};

var WebSocketData = {};

var AddEventListenerOptions = {};

var EventListenerOptions = {};

var $$WebSocket = {};

var WebSocketUpgrade = {};

var Writer = {};

var Reader = {};

export {
  ConsoleSize ,
  InspectOptions ,
  SetRawOptions ,
  SeekMode ,
  FileInfo ,
  FsFile ,
  MakeTempOptions ,
  MkdirOptions ,
  OpenOptions ,
  DirEntry ,
  ReadFileOptions ,
  RemoveOptions ,
  SymlinkOptions ,
  WatchFsOptions ,
  FsWatcher ,
  WriteFileOptions ,
  HttpServer ,
  NetAddr ,
  ServeHandlerInfo ,
  ServeHandler ,
  ServeHandlerAsync ,
  ServeUnixOptions ,
  ServeOptions ,
  ServeTlsOptions ,
  ListenOptions ,
  TcpListenOptions ,
  ListenTlsOptions ,
  Listener ,
  ConnectOptions ,
  TcpConn ,
  Conn ,
  ConnectTlsOptions ,
  TlsHandshakeInfo ,
  TlsConn ,
  NetworkInterfaceInfo ,
  ResolveDnsOptions ,
  StartTlsOptions ,
  CommandOptions ,
  CommandOutput ,
  CommandStatus ,
  ChildProcess ,
  Command ,
  Data ,
  writeTextFile ,
  serve ,
  serveWithOptions ,
  serveWithUnixOptions ,
  serveWithTlsOptions ,
  Telemetry ,
  UpgradeWebSocketOptions ,
  BinaryType ,
  ArrayBufferLike ,
  $$Blob ,
  ArrayBufferView ,
  WebSocketData ,
  AddEventListenerOptions ,
  EventListenerOptions ,
  $$WebSocket ,
  WebSocketUpgrade ,
  Writer ,
  Reader ,
}
/* No side effect */
