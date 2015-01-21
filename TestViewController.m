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

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIView *redBall = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2 -50, self.view.bounds.size.height/2-50, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 50.0;
    [self.view addSubview:redBall];
    self.redBall = redBall;
}

- (IBAction)animate:(UIButton *)sender {
    
    
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    
    scale.damping = 250.0;
    scale.stiffness = 900.0;
    scale.mass = 30;
    
    scale.fromValue = @(1.0);
    scale.toValue = @(2.0);
    
    [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
    
    self.redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
    


    /*
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:0
                     animations:^{
                         
                         self.redBall.transform = CGAffineTransformMakeTranslation(100, 0);
        
                     }
                     completion:NULL];
     */
    
    /*
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
