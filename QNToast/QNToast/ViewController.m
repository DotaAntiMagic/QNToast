//
//  ViewController.m
//  QNToast
//
//  Created by xian on 2017/11/4.
//  Copyright © 2017年 祁宁. All rights reserved.
//

#import "ViewController.h"
#import "QNToast.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [QNToast showWithText:@"显示文字,默认两秒"];
}



@end
