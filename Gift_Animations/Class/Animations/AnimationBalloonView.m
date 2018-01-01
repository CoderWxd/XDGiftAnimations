//
//  AnimationBalloonView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/7/11.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationBalloonView.h"
#define const_default_fireworks_size_rate 0.01

@interface AnimationBalloonView()
{
    UIImageView *flowerImV;
}

@end
@implementation AnimationBalloonView

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
    //bal_flowers
    UIImage *image = [UIImage imageNamed:@"bal_flowers"];
    flowerImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,self.height/2 + 60, self.width,self.height - (self.height/2 + 60))];
    flowerImV.image = image;
    [self addSubview:flowerImV];
    flowerImV.hidden = YES;
    [self startAnimation];
}

#pragma mark start

- (void)startAnimation{
    flowerImV.hidden = NO;
    flowerImV.alpha = 0.0;
    [UIView animateWithDuration:1.0 animations:^{
    flowerImV.alpha = 1.0;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (NSInteger i = 0; i < 120; i++) {
            [self addRandomStarWithRect:CGRectMake(self.width/2, self.height, 20, 20)];
        }
        
    });
    
  
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageNamed:@"bal_balloon"];
        float imageWidth = image.size.width/3.3;
        [self playBalloonAnimationImageWithPointX:imageWidth/2 + 20 duration: 5.0 firstStar:2.0 firstStarLocat:self.height/2 + 40 secondStartTime:3.0 secondStarLocat:40 scale:3.3 withFireScale:3];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playBalloonAnimationImageWithPointX:self.width/2 duration:4.0 firstStar:1.0 firstStarLocat:self.height - 60 secondStartTime:2.5 secondStarLocat:80 scale:4.4 withFireScale:4];
        });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageNamed:@"bal_balloon"];
        float imageWidth = image.size.width/15;
        [self playBalloonAnimationImageWithPointX:self.width - imageWidth -10 duration:3.0 firstStar:1.2 firstStarLocat:self.height/2 + 40 secondStartTime:1.8 secondStarLocat:100 scale:15 withFireScale:10];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1.0 animations:^{
                self.alpha = 0.0;
            }completion:^(BOOL finished) {
                 [self callBackManager];
                [self removeFromSuperview];
            }];
        });
    });
}

// 荧光闪烁,移动,消失

- (void)addRandomStarWithRect:(CGRect)rect {
    NSLog(@"addRandomStarWithRect");
    int randID = arc4random_uniform(6);
    int randOrx = arc4random_uniform(200);
    int randX;
    if (randOrx % 2 == 0) {
        randX =rect.origin.x + randOrx;
    }else{
        randX =rect.origin.x - randOrx;
    }
    int randOry = arc4random_uniform(250);
    int randY ;
    randY = rect.origin.y + randOry;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"bal_fluores%d.png", randID]];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(randX, randY, image.size.width / 2.5 , image.size.height/2.5)];
    imageView.image = image;
    [self addSubview:imageView];
    [self sendSubviewToBack:imageView];
    int randWidth = arc4random_uniform(30);
        imageView.width -= randWidth;
        imageView.height -= randWidth;
    int randTime = arc4random_uniform(100);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((randTime / 50.0) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        float offsect = arc4random_uniform(self.height);
        
        [UIView animateWithDuration:5.0 animations:^{
            CGRect frame = imageView.frame;
            frame.origin.y -= offsect;
            imageView.frame = frame;
            imageView.alpha = 0.0;
        }];
    });}

//气球上升
- (void)playBalloonAnimationImageWithPointX:(CGFloat)floatX duration:(CGFloat)duration firstStar:(CGFloat)firstTime firstStarLocat:(CGFloat)firstStarLocat secondStartTime:(CGFloat)secondTime secondStarLocat:(CGFloat)secondStarLocat scale:(CGFloat)scale withFireScale:(CGFloat)fireScale{
    UIImage *image = [UIImage imageNamed:@"bal_balloon"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(floatX, self.bottom, image.size.width / scale, image.size.height / scale)];
    imageView.centerX = floatX;
    imageView.image = image;
    [self addSubview:imageView];
    //烟花
    [UIView animateWithDuration:duration animations:^{
        imageView.bottom = 0;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(firstTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageNamed:@"bal_firework"];
        UIImageView* mImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageView.right - image.size.width/fireScale,firstStarLocat,image.size.width/fireScale,image.size.height/fireScale )];
        mImageView.image = image;
        [self addSubview:mImageView];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:mImageView];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [mImageView.layer removeAnimationForKey:@"colorimageAnimation"];
            mImageView.alpha = 0.0;
            [mImageView removeFromSuperview];
            
        });
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(secondTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageNamed:@"bal_firework"];
        UIImageView* mImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageView.right - image.size.width/fireScale, secondStarLocat,image.size.width/fireScale,image.size.height/fireScale )];
        mImageView.image = image;
        [self addSubview:mImageView];
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:mImageView];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [mImageView.layer removeAnimationForKey:@"colorimageAnimation"];
            mImageView.alpha = 0.0;
            [mImageView removeFromSuperview];
        });
    });

}

#define const_time_duration 0.3
// 烟花绽放
- (void)playColorFireworksWithCenter:(CGPoint)centerPoint withImage:(UIImageView *)imageView{
   
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    circleLayer.fillColor = [UIColor clearColor].CGColor;//这个必须透明，因为这样内圆才是不透明的
    circleLayer.strokeColor = [UIColor yellowColor].CGColor;//注意这个不能透明，因为实际上是这个显示出后面的图片了
    circleLayer.path = [self pathWithDiameter:1 uiview:imageView].CGPath;
    imageView.layer.mask = circleLayer;
    
    //让圆的变大的动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    UIBezierPath *toPath = [self pathWithDiameter: sqrt(CGRectGetWidth(imageView.bounds)*CGRectGetWidth(imageView.bounds) + CGRectGetHeight(imageView.bounds) *CGRectGetHeight(imageView.bounds)) uiview:imageView];
    pathAnimation.toValue = (id)toPath.CGPath;
    pathAnimation.duration = const_time_duration;
    
    
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    lineWidthAnimation.toValue = @(sqrt(CGRectGetWidth(imageView.bounds)*CGRectGetWidth(imageView.bounds) + CGRectGetHeight(imageView.bounds) *CGRectGetHeight(imageView.bounds)));
    lineWidthAnimation.duration = const_time_duration;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[pathAnimation, lineWidthAnimation];
    group.duration = const_time_duration;
    group.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
    group.fillMode = kCAFillModeForwards;//这两句的效果是让动画结束后不会回到原处，必须加
    [circleLayer addAnimation:group forKey:@"revealAnimation"];
    

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = @(1.3);
    scaleAnimation.duration = const_explosion_time;
    
    CABasicAnimation *fallAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    fallAnimation.toValue = @(imageView.layer.position.y + 2);
    fallAnimation.duration = const_explosion_time;
    
    
    CAAnimationGroup *colorImageGroup = [CAAnimationGroup animation];
    colorImageGroup.animations = @[scaleAnimation, fallAnimation];
    colorImageGroup.duration = const_explosion_time;
    colorImageGroup.removedOnCompletion = NO;
    colorImageGroup.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:colorImageGroup forKey:@"colorimageAnimation"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(const_explosion_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            imageView.alpha = 0.0;
        }completion:^(BOOL finished) {
            [imageView.layer removeAnimationForKey:@"colorimageAnimation"];
            [imageView removeFromSuperview];

        }];
    });
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
