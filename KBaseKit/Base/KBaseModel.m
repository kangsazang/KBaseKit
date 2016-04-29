//
//  KBaseModel.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KBaseModel.h"
#import "objc/runtime.h"

@implementation KBaseModel

- (NSDictionary *)convertDictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            
            id value = [self valueForKey: propertyName];
            
            
            if (value != nil) {
                
                NSString *className = NSStringFromClass([value class]);
                NSString *propertyType = nil;
                
                if ([className isEqualToString:@"__NSCFNumber"]) {
                    propertyType = className;
                    
                }
                else if ([className isEqualToString:@"__NSCFBoolean"])
                {
                    propertyType = @"NSCFBoolean";
                    
                    NSLog(@"NSCFBoolean : %@",value);
                }
                else
                {
                    const char *propType = getPropertyType(property);
                    propertyType = [NSString stringWithCString:propType
                                                      encoding:[NSString defaultCStringEncoding]];
                }
                
                [dict setObject:value forKey:propertyName];
            }
        }
    }
    free(properties);
    
    return dict;
}

- (NSDictionary *)classPropsFor:(Class)klass
{
    //NSLog(@"Properties for class:%@", klass);
    if (klass == NULL || klass == [NSObject class]) {
        return nil;
    }
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(klass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        
        if(propName) {
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            id value = [self valueForKey: propertyName];
            
            NSString *propertyType = nil;
            NSString *className = NSStringFromClass([value class]);
            if ([className isEqualToString:@"__NSCFNumber"]) {
                propertyType = className;
            }
            else if ([className isEqualToString:@"__NSCFBoolean"])
            {
                propertyType = @"NSCFBoolean";
                //value = value ? @"YES" : @"NO";
            }
            else
            {
                const char *propType = getPropertyType(property);
                propertyType = [NSString stringWithCString:propType
                                                  encoding:[NSString defaultCStringEncoding]];
            }
            
            if (value != nil) {
            
                [results setObject:value forKey:propertyName];
            }

        }
        
        NSDictionary* dict = [self classPropsFor:[klass superclass]];
        if (dict) {
            [results addEntriesFromDictionary:dict];
        }
    }
    
    free(properties);
    
    return results;
}

- (void)printPropertys
{
    NSDictionary *propertyList = [self classPropsFor:[self class]];
    
    NSMutableString *printString = [[NSMutableString alloc] init];
    for (NSString *key in [propertyList allKeys]) {
        NSString *value = [propertyList objectForKey:key];
        NSString *type = NSStringFromClass([[propertyList objectForKey:key] class]);
            NSString *propertyInfo = [NSString stringWithFormat:@"\n* %@ (%@) = %@", key, type, value];
        [printString appendFormat:@"%@",propertyInfo];
    }
    
    NSLog(@"\n\n============== %@ <%p> ==============\n%@",self.class, self, printString);
}


static const char *getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T') {
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
    }
    return "@";
}

@end
