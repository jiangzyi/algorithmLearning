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
#import "MaxHeap.h"

#import "SortTestHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SortTestHelper testSort:@"Selection Sort" sortMethod:^(NSMutableArray *array) {
        [BasicSort selectionSortArray:array];
    }];
    [SortTestHelper testSort:@"Insertion Sort" sortMethod:^(NSMutableArray *array) {
        [BasicSort insertionSortArray:array];
    }];
    [SortTestHelper testSort:@"Merge Sort" sortMethod:^(NSMutableArray *array) {
        [MergeSort MergeSortArray:array];
    }];
    [SortTestHelper testSort:@"Merge Sort BU" sortMethod:^(NSMutableArray *array) {
        [MergeSort MergeSortArrayBU:array];
    }];
    [SortTestHelper testSort:@"Quick Sort" sortMethod:^(NSMutableArray *array) {
        [QuickSort quickSort:array];
    }];
    [SortTestHelper testSort:@"Quick Sort2" sortMethod:^(NSMutableArray *array) {
        [QuickSort quickSort2:array];
    }];
    [SortTestHelper testSort:@"Quick Sort3" sortMethod:^(NSMutableArray *array) {
        [QuickSort quickSort3:array];
    }];
    [SortTestHelper testSort:@"Max Heap Sort1" sortMethod:^(NSMutableArray *array) {
        [MaxHeap heapSort1WithArray:array];
    }];
    [SortTestHelper testSort:@"Max Heap Sort2" sortMethod:^(NSMutableArray *array) {
        [MaxHeap heapSort2WithArray:array];
    }];
    [SortTestHelper testSort:@"Max Heap Sort3" sortMethod:^(NSMutableArray *array) {
        [MaxHeap heapSort3WithArray:array];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
