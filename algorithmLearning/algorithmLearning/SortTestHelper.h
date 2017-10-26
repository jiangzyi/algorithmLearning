//
//  SortTestHelper.h
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/26.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortTestHelper : NSObject

// 生成有n个元素的随机数组,每个元素的随机范围为[rangeL, rangeR]
+ (NSMutableArray *)generateRandomArrayWithN:(NSInteger)n rangeL:(NSInteger)rangeL rangeR:(NSInteger)rangeR;
// 打印数组的所有内容
+ (void)printArray:(NSMutableArray *)array;
// 判断数组是否有序
+ (BOOL)isSorted:(NSMutableArray *)array;
// 时间测试
+ (void)testSort:(NSString *)sortName sortMethod:(void (^)(NSMutableArray *))sortMethod array:(NSMutableArray *)array;
@end
