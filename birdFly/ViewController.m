//
//  ViewController.m
//  birdFly
//
//  Created by Trung Bao on 11/5/15.
//  Copyright © 2015 Trung Bao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *bird;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self drawjungle];
    [self drawbird];
    [self fly];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) drawjungle {
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame= self.view.bounds;
    background.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
}
-(void) drawbird {
    bird =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    NSMutableArray *fileimages =[[NSMutableArray alloc] init];
    for (int i=0; i<6; i++) {
        NSString *images;
        images =[NSString stringWithFormat:@"bird%d.png",i];
        [fileimages addObject:[UIImage imageNamed:images]];
    }
    bird.animationImages = fileimages;
    bird.animationDuration=1;
    bird.animationRepeatCount=0;
    [self.view addSubview:bird];
    [bird startAnimating];
}
-(void) fly {
    bird.transform=CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1,1), CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self fly];
        }];
    }];
}
@end
