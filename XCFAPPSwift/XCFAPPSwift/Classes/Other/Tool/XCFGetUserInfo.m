//
//  XCFGetUserInfo.m
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XCFGetUserInfo.h"
extern NSString *CTSettingCopyMyPhoneNumber();
@implementation XCFGetUserInfo

+(NSString *)myNumber{
    if (CTSettingCopyMyPhoneNumber()) {
        return CTSettingCopyMyPhoneNumber();
    }else{
        return @"";
    }
}

@end
