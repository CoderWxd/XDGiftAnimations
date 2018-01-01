//
//  CottonCaView.m
//  棉花糖
//
//  Created by 王晓栋 on 2017/6/29.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "CottonCaView.h"

@interface CottonCaView()
//底盘
@property(nonatomic,strong)UIImageView *cottoncandyImV;
//棉花糖
@property(nonatomic,strong)UIImageView *candyImV;
@property(nonatomic,strong)UIImageView *candyLoveImV;


@end
@implementation CottonCaView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self customInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)customInit{
    self.userInteractionEnabled = NO;
    
    // 圆盘
    UIImage *image = [UIImage imageNamed:@"cottonCandyStart"];
    float cotCanWidth = image.size.width/2;
    float cotCanHeight = image.size.height/2;
    self.cottoncandyImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2-cotCanWidth/2, self.height - 250, cotCanWidth, cotCanHeight)];
    self.cottoncandyImV.image = image;
    [self addSubview:self.cottoncandyImV];
//    
//    image = [UIImage imageNamed:@"cottonCandy_cot1"];
//    float cotWidth = image.size.width/2;
//    float cotHeight = image.size.height/2;
//    
    //cottoncandyImV_love
    image = [UIImage imageNamed:@"cottonCandy_love"];
    self.candyLoveImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,self.height/2- image.size.height/2 +100, self.width, image.size.height/2)];
    self.candyLoveImV.image = image;
    [self addSubview:self.candyLoveImV];
    self.candyLoveImV.alpha = 0.0;
    ESWeakSelf;
    self.cottoncandyImV.alpha = 0.0;
    [UIView animateWithDuration:1.2 animations:^{
        ESStrongSelf;
        _self.cottoncandyImV.alpha = 1.0;
    }completion:^(BOOL finished) {
        ESStrongSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimationDropImageName:@"cottonCandy_cot1" withCenterX:9 duration:1.0 withCenterX:37];
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [self startAnimationDropImageName:@"cottonCandy_cot2" withCenterX:26 duration:1.5 withCenterX:20];
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimationDropImageName:@"cottonCandy_cot3" withCenterX:33 duration:1.5 withCenterX:11];
                [self startAnimationDropImageName:@"cottonCandy_cot4" withCenterX:34 duration:1.5 withCenterX:25];

        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimationDropImageName:@"cottonCandy_cot5" withCenterX:27 duration:1.5 withCenterX:16];
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [self startAnimationDropImageName:@"cottonCandy_cot6" withCenterX:8 duration:1.5 withCenterX:7];

        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self startAnimationDropImageName:@"cottonCandy_cot7" withCenterX:8 duration:1.5 withCenterX:18];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.cottoncandyImV.image = [UIImage imageNamed:@"cottonCandyEnd"];
                self.candyLoveImV.alpha = 0.0;
                [UIView animateWithDuration:0.8 animations:^{
                    ESStrongSelf;
                    _self.candyLoveImV.top -= 100;
                    _self.candyLoveImV.alpha = 1.0;
                }completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.5 animations:^{
                        ESStrongSelf;
                        _self.candyLoveImV.transform =  CGAffineTransformMakeScale(1.5, 1.5);
                    }completion:^(BOOL finished) {
                        ESStrongSelf;
                        [UIView animateWithDuration:1.5 animations:^{
                            _self.alpha = 0.0;
                        }completion:^(BOOL finished) {
                            [_self callBackManager];
                            [_self removeFromSuperview];
                        }];
                    }];

                }];
            });
        });


    }];
   

    
}
- (void)startAnimationDropImageName:(NSString *)imageName withCenterX:(NSInteger)centerXInstance duration:(float)duration withCenterX:(NSInteger)centerYInstance{
    UIImage *image = [UIImage imageNamed:imageName];
    float cotWidth = image.size.width/2;
    float cotHeight = image.size.height/2;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2-cotWidth/2 , -cotHeight, cotWidth, cotHeight)];
    imageView.image = image;
    [self addSubview:imageView];
    if (centerXInstance % 2 == 0) {
        imageView.centerX += centerXInstance;
    }else{
    imageView.centerX -= centerXInstance;
    }
    
    ESWeakSelf;
    [UIView animateWithDuration:duration animations:^{
        ESStrongSelf;
        if (centerYInstance % 2 == 0) {
        imageView.centerY  = _self.cottoncandyImV.centerY + centerYInstance;
        }else{
            imageView.centerY  = _self.cottoncandyImV.centerY - centerYInstance;

        }
        
    }];
}


- (void)callBackManager{
    [LuxuManager sharedManager].isShowAnimation = NO;
    [[LuxuManager sharedManager] showLuxuryAnimation];
}
@end
