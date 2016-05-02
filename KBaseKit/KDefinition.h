//
//  KDefinition.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

// by .. http://matt.coneybeare.me/my-favorite-macros-for-objective-c-development-in-xcode/


#define K_IsIPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define K_IsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define K_IsRetinaDevice ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] >= 2)
#define K_IsMultiTaskingSupported ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)] && [[UIDevice currentDevice] isMultitaskingSupported])

#define K_RunOnMainThread if (![NSThread isMainThread]) { dispatch_sync(dispatch_get_main_queue(), ^{ [self performSelector:_cmd]; }); return; };

#define K_AppDelegate ((UAAppDelegate *)[[UIApplication sharedApplication] delegate])

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 |
 |      LOG
 |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

///*! Default Log */
#ifndef NSLog
    #if DEBUG
        #define NSLog(...) do { fprintf(stdout, "\n %s[Line:%d] %s \n", __func__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]); } while (0)
    #else
        #define NSLog(...) do { fprintf(stdout, "\n %s[Line:%d] %s \n", __func__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]); } while (0)
    #endif
#endif

/*! SYSTEM Log */
#ifndef SYSLog
    #if DEBUG
        #define SYSLog(...) do { fprintf(stdout, "\n%s", [[NSString stringWithFormat:__VA_ARGS__] UTF8String]); } while (0)
    #else
        #define SYSLog(...) do { } while (0)
    #endif
#endif

/* Struct Log Macro */
#define NSLog_Bounds(view)  NSLog(@"%@ bounds: %@", view, NSStringFromRect([view bounds]))
#define NSLog_Frame(view)   NSLog(@"%@ frame: %@", view, NSStringFromRect([view frame]))
#define NSLog_Size(view)    NSLog(@"%@ frame: %@", view, NSStringFromCGSize([view frame].size))

#define NSStringFromBool(b) (b ? @"YES" : @"NO")

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 |
 |      Debug Alert
 |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

#define KAlert(MSG)     if(K_DEV_MODE) { [[[UIAlertView alloc] initWithTitle:@"DEUBG Alert" message:MSG delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil] show]; }



/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 |
 |      Color MACRO
 |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

#define K_RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define K_RGB(r,g,b)      K_RGBA(r,g,b,1.0)
#define K_HexColorAlpha(c,a)  [UIColor colorWithRed:((float)((c & 0xFF0000) >> 16))/255.0 \
                                                green:((float)((c & 0xFF00) >> 8))/255.0 \
                                                blue:((float)(c & 0xFF))/255.0 \
                                                alpha:a]
#define K_HexColor(c)     K_HexColorAlpha(c,1.0)


