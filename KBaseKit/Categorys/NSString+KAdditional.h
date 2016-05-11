//
//  NSString+KAdditional.h
//  Pods
//
//  Created by Chans  on 2016. 5. 4..
//
//

#import <UIKit/UIKit.h>

@interface NSString (KAdditional)

#pragma mark -

- (BOOL)isEmpty;

- (BOOL)findText:(NSString *)text;


#pragma mark - Encoding

+ (NSString *)base64EncodeData:(NSData *)objData;
+ (NSData *)base64DecodeString:(NSString *)strBase64;

- (NSString *)base64Encoding;
- (NSString *)base64Decoding;

- (NSString *)urlEncoding;
- (NSString *)urlDecoding;


#pragma mark - Hash

- (NSString *)MD5;
- (NSString *)SHA1;
- (NSString *)SHA256;
- (NSString *)SHA512;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


@end
