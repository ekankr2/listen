# Listen Backend Development Plan

This plan follows Kent Beck's TDD methodology. Each item represents a test to be written (RED), implemented (GREEN), and refactored.

**Status Legend:**
- [ ] Not started
- [x] Completed
- [~] In progress

---

## Phase 1: MVP Core API & Infrastructure

### 1.1 Project Setup & Configuration

**Current Status:** Basic Elysia setup complete

- [x] Initialize Elysia project
- [x] Test: shouldLoadEnvironmentVariables
- [x] Test: shouldConnectToDatabaseOnStartup
- [x] Test: shouldHandleInvalidEnvironmentVariablesGracefully
- [x] Feature: Setup environment configuration
- [x] Feature: Database connection (PostgreSQL, Drizzle)
- [x] Feature: Logging infrastructure
- [x] Feature: Error handling middleware
- [x] Feature: Request validation middleware

### 1.2 User Authentication & Authorization (OAuth2 with Better Auth)

**Current Status:** OAuth2-only (Google, Kakao) using Better Auth

#### Better Auth Setup
- [ ] Feature: Install better-auth and @better-auth/cli
- [ ] Feature: Configure Better Auth with Drizzle database
- [ ] Feature: Setup Google OAuth provider credentials
- [ ] Feature: Setup Kakao OAuth provider credentials
- [ ] Feature: Mount Better Auth handler to Elysia app
- [ ] Feature: Configure auth client for frontend

#### OAuth2 Authentication
- [ ] Test: shouldAuthenticateWithGoogleOAuth
- [ ] Test: shouldAuthenticateWithKakaoOAuth
- [ ] Test: shouldCreateNewUserFromOAuthProfile
- [ ] Test: shouldReturnExistingUserForKnownOAuthAccount
- [ ] Test: shouldPreventDuplicateOAuthAccounts
- [ ] Test: shouldReturnSessionAfterOAuthSuccess
- [ ] Test: shouldUpdateLastLoginTimestamp
- [ ] Feature: Google OAuth sign-in via Better Auth
- [ ] Feature: Kakao OAuth sign-in via Better Auth
- [ ] Feature: User creation from OAuth profile
- [ ] Feature: Session management via Better Auth

#### Token Management
- [ ] Test: shouldRefreshAccessTokenWithValidRefreshToken
- [ ] Test: shouldRejectExpiredRefreshToken
- [ ] Test: shouldRejectInvalidRefreshToken
- [ ] Test: shouldInvalidateOldRefreshToken
- [ ] Test: shouldProtectEndpointsWithAuthMiddleware
- [ ] Test: shouldExtractUserIdFromAccessToken
- [ ] Feature: POST /api/auth/refresh endpoint
- [ ] Feature: JWT verification middleware
- [ ] Feature: Token expiration handling
- [ ] Feature: Refresh token rotation

#### Logout
- [ ] Test: shouldInvalidateRefreshTokenOnLogout
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: POST /api/auth/logout endpoint
- [ ] Feature: Token blacklist/revocation

### 1.3 User Profile Management

**Current Status:** Not implemented

- [ ] Test: shouldGetUserProfileById
- [ ] Test: shouldReturn404ForNonexistentUser
- [ ] Test: shouldUpdateUserFirstName
- [ ] Test: shouldUploadUserAvatar
- [ ] Test: shouldRecordVoiceBio
- [ ] Test: shouldRejectVoiceBioOver30Seconds
- [ ] Test: shouldDeleteUserAccount
- [ ] Test: shouldCascadeDeleteUserDataOnAccountDeletion
- [ ] Test: shouldRequireAuthenticationForProfileUpdate
- [ ] Test: shouldOnlyAllowUserToUpdateOwnProfile
- [ ] Feature: GET /api/users/:id endpoint
- [ ] Feature: PATCH /api/users/:id endpoint
- [ ] Feature: DELETE /api/users/:id endpoint
- [ ] Feature: Avatar upload to cloud storage
- [ ] Feature: Voice bio upload and storage

### 1.4 Voice Message Storage & Management

**Current Status:** Not implemented

#### Audio Upload
- [ ] Test: shouldUploadAudioFileToCloudStorage
- [ ] Test: shouldValidateAudioFormat (AAC-LC m4a)
- [ ] Test: shouldRejectUnsupportedFormats
- [ ] Test: shouldCalculateAudioDuration
- [ ] Test: shouldGenerateUniqueFileKey
- [ ] Test: shouldReturnSignedUrlForDownload
- [ ] Feature: Setup cloud storage (S3/GCS/R2)
- [ ] Feature: Audio file validation
- [ ] Feature: Audio metadata extraction
- [ ] Feature: CDN integration for fast delivery

#### Audio Retrieval
- [ ] Test: shouldGenerateSignedDownloadUrl
- [ ] Test: shouldSetAppropriateExpiryTime
- [ ] Test: shouldHandleMissingAudioFile
- [ ] Feature: GET /api/audio/:key endpoint
- [ ] Feature: Signed URL generation
- [ ] Feature: Cache headers configuration

### 1.5 Story (Voice Message) Creation & Release

**Current Status:** Not implemented

- [ ] Test: shouldCreateStoryWithValidAudio
- [ ] Test: shouldEnforceDurationBetween15And90Seconds
- [ ] Test: shouldRejectDurationUnder15Seconds
- [ ] Test: shouldRejectDurationOver90Seconds
- [ ] Test: shouldStoreOptionalTopicTag
- [ ] Test: shouldSetCreatedTimestamp
- [ ] Test: shouldAssociateStoryWithUser
- [ ] Test: shouldCalculateAndStoreDuration
- [ ] Test: shouldReturnCreatedStoryWithId
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: POST /api/stories endpoint
- [ ] Feature: Story model (id, userId, audioUrl, duration, topicTag, createdAt)
- [ ] Feature: Audio duration validation
- [ ] Feature: Topic tag validation

### 1.6 Random Story Discovery (Home Feed)

**Current Status:** Not implemented

- [ ] Test: shouldReturnRandomStoryFromPool
- [ ] Test: shouldExcludeUserOwnStories
- [ ] Test: shouldExcludeStoriesFromBlockedUsers
- [ ] Test: shouldIncludeUserFirstNameOnly
- [ ] Test: shouldIncludeAudioUrl
- [ ] Test: shouldIncludeDurationAndTimestamp
- [ ] Test: shouldReturn404WhenPoolIsEmpty
- [ ] Test: shouldNotRepeatRecentlySeenStories (within session)
- [ ] Test: shouldWeighNewerStoriesHigher (optional)
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: GET /api/stories/random endpoint
- [ ] Feature: Random selection algorithm
- [ ] Feature: User exclusion logic
- [ ] Feature: Blocked user filtering
- [ ] Feature: "Recently seen" tracking (cache/session)

### 1.7 Chat Creation (Reply to Message)

**Current Status:** Not implemented

- [ ] Test: shouldCreateChatBetweenTwoUsers
- [ ] Test: shouldIncludeOriginalStoryReference
- [ ] Test: shouldPreventDuplicateChatsBetweenSameUsers
- [ ] Test: shouldCreateInitialReplyMessage
- [ ] Test: shouldReturnChatIdAndDetails
- [ ] Test: shouldRequireAuthentication
- [ ] Test: shouldValidateBothUsersExist
- [ ] Feature: POST /api/chats endpoint
- [ ] Feature: Chat model (id, user1Id, user2Id, originalStoryId, createdAt)
- [ ] Feature: Duplicate chat prevention logic
- [ ] Feature: Initial message creation

### 1.8 Chat Room - Voice Message Exchange

**Current Status:** Not implemented

#### Send Message
- [ ] Test: shouldSendVoiceMessageInChat
- [ ] Test: shouldValidateUserIsParticipant
- [ ] Test: shouldAssociateMessageWithChatAndSender
- [ ] Test: shouldStoreAudioUrl
- [ ] Test: shouldCalculateDuration
- [ ] Test: shouldReturnMessageWithId
- [ ] Test: shouldUpdateChatLastMessageTimestamp
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: POST /api/chats/:chatId/messages endpoint
- [ ] Feature: Message model (id, chatId, senderId, audioUrl, duration, createdAt)
- [ ] Feature: Participant validation
- [ ] Feature: Audio storage integration

#### Retrieve Messages
- [ ] Test: shouldGetAllMessagesInChat
- [ ] Test: shouldValidateUserIsParticipant
- [ ] Test: shouldReturnMessagesInChronologicalOrder
- [ ] Test: shouldIncludeSenderInfo
- [ ] Test: shouldPaginateResults
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: GET /api/chats/:chatId/messages endpoint
- [ ] Feature: Pagination support (cursor-based)
- [ ] Feature: Message sorting

#### Get Chat Details
- [ ] Test: shouldGetChatById
- [ ] Test: shouldValidateUserIsParticipant
- [ ] Test: shouldIncludeOtherParticipantInfo
- [ ] Test: shouldIncludeLastMessageInfo
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: GET /api/chats/:chatId endpoint
- [ ] Feature: Participant details serialization

### 1.9 Active Chats List

**Current Status:** Not implemented

- [ ] Test: shouldListAllChatsForUser
- [ ] Test: shouldOrderByMostRecentMessageFirst
- [ ] Test: shouldIncludeOtherParticipantInfo
- [ ] Test: shouldIncludeLastMessagePreview
- [ ] Test: shouldIncludeUnreadCount
- [ ] Test: shouldPaginateResults
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: GET /api/chats endpoint
- [ ] Feature: Unread message counting
- [ ] Feature: Last message aggregation
- [ ] Feature: Pagination support

### 1.10 Close/Delete Chat

**Current Status:** Not implemented

- [ ] Test: shouldDeleteChatById
- [ ] Test: shouldValidateUserIsParticipant
- [ ] Test: shouldCascadeDeleteMessages
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: DELETE /api/chats/:chatId endpoint
- [ ] Feature: Cascade deletion logic

---

## Phase 2: Safety & Moderation

### 2.1 Blocking System

**Current Status:** Not implemented

#### Block User
- [ ] Test: shouldBlockUserById
- [ ] Test: shouldPreventBlockingSelf
- [ ] Test: shouldStoreBlockRelationship
- [ ] Test: shouldReturnSuccessConfirmation
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: POST /api/users/block endpoint
- [ ] Feature: Block model (blockerId, blockedId, createdAt)

#### Unblock User
- [ ] Test: shouldUnblockUserById
- [ ] Test: shouldRemoveBlockRelationship
- [ ] Test: shouldReturn404IfNotBlocked
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: DELETE /api/users/block/:userId endpoint

#### Get Blocked Users
- [ ] Test: shouldListAllBlockedUsers
- [ ] Test: shouldIncludeUserDetails
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: GET /api/users/blocked endpoint

#### Apply Block Filters
- [ ] Test: shouldExcludeBlockedUsersFromDiscovery
- [ ] Test: shouldExcludeBlockersFromDiscovery
- [ ] Test: shouldPreventChatCreationWithBlockedUser
- [ ] Test: shouldPreventMessagesFromBlockedUser
- [ ] Feature: Block filtering in story discovery
- [ ] Feature: Block validation in chat creation
- [ ] Feature: Block enforcement in messaging

### 2.2 Reporting System

**Current Status:** Not implemented

#### Report Content
- [ ] Test: shouldReportStory
- [ ] Test: shouldReportMessage
- [ ] Test: shouldReportUser
- [ ] Test: shouldStoreReportReason
- [ ] Test: shouldPreventDuplicateReports
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: POST /api/reports endpoint
- [ ] Feature: Report model (reporterId, reportedType, reportedId, reason, status, createdAt)
- [ ] Feature: Report reason validation

#### Review Reports (Admin)
- [ ] Test: shouldListAllPendingReports
- [ ] Test: shouldFilterReportsByType
- [ ] Test: shouldIncludeReportedContentDetails
- [ ] Test: shouldRequireAdminAuthentication
- [ ] Feature: GET /api/admin/reports endpoint
- [ ] Feature: Admin authentication middleware
- [ ] Feature: Report filtering and sorting

#### Resolve Report (Admin)
- [ ] Test: shouldUpdateReportStatus
- [ ] Test: shouldAllowStatusChangeToPending/Resolved/Dismissed
- [ ] Test: shouldRequireAdminAuthentication
- [ ] Feature: PATCH /api/admin/reports/:id endpoint
- [ ] Feature: Status transition validation

### 2.3 Content Moderation

**Current Status:** Not implemented

#### Flag Content (Admin)
- [ ] Test: shouldFlagStoryAsInappropriate
- [ ] Test: shouldFlagMessageAsInappropriate
- [ ] Test: shouldRemoveFromDiscovery
- [ ] Test: shouldRequireAdminAuthentication
- [ ] Feature: POST /api/admin/moderate endpoint
- [ ] Feature: Content status field (active, flagged, removed)

#### User Suspension (Admin)
- [ ] Test: shouldSuspendUser
- [ ] Test: shouldSetSuspensionDuration
- [ ] Test: shouldPreventSuspendedUserLogin
- [ ] Test: shouldRemoveAllUserStoriesFromPool
- [ ] Test: shouldRequireAdminAuthentication
- [ ] Feature: POST /api/admin/users/:id/suspend endpoint
- [ ] Feature: User status field (active, suspended, banned)
- [ ] Feature: Suspension enforcement in auth

#### Ban User (Admin)
- [ ] Test: shouldBanUserPermanently
- [ ] Test: shouldInvalidateAllTokens
- [ ] Test: shouldRemoveAllContent
- [ ] Test: shouldRequireAdminAuthentication
- [ ] Feature: POST /api/admin/users/:id/ban endpoint
- [ ] Feature: Permanent ban logic

---

## Phase 3: Real-Time Features & Notifications

### 3.1 Push Notification Infrastructure

**Current Status:** Not implemented

#### Device Token Management
- [ ] Test: shouldRegisterDeviceToken
- [ ] Test: shouldAssociateTokenWithUser
- [ ] Test: shouldUpdateExistingToken
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: POST /api/notifications/register endpoint
- [ ] Feature: DeviceToken model (userId, token, platform, createdAt)

#### Remove Device Token
- [ ] Test: shouldUnregisterDeviceToken
- [ ] Test: shouldRequireAuthentication
- [ ] Feature: DELETE /api/notifications/register endpoint

### 3.2 Push Notification Sending

**Current Status:** Not implemented

- [ ] Test: shouldSendNotificationOnNewMessage
- [ ] Test: shouldSendNotificationOnNewChat
- [ ] Test: shouldRespectUserNotificationPreferences
- [ ] Test: shouldHandleInvalidTokenGracefully
- [ ] Test: shouldRetryFailedNotifications
- [ ] Feature: Firebase Cloud Messaging integration
- [ ] Feature: APNs integration (iOS)
- [ ] Feature: Notification preferences model
- [ ] Feature: Background job for notification delivery

### 3.3 Real-Time Updates (Optional)

**Current Status:** Not implemented

- [ ] Test: shouldEstablishWebSocketConnection
- [ ] Test: shouldAuthenticateWebSocketConnection
- [ ] Test: shouldSendNewMessageEventToRecipient
- [ ] Test: shouldSendTypingIndicatorEvent
- [ ] Test: shouldHandleDisconnectionGracefully
- [ ] Feature: WebSocket support in Elysia
- [ ] Feature: Real-time message delivery
- [ ] Feature: Typing indicators

---

## Phase 4: Advanced Discovery & Filtering

### 4.1 Topic Tags

**Current Status:** Not implemented

- [ ] Test: shouldAcceptValidTopicTag
- [ ] Test: shouldRejectInvalidTopicTag
- [ ] Test: shouldStoreTagWithStory
- [ ] Test: shouldReturnTagInStoryResponse
- [ ] Feature: Topic tag enum/validation
- [ ] Feature: Tag storage in Story model

### 4.2 Topic-Based Filtering

**Current Status:** Not implemented

- [ ] Test: shouldFilterStoriesByTopicTag
- [ ] Test: shouldReturnRandomStoryFromFilteredPool
- [ ] Test: shouldFallbackToAllStoriesIfNoMatches
- [ ] Feature: GET /api/stories/random?topic=:tag endpoint
- [ ] Feature: Topic filtering logic

### 4.3 Location-Based Discovery (Future)

**Current Status:** Not planned for MVP

- [ ] Test: shouldStoreOptionalUserLocation
- [ ] Test: shouldFilterStoriesByProximity
- [ ] Test: shouldRespectPrivacySettings
- [ ] Feature: Location storage (encrypted)
- [ ] Feature: Proximity calculation
- [ ] Feature: Location-based discovery toggle

---

## Phase 5: Data & Analytics

### 5.1 User Activity Tracking

**Current Status:** Not implemented

- [ ] Test: shouldTrackUserLogin
- [ ] Test: shouldTrackStoryCreation
- [ ] Test: shouldTrackMessageSent
- [ ] Test: shouldTrackChatCreation
- [ ] Test: shouldStoreTimestampsOnly (privacy-focused)
- [ ] Feature: Analytics event model
- [ ] Feature: Activity logging service

### 5.2 Metrics & Reporting

**Current Status:** Not implemented

- [ ] Test: shouldCalculateDailyActiveUsers
- [ ] Test: shouldCalculateReplyRate
- [ ] Test: shouldCalculateAverageChatDuration
- [ ] Test: shouldCalculateRetentionRate
- [ ] Feature: GET /api/admin/metrics endpoint
- [ ] Feature: Metrics calculation service
- [ ] Feature: Scheduled metrics aggregation

---

## Phase 6: Performance & Optimization

### 6.1 Caching Strategy

**Current Status:** Not implemented

- [ ] Test: shouldCacheFrequentlyAccessedData
- [ ] Test: shouldInvalidateCacheOnUpdate
- [ ] Test: shouldSetAppropriateExpiryTimes
- [ ] Feature: Redis integration
- [ ] Feature: Cache middleware
- [ ] Feature: Cache invalidation logic

### 6.2 Database Optimization

**Current Status:** Not implemented

- [ ] Test: shouldUseIndexesForFrequentQueries
- [ ] Test: shouldOptimizeRandomStoryQuery
- [ ] Test: shouldEfficientlyCountUnreadMessages
- [ ] Feature: Database indexes
- [ ] Feature: Query optimization
- [ ] Feature: Connection pooling

### 6.3 Audio Delivery Optimization

**Current Status:** Not implemented

- [ ] Test: shouldServeAudioFromCDN
- [ ] Test: shouldSupportRangeRequests (streaming)
- [ ] Test: shouldCompress Audio Files
- [ ] Feature: CDN configuration
- [ ] Feature: Audio compression pipeline
- [ ] Feature: Progressive audio loading

---

## Phase 7: Testing Infrastructure

### 7.1 Unit Tests - Services

**Current Status:** No tests exist

- [ ] Test: AuthService - all methods
- [ ] Test: UserService - all methods
- [ ] Test: StoryService - all methods
- [ ] Test: ChatService - all methods
- [ ] Test: MessageService - all methods
- [ ] Test: BlockService - all methods
- [ ] Test: ReportService - all methods
- [ ] Test: NotificationService - all methods
- [ ] Target: 80%+ code coverage for services

### 7.2 Unit Tests - Models

**Current Status:** No tests exist

- [ ] Test: User model - validation
- [ ] Test: Story model - validation
- [ ] Test: Chat model - validation
- [ ] Test: Message model - validation
- [ ] Test: Block model - validation
- [ ] Test: Report model - validation
- [ ] Target: 100% code coverage for models

### 7.3 Integration Tests - API Endpoints

**Current Status:** No tests exist

- [ ] Test: Auth endpoints - full flow
- [ ] Test: User endpoints - full flow
- [ ] Test: Story endpoints - full flow
- [ ] Test: Chat endpoints - full flow
- [ ] Test: Blocking endpoints - full flow
- [ ] Test: Reporting endpoints - full flow
- [ ] Target: All endpoints covered

### 7.4 Integration Tests - Database

**Current Status:** No tests exist

- [ ] Test: User CRUD operations
- [ ] Test: Story CRUD operations
- [ ] Test: Chat CRUD operations
- [ ] Test: Message CRUD operations
- [ ] Test: Block relationship operations
- [ ] Test: Report operations
- [ ] Test: Transaction handling

### 7.5 End-to-End Tests

**Current Status:** No tests exist

- [ ] Test: Complete user flow - register, create story, discover
- [ ] Test: Complete user flow - reply to story, exchange messages
- [ ] Test: Authentication flow - login, refresh, logout
- [ ] Test: Blocking flow - block user, verify exclusion
- [ ] Test: Reporting flow - report content, admin resolution

---

## Phase 8: DevOps & Deployment

### 8.1 Environment Configuration

**Current Status:** Basic .env file

- [ ] Test: shouldLoadDevelopmentConfig
- [ ] Test: shouldLoadProductionConfig
- [ ] Test: shouldValidateRequiredEnvVars
- [ ] Feature: Development environment setup
- [ ] Feature: Staging environment setup
- [ ] Feature: Production environment setup
- [ ] Feature: Environment variable validation

### 8.2 Database Migrations

**Current Status:** Not implemented

- [ ] Feature: Migration framework setup
- [ ] Feature: User table migration
- [ ] Feature: Story table migration
- [ ] Feature: Chat table migration
- [ ] Feature: Message table migration
- [ ] Feature: Block table migration
- [ ] Feature: Report table migration
- [ ] Feature: DeviceToken table migration

### 8.3 Deployment Pipeline

**Current Status:** Not implemented

- [ ] Feature: Docker containerization
- [ ] Feature: CI/CD pipeline (GitHub Actions)
- [ ] Feature: Automated testing in CI
- [ ] Feature: Automated deployment to staging
- [ ] Feature: Manual deployment to production
- [ ] Feature: Health check endpoint
- [ ] Feature: Monitoring and alerting

### 8.4 Documentation

**Current Status:** Minimal

- [ ] Feature: API documentation (OpenAPI/Swagger)
- [ ] Feature: Setup instructions (README)
- [ ] Feature: Environment variables documentation
- [ ] Feature: Deployment guide
- [ ] Feature: Architecture documentation

---

## Current Priority Order

**Immediate (This Sprint):**
1. Project setup & configuration (1.1)
2. User authentication & authorization (1.2)
3. User profile management (1.3)
4. Voice message storage (1.4)
5. Story creation & release (1.5)

**Next Sprint:**
1. Random story discovery (1.6)
2. Chat creation (1.7)
3. Chat room messaging (1.8)
4. Active chats list (1.9)
5. Close/delete chat (1.10)

**Following Sprints:**
1. Blocking system (2.1)
2. Reporting system (2.2)
3. Push notifications (3.1, 3.2)
4. Testing infrastructure (7.1, 7.2, 7.3)

---

## Database Schema Overview

### Users (OAuth2-only)
```sql
id: UUID (PK)
email: STRING (unique, not null)
username: STRING (unique, not null)
first_name: STRING
avatar_url: STRING
voice_bio_url: STRING
oauth_provider: ENUM (google, kakao, not null)
oauth_provider_id: STRING (not null)
status: ENUM (active, suspended, banned)
created_at: TIMESTAMP
updated_at: TIMESTAMP
last_login_at: TIMESTAMP
UNIQUE (oauth_provider, oauth_provider_id)
```

### Stories
```sql
id: UUID (PK)
user_id: UUID (FK -> Users)
audio_url: STRING (not null)
duration: INTEGER (seconds)
topic_tag: STRING
status: ENUM (active, flagged, removed)
created_at: TIMESTAMP
```

### Chats
```sql
id: UUID (PK)
user1_id: UUID (FK -> Users)
user2_id: UUID (FK -> Users)
original_story_id: UUID (FK -> Stories, nullable)
last_message_at: TIMESTAMP
created_at: TIMESTAMP
```

### Messages
```sql
id: UUID (PK)
chat_id: UUID (FK -> Chats)
sender_id: UUID (FK -> Users)
audio_url: STRING (not null)
duration: INTEGER (seconds)
is_read: BOOLEAN
created_at: TIMESTAMP
```

### Blocks
```sql
id: UUID (PK)
blocker_id: UUID (FK -> Users)
blocked_id: UUID (FK -> Users)
created_at: TIMESTAMP
UNIQUE (blocker_id, blocked_id)
```

### Reports
```sql
id: UUID (PK)
reporter_id: UUID (FK -> Users)
reported_type: ENUM (story, message, user)
reported_id: UUID
reason: STRING
status: ENUM (pending, resolved, dismissed)
created_at: TIMESTAMP
resolved_at: TIMESTAMP
```

### DeviceTokens
```sql
id: UUID (PK)
user_id: UUID (FK -> Users)
token: STRING (not null)
platform: ENUM (ios, android, web)
created_at: TIMESTAMP
updated_at: TIMESTAMP
```

### RefreshTokens
```sql
id: UUID (PK)
user_id: UUID (FK -> Users)
token: STRING (not null, unique)
expires_at: TIMESTAMP
created_at: TIMESTAMP
```

---

## Tech Stack

**Framework:** Elysia (Bun runtime)
**Database:** PostgreSQL
**ORM:** Drizzle
**Authentication:** Better Auth (OAuth2: Google, Kakao)
**Cloud Storage:** AWS S3 / Cloudflare R2 / Google Cloud Storage
**CDN:** CloudFront / Cloudflare
**Caching:** Redis
**Push Notifications:** Firebase Cloud Messaging + APNs
**Real-time:** WebSocket (Elysia WS plugin)
**Testing:** Bun test
**Deployment:** Docker + Cloud Run / Railway / Fly.io

---

## Notes

- Use `/go` to start implementing the next unmarked test
- Follow RED → GREEN → REFACTOR cycle for each test
- Keep commits small and focused
- Separate structural ([STRUCTURAL]) from behavioral ([BEHAVIORAL]) commits
- Run all tests before committing
- Update this plan as requirements evolve
- Prioritize security (auth, validation, sanitization)
- Optimize for audio delivery performance
- Design for scalability from day one

**Last Updated:** 2025-11-13
**Current Phase:** Phase 1 - MVP Core API & Infrastructure