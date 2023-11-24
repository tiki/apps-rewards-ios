/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Foundation

public enum EmailEnum: String, CaseIterable {
    
    /// Represents the Gmail email provider.
    case GMAIL
    
    /// Represents the AOL email provider.
    case AOL
    
    /// Represents the Yahoo email provider.
    case YAHOO
    
    /// Represents the Outlook email provider.
    case OUTLOOK
    
    /// Represents no email provider.
    case NONE
    
    /// Represents a custom email provider
    case CUSTOM
    
}
