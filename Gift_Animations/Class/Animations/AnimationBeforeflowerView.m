//
//  AnimationBeforeflowerView.m
//  Gift_Animations
//
//  Created by 王晓栋 on 2018/4/18.
//  Copyright © 2018年 王晓栋. All rights reserved.
//

#import "AnimationBeforeflowerView.h"
#import "AnimationImageCache.h"
#import "LuxuManager.h"


@interface AnimationBeforeflowerView()

@property(nonatomic,strong)UIImageView *bflowerBackgroundView;
@property(nonatomic,strong)UIImageView *moonView;
@property(nonatomic,strong)UIImageView *grassView;
@property(nonatomic,strong)UIImageView *woodsView;
@property(nonatomic,strong)UIImageView *mushroomView;
@property(nonatomic,strong)UIImageView *catView;
@property(nonatomic,strong)UIImageView *purpleButterView;
@property(nonatomic,strong)UIImageView *blueButterView;
@property(nonatomic,strong)UIImageView *loveView;
@property(nonatomic,strong)UIImageView *catLoveView;
@property(nonatomic,strong)NSMutableArray *lovesArray;
@property(nonatomic,strong)UIImageView *startView;
@property(nonatomic,strong)UIImageView *start2View;



 @end

@implementation AnimationBeforeflowerView

#pragma mark - init

- (instancetype)init {
    self = [super init];
    [self customInit];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self customInit];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self customInit];
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

static inline CGFloat ImageWToScale(UIImage *image,CGFloat scale) {
    return image.size.width/scale;
};
static inline CGFloat ImageHToScale(UIImage *image,CGFloat scale) {
    return image.size.height/scale;
};

- (void)setMNickName:(NSString *)mNickName {
    UILabel* nameLabel = [[UILabel alloc] init];
    nameLabel.text = mNickName;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.shadowColor = [UIColor yellowColor];
    [nameLabel sizeToFit];
    nameLabel.center = CGPointMake(self.width / 2, self.height / 2 + 100);
    [self addSubview:nameLabel];
}


- (void)customInit {
    self.userInteractionEnabled = NO;
    
    self.bflowerBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.bflowerBackgroundView.image = [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_light_bg"];
    self.bflowerBackgroundView.alpha = 0;
    [self addSubview:self.bflowerBackgroundView];
 
    UIImage *moonImage = [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_moon"];
     self.moonView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, - ImageHToScale(moonImage, 3.0), ImageWToScale(moonImage,3.0), ImageHToScale(moonImage,3.0))];
    self.moonView.image = moonImage;
    [self addSubview:self.moonView];
    
    
    UIImage *woodsImage = [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_woods"];
    self.woodsView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH- ImageWToScale(woodsImage,3.0),0,ImageWToScale(woodsImage,3.0), ImageHToScale(woodsImage,3.0))];
    self.woodsView.image = woodsImage;
    [self addSubview:self.woodsView];

    
    UIImage *grassImage = [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_grass"];
    self.grassView = [[UIImageView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT - ImageHToScale(grassImage,3.0),SCREEN_WIDTH, ImageHToScale(grassImage,3.0))];
    self.grassView.image = grassImage;
    [self addSubview:self.grassView];
    self.woodsView.top = self.grassView.top - ImageHToScale(woodsImage,3.0) + 70;

    UIImage *mushroomImage = [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_mushroom"];
    self.mushroomView = [[UIImageView alloc] initWithFrame:CGRectMake(0,self.grassView.top - ImageHToScale(mushroomImage,3.5) + 120 ,ImageWToScale(mushroomImage,3.5), ImageHToScale(mushroomImage,3.5))];
    self.mushroomView.image = mushroomImage;
    [self addSubview:self.mushroomView];
 
    UIImage *catImage = [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_small_cat"];
    self.catView = [[UIImageView alloc] initWithFrame:CGRectMake(self.mushroomView.right ,self.grassView.top - ImageHToScale(catImage,3.0) + 50 ,ImageWToScale(catImage,3.0), ImageHToScale(catImage,3.0))];
    self.catView.image = catImage;
    [self addSubview:self.catView];
    
    UIImage *purpleButterImage =[[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_purple_butterfly0"];
    self.purpleButterView = [[UIImageView alloc] initWithFrame:CGRectMake(10 ,SCREEN_HEIGHT - ImageHToScale(purpleButterImage,3.5) - 50 ,ImageWToScale(purpleButterImage,3.5), ImageHToScale(purpleButterImage,3.5))];
    self.purpleButterView.image = purpleButterImage;
    NSMutableArray<UIImage *> *butterArrays = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i <= 17 ; i ++) {
      NSString *imageName =  [NSString stringWithFormat:@"beforeflower_purple_butterfly%zd",i];
            UIImage *image =[[AnimationImageCache shareInstance] getImageWithName:imageName];
        if (image) {
            [butterArrays addObject:image];
        }
    }
    self.purpleButterView.animationImages = butterArrays;
    self.purpleButterView.animationDuration = 17 * 0.2;
    self.purpleButterView.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.purpleButterView];
    
    
    UIImage *blueButterImage =[[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_blue_butterfly0"];
    self.blueButterView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - ImageWToScale(blueButterImage,3.5)- 30 ,SCREEN_HEIGHT - ImageHToScale(blueButterImage,3.5) - 40 ,ImageWToScale(blueButterImage,3.5), ImageHToScale(blueButterImage,3.5))];
    self.blueButterView.image = blueButterImage;
    NSMutableArray<UIImage *> *bluebutterArrays = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i <= 17 ; i ++) {
        NSString *imageName =  [NSString stringWithFormat:@"beforeflower_blue_butterfly%zd",i];
        UIImage *image =[[AnimationImageCache shareInstance] getImageWithName:imageName];
        if (image) {
            [bluebutterArrays addObject:image];
        }
    }
    self.blueButterView.animationImages = bluebutterArrays;
    self.blueButterView.animationDuration = 17 * 0.2;
    self.blueButterView.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.blueButterView];
    
    
    UIImage *startImage =[[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_start0"];
    self.startView = [[UIImageView alloc] initWithFrame:CGRectMake(5 ,0,ImageWToScale(startImage,3.0), ImageHToScale(startImage,3.0))];
    self.startView.image = startImage;
    NSMutableArray<UIImage *> *startArrays = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i <= 9 ; i ++) {
        NSString *imageName =  [NSString stringWithFormat:@"beforeflower_start%zd",i];
        UIImage *image =[[AnimationImageCache shareInstance] getImageWithName:imageName];
        if (image) {
            [startArrays addObject:image];
        }
    }
    self.startView.animationImages = startArrays;
    self.startView.animationDuration = 9 * 0.2;
    self.startView.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.startView];
    self.startView.top =self.mushroomView.top + 40;
    
    
    self.start2View = [[UIImageView alloc] initWithFrame:CGRectMake(10 ,0,ImageWToScale(startImage,3.0), ImageHToScale(startImage,3.0))];
    self.start2View.image = startImage;
 
    self.start2View.animationImages = startArrays;
    self.start2View.animationDuration = 9 * 0.2;
    self.start2View.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.start2View];
    self.start2View.centerX =SCREEN_WIDTH/2;
    self.start2View.centerY =self.mushroomView.centerY + 30;

    self.moonView.hidden = YES;
    self.grassView.hidden = YES;
    
    self.woodsView.hidden = YES;
    self.mushroomView.hidden = YES;
    self.catView.hidden = YES;
    self.purpleButterView.hidden = YES;
    self.blueButterView.hidden = YES;
    
    self.startView.hidden = YES;
    self.start2View.hidden = YES;

     [self startAnimation];
}

#pragma mark - start

- (void)startAnimation{
    
    [UIView animateWithDuration:2.0 animations:^{
       self.bflowerBackgroundView.alpha = 1.0;
    }];
    ESWeakSelf
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        self.moonView.hidden = NO;
        [UIView animateWithDuration:7 animations:^{
            ESStrongSelf;
            _self.moonView.left -= _self.moonView.width;
            _self.moonView.bottom += _self.moonView.height;
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.grassView.hidden = NO;
        self.grassView.alpha = 0.0;
        [UIView animateWithDuration:1.5 animations:^{
            ESStrongSelf;
           _self.grassView.alpha = 1.0;
        }];
    });
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.woodsView.hidden = NO;
        self.woodsView.alpha = 0.0;
        self.mushroomView.hidden = NO;
        self.mushroomView.alpha = 0.0;
        self.catView.hidden = NO;
        self.catView.alpha = 0.0;
       
         self.blueButterView.hidden = NO;
         [self.blueButterView startAnimating];
        [UIView animateWithDuration:1.5 animations:^{
            ESStrongSelf;
            _self.woodsView.alpha = 1.0;
        }completion:^(BOOL finished) {
            ESStrongSelf;
            _self.purpleButterView.hidden = NO;
            [_self.purpleButterView startAnimating];
        }];
        [UIView animateWithDuration:1.5 delay:1.5 options:UIViewAnimationOptionCurveLinear animations:^{
            ESStrongSelf;
            _self.mushroomView.alpha = 1.0;
        } completion:^(BOOL finished) {
            ESStrongSelf;
            [_self playStartAniamtion];

        }];
        [UIView animateWithDuration:1.5 delay:3.0 options:UIViewAnimationOptionCurveLinear animations:^{
            ESStrongSelf;
            _self.catView.alpha = 1.0;
        } completion:^(BOOL finished) {
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSInteger i = 0; i < 10; i ++) {
                
                [array addObject:[NSString stringWithFormat:@"第%zd个",i]];
            }
            self.lovesArray = [NSMutableArray arrayWithArray:array];
            [self addLoveView];
        }];

    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playLightAniamtionWithImageName:@"beforeflower_purple_light" imageCount:12 center:CGPointMake(SCREEN_WIDTH/4 - 20, SCREEN_HEIGHT - 180)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self playLightAniamtionWithImageName:@"beforeflower_blue_light" imageCount:9 center:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 180)];

        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self playLightAniamtionWithImageName:@"beforeflower_golden_light" imageCount:7 center:CGPointMake(SCREEN_WIDTH/4+SCREEN_WIDTH/2 + 20  , SCREEN_HEIGHT - 180)];
        });

     });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playLightAniamtionWithImageName:@"beforeflower_purple_light" imageCount:12 center:CGPointMake(SCREEN_WIDTH/3+ 15, SCREEN_HEIGHT - 190)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self playLightAniamtionWithImageName:@"beforeflower_golden_light" imageCount:7 center:CGPointMake(SCREEN_WIDTH/3*2 , SCREEN_HEIGHT - 100)];

        });

    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(18.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playLightAniamtionWithImageName:@"beforeflower_purple_light" imageCount:12 center:CGPointMake(SCREEN_WIDTH/4 - 30, SCREEN_HEIGHT - 160)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self playLightAniamtionWithImageName:@"beforeflower_blue_light" imageCount:9 center:CGPointMake(SCREEN_WIDTH/2- 10 - 5, SCREEN_HEIGHT - 130)];

        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self playLightAniamtionWithImageName:@"beforeflower_golden_light" imageCount:7 center:CGPointMake(SCREEN_WIDTH/4+SCREEN_WIDTH/2 + 10 , SCREEN_HEIGHT - 160)];

        });

    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(25.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESWeakSelf;
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            ESStrongSelf;
            [_self.purpleButterView stopAnimating];
            [_self.blueButterView stopAnimating];
            [_self.start2View stopAnimating];
            [_self.startView stopAnimating];
            [_self removeFromSuperview];
            [_self.layer removeAllAnimations];
            [_self callBackManager];
            _self = nil;
        }];
    });
}
- (void)addLoveView{
    if (self.lovesArray && self.lovesArray.count > 0) {
         [self.lovesArray removeObjectAtIndex:0];
        [self showMoreLoveAnimateFromView:self.catView addToView:self withLoveCount:1 withLightPos:0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addLoveView];
        });
    }
 }

- (void)playLightAniamtionWithImageName:(NSString *)imageName imageCount:(NSInteger)imageCount center:(CGPoint)center{
    
    UIImage *lightImage =[[AnimationImageCache shareInstance]getImageWithName:[NSString stringWithFormat:@"%@0",imageName]];
    UIImageView *lightImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ImageWToScale(lightImage, 3.0), ImageHToScale(lightImage, 3.0))];
    lightImV.image = lightImage;
    [self addSubview:lightImV];
    lightImV.center = center;
    NSMutableArray<UIImage *> *images = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0 ; i <= imageCount; i ++) {
        NSString *igName =  [NSString stringWithFormat:@"%@%zd",imageName,i];
        UIImage *image =[[AnimationImageCache shareInstance] getImageWithName:igName];
        if (image) {
            [images addObject:image];
        }

    }
    lightImV.animationImages = images;
    lightImV.animationDuration = imageCount * 0.2;
    lightImV.animationRepeatCount = MAXFLOAT;
    
    [lightImV startAnimating];
    lightImV.alpha = 0.0;
    [UIView animateWithDuration:2.0 animations:^{
        lightImV.alpha = 1.0;
     }completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:8.0 animations:^{
        lightImV.bottom = 0;
    }completion:^(BOOL finished) {
        [lightImV stopAnimating];
        [lightImV removeFromSuperview];
    }];
 }
- (void)playStartAniamtion{
    self.startView.hidden = NO;
    [self.startView startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.start2View.hidden = NO;
        [self.start2View startAnimating];
    });

}

#pragma mark 粒子动画

- (void)showMoreLoveAnimateFromView:(UIView *)fromView addToView:(UIView *)addToView withLoveCount:(NSInteger)count withLightPos:(int)lightPos {
 
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    CGRect loveFrame = [fromView convertRect:fromView.frame toView:addToView];
    CGPoint position = CGPointMake(SCREEN_WIDTH - fromView.width - 10, loveFrame.origin.y - 30);
    position.y /= 2;
    imageView.layer.position = position;
    imageView.image =  [[AnimationImageCache shareInstance] getImageWithName:@"beforeflower_heart"];
    [addToView addSubview:imageView];
    
    imageView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    CGFloat duration = 3 + arc4random()%5;
    CAKeyframeAnimation *positionAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimate.repeatCount = 1;
    positionAnimate.duration = duration;
    positionAnimate.fillMode = kCAFillModeForwards;
    positionAnimate.removedOnCompletion = NO;
    
    UIBezierPath *sPath = [UIBezierPath bezierPath];
    [sPath moveToPoint:position];
    CGFloat sign = arc4random()%2 == 1 ? 1 : -1;
    CGFloat controlPointValue = (arc4random()%50 + arc4random()%100) * sign;
    [sPath addCurveToPoint:CGPointMake(position.x, position.y - 150) controlPoint1:CGPointMake(position.x - controlPointValue, position.y - 100) controlPoint2:CGPointMake(position.x + controlPointValue, position.y - 100)];
    positionAnimate.path = sPath.CGPath;
    [imageView.layer addAnimation:positionAnimate forKey:@"heartAnimated"];
    [UIView animateWithDuration:duration animations:^{
        imageView.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

- (void)callBackManager{
    [LuxuManager sharedManager].isShowAnimation = NO;
    [ [LuxuManager sharedManager] showLuxuryAnimation];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
