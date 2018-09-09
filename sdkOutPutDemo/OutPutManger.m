//
//  OutPutManger.m
//  sdkOutPutDemo
//
//  Created by 曹轩 on 2018/9/9.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "OutPutManger.h"

#define centerName @"sdkoutPutCenter"

@implementation OutPutManger

static OutPutManger * _instance = nil;

// 因为项目当时用的用单利我也懒得改 正常情况下面这几个方法写成类方法比较好点 单利有些影响性能
+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

// 注册通知
-(void)putlogServer:(id)server sel:(SEL)sel{
    
    [[NSNotificationCenter defaultCenter] addObserver:server selector:sel name:centerName object:nil];
    
}
// 发送消息
-(void)postLogobject:(NSString*)log{
    
    // 回到主线程这行代码刚开始没有 当我写完开始在项目中跑的时候，直接xcode 闪退了，然后我再次调试的时候 根据错误信息在网上找了一片帖子 是这样说 当我们的“通知“在主线程注册，然而在其他线程里发送通知就是出现错误。
    dispatch_async(dispatch_get_main_queue(), ^{
        //回调或者说是通知主线程刷新，
        //        NSLog(@"主线程 %@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:centerName object:log];
        
    });
    
    
}
// 删除通知
-(void)delgateLogserver:(id)server{
    
    [[NSNotificationCenter defaultCenter]removeObserver:server name:centerName object:nil];
    
}

@end
