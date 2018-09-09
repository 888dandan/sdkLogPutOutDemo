//
//  OutPutManger.h
//  sdkOutPutDemo
//
//  Created by 曹轩 on 2018/9/9.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OutPutManger : NSObject
//注册通知
-(void)putlogServer:(id)server sel:(SEL)sel;
// 发送通知
-(void)postLogobject:(NSString*)log;
// 删除通知
-(void)delgateLogserver:(id)server;
// 单利
+(instancetype) shareInstance;

@end
