//
//  TestViewController.m
//  Animation
//
//  Created by Erik Griffin on 1/21/15.
//  Copyright (c) 2015 Erik Griffin. All rights reserved.
//

#import "TestViewController.h"
#import "JNWSpringAnimation.h"

@interface TestViewController ()

@property (nonatomic) UIView *redBall;
@property (nonatomic) UIView *blueSquare;
@property (nonatomic) UIView *greenBall;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat boundHeight = self.view.bounds.size.height;
    CGFloat boundWidth = self.view.bounds.size.width;

    UIView *redBall = [[UIView alloc]initWithFrame:CGRectMake(boundWidth/2-50, boundHeight/5, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 50.0;
    [self.view addSubview:redBall];
    self.redBall = redBall;
    NSLog(@"Red y coord %f",self.redBall.frame.origin.y);
    
    
    self.blueSquare = [[UIView alloc]initWithFrame:CGRectMake(boundWidth/2-50, boundHeight*(4.0/5.0), 100, 100)];
    self.blueSquare.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueSquare];
    NSLog(@"Blue y coord %f",self.blueSquare.frame.origin.y);
    
    self.greenBall = [[UIView alloc]initWithFrame:CGRectMake(25, boundHeight/2+20, 50, 50)];
    self.greenBall.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenBall];
    NSLog(@"Green y coord %f",self.greenBall.frame.origin.y);


}

- (IBAction)animate:(UIButton *)sender {
    
    
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    
    scale.damping = 3.5;
    scale.stiffness = 20.0;
    scale.mass = 0.8;
    
    scale.fromValue = @(1.0);
    scale.toValue = @(2.0);
    
    [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
    
    self.redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
    
    JNWSpringAnimation *rotate = [JNWSpringAnimation animationWithKeyPath:@"transform.rotation"];
    
    rotate.damping = 17.0;
    rotate.stiffness = 125;
    rotate.mass = 3.0;
    
    rotate.fromValue = @(0);
    rotate.toValue = @(M_PI_2);
    
    [self.blueSquare.layer addAnimation:rotate forKey:rotate.keyPath];
    self.blueSquare.transform = CGAffineTransformRotate(self.blueSquare.transform,(M_PI_2));
    [self.blueSquare.layer addAnimation:scale forKey:scale.keyPath];
    // By not using the 'Make' method, it's saving the transform matrix for scale, making the square double in size
    // each time 'animate' is pressed.
    // This is not what I want, so I think it better to use make in this situation.
    // I don't know why he said you must do it this way for using multiple animations
    // self.blueSquare.transform = CGAffineTransformScale(self.blueSquare.transform, 2.0, 2.0);
    self.blueSquare.transform = CGAffineTransformMakeScale(2.0, 2.0);
    
    JNWSpringAnimation *translate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.x"];
    
    translate.damping = 7;
    translate.stiffness = 7;
    translate.mass = 1;
    
    translate.fromValue = @(0);
    translate.toValue = @(200);
    
    [self.greenBall.layer addAnimation:translate forKey:translate.keyPath];
    self.greenBall.transform = CGAffineTransformMakeTranslation(200, 0);
    

    
    /*
     
    // iOS 7 native animation.

    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         // Animate the ball
                         self.redBall.backgroundColor = [UIColor greenColor];
                         self.redBall.transform = CGAffineTransformConcat(
                                        CGAffineTransformMakeScale(2.0, 2.0),
                                        CGAffineTransformMakeTranslation(0.0, 70.0));
                         
                         
                     }
                     completion:NULL];
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
