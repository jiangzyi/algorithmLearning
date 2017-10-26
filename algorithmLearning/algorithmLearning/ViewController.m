//
//  ViewController.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/25.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "ViewController.h"
#import "BasicSort.h"
#import "SortTestHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array1 = [SortTestHelper generateRandomArrayWithN:10000 rangeL:0 rangeR:10000];
    NSMutableArray *array2 = [array1 mutableCopy];
    [SortTestHelper testSort:@"Selection Sort" sortMethod:^(NSMutableArray *array) {
        [BasicSort selectionSortArray:array];
    } array:array1];
    [SortTestHelper testSort:@"Insertion Sort" sortMethod:^(NSMutableArray *array) {
        [BasicSort insertionSortArray:array];
    } array:array2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
