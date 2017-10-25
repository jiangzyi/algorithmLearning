//
//  ViewController.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/25.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "ViewController.h"
#import "algorithmMethod/SelectionSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1,@2,@3,@4,@5,@61,@2,@2331,@213123,@211321, nil];
     [SelectionSort selectionSortArray:arr];
    NSLog(@"%@", arr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
