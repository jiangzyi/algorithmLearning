//
//  ViewController.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/25.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "ViewController.h"

#import "BasicSort.h"
#import "MergeSort.h"
#import "QuickSort.h"

#import "SortTestHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array1 = [SortTestHelper generateRandomArrayWithN:10000 rangeL:0 rangeR:10000];
    NSMutableArray *array2 = [array1 mutableCopy];
    NSMutableArray *array3 = [array1 mutableCopy];
    NSMutableArray *array4 = [array1 mutableCopy];
    NSMutableArray *array5 = [array1 mutableCopy];
    NSMutableArray *array6 = [array1 mutableCopy];
    NSMutableArray *array7 = [array1 mutableCopy];
    [SortTestHelper testSort:@"Selection Sort" sortMethod:^(NSMutableArray *array) {
        [BasicSort selectionSortArray:array];
    } array:array1];
    [SortTestHelper testSort:@"Insertion Sort" sortMethod:^(NSMutableArray *array) {
        [BasicSort insertionSortArray:array];
    } array:array2];
    [SortTestHelper testSort:@"Merge Sort" sortMethod:^(NSMutableArray *array) {
        [MergeSort MergeSortArray:array];
    } array:array3];
    [SortTestHelper testSort:@"Merge Sort BU" sortMethod:^(NSMutableArray *array) {
        [MergeSort MergeSortArrayBU:array];
    } array:array4];
    [SortTestHelper testSort:@"Quick Sort" sortMethod:^(NSMutableArray *array) {
        [QuickSort quickSort:array];
    } array:array5];
    [SortTestHelper testSort:@"Quick Sort2" sortMethod:^(NSMutableArray *array) {
        [QuickSort quickSort2:array];
    } array:array6];
    [SortTestHelper testSort:@"Quick Sort3" sortMethod:^(NSMutableArray *array) {
        [QuickSort quickSort3:array];
    } array:array7];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
