//
//  IndexHeap.h
//  algorithmLearning
//
//  Created by peng8744 on 2017/12/1.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexMaxHeap : NSObject

- (instancetype)initWithCapacity:(NSInteger)capacity;
- (NSInteger)size;
- (BOOL)isEmpty;

- (void)insertWithIndex:(NSInteger)i Item:(id)item;
- (id)extractMax;
- (NSInteger)extractMaxIndex;
- (id)getItemWithIndex:(NSInteger)i;

@end
