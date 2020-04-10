//
//  Counter.m
//  NativeModules
//
//  Created by Srikanth Sharma on 09/04/20.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_MODULE(Counter, NSObject)
  RCT_EXTERN_METHOD(increment)
  RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)
@end
