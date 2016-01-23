//
//  ViewController.m
//  StackViewDemo
//
//  Created by 杨锦辉 on 16/1/23.
//  Copyright © 2016年 杨锦辉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *myStackV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//添加星星
- (IBAction)addStar:(id)sender {
    UIImageView *starImage = [[UIImageView alloc]init];
    starImage.image = [UIImage imageNamed:@"star"];
    starImage.contentMode = UIViewContentModeScaleAspectFit;//防止图片变形
    [self.myStackV addArrangedSubview:starImage];
    [UIView animateWithDuration:0.25 animations:^{
        [self.myStackV layoutIfNeeded];
    }];
    NSLog(@"星星的个数为：%lu",self.myStackV.arrangedSubviews.count);
}

//移除星星
- (IBAction)removeStar:(id)sender {
    id star = self.myStackV.arrangedSubviews.lastObject;
    if ([star isKindOfClass:[UIImageView class]]) {
        [self.myStackV removeArrangedSubview:star];
        [star removeFromSuperview];
        [UIView animateWithDuration:0.5 animations:^{
            [self.myStackV layoutIfNeeded];
        }];
    }
    NSLog(@"星星的个数为：%lu",self.myStackV.arrangedSubviews.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
