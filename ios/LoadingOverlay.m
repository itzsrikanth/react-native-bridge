//
//  LoadingOverlay.m
//  NativeModules
//
//  Created by Srikanth Sharma on 09/04/20.
//

#import "React/RCTLog.h"
#import "LoadingOverlay.h"
#import "JGProgressHUD.h"
#import <UIKit/UIKit.h>
@implementation LoadingOverlay

// This RCT (React) "macro" exposes the current module to JavaScript
RCT_EXPORT_MODULE();

JGProgressHUD *HUD;

RCT_EXPORT_METHOD(toggle:(BOOL *)show
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    
    @try{
      if(!HUD)
        HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];

      if(show){
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        UIView *topView = window.rootViewController.view;
        HUD.textLabel.text = @"Loading";
        [HUD showInView:topView];
      }else{
        [HUD dismiss];
      }
      
      
      resolve(@{ @"key": [NSNumber numberWithBool:1] });
    }
    @catch(NSException *exception){
      reject(@"get_error",exception.reason, nil);
    }
  });
}

@end
