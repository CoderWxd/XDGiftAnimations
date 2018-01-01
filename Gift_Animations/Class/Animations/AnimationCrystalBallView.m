//
//  AnimationCrystalBallView.m
//  梦幻水晶球
//
//  Created by 王晓栋 on 2017/8/14.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationCrystalBallView.h"
@interface AnimationCrystalBallView()
{
    //黑色背景
    UIImageView *_blackGroundImV;
    
    //星空
    UIImageView *_starrySkyImV;
    
    //爱心
    UIImageView *_loveImV;
    //星球
    UIImageView *_ballImV;
    //亲吻
    UIImageView *_colorImV;
}
@end

@implementation AnimationCrystalBallView



- (void)dealloc{
    NSLog(@"%s",__func__);
}
- (instancetype)init{
    if (self = [super init]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self customUI];
        
    }
    return self;
}
- (void)customUI{
    self.userInteractionEnabled = NO;
    UIImage *image = [UIImage imageNamed:@"crystalBall_blackGround"];
    float groundHeight = image.size.height/2;
    _blackGroundImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, groundHeight)];
    _blackGroundImV.image = image;
    [self addSubview:_blackGroundImV];
    _blackGroundImV.bottom = ScreenHeight/2;
    
    
    image = [UIImage imageNamed:@"crystalBall_starrySky"];
    float starrySkyHeight = image.size.height/2;
    _starrySkyImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, starrySkyHeight)];
    _starrySkyImV.image = image;
    [self addSubview:_starrySkyImV];
    _starrySkyImV.bottom = _blackGroundImV.bottom;
    
    
    
    image = [UIImage imageNamed:@"crystalBall_love"];
    float loveHeight = image.size.height/2;
    _loveImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, loveHeight)];
    _loveImV.image = image;
    [self addSubview:_loveImV];
    _loveImV.bottom = _blackGroundImV.bottom + 80;
    
    
    image = [UIImage imageNamed:@"crystalBall_ball"];
    float ballHeight = image.size.height/2;
    _ballImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ballHeight)];
    _ballImV.image = image;
    [self addSubview:_ballImV];
    _ballImV.top = _blackGroundImV.bottom + 80;

    
    
    image = [UIImage imageNamed:@"crystalBall_color1"];
    
    float colorWidth = image.size.width/2;
    float colorHeight = image.size.height/2;
    
    _colorImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, colorWidth, ballHeight)];
    _colorImV.image = image;
    [self addSubview:_colorImV];
    _colorImV.bottom = _blackGroundImV.bottom;
    _colorImV.centerX = ScreenWidth/2;

    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for (NSInteger i = 1;  i < 4; i++) {
        NSString *imageName = [NSString stringWithFormat:@"crystalBall_color%zd",i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [images addObject:image];
        }
    }
    _colorImV.animationImages = images;
    _colorImV.animationDuration = 0.3;
    _colorImV.animationRepeatCount = MAXFLOAT;

    _blackGroundImV.hidden = YES;
    _starrySkyImV.hidden = YES;
    _loveImV.hidden = YES;
    _ballImV.hidden = YES;
    _colorImV.hidden = YES;

    [self startAnimation];

    
    
}
- (void)startAnimation{
    _blackGroundImV.hidden = NO;
    _blackGroundImV.alpha = 0.0;
    
    _starrySkyImV.hidden = NO;
    _starrySkyImV.alpha = 0.0;

    
    [UIView animateWithDuration:2.0 animations:^{
        _blackGroundImV.alpha = 1.0;
        _starrySkyImV.alpha = 1.0;

    }];
    
    [self starTwinkleWithImV:_starrySkyImV];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _loveImV.hidden = NO;
        _loveImV.alpha = 0.0;
        [UIView animateWithDuration:0.15 animations:^{
            _loveImV.alpha = 1.0;

        }completion:^(BOOL finished) {
            [self starTwinkleWithImV:_loveImV];

        }];
        [UIView animateWithDuration:1.5 animations:^{
            _loveImV.top = 20;
        }];
        
        _ballImV.hidden = NO;
        [UIView animateWithDuration:1.0 animations:^{
            _ballImV.top -= 80;
        }];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _colorImV.hidden = NO;
        _colorImV.alpha = 0.0;
        [UIView animateWithDuration:0.5 animations:^{
        _colorImV.alpha = 1.0;
        }completion:^(BOOL finished) {
        [_colorImV startAnimating];
        }];
        
    });
    ESWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        [UIView animateWithDuration:2.0 animations:^{
            _self.alpha = 0.0;
        }completion:^(BOOL finished) {
             ESStrongSelf;
            [_colorImV stopAnimating];
            [_self callBackManager];
            [_self removeFromSuperview];

        }];
    });
}
- (void)starTwinkleWithImV:(UIImageView *)imageView{
    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(0.6), @(1.0), @(0.6)];
    opacityAnimation.autoreverses = YES;
    
    opacityAnimation.duration = 1.0;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.calculationMode = kCAAnimationCubic;
    opacityAnimation.repeatCount = HUGE_VALF;
    float customeNumber= (float)(1+arc4random()%99)/100;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(customeNumber * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imageView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    });

}

- (void)callBackManager{
    [LuxuManager sharedManager].isShowAnimation = NO;
    [[LuxuManager sharedManager] showLuxuryAnimation];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
