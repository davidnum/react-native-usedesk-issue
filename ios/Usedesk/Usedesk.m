#import "React/RCTBridgeModule.h"
#import "React/RCTUtils.h"

@interface RCT_EXTERN_MODULE(Usedesk, UIViewController)

RCT_EXTERN_METHOD(start:
                  (NSDictionary) params
                  successCb:(RCTResponseSenderBlock)successCb
                  errorCb:(RCTResponseSenderBlock)errorCb
)

RCT_EXTERN_METHOD(closeChat)

@end
