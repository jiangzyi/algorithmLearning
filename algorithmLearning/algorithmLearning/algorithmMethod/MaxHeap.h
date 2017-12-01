//
//  MaxHeap.h
//  algorithmLearning
//
//  Created by peng8744 on 2017/11/30.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MaxHeap : NSObject

+ (void)heapSort1WithArray:(NSMutableArray *)array;
+ (void)heapSort2WithArray:(NSMutableArray *)array;
+ (void)heapSort3WithArray:(NSMutableArray *)array;

- (instancetype)initWithCapacity:(NSInteger)capacity;
- (instancetype)initWithArray:(NSMutableArray *)array;
- (NSInteger)size;
- (BOOL)isEmpty;

- (void)insertWithItem:(id)item;
- (id)extractMax;

@end
