//
//  KCommon.m
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "KCommon.h"
#import "KDefinition.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@interface KCommon ()

@end

#define KFIRST_LUNCH_FINISHED_KEY   @"KFirst_Lunch_Finished_Key"
#define KDEBUG_MODE_KEY             @"KDebug_Mode_Key"

@implementation KCommon

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([[NSUserDefaults standardUserDefaults] boolForKey:KFIRST_LUNCH_FINISHED_KEY] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:KDEBUG_MODE_KEY];

            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:KFIRST_LUNCH_FINISHED_KEY];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    return self;
}

+ (instancetype)shared{
    return [super shared];
}


+ (BOOL)isDebugMode
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:KDEBUG_MODE_KEY];
}

+ (void)setDebugMode:(BOOL)debugMode
{
    [[NSUserDefaults standardUserDefaults] setBool:debugMode forKey:KDEBUG_MODE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - INFOMATION

#define CO_LOG_GUBUN @"******************************************************************************"

+ (void)appicationInfomation
{
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [NSString stringWithFormat:@"%@ %@",systemName, [KCommon systemVersion]];
    
    NSString *screenWidth = [NSString stringWithFormat:@"%.f pixel", [[UIScreen mainScreen] bounds].size.width];
    NSString *screenHeight = [NSString stringWithFormat:@"%.f pixel", [[UIScreen mainScreen] bounds].size.height];
    NSString *statusBarHeight = [NSString stringWithFormat:@"%.f pixel",[[UIApplication sharedApplication] statusBarFrame].size.height];

    [KCommon beautifulLog:@"" value:CO_LOG_GUBUN];
    [KCommon beautifulLog:@"" value:@""];
    [KCommon beautifulLog:@"Application DisplayName" value:[KCommon displayName]];
    [KCommon beautifulLog:@"Application Identifier" value:[KCommon identifier]];
    [KCommon beautifulLog:@"Application Version" value:[KCommon versionNumber]];
    [KCommon beautifulLog:@"Application Build" value:[KCommon buildNumber]];
    [KCommon beautifulLog:@"" value:@""];
    [KCommon beautifulLog:@"Platform" value:[KCommon platform]];
    [KCommon beautifulLog:@"Device Model" value:[UIDevice currentDevice].model];
    [KCommon beautifulLog:@"System Version" value:systemVersion];
    [KCommon beautifulLog:@"" value:@""];
    [KCommon beautifulLog:@"Screen Width" value:screenWidth];
    [KCommon beautifulLog:@"Screen Height" value:screenHeight];
    [KCommon beautifulLog:@"StatusBar Height" value:statusBarHeight];
    [KCommon beautifulLog:@"" value:@""];
    
#if DEBUG
    [KCommon beautifulLog:@"DEBUG" value:@"YES"];
#else
    [KCommon beautifulLog:@"DEBUG" value:@"NO"];
#endif
    
    
    [KCommon beautifulLog:@"DEV MODE" value:[KCommon isDebugMode] ? @"YES" : @"NO"];
    
    [KCommon beautifulLog:@"" value:@""];

    /* 스토리보드 관련 로그 작업 중.
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSArray * resourceContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:resourcePath error:nil];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSLog(@"%@",[bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"]);

    int storyBoardCount = 1;
    for (NSString *path in resourceContents) {
        if ([path rangeOfString:@".storyboard"].length > 0) {
            NSString *logName = [NSString stringWithFormat:@"StoryBoard %d",storyBoardCount];
            [KCommon beautifulLog:logName value:path];
            storyBoardCount++;
        }
    }
     */
    
    [KCommon beautifulLog:@"" value:@""];


    [KCommon beautifulLog:@"" value:[NSString stringWithFormat:@"%@\n\n",CO_LOG_GUBUN]];
    
    

}

+ (void)beautifulLog:(NSString *)name value:(NSString *)value
{
    NSString *gubun = CO_LOG_GUBUN;
    NSInteger gubunLenth = gubun.length;
    if ([value rangeOfString:CO_LOG_GUBUN].location == 0) {
        SYSLog(@"%@",value);
    }
    else
    {
        NSMutableString *str = [NSMutableString stringWithFormat:@"* %@",name];
        NSInteger space = gubunLenth - (str.length + value.length + 2);
        for (int i = 0; i < space; i++) {
            [str appendFormat:@" "];
        }
        [str appendString:value];
        [str appendString:@" *"];
        
        SYSLog(@"%@",str);
    }
}

+ (NSString *)platform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+ (NSString *)displayName
{
    NSString *displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    if (displayName == nil || [displayName length] == 0) {
        displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
    }
    
    return displayName;
}

+ (NSString *)identifier
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)versionNumber
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

+ (NSString *)buildNumber
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}

+ (NSString *)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark - UTIL

/*! Path */

+ (NSString *)documentAppendPath:(NSString *)path
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [documentPath stringByAppendingPathComponent:path];
}

+ (NSString *)cachesAppendPath:(NSString *)path
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [cachesPath stringByAppendingPathComponent:path];
}

/*! 웹 및 HTTP 통신 관리 */

+ (void)httpShareCookie:(BOOL)isShare
{
    NSHTTPCookieAcceptPolicy policy = NSHTTPCookieAcceptPolicyAlways;
    if (isShare == NO) {
        policy = NSHTTPCookieAcceptPolicyNever;
    }
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:policy];
}

+ (void)httpPrintCookie
{
    NSLog(@"cookieName : %@",[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]);
}

+ (void)httpDeleteCache
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

+ (void)httpDeleteCookie
{
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}

+ (NSDictionary*)urlParamParsing:(NSString*)url
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSString *param = nil;
    NSArray *array = [url componentsSeparatedByString:@"?"];
    
    if([array count] == 0)
        return nil;
    else if([array count] == 1)
        param = [array objectAtIndex:0];
    else
        param = [array objectAtIndex:1];
    
    NSMutableArray *parsingArray = [[NSMutableArray alloc] init];
    NSArray *subArray = [param componentsSeparatedByString:@"&"];
    if([subArray count] <= 0)
        return nil;
    else if([subArray count] <= 1)
        [parsingArray addObject:[subArray objectAtIndex:0]];
    else
        [parsingArray addObjectsFromArray:subArray];
    
    for(NSString *parsingStr in parsingArray)
    {
        NSArray *_subArray = [parsingStr componentsSeparatedByString:@"="];
        if([_subArray count] <= 1)
            continue;
        [dict setObject:[_subArray objectAtIndex:1] forKey:[_subArray objectAtIndex:0]];
    }
    return dict;
}

+ (NSString *)urlParamMerge:(NSString *)url param:(NSDictionary *)param
{
    NSMutableString *returnUrl = [[NSMutableString alloc] initWithString:url];
    
    NSArray *allKeys = [param allKeys];
    
    if (allKeys.count > 0)
    {
        [returnUrl appendString:@"?"];
        for (NSString *key in allKeys)
        {
            NSString *appendString = [NSString stringWithFormat:@"%@=%@",key,[param objectForKey:key]];
            [returnUrl appendString:appendString];
            if (key != [allKeys lastObject]) {
                [returnUrl appendString:@"&"];
            }
        }
    }
    return returnUrl;
}

/*! Encoding */

+ (NSString *)urlEncoding:(NSString *)value
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_9_0
    /*!
     URLFragmentAllowedCharacterSet  "#%<>[\]^`{|}
     URLHostAllowedCharacterSet      "#%/<>?@\^`{|}
     URLPasswordAllowedCharacterSet  "#%/:<>?@[\]^`{|}
     URLPathAllowedCharacterSet      "#%;<>?[\]^`{|}
     URLQueryAllowedCharacterSet     "#%<>[\]^`{|}
     URLUserAllowedCharacterSet      "#%/:<>?@[\]^`

     NSCharacterSet *customCharacterset = [[NSCharacterSet characterSetWithCharactersInString:@"your characters"] invertedSet];
     */
    
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"/%&=?$#+-~@<>|\\*,.()[]{}^! "] invertedSet];
    return [value stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
#else
    NSString * encodedString = (__bridge_transfer NSString *)
    CFURLCreateStringByAddingPercentEscapes(NULL,
                                            (CFStringRef)value,
                                            NULL,
                                            CFSTR("/%&=?$#+-~@<>|\\*,.()[]{}^!"),
                                            CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return encodedString;
#endif
    
}

+ (NSString *)urlDecoding:(NSString *)value
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_9_0
    return value.stringByRemovingPercentEncoding;
#else
    NSString *decodedString = (__bridge_transfer NSString *)
    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                            (__bridge CFStringRef)value,
                                                            CFSTR(""),
                                                            CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
#endif
    
}

/*! Json Parse..  */

+ (id)jsonParse:(NSData *)jsonData
{
    NSData *newJsonData = [KCommon dataByRemovingControlCharacters:jsonData];
    NSError *error = nil;
    
    id parseResult = [NSJSONSerialization JSONObjectWithData:newJsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&error];
    
    if (error) {
        return error;
    }
    else
    {
        return parseResult;
    }
}

+ (NSString *)stringByRemovingControlCharacters: (NSString *)inputString
{
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
    NSRange range = [inputString rangeOfCharacterFromSet:controlChars];
    if (range.location != NSNotFound) {
        NSMutableString *mutable = [NSMutableString stringWithString:inputString];
        while (range.location != NSNotFound) {
            [mutable deleteCharactersInRange:range];
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputString;
}

+ (NSData *)dataByRemovingControlCharacters: (NSData *)inputData
{
    NSString* inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    
    inputString = [KCommon stringByRemovingControlCharacters:inputString];
    
    return [inputString dataUsingEncoding:NSUTF8StringEncoding];
}


/*! Image */

+ (UIImage *)stretchImageWithName:(NSString *)aName leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight
{
    UIImage	*image_	= [UIImage imageNamed:aName];
    
    return [image_ stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}

+ (UIImage *)stretchImageWithName:(NSString *)aName
{
    UIImage	*image_	= [UIImage imageNamed:aName];
    
    return [image_ stretchableImageWithLeftCapWidth:image_.size.width/2.0f topCapHeight:image_.size.height/2.0f];
}

/*! 기타 */

+ (BOOL)findString:(NSString *)str find:(NSString *)_findStr
{
    if (!str) return NO;
    
    NSMutableString *mstr;
    mstr = [NSMutableString stringWithString:str];
    
    NSRange substr = [mstr rangeOfString:_findStr];
    if (substr.location != NSNotFound) {
        return YES;
    }
    
    return NO;
}


@end
