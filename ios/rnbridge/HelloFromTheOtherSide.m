#import "HelloFromTheOtherSide.h"

@implementation HelloFromTheOtherSide

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(greet:(NSString*)name
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString *hello = @"Hello ";
  NSString *result = [hello stringByAppendingString:name];
  resolve(result);
};

@end
