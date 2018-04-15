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
#import <WCDB/WCTCore+Private.h>

@implementation WCTDatabase (RepairKit)

- (BOOL)backupWithCipher:(NSData *)key
{
    return _database->backup(key.bytes, (unsigned int) key.length);
}

- (BOOL)backup
{
    return [self backupWithCipher:nil];
}

- (BOOL)recoverFromPath:(NSString *)corruptedDBPath
           withPageSize:(const int)pageSize
           backupCipher:(NSData *)backupCipher
         databaseCipher:(NSData *)databaseCipher
{
    return _database->recoverFromPath(corruptedDBPath.UTF8String,
                                      pageSize,
                                      backupCipher.bytes,
                                      (unsigned int) backupCipher.length,
                                      databaseCipher.bytes,
                                      (unsigned int) databaseCipher.length);
}

@end