//
//  AnimationCreamView.m
//  雪糕
//
//  Created by 王晓栋 on 2017/6/23.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationCreamView.h"
#import "UIView+ESShortcut.h"
#import "AnimationModel.h"
@interface AnimationCreamView()

@property(nonatomic,strong)AnimationModel *animationModel;

@property(nonatomic,strong)UIImageView *creamImV;
@end

@implementation AnimationCreamView

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
    self.animationModel = [[AnimationModel alloc]init];
    self.animationModel.duration = 3.29;
    self.animationModel.nameEnd = 61;
    self.animationModel.imageName = @"cream_img";
    self.animationModel.delayDuration = 0;
    self.animationModel.animationFrame = [UIScreen mainScreen].bounds;
    self.animationModel.superView = self;
    [self.animationModel runQueue];
    ESWeakSelf;
    self.animationModel.animationStopBlock = ^(AnimationModel *model){
        model.animationView.alpha = 1.0;
        [UIView animateWithDuration:2.0 animations:^{
            ESStrongSelf;
            model.animationView.alpha = 0.0;
        } completion:^(BOOL finished) {
            ESStrongSelf
            model.animationView.image = nil;
            [model.animationView removeFromSuperview];
//            [model.superView removeFromSuperview];
            model.superView = nil;
            [_self callBackManager];
        }];
        
    };
    
}

#pragma mark - end

- (void)callBackManager {
        [LuxuManager sharedManager].isShowAnimation = NO;
        [[LuxuManager sharedManager] showLuxuryAnimation];
}
/*}
 - (void)customUI{
 self.userInteractionEnabled = NO;
 UIImage *creamImage = [UIImage imageNamed:@"cream0"];
 float scarlCrWid = creamImage.size.width/4;
 float scarlCrHei = creamImage.size.height/4;
 creamImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -scarlCrWid/2 , ScreenHeight/2 - scarlCrHei/2, scarlCrWid, scarlCrHei)];
 creamImV.image = creamImage;
 creamImV.centerX = self.centerX -30;
 [self addSubview:creamImV];
 
 UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,0,CGRectGetWidth(creamImV.bounds),0)];
 UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:creamImV.bounds];
 CAShapeLayer *maskLayer = [CAShapeLayer layer];
 creamImV.layer.mask = maskLayer;
 maskLayer.path = maskFinalPath.CGPath;
 CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
 maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
 maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
 maskLayerAnimation.removedOnCompletion = YES;
 maskLayerAnimation.duration = 0.5;//kCAMediaTimingFunctionEaseOut
 maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//kCAMediaTimingFunctionEaseIn
 [maskLayerAnimation setValue:@"maskLayerAnimation" forKey:@"keyID"];
 [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];
 ESWeakSelf;
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 ESStrongSelf;
 [UIView animateWithDuration:.0 delay:0.2 options:UIViewAnimationOptionRepeat animations:^{
 [self shakeView:creamImV];
 } completion:^(BOOL finished) {
 
 [self animationStart2];
 
 }];
 });
 
 
 
 }
 - (void)animationStart2{
 
 CAKeyframeAnimation *positionAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
 positionAnimate.repeatCount = 1;
 positionAnimate.duration =4.0;
 positionAnimate.fillMode = kCAFillModeForwards;
 
 CGFloat radius = 30;
 BOOL clockWise = true;
 //初始化一个路径
 UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:radius startAngle:(M_PI) endAngle:2*M_PI clockwise:clockWise];
 [path addArcWithCenter:self.center radius:radius startAngle:(2*M_PI) endAngle:M_PI clockwise: false];
 positionAnimate.path = path.CGPath;
 positionAnimate.delegate =self;
 positionAnimate.removedOnCompletion = NO;
 [creamImV.layer addAnimation:positionAnimate forKey:@"positionAnimate"];
 ESWeakSelf;
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 ESStrongSelf;
 [self shakeView:creamImV];
 });
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 ESStrongSelf;
 self.alpha = 1.0;
 [UIView animateWithDuration:1.0 animations:^{
 self.alpha = 0.0;
 
 }completion:^(BOOL finished) {
 [creamImV.layer removeAnimationForKey:@"maskLayerAnimation"];
 [creamImV.layer removeAnimationForKey:@"positionAnimate"];
 [self removeFromSuperview];
 [self callBackManager];
 
 }];
 });
 }
 
 #pragma mark - CAAnimationDelegate
 - (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
 if (flag) {
 [self shakeView:creamImV];
 }
 }
 
 //抖动
 - (void)shake{
 CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
 animation.values = @[
 
 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.1)],
 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],
 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)],
 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],
 ];
 animation.duration = 0.10;
 animation.removedOnCompletion = YES;
 [animation setValue:@"first" forKey:@"animationName"];
 [creamImV.layer addAnimation:animation forKey:@"positionAni"];
 
 }
 /**
 *  左右抖动
 - (void)shakeView:(UIView*)viewToShake
 {
 CGFloat t =4.0;
 CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
 CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
 viewToShake.transform = translateLeft;//
 [UIView animateWithDuration:0.02 delay:0.0 options: UIViewAnimationOptionRepeat animations:^{
 [UIView setAnimationRepeatCount:1.0];
 viewToShake.transform = translateRight;
 } completion:^(BOOL finished){
 if(finished){
 [UIView animateWithDuration:0.01 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
 viewToShake.transform =CGAffineTransformIdentity;
 } completion:NULL];
 }
 }];
 }
 */

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
