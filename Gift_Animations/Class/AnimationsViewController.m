//
//  AnimationsViewController.m
//  飞升上神
//
//  Created by 王晓栋 on 2018/1/25.
//  Copyright © 2018年 com.qinqin.www. All rights reserved.
//

#import "AnimationsViewController.h"

#import "LuxuManager.h"
#import <OpenGLES/EAGL.h>
#import <WebKit/WebKit.h>
#import "HappyYearView.h"
#import "AnimationBalloonView.h"
#import <CoreText/CoreText.h>
#import "AnimationBeforeflowerView.h"

@interface AnimationsViewController ()<CAAnimationDelegate>
{
    UIImageView *imageView;
    BOOL isLivingShowState;
    UIView *_btnSup;
    HappyYearView *_happyYearView;
    NSMutableArray *dataArr;
    NSMutableArray *numArr;
    AnimationBeforeflowerView *_beforeflowerView;
}
@property(nonatomic,strong)UIImageView *mAwardNormalView;
@end

@implementation AnimationsViewController


#define item_height 50
#define start_x 10
#define start_y 50
#define seg_x 10
#define seg_y 14

#define item_width (ScreenWidth - 5 * 10)/4

#pragma mark  view

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
 
    UIView *animationView = [[UIView alloc] initWithFrame:self.view.bounds];
    animationView = [[UIView alloc] initWithFrame:self.view.bounds];
    animationView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:animationView];
    [LuxuManager sharedManager].livingView = animationView;
    
    _btnSup = [[UIView alloc] initWithFrame:self.view.bounds];
    _btnSup.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_btnSup];
    isLivingShowState = YES;
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizer:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    NSArray *array = @[@"飞升上神",
                       @"戒指",
                       @"栗子",
                       @"棉花糖",
                       @"摩天轮",
                       @"冰淇淋",
                       @"项链",
                       @"爱心棒棒糖",
                       @"ME_栗子",
                       @"ME_香水",
                       @"ME_棉花糖",
                       @"ME_项链",
                       @"气球 520",
                       @"ME_花仙子礼服",
                       @"梦幻水晶球",
                       @"流星雨",
                       @"蓝色之恋",
                       @"圣诞礼物",
                       @"比翼双飞",
                       @"香水",
                       @"花仙子礼服",
                       @"浮空岛",
                       @"游艇",
                       @"城堡",
                       @"冠",
                       @"水晶鞋",
                       @"婚纱",
                       @"烟花",
                       @"花",
                       @"新年快乐",
                       @"花前月下",
                       @"退出按钮"];
    
    
    int pos_x = start_x; int pos_y = start_y;
    
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(pos_x, pos_y, item_width, item_height);
        pos_x += item_width + seg_x;
        NSLog(@"pos_x=%d",pos_x);
        if (pos_x + item_width > ScreenWidth) {
            pos_x = start_x;
            pos_y += item_height + seg_y;
        }
        button.tag = 1000+ i;
        [_btnSup addSubview:button];
    }
}
- (void)button:(UIButton *)button{
    NSString *git_id = [NSString stringWithFormat:@"%zd",button.tag];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:git_id forKey:@"gif_id"];
    [LuxuManager sharedManager].luxuryDict = dict;
    if ([button.titleLabel.text isEqualToString: @"退出按钮"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
#define HIDEN_DISTANCE 50
#define SHOW_DISTANCE 20

- (void)gestureRecognizer:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation = [recognizer translationInView:_btnSup];
    NSLog(@"translation.x = %.2f",translation.x);
    
    if (isLivingShowState) {// 显示
        if (translation.x < 0) {
            return;
        }
        if (UIGestureRecognizerStateEnded == recognizer.state
            || UIGestureRecognizerStateCancelled == recognizer.state) {
            if (translation.x >= HIDEN_DISTANCE) {
                [UIView animateWithDuration:0.2 animations:^{
                    _btnSup.left = _btnSup.superview.width;
                } completion:^(BOOL finished) {
                    isLivingShowState = NO;
                    
                }];
            } else {
                [UIView animateWithDuration:0.2 animations:^{
                    _btnSup.left = 0;
                } completion:^(BOOL finished) {
                    isLivingShowState = YES;
                }];
            }
        } else {
            isLivingShowState = YES;
            _btnSup.left += [_btnSup convertPoint:translation fromView:recognizer.view].x;
            
            [recognizer translationInView:_btnSup];
        }
    } else {
        if (translation.x > 0) {
            return;
        }
        if (UIGestureRecognizerStateEnded == recognizer.state || UIGestureRecognizerStateCancelled == recognizer.state) {
            if (fabs(translation.x) >= SHOW_DISTANCE) {
                [UIView animateWithDuration:0.2 animations:^{
                    _btnSup.left = 0;
                } completion:^(BOOL finished) {
                    isLivingShowState = YES;
                }];
            } else {
                [UIView animateWithDuration:0.2 animations:^{
                    _btnSup.left = _btnSup.superview.width;
                } completion:^(BOOL finished) {
                    isLivingShowState = NO;
                }];
            }
        } else {
            if (_btnSup.left + [_btnSup convertPoint:translation fromView:recognizer.view].x <= 0) {
                return;
            }
            _btnSup.left += translation.x;
            [recognizer translationInView:recognizer.view];
        }
    }
}

- (void)startAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(3, 3, 13)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 12)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 10)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(.3, .3, 5)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 2)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 2)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 2)]];
    animation.duration = .5;
    animation.removedOnCompletion = YES;
    [animation setValue:@"first" forKey:@"animationName"];
    [self.mAwardNormalView.layer addAnimation:animation forKey:@"animationName"];
}

- (void)startBigAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(6, 6, 13)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(5.5, 5.5, 12)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(4.4, 4.4, 10)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(3.3, 3.3, 5)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.2, 2.2, 3)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.2, 2.2, 3)],
                         
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 2)]];
    animation.duration = .5;
    animation.removedOnCompletion = YES;
    [animation setValue:@"first" forKey:@"animationName"];
    [self.mAwardNormalView.layer addAnimation:animation forKey:@"animationName"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
