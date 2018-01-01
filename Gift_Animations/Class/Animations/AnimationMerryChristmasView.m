//
//  AnimationMerryChristmasView.m
//  圣诞快乐
//
//  Created by 王晓栋 on 2017/12/4.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationMerryChristmasView.h"
@interface AnimationMerryChristmasView()
{
    UIImageView *_groundImV;
    UIImageView *_theRoleImV;
    UIImageView *_merryChristmasImV;
}
@end
@implementation AnimationMerryChristmasView
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
    UIImage *image = [UIImage imageNamed:@"merryChristmas_ground"];
    _groundImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight -image.size.height/3 , ScreenWidth, image.size.height/3)];
    _groundImV.image = image;
    [self addSubview:_groundImV];
    
    image = [UIImage imageNamed:@"merryChristmas_theRole1"];
    _theRoleImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , ScreenWidth, image.size.height/3)];
    _theRoleImV.image = image;
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for (NSInteger i = 1; i <= 3; i++) {
        NSString *imageName = [NSString stringWithFormat:@"merryChristmas_theRole%zd",i];
        UIImage *image = [UIImage imageNamed:imageName];
        if(image){
            [images addObject:image];
        }
    }
    _theRoleImV.animationImages = images;
    _theRoleImV.animationDuration = 1.0;
    _theRoleImV.animationRepeatCount = MAXFLOAT;
    [_theRoleImV startAnimating];

    [self addSubview:_theRoleImV];
    
    
    //merryChristmasImV
    image  = [UIImage imageNamed:@"merryChristmas1"];
    _merryChristmasImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -image.size.width/3/2 , ScreenHeight/2 - image.size.width/3/2 + 50  , image.size.width/3, image.size.height/3)];
    _merryChristmasImV.image = image;
    [self addSubview:_merryChristmasImV];
    NSMutableArray<UIImage *> *merryImages = [NSMutableArray array];
    for (NSInteger i = 1; i <= 3; i++) {
        NSString *imageName = [NSString stringWithFormat:@"merryChristmas%zd",i];
        UIImage *image = [UIImage imageNamed:imageName];
        if(image){
            [merryImages addObject:image];
        }
    }
    _merryChristmasImV.animationImages = merryImages;
    _merryChristmasImV.animationDuration = 1.0;
    _merryChristmasImV.animationRepeatCount = MAXFLOAT;

    
    
    _groundImV.hidden = YES;
    _theRoleImV.hidden = YES;
    _merryChristmasImV.hidden = YES;
    [self startAnimation];
}
- (void)startAnimation{
    _groundImV.hidden = NO;
    _theRoleImV.hidden = NO;
    _groundImV.alpha = 0.0;
    _theRoleImV.alpha = 0.0;
    
    [UIView animateWithDuration:2.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _groundImV.alpha = 1.0;
        _theRoleImV.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self playAetalsAnimationbirthRate:4 lifetime:6 imageName:@"merryChristmas_snow1"scale:0.13 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:1];
        [self playAetalsAnimationbirthRate:4 lifetime:6 imageName:@"merryChristmas_snow2" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:1];
        [self playAetalsAnimationbirthRate:2 lifetime:6.0 imageName:@"merryChristmas_snow1"scale:0.19 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1 withType:1];
//        [self playAetalsAnimationbirthRate:4.0 lifetime:7.0 imageName:@"merryChristmas_snow2" scale:0.23 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
//        [self playAetalsAnimationbirthRate:.4 lifetime:3.0 imageName:@"merryChristmas_snow1" scale:0.14 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
//        [self playAetalsAnimationbirthRate:.5 lifetime:3.0 imageName:@"merryChristmas_snow2" scale:0.19 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        [self playAetalsAnimationbirthRate:5 lifetime:10 imageName:@"merryChristmas_snow1"scale:0.13 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:1];
//        [self playAetalsAnimationbirthRate:2.0 lifetime:15.0 imageName:@"merryChristmas_snow2" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:1];
//        [self playAetalsAnimationbirthRate:3.0 lifetime:17.0 imageName:@"merryChristmas_snow1"scale:0.28 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1 withType:1];
//        [self playAetalsAnimationbirthRate:1.0 lifetime:18.0 imageName:@"merryChristmas_snow2" scale:0.23 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
//        [self playAetalsAnimationbirthRate:.4 lifetime:19.0 imageName:@"merryChristmas_snow1" scale:0.14 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
//        [self playAetalsAnimationbirthRate:.5 lifetime:20.0 imageName:@"merryChristmas_snow2" scale:0.19 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
//    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_one_firework" imageCount:16 animationDuration:4.0 center:CGPointMake(ScreenWidth/2- 100, ScreenHeight/2 - 50)];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_one_firework" imageCount:16 animationDuration:4.0 center:CGPointMake(ScreenWidth/2+100, ScreenHeight/2 - 50)];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_two_firework" imageCount:10 animationDuration:3.0 center:CGPointMake(ScreenWidth/2+100, ScreenHeight/2+ 50)];
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_three_firework" imageCount:9 animationDuration:2 center:CGPointMake(ScreenWidth/2, ScreenHeight/2)];

    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_three_firework" imageCount:9 animationDuration:2 center:CGPointMake(ScreenWidth/2+ 100, ScreenHeight/2+ 100)];
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_three_firework" imageCount:9 animationDuration:2 center:CGPointMake(ScreenWidth/2+ 100, ScreenHeight/2- 100)];
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_four_firework" imageCount:9 animationDuration:2 center:CGPointMake(ScreenWidth/2- 30, ScreenHeight/2+50)];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playfireworkAnimationImageName:@"merryChristmas_four_firework" imageCount:9 animationDuration:2 center:CGPointMake(ScreenWidth/2- 50, ScreenHeight/2 +50)];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(13 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _merryChristmasImV.hidden = NO;
        _merryChristmasImV.alpha = 0.0;
        [_merryChristmasImV startAnimating];
        [UIView animateWithDuration:1.5 animations:^{
           _merryChristmasImV.alpha = 1.0;
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(16.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        ESWeakSelf
        [UIView animateWithDuration:0.5 animations:^{
            ESStrongSelf;
            _self.alpha = 0;
        } completion:^(BOOL finished) {
            ESStrongSelf;
            [_self.layer removeAllAnimations];
            [_self removeFromSuperview];
            [_self callBackManager];
            _self = nil;
        }];
    });

}


//粒子动画
- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange withType:(NSInteger )type{
    
    //粒子发射器
    CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
    //粒子发射的位置
    if (type == 1) {
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, 0);
        
    }else if(type == 2){
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, ScreenHeight - 60);
        
    }else if(type == 3){
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, -150);
        
    }
    //发射源的大小
    cAEmitterLayer.emitterSize        = CGSizeMake(ScreenWidth, 0.0);;
    //发射模式
    cAEmitterLayer.emitterMode        = kCAEmitterLayerOutline;
    //发射源的形状
    cAEmitterLayer.emitterShape    =kCAEmitterLayerLine;
    
    cAEmitterLayer.velocity = 3.0;
    
    cAEmitterLayer.spin = 1.0;
    //创建花瓣粒子
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    //粒子的名称
    emitterCell.name = @"chestnut";
    
    emitterCell.emissionLongitude =  M_PI / 2;
    
    //粒子参数的速度乘数因子。越大出现的越快
    emitterCell.birthRate        = birthRate;
    //存活时间
    emitterCell.lifetime        = lifetime;
    
    if (type == 3) {
        //粒子速度
        emitterCell.velocity        = 5;
        //粒子速度范围
        emitterCell.velocityRange = 6;
    }else{
        //粒子速度
        emitterCell.velocity   = -10;
        //粒子速度范围
        emitterCell.velocityRange = 5;
    }
    
    
    emitterCell.alphaSpeed = 0.3f;
    
    emitterCell.xAcceleration = 0;
    if (type == 1) {
        emitterCell.yAcceleration = 90;
        
    }else if(type == 2){
        emitterCell.yAcceleration = -90;
        
    }else if(type == 3){
        emitterCell.yAcceleration = 90;
        
    }
    emitterCell.zAcceleration = 0;
    //周围发射角度
    emitterCell.emissionRange =  M_PI;        // some variation in angle
    //子旋转角度范围
    emitterCell.spinRange        = 0.25 * M_PI;        // slow spin
    //粒子图片
    emitterCell.contents        = (id) [[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]] CGImage];
    emitterCell.scale = scale;
    // 将粒子添加到粒子发射器上
    cAEmitterLayer.emitterCells = [NSArray arrayWithObject:emitterCell];
    [self.layer addSublayer:cAEmitterLayer];
    [self.layer insertSublayer:cAEmitterLayer atIndex:0];
}



/**
 * 雪花飘落
 */
//- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange withType:(NSInteger )type{
//
//    //粒子发射器
//    CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
//    //粒子发射的位置
//    if (type == 1) {
//        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, -ScreenHeight);
//
//    }else if(type == 2){
//        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, ScreenHeight - 60);
//
//    }else if(type == 3){
//        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, -150);
//
//    }
//    //发射源的大小
//    cAEmitterLayer.emitterSize        = CGSizeMake(ScreenWidth, 0.0);;
//    //发射模式
//    cAEmitterLayer.emitterMode        = kCAEmitterLayerOutline;
//    //发射源的形状
//    cAEmitterLayer.emitterShape    =kCAEmitterLayerLine;
//
//    cAEmitterLayer.velocity = 2.0;
//
//    cAEmitterLayer.spin = 3.0;
//    //创建花瓣粒子
//    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
//    //粒子的名称
//    emitterCell.name = @"chestnut";
//
//    emitterCell.emissionLongitude =  M_PI / 2;
//
//    //粒子参数的速度乘数因子。越大出现的越快
//    emitterCell.birthRate        = 1;
//    //存活时间
//    emitterCell.lifetime        = lifetime/2;
//
//    if (type == 3) {
//        //粒子速度
//        emitterCell.velocity        = 5;
//        //粒子速度范围
//        emitterCell.velocityRange = 6;
//    }else{
//        //粒子速度
//        emitterCell.velocity        = -10;
//        //粒子速度范围
//        emitterCell.velocityRange = 2;
//    }
//
//
//    emitterCell.alphaSpeed = 0.3f;
//
//    emitterCell.xAcceleration = 0;
//    if (type == 1) {
//        emitterCell.yAcceleration = 90;
//
//    }else if(type == 2){
//        emitterCell.yAcceleration = -90;
//
//    }else if(type == 3){
//        emitterCell.yAcceleration = 90;
//
//    }
//    emitterCell.zAcceleration = 0;
//    //周围发射角度
//    emitterCell.emissionRange =  M_PI;        // some variation in angle
//    //子旋转角度范围
//    emitterCell.spinRange        = 0.25 * M_PI;        // slow spin
//    //粒子图片
//    emitterCell.contents        = (id) [[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]] CGImage];
//    emitterCell.scale = scale;
//    // 将粒子添加到粒子发射器上
//    cAEmitterLayer.emitterCells = [NSArray arrayWithObject:emitterCell];
//    [self.layer addSublayer:cAEmitterLayer];
//}


- (void)playfireworkAnimationImageName:(NSString *)imageNameStr imageCount:(NSInteger)imageCount animationDuration:(float)duration center:(CGPoint)imageCenter{
    
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for (NSInteger i = 1; i <= imageCount; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@%zd",imageNameStr,i];
        UIImage *image = [UIImage imageNamed:imageName];
        if(image){
            [images addObject:image];
        }
    }
    NSString *imageStr = [NSString stringWithFormat:@"%@1",imageNameStr];
    UIImage * image = [UIImage imageNamed:imageStr];
    UIImageView *fireWorkImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , image.size.width/3, image.size.height/3)];
    fireWorkImV.image = image;
    fireWorkImV.animationImages = images;
    fireWorkImV.animationDuration = duration;
    fireWorkImV.animationRepeatCount = 0;
    fireWorkImV.center = imageCenter;
    [self addSubview:fireWorkImV];
    [fireWorkImV startAnimating];
}

/**
 *  根据直径生成圆的path，圆点是中心点
 */
- (UIBezierPath *)pathWithDiameter:(CGFloat)diameter uiview:(UIView *)uiview {
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake((CGRectGetWidth(uiview.bounds) - diameter) / 2, (CGRectGetHeight(uiview.bounds) - diameter) / 2, diameter, diameter)];
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
