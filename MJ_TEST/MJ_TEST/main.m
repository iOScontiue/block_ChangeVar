//
//  main.m
//  MJ_TEST
//
//  Created by 卢育彪 on 2019/1/2.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"

void(^block)(void);

void test1()
{
    int age = 10;
    block = ^{
//        age = 20;
        NSLog(@"%d", age);
    };
}

//__block int age = 10;
void test2()
{
    static int age = 10;
    block = ^{
        age = 20;
        NSLog(@"%d", age);
    };
}

void test3()
{
    __block int age = 10;
    block = ^{
        age = 20;
        NSLog(@"%d", age);
    };
}

struct __Block_byref_age_0 {
    void *__isa;
    struct __Block_byref_age_0 *__forwarding;
    int __flags;
    int __size;
    int age;
};

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __test3_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(void);
    void (*dispose)(void);
};

struct __test4_block_impl_0 {
    struct __block_impl impl;
    struct __test3_block_desc_0* Desc;
    struct __Block_byref_age_0 *age;
};

void test4()
{
    __block int age = 10;
    block = ^{
        age = 20;
        NSLog(@"%d", age);
    };
    
    struct __test4_block_impl_0 *strBlock = (__bridge struct __test4_block_impl_0 *)block;
    
    NSLog(@"%p", &age);
    NSLog(@"----");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test1();
//        block();
        
//        test2();
//        block();
        
//        test3();
//        block();
        
        test4();
        block();
    }
    return 0;
}


