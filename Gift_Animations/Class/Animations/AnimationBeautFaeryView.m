//
//  AnimationBeautFaeryView.m
//  花仙子礼服
//
//  Created by 王晓栋 on 2017/8/14.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationBeautFaeryView.h"
@interface AnimationBeautFaeryView()
{
    UIView *_goundView;
    UIImageView *_wihteGroundImV;
    UIImageView *_lampImV;
    UIImageView *_skirtImV;//礼服
    UIImageView *_petalsImV;
    
    UIView *_maskView;
    
    
}
@end
@implementation AnimationBeautFaeryView

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
    _goundView = [[UIView alloc]initWithFrame:self.bounds];
    _goundView.backgroundColor = [UIColor blackColor];
    [self addSubview:_goundView];
    
    UIImage *image = [UIImage imageNamed:@"beautFaery_lamp"];

    float lampWidth = image.size.width/2;
    float lampHeight = image.size.height/2;
    _lampImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - lampWidth/2, 0, lampWidth, lampHeight)];
    _lampImV.image = image;
    [self addSubview:_lampImV];
    
    image = [UIImage imageNamed:@"beautFaery_wihteground"];
    float groundWidth = image.size.width/2;
    float groundHeight = image.size.height/2;
    _wihteGroundImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - groundWidth/2, ScreenHeight/2, groundWidth, groundHeight)];
    _wihteGroundImV.image = image;
    [self addSubview:_wihteGroundImV];

    
    _maskView = [[UIView alloc] initWithFrame:self.bounds];
    _maskView.backgroundColor = [UIColor clearColor];
    [self addSubview:_maskView];
    

    image = [UIImage imageNamed:@"beautFaery_petals"];
    float petalWidth = image.size.width/2;
    float petalHeight = image.size.height/2;
    _petalsImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - lampWidth/2, 0, petalWidth, petalHeight)];
    _petalsImV.image = image;
    [_maskView addSubview:_petalsImV];
    _petalsImV.centerX = _wihteGroundImV.centerX;
    _petalsImV.bottom = 0;
    
    image = [UIImage imageNamed:@"beautFaery_skirt"];
    float skirtWidth = image.size.width/2;
    float skirtHeight = image.size.height/2;
    _skirtImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - lampWidth/2, 0, skirtWidth, skirtHeight)];
    _skirtImV.image = image;
    [self addSubview:_skirtImV];
    _skirtImV.bottom = _wihteGroundImV.top +100;
    _skirtImV.centerX = _wihteGroundImV.centerX;

    _goundView.hidden = YES;
    _wihteGroundImV.hidden = YES;
    _lampImV.hidden = YES;
    _skirtImV.hidden = YES;
    _petalsImV.hidden = YES;
    _maskView.hidden = NO;

    [self startAnimation];

}


#pragma mark start

- (void)startAnimation{
    _goundView.hidden = NO;
    _goundView.alpha = 0.0;
    _wihteGroundImV.hidden = NO;
    _wihteGroundImV.alpha = 0.0;
    _lampImV.hidden = NO;
    _lampImV.alpha = 0.0;
    [UIView animateWithDuration:2.0 animations:^{
        _goundView.alpha = 0.2;
        _lampImV.alpha = 1.0;
        _wihteGroundImV.alpha = 1.0;

    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _skirtImV.hidden = NO;
        UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,0,CGRectGetWidth(_skirtImV.bounds),0)];//CGRectGetWidth(wordsImV.bounds)
        UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:_skirtImV.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        _skirtImV.layer.mask = maskLayer;
        maskLayer.path = maskFinalPath.CGPath;
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
        maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
        maskLayerAnimation.removedOnCompletion = YES;
        maskLayerAnimation.duration = 2.0;//kCAMediaTimingFunctionEaseOut
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//kCAMediaTimingFunctionEaseIn
        [maskLayerAnimation setValue:@"maskLayerAnimation" forKey:@"animationID"];
        [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];
    });

    ESWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        [_self insertSubview:_skirtImV atIndex:self.subviews.count];
        
        [_self playAetalsAnimationbirthRate:1.0 lifetime:3.0 imageName:@"beautFaery_petal1"scale:0.4 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13];
        [_self playAetalsAnimationbirthRate:2.0 lifetime:3.0 imageName:@"beautFaery_petal2" scale:0.41 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12];
        [_self playAetalsAnimationbirthRate:3.0 lifetime:3.0 imageName:@"beautFaery_petal3"scale:0.38 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1];
        [_self playAetalsAnimationbirthRate:4.0 lifetime:3.0 imageName:@"beautFaery_petal4"scale:0.8 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13];
        [_self playAetalsAnimationbirthRate:3.0 lifetime:3.0 imageName:@"beautFaery_petal5" scale:0.81 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12];
        [_self playAetalsAnimationbirthRate:2.0 lifetime:3.0 imageName:@"beautFaery_petal6"scale:0.88 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1];
        

            [UIView animateWithDuration:2.0 delay:8.0 options:UIViewAnimationOptionCurveLinear animations:^{
            _self.alpha = 0.0;
            } completion:^(BOOL finished) {
                [_self callBackManager];
                [_self removeFromSuperview];
            }];

    });
    
    
}
/**
 *  加遮罩
 */
- (void)addMask{
    CGFloat startY = _wihteGroundImV.bottom - 20;
    CGPoint point1 = CGPointMake(_wihteGroundImV.left - 10, startY);
    CGPoint point2 = CGPointMake(ScreenWidth/2 - 40 , 0);
    CGPoint point3 = CGPointMake(ScreenWidth/2 +40 , 0);

    CGPoint point4 = CGPointMake(_wihteGroundImV.right + 10,startY);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    _maskView.layer.mask = layer;

}
//粒子动画
- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange{
    
    //粒子发射器
    CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
    //粒子发射的位置
    cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, 0);
    //发射源的大小
    cAEmitterLayer.emitterSize        = CGSizeMake(ScreenWidth/2, 50);;
    //发射模式
    cAEmitterLayer.emitterMode        = kCAEmitterLayerOutline;
    //发射源的形状
    cAEmitterLayer.emitterShape    = kCAEmitterLayerLine;
    cAEmitterLayer.velocity = 5.0;
    cAEmitterLayer.spin = 3.0;
    //创建花瓣粒子
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    //粒子的名称
    emitterCell.name = @"chestnut";
//    emitterCell.emissionLongitude =
//    emissionLongitude
    //粒子参数的速度乘数因子。越大出现的越快
    emitterCell.birthRate        = birthRate;
    //存活时间
    emitterCell.lifetime        = lifetime;
    //粒子速度
    emitterCell.velocity        = 10;
    //粒子速度范围
    emitterCell.velocityRange = 10;
    emitterCell.alphaSpeed = 0.3f;
    
    emitterCell.xAcceleration = 0;
    emitterCell.yAcceleration = 90;
    emitterCell.zAcceleration = 0;
    //周围发射角度
//    emitterCell.emissionRange =  M_PI;        // some variation in angle
    //子旋转角度范围
//    emitterCell.spinRange        = 0.0 * M_PI;        // slow spin
    //粒子图片
    emitterCell.contents        = (id) [[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]] CGImage];
    emitterCell.scale = scale;
    // 将粒子添加到粒子发射器上
    cAEmitterLayer.emitterCells = [NSArray arrayWithObject:emitterCell];
    [self.layer addSublayer:cAEmitterLayer];
    
    
    
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
