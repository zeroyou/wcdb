/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <WCDB/Interface.h>

@implementation NSObject (ColumnCoding)

+ (instancetype)unarchiveWithWCTValue:(NSData *)value
{
    assert([self.class conformsToProtocol:@protocol(NSCoding)]);
    return value ? [NSKeyedUnarchiver unarchiveObjectWithData:value] : nil;
}

- (NSData *)archivedWCTValue
{
    //Class should conform to either [WCTColumnCoding] or [NSCoding] protocol or it may crash here.
    assert([self.class conformsToProtocol:@protocol(NSCoding)]);
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

+ (WCDB::ColumnType)columnTypeForWCDB
{
    return WCDB::ColumnType::BLOB;
}

@end