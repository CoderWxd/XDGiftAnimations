//
//  PerfumeView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/6/28.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "PerfumeView.h"
#import "UIView+ESShortcut.h"

@interface PerfumeView()

@property(nonatomic,strong)UIImageView *perfumeImV;
@property(nonatomic,strong)UIImageView *smokeImV;
@property(nonatomic,strong)UIImageView *purpleCigarImV;
@property(nonatomic,strong)UIImageView *smaButterImV;//小
@property(nonatomic,strong)UIImageView *midButterImV;//中
@property(nonatomic,strong)UIImageView *bigButterImV;//大

@end

@implementation PerfumeView

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
    self.backgroundColor = [UIColor clearColor];
    
    //perfume
    UIImage *image = [UIImage imageNamed:@"perfume"];
    float scaleWidth = image.size.width/2;
    float scaleHeight = image.size.height/2;
    self.perfumeImV = [[UIImageView alloc] initWithFrame:CGRectMake(self.width, 40, scaleWidth, scaleHeight)];
    self.perfumeImV.image = image;
    [self addSubview:self.perfumeImV];
    self.perfumeImV.transform =CGAffineTransformMakeRotation(M_PI/6);
    
    //perfume_purp_smoke
    image = [UIImage imageNamed:@"perfume_purp_smoke"];
    float smokeWidth =image.size.width/2;
    float smokeHeight =image.size.height/2;
    self.smokeImV = [[UIImageView alloc] initWithFrame:CGRectMake(self.width+30, -40, smokeWidth, smokeHeight)];
    self.smokeImV.image = image;
    [self addSubview:self.smokeImV];
    [self sendSubviewToBack:self.smokeImV];

    //perfume_purple_cigar
    image = [UIImage imageNamed:@"perfume_purple_cigar"];
    float cigarWidth = image.size.width/2;
    float cigarHeight = image.size.height/2;
    self.purpleCigarImV = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, cigarWidth, cigarHeight)];
    self.purpleCigarImV.image = image;
    [self addSubview:self.purpleCigarImV];
    self.purpleCigarImV.hidden = YES;
    self.purpleCigarImV.center  = CGPointMake(self.width/2 -30,self.height - 160);
    [self sendSubviewToBack:self.purpleCigarImV];
    
    //perfume_middle_butter
    image = [UIImage imageNamed:@"perfume_middle_butter"];
    float middleWidth = image.size.width/2.5;
    float middleHeight = image.size.height/2.5;
    self.midButterImV = [[UIImageView alloc] initWithFrame:CGRectMake(self.purpleCigarImV.width/2 +20,70, middleWidth, middleHeight)];
    self.midButterImV.image = image;
    [self.purpleCigarImV addSubview:self.midButterImV];
    self.midButterImV.hidden = NO;

    
    //perfume_sma_butter
    image = [UIImage imageNamed:@"perfume_sma_butter"];
    float smaButWidth = image.size.width/2;
    float smaButHeight = image.size.height/2;
    self.smaButterImV = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2,self.height - 200, smaButWidth, smaButHeight)];
    self.smaButterImV.image = image;
    [self addSubview:self.smaButterImV];
    self.smaButterImV.hidden = YES;

    
    //perfume_big_butter
    image = [UIImage imageNamed:@"perfume_big_butter"];
    float butterWidth = image.size.width/2;
    float butterHeight = image.size.height/2;
    self.bigButterImV = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2,self.height - 150, butterWidth, butterHeight)];
    self.bigButterImV.image = image;
    [self addSubview:self.bigButterImV];
    self.bigButterImV.hidden = YES;

    
    ESWeakSelf;
    [UIView animateWithDuration:1.5 animations:^{
        ESStrongSelf;
        _self.perfumeImV.centerX -= ScreenWidth - 80;
        _self.perfumeImV.centerY += 180;
        _self.smokeImV.right = ScreenWidth;
        _self.smokeImV.top =_self.perfumeImV.top -50;
    } completion:^(BOOL finished) {
        ESStrongSelf;
        _self.smokeImV.hidden = YES;
        [_self.smokeImV removeFromSuperview];
        [_self startAnimation];
    }];

}
- (void)startAnimation{
    
    ESWeakSelf;
    [UIView animateWithDuration:1.5 animations:^{
        ESStrongSelf;
        _self.perfumeImV.centerX = self.width/2;
        _self.perfumeImV.centerY = self.height - 150;
        self.perfumeImV.transform =CGAffineTransformIdentity;

    } completion:^(BOOL finished) {

    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *momAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        momAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        momAnimation.toValue = [NSNumber numberWithFloat:-0.3];
        momAnimation.byValue = [NSNumber numberWithFloat:0.3];
        
        momAnimation.duration = 0.2;
        momAnimation.repeatCount = 1;
        momAnimation.removedOnCompletion = YES;
        
        momAnimation.autoreverses = YES;
        [self.perfumeImV.layer addAnimation:momAnimation forKey:@"animateLayer"];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //上面蝴蝶
        self.smaButterImV.hidden = NO;
        CGRect frame = self.smaButterImV.frame;
        self.smaButterImV.transform = CGAffineTransformMakeScale(0.1, 0.1);
        frame.origin.x += 80;
        frame.origin.y -= 80;
        [UIView animateWithDuration:0.8 animations:^{
            ESStrongSelf;

            _self.smaButterImV.transform = CGAffineTransformMakeScale(1.2, 1.2);
            _self.smaButterImV.frame = frame;
        } completion:^(BOOL finished) {

        }];
        //下面蝴蝶
        self.bigButterImV.hidden = NO;
        CGRect bigButFrame = self.bigButterImV.frame;
        self.bigButterImV.transform = CGAffineTransformMakeScale(0.1, 0.1);
        bigButFrame.origin.x += 100;
        [UIView animateWithDuration:0.8 animations:^{
            ESStrongSelf;
            _self.bigButterImV.transform = CGAffineTransformMakeScale(1.2, 1.2);
            _self.bigButterImV.frame = bigButFrame;
        } completion:^(BOOL finished) {
            
        }];
        //中间蝴蝶
        UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:CGRectMake(CGRectGetWidth(self.purpleCigarImV.bounds), 0, CGRectGetWidth(self.purpleCigarImV.bounds), CGRectGetHeight(self.purpleCigarImV.bounds))];
            UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithRect:self.purpleCigarImV.bounds];
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            self.purpleCigarImV.layer.mask = maskLayer;
        maskLayer.path = maskFinalPath.CGPath;
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id)maskStartPath.CGPath;
        maskLayerAnimation.toValue = (__bridge id)maskFinalPath.CGPath;
        maskLayerAnimation.removedOnCompletion = NO;
        maskLayerAnimation.duration = 0.7;
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [maskLayer addAnimation:maskLayerAnimation forKey:@"maskLayerAnimation"];

        self.purpleCigarImV.hidden = NO;
        [UIView animateWithDuration:0.7 animations:^{
            ESStrongSelf;
            _self.purpleCigarImV.left += self.purpleCigarImV.width/2;
            _self.purpleCigarImV.top -= self.purpleCigarImV.height/2;
        }];

    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [UIView animateWithDuration:1.0 animations:^{
            ESStrongSelf;
            _self.alpha = 0.0;
        }completion:^(BOOL finished) {
            ESStrongSelf;
            [_self callBackManager];
            [_self removeFromSuperview];
            
        }];
    });

}

- (void)callBackManager {
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
