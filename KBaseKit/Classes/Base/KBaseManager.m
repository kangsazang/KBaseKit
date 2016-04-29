//
//  KBaseManager.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KBaseManager.h"

@implementation KBaseManager

+ (instancetype)shared {
    
    static dispatch_once_t once;
    static NSMutableDictionary *sharedInstances;
    
    dispatch_once(&once, ^{ /* This code fires only once */
        
        // Creating of the container for shared instances for different classes
        sharedInstances = [NSMutableDictionary new];
    });
    
    id sharedInstance;
    
    @synchronized(self) { /* Critical section for Singleton-behavior */
        
        // Getting of the shared instance for exact class
        sharedInstance = sharedInstances[NSStringFromClass(self)];
        
        if (!sharedInstance) {
            // Creating of the shared instance if it's not created yet
            sharedInstance = [self new];
            sharedInstances[NSStringFromClass(self)] = sharedInstance;
        }
    }
    
    return sharedInstance;
}

@end
