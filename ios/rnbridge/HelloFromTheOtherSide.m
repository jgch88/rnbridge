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

RCT_EXPORT_METHOD(capitaliseUserNames:(NSDictionary*)user
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSMutableDictionary *mutableUser = [user mutableCopy];
  NSString *firstNameKey = @"firstName";
  NSString *lastNameKey = @"lastName";
  
  if ([mutableUser valueForKey:firstNameKey] == nil || [mutableUser valueForKey:lastNameKey] == nil) {
    reject(@"missingKeys", @"firstName and lastName must be present on user", nil);
    return; // otherwise it will reject AND resolve
  }
  
  mutableUser[firstNameKey] = [[NSString stringWithString:[NSString stringWithFormat:@"%@",[mutableUser objectForKey:firstNameKey]]] uppercaseString];
  mutableUser[lastNameKey] = [[NSString stringWithString:[NSString stringWithFormat:@"%@",[mutableUser objectForKey:lastNameKey]]] uppercaseString];
  resolve([mutableUser copy]);
}
@end
