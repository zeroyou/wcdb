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

@implementation WCTError

+ (instancetype)errorWithWCDBError:(const WCDB::Error *)error
{
    if (!error) {
        return nil;
    }
    size_t hash = error->getHashedTypeid();
    if (hash == typeid(WCDB::SQLiteError).hash_code()) {
        return [[WCTSQLiteError alloc] initWithWCDBError:error];
    } else if (hash == typeid(WCDB::HandleError).hash_code()) {
        return [[WCTHandleError alloc] initWithWCDBError:error];
    } else if (hash == typeid(WCDB::CoreError).hash_code()) {
        return [[WCTCoreError alloc] initWithWCDBError:error];
    } else if (hash == typeid(WCDB::FileError).hash_code()) {
        return [[WCTFileError alloc] initWithWCDBError:error];
    }
    assert(hash == typeid(WCDB::Error).hash_code());
    return [[WCTError alloc] initWithWCDBError:error];
}

- (instancetype)initWithWCDBError:(const WCDB::Error *)error
{
    assert(error != nullptr);
    if (self = [super initWithDomain:@"WCDB"
                                code:error->code
                            userInfo:nil]) {
        _message = @(error->message.c_str());
        _level = (WCTErrorLevel) error->level;
    }
    return self;
}

- (WCTErrorType)type
{
    return WCTErrorTypeError;
}

- (NSString *)description
{
    NSMutableString *desc = [[NSMutableString alloc] initWithUTF8String:WCDB::Error::LevelName((WCDB::Error::Level) _level)];
    [desc appendFormat:@"Code: %ld", (long) self.code];
    [desc appendFormat:@"Msg: %@", _message];
    return desc;
}

@end