#import "ShikuFlutterPlugin.h"
#import "AESUtil.h"
//#import "MD5Util.h"

@implementation ShikuFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"shiku_flutter"
                                     binaryMessenger:[registrar messenger]];
    ShikuFlutterPlugin* instance = [[ShikuFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"singleAESEncryptBase64" isEqualToString:call.method]) {
        NSString *text = call.arguments[@"text"];
//        NSString *apiKey = call.arguments[@"apiKey"];
        FlutterStandardTypedData* code = (FlutterStandardTypedData*)call.arguments[@"code"];
        
//        NSData* newData = [code typedDataWithBytes];
//        FlutterStandardTypedData* code = [call.arguments[@"code"] typedDataWithBytes];
        
//        NSData *aesJsonData = [AESUtil encryptAESData:[text dataUsingEncoding:NSUTF8StringEncoding] key:[]];
//
        
        NSLog(@"%@", text);
//        result(aesJsonData);
        
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
