//
//  ViewController.m
//  sdkOutPutDemo
//
//  Created by 曹轩 on 2018/9/9.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "ViewController.h"
#import "OutPutManger.h"

@interface ViewController ()

@property(nonatomic,strong) NSMutableArray *logArr;

@end

@implementation ViewController

-(NSMutableArray *)logArr{
    if (_logArr==nil) {
        
        _logArr=[[NSMutableArray alloc]init];
    }
    return _logArr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    OutPutManger *logManger = [OutPutManger shareInstance];
    [logManger putlogServer:self sel:@selector(logcenter:)];
}


-(void)logcenter:(NSNotification*)notification{
    // 可以用一个textview 接收一下这些打印信息 字
    [_logArr addObject:notification.object];
    
}


// 这里一般是sdk里面的操作，我们需要打印一些关键信息给测试人员呈现出来
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    OutPutManger *logManger = [OutPutManger shareInstance];
    [logManger postLogobject:@"我要发送通知了"];
}


// 那里注册通知，那里注销
-(void)dealloc{
    
    OutPutManger *logManger = [OutPutManger shareInstance];
    [logManger delgateLogserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
