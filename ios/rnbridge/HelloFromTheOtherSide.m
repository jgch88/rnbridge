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

RCT_EXPORT_METHOD(generateNames:(NSInteger)numberOfNames
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString *name = @"Justin";
  NSMutableArray *array = [[NSMutableArray alloc] init];
  for (int i = 0; i < numberOfNames; i++) {
    [array addObject:name];
  }
  NSArray *result = [array copy];
  resolve(result);
}
@end
