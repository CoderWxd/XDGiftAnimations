//
//  AnimationFlyWingView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/8/3.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationFlyWingView.h"
@interface AnimationFlyWingView()
{
    UIImageView *lakeImV;
    UIImageView *lotusMobileImV;
    UIImageView *whiteLotusImV;
    UIImageView *lotusHigMobileImV;
    UIImageView *leftGreenBirdsImV;
    UIImageView *leftBirdsImV;
    UIImageView *frontLotusImV;
    UIImageView *rightMandarinImV;
    UIImageView *butterfly1ImV;
    UIImageView *butterfly2ImV;
    UIImageView *leftMandarinImV;
    UIImageView *wordsImV;
    
    UIImageView *rightGreBirdsImV;
    UIImageView *rightBirdsfly;
}

@end

@implementation AnimationFlyWingView

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
    //flywing_lake
    UIImage *image = [UIImage imageNamed:@"flywing_lake"];
    float width = image.size.width/3;
    float height = image.size.height/3;
    lakeImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,ScreenHeight - 80 - height, ScreenWidth, height)];
    lakeImV.image = image;
    [self addSubview:lakeImV];
    
    //flywing_words
    image = [UIImage imageNamed:@"flywing_words"];
    width = image.size.width/3.0;
    height = image.size.height/3.0;
    wordsImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - width/2,lakeImV.top - 40, width, height)];
    wordsImV.image = image;
    [self addSubview:wordsImV];
    

    
    //flywing_right_mandarin
    image = [UIImage imageNamed:@"flywing_right_mandarin"];
    width = image.size.width/3;
    height = image.size.height/3;
    rightMandarinImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    rightMandarinImV.image = image;
    [self addSubview:rightMandarinImV];
    rightMandarinImV.top = lakeImV.top + 40;
    
    
    //flywing_lotus_mobile
    image = [UIImage imageNamed:@"flywing_lotus_mobile"];
     width = image.size.width/3;
     height = image.size.height/3;
    lotusMobileImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    lotusMobileImV.image = image;
    [self addSubview:lotusMobileImV];
    lotusMobileImV.centerY = lakeImV.centerY - 20;
    
    //flywing_whitelotus
    image = [UIImage imageNamed:@"flywing_whitelotus"];
    width = image.size.width/3;
    height = image.size.height/3;
    whiteLotusImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    whiteLotusImV.image = image;
    [self addSubview:whiteLotusImV];
    whiteLotusImV.top = lakeImV.top + 10;
    whiteLotusImV.right = lakeImV.right;
    
    //flywing_lotus_highly_mobile
    image = [UIImage imageNamed:@"flywing_lotus_highly_mobile"];
    height = image.size.height/3;
    lotusHigMobileImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, 0)];
    lotusHigMobileImV.image = image;
    [self addSubview:lotusHigMobileImV];
    lotusHigMobileImV.bottom = lakeImV.bottom -20;
    
    //左飞绿鸟 flywing_left_green_birdsfly
    image = [UIImage imageNamed:@"flywing_left_green_birdsfly"];
    width = image.size.width/3;
    height = image.size.height/3;
    leftGreenBirdsImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    leftGreenBirdsImV.image = image;
    [self addSubview:leftGreenBirdsImV];
    leftGreenBirdsImV.bottom = 0;
    leftGreenBirdsImV.left = ScreenWidth -30;
    
    //左飞鸟 flywing_left_birdsfly
    image = [UIImage imageNamed:@"flywing_left_birdsfly"];
    width = image.size.width/3;
    height = image.size.height/3;
    leftBirdsImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    leftBirdsImV.image = image;
    [self addSubview:leftBirdsImV];
    leftBirdsImV.left = ScreenWidth;

    //flywing_frontlotus
    image = [UIImage imageNamed:@"flywing_frontlotus"];
    width = image.size.width/3;
    height = image.size.height/3;
    frontLotusImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 0, 0)];
    frontLotusImV.image = image;
    [self addSubview:frontLotusImV];
    frontLotusImV.bottom = lakeImV.bottom -20;
    
    //flywing_butterfly1-1
    
    image = [UIImage imageNamed:@"flywing_butterfly1-1"];
    width = image.size.width/4;
    height = image.size.height/4;
    butterfly1ImV = [[UIImageView alloc]initWithFrame:CGRectMake(10,0, width, height)];
    NSMutableArray<UIImage *> *images1 = [NSMutableArray array];
    UIImage *image1 = [UIImage imageNamed:@"flywing_butterfly1-1"];
    if (image1) {
    [images1 addObject:image1];
    }
    UIImage *image2 = [UIImage imageNamed:@"flywing_butterfly1-2"];
    if (image2) {
        [images1 addObject:image2];
    }
    butterfly1ImV.animationImages = images1;
    butterfly1ImV.animationDuration = 0.4;
    butterfly1ImV.image = image;
    [self addSubview:butterfly1ImV];
    butterfly1ImV.centerY =lakeImV.centerY;
    butterfly1ImV.left = 60;
    
     //flywing_butterfly2-1
    image = [UIImage imageNamed:@"flywing_butterfly2-1"];
    width = image.size.width/4;
    height = image.size.height/4;
    butterfly2ImV = [[UIImageView alloc]initWithFrame:CGRectMake(10,0, width, height)];
    NSMutableArray<UIImage *> *images2 = [NSMutableArray array];
    UIImage *image3 = [UIImage imageNamed:@"flywing_butterfly2-1"];
    if (image3) {
        [images2 addObject:image3];
    }
    UIImage *image4 = [UIImage imageNamed:@"flywing_butterfly2-2"];
    if (image4) {
        [images2 addObject:image4];
    }
    butterfly2ImV.animationImages = images2;
    butterfly2ImV.animationDuration = 0.4;
    butterfly2ImV.image = image;
    [self addSubview:butterfly2ImV];
    [self insertSubview:butterfly2ImV belowSubview:lotusHigMobileImV];
    butterfly2ImV.bottom = lakeImV.bottom;
    butterfly2ImV.right = ScreenWidth - 40;
    butterfly2ImV.transform = CGAffineTransformMakeRotation(-M_PI/4);
    
    //flywing_left_mandarin
    image = [UIImage imageNamed:@"flywing_left_mandarin"];
    width = image.size.width/3.5;
    height = image.size.height/3.5;
    leftMandarinImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    leftMandarinImV.image = image;
    [self addSubview:leftMandarinImV];
    leftMandarinImV.bottom = lakeImV.bottom -40;
    leftMandarinImV.right = lakeImV.right - 50;
    [self insertSubview:leftMandarinImV belowSubview:lotusHigMobileImV];
    
    //flywing_right_birdsfly
    image = [UIImage imageNamed:@"flywing_right_birdsfly"];
    width = image.size.width/3.0;
    height = image.size.height/3.0;
    rightBirdsfly = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    rightBirdsfly.image = image;
    [self addSubview:rightBirdsfly];
    rightBirdsfly.bottom = ScreenHeight/2 - 40;
    rightBirdsfly.right = 0;

    //flywing_right_green_birdsfly
    image = [UIImage imageNamed:@"flywing_right_green_birdsfly"];
    width = image.size.width/3.0;
    height = image.size.height/3.0;
    rightGreBirdsImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, width, height)];
    rightGreBirdsImV.image = image;
    [self addSubview:rightGreBirdsImV];
    rightGreBirdsImV.right = 0;
    rightGreBirdsImV.bottom = rightBirdsfly.top;




    

    
    lakeImV.hidden = YES;
    lotusMobileImV.hidden = YES;
    whiteLotusImV.hidden = YES;
    
    lotusHigMobileImV.hidden = YES;
    frontLotusImV.hidden = YES;
    rightMandarinImV.hidden = YES;
    butterfly1ImV.hidden = YES;
    butterfly2ImV.hidden = YES;
    leftMandarinImV.hidden = YES;
    wordsImV.hidden = YES;
    rightGreBirdsImV.hidden = YES;
    rightBirdsfly.hidden = YES;
    

    [self startAnimation];

}

#pragma mark start

- (void)startAnimation{
    
    lakeImV.hidden = NO;
    lotusMobileImV.hidden = NO;
    whiteLotusImV.hidden = NO;
    lakeImV.alpha = 0.0;
    lotusMobileImV.alpha = 0.0;
    whiteLotusImV.alpha = 0.0;
    ESWeakSelf;

    [UIView animateWithDuration:1.5 animations:^{
        lakeImV.alpha = 1.0;
        lotusMobileImV.alpha = 1.0;
        whiteLotusImV.alpha = 1.0;
    }completion:^(BOOL finished) {
        ESStrongSelf;
        //循环移动
        [_self playRecyclingMobileWithImV:lotusMobileImV];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_self playRecyclingMobileWithImV:whiteLotusImV];

        });
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        lotusHigMobileImV.hidden = NO;
        lotusHigMobileImV.alpha = 0.0;
        UIImage *image = [UIImage imageNamed:@"flywing_lotus_highly_mobile"];
        CGFloat width = image.size.width/3;
        CGFloat height = image.size.height/3;
        [UIView animateWithDuration:1.5 animations:^{
            lotusHigMobileImV.alpha = 1.0;
            lotusHigMobileImV.height = height;
            lotusHigMobileImV.bottom = lakeImV.bottom -20;
        }];
        
        image = [UIImage imageNamed:@"flywing_frontlotus"];
        width = image.size.width/3.5;
        height = image.size.height/3.5;
        frontLotusImV.hidden = NO;
        frontLotusImV.alpha = 0.0;
        [UIView animateWithDuration:1.5 animations:^{
            frontLotusImV.alpha = 1.0;
            frontLotusImV.width = width;
            frontLotusImV.height = height;
            frontLotusImV.bottom = lakeImV.bottom -20;
        }];
        
        
        rightMandarinImV.hidden = NO;
        rightMandarinImV.transform = CGAffineTransformMakeScale(0.4, 0.4);
        [UIView animateWithDuration:2.0 animations:^{
            rightMandarinImV.transform = CGAffineTransformMakeScale(0.6, 0.6);

        }];
        [UIView animateWithDuration:4.0 animations:^{
            rightMandarinImV.left = ScreenWidth;
            rightMandarinImV.top += 40;
        }completion:^(BOOL finished) {
            [rightMandarinImV removeFromSuperview];
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            butterfly1ImV.hidden = NO;
            [butterfly1ImV startAnimating];
            [UIView animateWithDuration:3.0 animations:^{
                butterfly1ImV.center = CGPointMake(self.centerX - 8 , self.centerY - 40);
            }];
            butterfly2ImV.hidden = NO;
            [butterfly2ImV startAnimating];
            [UIView animateWithDuration:3.0 animations:^{
                butterfly2ImV.center = CGPointMake(self.centerX + 60, self.centerY);
            }];
            
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            leftMandarinImV.hidden = NO;
            leftMandarinImV.transform = CGAffineTransformMakeScale(0.1, 0.1);
            [UIView animateWithDuration:2.0 animations:^{
                leftMandarinImV.transform = CGAffineTransformMakeScale(1.0,1.0);
                leftMandarinImV.left -= 90;
            }];
        });
    });
  
 

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        [_self playRightToLeftBirdsAndWordsAnimations];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        [_self playleftToRightBirdsAndWordsAnimations];
    });
    
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          ESStrongSelf;
          
          [UIView animateWithDuration:2.0 animations:^{
              _self.alpha = 0.0;
          }completion:^(BOOL finished) {
              ESStrongSelf;
              [_self.layer removeAllAnimations];
              [_self callBackManager];
              [_self removeFromSuperview];
              _self = nil;
          }];
      });
    
}
/**
 * 荷花循环移动
 */
- (void)playRecyclingMobileWithImV:(UIImageView *)imV{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    [animation setAutoreverses:YES];
    animation.repeatCount = 2;
    NSValue *p1 = [NSValue valueWithCGPoint:imV.center];
    NSValue *p2 =[NSValue valueWithCGPoint:CGPointMake(imV.centerX + 30, imV.centerY)];
    animation.values = @[p1,p2];
    [imV.layer addAnimation:animation forKey:@"positionAnimation"];
    
}


/**
 * 飞鸟 文字出现 移动 向左
 */
- (void)playRightToLeftBirdsAndWordsAnimations{
    [UIView animateWithDuration:2.0 animations:^{
        leftGreenBirdsImV.top += 130;
        leftGreenBirdsImV.right = 130;
    }completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:1.0 delay:1.9 options:UIViewAnimationOptionLayoutSubviews animations:^{
        leftGreenBirdsImV.top += 50;
        leftGreenBirdsImV.right = 0;
    } completion:^(BOOL finished) {
        [leftGreenBirdsImV removeFromSuperview];
    }];
    [UIView animateWithDuration:2.0 animations:^{
        leftBirdsImV.top += 200;
        leftBirdsImV.right = ScreenWidth/2 - 30;
    }completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:1.0 delay:1.9 options:UIViewAnimationOptionLayoutSubviews animations:^{
        leftBirdsImV.top -= 40;
        leftBirdsImV.right = 0;
    } completion:^(BOOL finished) {
        [leftBirdsImV removeFromSuperview];
    }];

}

/**
 * 飞鸟 文字出现 移动 向右
 */
- (void)playleftToRightBirdsAndWordsAnimations{
    
    rightGreBirdsImV.hidden = NO;
    rightBirdsfly.hidden = NO;
    [UIView animateWithDuration:4.0 animations:^{
        rightGreBirdsImV.bottom = ScreenHeight/2- 40;
        rightGreBirdsImV.right = ScreenWidth;
        rightBirdsfly.bottom = ScreenHeight/2 - 40;
        rightBirdsfly.right = ScreenWidth- 50 ;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        wordsImV.hidden = NO;
        UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,0,0,CGRectGetHeight(wordsImV.bounds))];//CGRectGetWidth(wordsImV.bounds)
        UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:wordsImV.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        wordsImV.layer.mask = maskLayer;
        maskLayer.path = maskFinalPath.CGPath;
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
        maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
        maskLayerAnimation.removedOnCompletion = YES;
        maskLayerAnimation.duration = 3.0;//kCAMediaTimingFunctionEaseOut
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//kCAMediaTimingFunctionEaseIn
        [maskLayerAnimation setValue:@"maskLayerAnimation" forKey:@"keyID"];
        [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];
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
