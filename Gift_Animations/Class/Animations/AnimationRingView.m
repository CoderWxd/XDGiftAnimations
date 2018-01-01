//
//  AnimationRingView.m
//  戒指
//
//  Created by 王晓栋 on 2017/6/23.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationRingView.h"
@interface AnimationRingView()<CAAnimationDelegate>
{
    UIImageView *ringImV;
    UIImageView *ringMeteorImV;
    UIImageView *ringStarsImV;
}

@end
@implementation AnimationRingView

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

//times 5s

- (void)customUI{
    self.userInteractionEnabled = NO;
    
    UIImage *ringImage = [UIImage imageNamed:@"ring"];
    float  scalRing = ringImage.size.width/4;
    ringImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-scalRing/2, ScreenHeight/2 - scalRing/2, scalRing, scalRing)];
    ringImV.image = ringImage;
    [self addSubview:ringImV];
    ringImV.alpha = 0.0;
    [UIView animateWithDuration:1.5 animations:^{
        ringImV.alpha = 1;
    }];
    for (NSInteger i = 0; i < 5; i++) {
        float starCenterX = arc4random_uniform(30);
        float starCenterY = arc4random_uniform(30);
        NSLog(@"starCenterX=%.2f,starCenterY=%.2f",starCenterX,starCenterY);
    [self playStartAnimationCenter:CGPointMake(ringImV.width/2 -10 + starCenterX *i , ringImV.height/2-10 + starCenterY * i)];
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *meteorImage = [UIImage imageNamed:@"ring_meteor_sand"];
        float meteorWidth = meteorImage.size.width/10;
        float meteorHeight = meteorImage.size.height/10;
        ringMeteorImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -meteorWidth/2, ScreenHeight/2  - meteorWidth, meteorWidth, meteorHeight)];
        ringMeteorImV.image = meteorImage;
        [self addSubview:ringMeteorImV];
        UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,0,CGRectGetWidth(ringMeteorImV.bounds),0)];
        UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:ringMeteorImV.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        ringMeteorImV.layer.mask = maskLayer;
        maskLayer.path = maskFinalPath.CGPath;
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
        maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
        maskLayerAnimation.removedOnCompletion = YES;
        maskLayerAnimation.duration = 1.5;//kCAMediaTimingFunctionEaseOut
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//kCAMediaTimingFunctionEaseIn
        maskLayerAnimation.delegate = self;
        [maskLayerAnimation setValue:@"maskLayerAnimation" forKey:@"keyID"];
        [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];
    });

}

#pragma mark 星光闪烁

- (void)playStartAnimationCenter:(CGPoint )point {
    
    float starCenterX = arc4random_uniform(30);

    UIImage *startImage = [UIImage imageNamed:@"ring_stars"];
    UIImageView *startImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, startImage.size.width/5 +starCenterX, startImage.size.height/5+starCenterX)];
    startImageV.image = startImage;
    startImageV.center = point;
    [ringImV addSubview:startImageV];

    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(0), @(1.5), @(0)];
    opacityAnimation.autoreverses = YES;

    opacityAnimation.duration = 1.0;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.calculationMode = kCAAnimationCubic;
    opacityAnimation.repeatCount = HUGE_VALF;
    float customeNumber= (float)(1+arc4random()%99)/100;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(customeNumber * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [startImageV.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    });
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
 
    if (flag) {

        NSString *keyID = [anim valueForKey:@"keyID"];
        if ([keyID isEqualToString:@"maskLayerAnimation"]) {
         NSLog(@"动画停止......");
            ESWeakSelf;
            [UIView animateWithDuration:2.0 animations:^{
                ESStrongSelf;
                _self.alpha = 0.0;
            }completion:^(BOOL finished) {
                ESStrongSelf;
                _self.hidden = YES;
                [_self removeFromSuperview];
                [_self callBackManager];
                
            }];
        }
    }
}
#pragma mark - end


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
