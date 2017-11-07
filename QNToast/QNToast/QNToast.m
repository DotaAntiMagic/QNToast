//
//  QNToast.m
//  QNToast
//
//  Created by xian on 2017/11/3.
//  Copyright © 2017年 祁宁. All rights reserved.
//

#import "QNToast.h"
static const CGFloat textLeftSpace = 5.0f;
@implementation QNToast

+ (QNToast *)createWithText:(NSString *)text{
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.numberOfLines = 0;
    textLabel.text = text;
    [textLabel sizeToFit];
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{
                                NSFontAttributeName:textLabel.font,
                                NSParagraphStyleAttributeName:[NSParagraphStyle defaultParagraphStyle]
                                };
    CGRect labelRect = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    size.width = labelRect.size.width;
    size.height = labelRect.size.height;
    if(size.width < 50){
        size.width  = 50;
    }
    if(size.height < 20){
        size.height = 20;
    }
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    QNToast *toast = [[QNToast alloc] initWithFrame:CGRectMake(0, 0, size.width + 30, size.height + 30)];
     toast.center = CGPointMake(screenSize.width / 2, screenSize.height / 2);
    toast.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8f];
    toast.layer.cornerRadius = textLeftSpace;
    toast.layer.masksToBounds = YES;
    textLabel.frame = CGRectMake(textLeftSpace, textLeftSpace, toast.bounds.size.width - textLeftSpace * 2, toast.bounds.size.height - textLeftSpace);
    [toast addSubview:textLabel];
    toast.alpha = 0.0f;
    return toast;
}

+ (void)showWithText:(NSString *)text{
    QNToast *toast = [QNToast createWithText:text];
//    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
//    if (!mainWindow){
//        mainWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
//    }
    [[toast lastWindow] addSubview:toast];
    [toast show];
}

- (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}


- (void)show{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.alpha = 1.0f;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf disMiss];
        });
    }];
}

- (void)disMiss{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4f animations:^{
        weakSelf.alpha = 0.0f;
        weakSelf.transform  = CGAffineTransformScale(weakSelf.transform, 0.3, 0.3f);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
