//
//  AutoEnablePulseService.m
//
//
//  Created by minsOne on 11/1/23.
//

#import <Foundation/Foundation.h>
@import PulseService;

@interface AutoEnablePulseService : NSObject
@end

@implementation AutoEnablePulseService : NSObject

+ (void)load {
    [PulseRemoteLoggerEnableService start];
}
@end

