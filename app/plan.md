# Listen App Development Plan

This plan follows Kent Beck's TDD methodology. Each item represents a test to be written (RED), implemented (GREEN), and refactored.

**Status Legend:**
- [ ] Not started
- [x] Completed
- [~] In progress

---

## Phase 1: MVP Core Features Completion

### 1.1 Home Feed - Random Discovery (Partially Complete)

**Current Status:** Basic implementation exists but missing key functionality

- [x] Load random voice message from API
- [x] Display voice message with basic info
- [x] Play/pause audio playback
- [x] Skip to next random message
- [x] Test: shouldLoadRandomMessageOnInitialization
- [ ] Test: shouldDisplayMessageMetadata (duration, timestamp, sender name)
- [ ] Test: shouldPlayAudioWhenPlayButtonTapped
- [ ] Test: shouldPauseAudioWhenPauseButtonTapped
- [ ] Test: shouldStopCurrentAndLoadNextOnSkip
- [ ] Test: shouldShowLoadingIndicatorWhileFetchingMessage
- [ ] Test: shouldShowErrorMessageWhenApiFails
- [ ] Test: shouldHandleEmptyMessagePool
- [ ] Feature: Display waveform visualization during playback
- [ ] Feature: Show playback position and duration
- [ ] Feature: Handle audio loading errors gracefully

### 1.2 Reply to Message - Start Chat from Home

**Current Status:** Not implemented

- [ ] Test: shouldShowReplyButtonOnHomeMessage
- [ ] Test: shouldCreateNewChatWhenReplyTapped
- [ ] Test: shouldNavigateToChatRoomAfterReply
- [ ] Test: shouldIncludeOriginalMessageInNewChat
- [ ] Feature: Add "Reply" button to home feed
- [ ] Feature: Call API to create chat session
- [ ] Feature: Navigate to chat room with new chat ID
- [ ] Feature: Show confirmation before starting chat

### 1.3 Story Creation - Record & Release

**Current Status:** Recording works, but release flow incomplete

- [x] Basic recording UI exists
- [x] Start/stop recording functionality
- [ ] Test: shouldRequestMicrophonePermissionOnFirstRecord
- [ ] Test: shouldShowRecordingIndicatorWhenRecording
- [ ] Test: shouldDisplayRecordingDurationInRealtime
- [ ] Test: shouldEnforceMinimumDuration15Seconds
- [ ] Test: shouldEnforceMaximumDuration90Seconds
- [ ] Test: shouldStopRecordingAtMaxDuration
- [ ] Test: shouldAllowPlaybackReviewBeforeRelease
- [ ] Test: shouldUploadAudioFileToBackend
- [ ] Test: shouldCreateStoryWithAudioUrl
- [ ] Test: shouldShowSuccessMessageAfterRelease
- [ ] Test: shouldReturnToHomeAfterSuccessfulRelease
- [ ] Test: shouldHandleUploadFailureGracefully
- [ ] Test: shouldAllowCancelDuringRecording
- [ ] Test: shouldDeleteLocalFileAfterSuccessfulUpload
- [ ] Feature: Calculate actual audio duration
- [ ] Feature: Add optional topic tags
- [ ] Feature: Implement review screen with play/re-record/release
- [ ] Feature: Upload audio to backend
- [ ] Feature: Show upload progress indicator
- [ ] Feature: Handle network errors during upload

### 1.4 Chat Room - Voice Conversation

**Current Status:** Basic structure exists, needs message exchange

- [x] Chat room UI exists
- [x] Load messages from API
- [ ] Test: shouldLoadChatMessagesOnOpen
- [ ] Test: shouldDisplayMessagesInChronologicalOrder
- [ ] Test: shouldShowSenderNameForEachMessage
- [ ] Test: shouldDifferentiateSentVsReceivedMessages
- [ ] Test: shouldShowRecordButtonForNewMessage
- [ ] Test: shouldRecordAndSendVoiceMessage
- [ ] Test: shouldUploadVoiceMessageToBackend
- [ ] Test: shouldAddNewMessageToListAfterSend
- [ ] Test: shouldPlayMessageWhenTapped
- [ ] Test: shouldShowPlaybackIndicatorForActiveMessage
- [ ] Test: shouldPauseOtherMessagesWhenPlayingOne
- [ ] Test: shouldShowMessageTimestamps
- [ ] Test: shouldShowDeliveryStatus (sending, sent, failed)
- [ ] Test: shouldRetryFailedMessageSend
- [ ] Test: shouldHandleEmptyChatGracefully
- [ ] Feature: Record voice message in chat
- [ ] Feature: Upload and send voice message
- [ ] Feature: Real-time message updates (polling or WebSocket)
- [ ] Feature: Message delivery indicators
- [ ] Feature: Scroll to latest message

### 1.5 Chats List - Active Conversations

**Current Status:** Basic list with mock data

- [x] Display list of chats
- [x] Show last message info
- [x] Show unread count
- [ ] Test: shouldLoadChatsFromApiOnInitialization
- [ ] Test: shouldDisplayChatsInMostRecentFirstOrder
- [ ] Test: shouldShowUnreadCountBadge
- [ ] Test: shouldHighlightChatsWithUnreadMessages
- [ ] Test: shouldNavigateToChatRoomWhenTapped
- [ ] Test: shouldRefreshChatsOnPullToRefresh
- [ ] Test: shouldShowEmptyStateWhenNoChats
- [ ] Test: shouldShowLoadingIndicatorWhileFetching
- [ ] Test: shouldHandleApiErrorGracefully
- [ ] Test: shouldShowLastMessagePreview
- [ ] Test: shouldShowParticipantAvatar
- [ ] Test: shouldAllowSwipeToDeleteChat
- [ ] Feature: Replace mock data with real API
- [ ] Feature: Implement pull-to-refresh
- [ ] Feature: Add swipe-to-delete functionality
- [ ] Feature: Show "No chats yet" empty state

---

## Phase 2: Authentication & User Management

### 2.1 Authentication Flow

**Current Status:** API endpoints exist, no UI

- [ ] Test: shouldShowLoginScreenForUnauthenticatedUser
- [ ] Test: shouldValidateEmailFormat
- [ ] Test: shouldValidatePasswordRequirements
- [ ] Test: shouldCallLoginApiWithCredentials
- [ ] Test: shouldStoreTokensOnSuccessfulLogin
- [ ] Test: shouldNavigateToHomeAfterLogin
- [ ] Test: shouldShowErrorMessageOnInvalidCredentials
- [ ] Test: shouldShowLoadingIndicatorDuringLogin
- [ ] Test: shouldHandleNetworkErrorsDuringLogin
- [ ] Test: shouldAllowNavigationToRegisterScreen
- [ ] Feature: Create login page UI
- [ ] Feature: Create register page UI
- [ ] Feature: Implement form validation
- [ ] Feature: Handle authentication errors
- [ ] Feature: Store tokens securely

### 2.2 Registration Flow

**Current Status:** API endpoint exists, no UI

- [ ] Test: shouldValidateAllRequiredFields
- [ ] Test: shouldEnforcePasswordStrength
- [ ] Test: shouldConfirmPasswordMatch
- [ ] Test: shouldCheckUsernameAvailability
- [ ] Test: shouldCallRegisterApiWithUserData
- [ ] Test: shouldCreateUserProfileOnSuccess
- [ ] Test: shouldAutoLoginAfterRegistration
- [ ] Test: shouldShowErrorForDuplicateEmail
- [ ] Feature: Create registration form
- [ ] Feature: Add password strength indicator
- [ ] Feature: Implement username uniqueness check
- [ ] Feature: Handle registration errors

### 2.3 User Profile

**Current Status:** API endpoints exist, no UI

- [ ] Test: shouldLoadUserProfileOnSettingsOpen
- [ ] Test: shouldDisplayUserName
- [ ] Test: shouldDisplayUserAvatar
- [ ] Test: shouldAllowEditingFirstName
- [ ] Test: shouldRecordVoiceBioUp30Seconds
- [ ] Test: shouldPlaybackVoiceBio
- [ ] Test: shouldUpdateProfileOnSave
- [ ] Test: shouldHandleUpdateFailure
- [ ] Feature: Create profile page UI
- [ ] Feature: Add avatar upload
- [ ] Feature: Implement voice bio recording
- [ ] Feature: Add profile editing

### 2.4 Token Management

**Current Status:** Basic token storage, refresh TODO

- [ ] Test: shouldStoreAccessTokenOnLogin
- [ ] Test: shouldStoreRefreshTokenOnLogin
- [ ] Test: shouldAddAuthHeaderToAllRequests
- [ ] Test: shouldDetect401Unauthorized
- [ ] Test: shouldAttemptTokenRefresh
- [ ] Test: shouldRetryFailedRequestAfterRefresh
- [ ] Test: shouldLogoutOnRefreshFailure
- [ ] Feature: Implement token refresh logic
- [ ] Feature: Handle token expiration
- [ ] Feature: Auto-retry failed requests

---

## Phase 3: Audio Features Enhancement

### 3.1 Audio Duration Management

**Current Status:** Hardcoded durations

- [ ] Test: shouldCalculateActualAudioDuration
- [ ] Test: shouldStoreCorrectDurationInDatabase
- [ ] Test: shouldDisplayCorrectDurationInUI
- [ ] Test: shouldUpdateDurationDuringPlayback
- [ ] Feature: Calculate duration from audio file
- [ ] Feature: Store duration with voice messages
- [ ] Feature: Display accurate duration in all UIs

### 3.2 Waveform Visualization

**Current Status:** Not implemented

- [ ] Test: shouldGenerateWaveformFromAudioFile
- [ ] Test: shouldDisplayWaveformDuringPlayback
- [ ] Test: shouldHighlightPlaybackPosition
- [ ] Test: shouldAllowSeekByTappingWaveform
- [ ] Test: shouldUpdateWaveformDuringRecording
- [ ] Feature: Add waveform library
- [ ] Feature: Generate waveform data
- [ ] Feature: Implement waveform UI component
- [ ] Feature: Add seek functionality

### 3.3 Audio Quality & Performance

**Current Status:** Basic implementation

- [ ] Test: shouldCachePlayedAudioFiles
- [ ] Test: shouldReusesCachedAudioWhenAvailable
- [ ] Test: shouldClearCacheWhenStorageLow
- [ ] Test: shouldCompressAudioBeforeUpload
- [ ] Test: shouldStreamAudioForLargeFiles
- [ ] Feature: Implement audio caching
- [ ] Feature: Add audio compression
- [ ] Feature: Progressive audio loading

---

## Phase 4: Error Handling & Loading States

### 4.1 Loading States

**Current Status:** Basic loading flags, no UI indicators

- [ ] Test: shouldShowLoadingIndicatorWhenFetchingMessages
- [ ] Test: shouldShowLoadingIndicatorWhenUploadingAudio
- [ ] Test: shouldShowLoadingIndicatorWhenSendingMessage
- [ ] Test: shouldHideLoadingWhenOperationCompletes
- [ ] Test: shouldShowSkeletonLoadersForLists
- [ ] Feature: Add loading indicators to all async operations
- [ ] Feature: Implement skeleton loaders
- [ ] Feature: Add progress bars for uploads

### 4.2 Error Handling UI

**Current Status:** Errors stored in state, not shown to users

- [ ] Test: shouldShowErrorDialogOnApiFailure
- [ ] Test: shouldShowToastForMinorErrors
- [ ] Test: shouldShowInlineErrorsForFormValidation
- [ ] Test: shouldProvideRetryOptionOnNetworkError
- [ ] Test: shouldShowSpecificErrorMessages (not generic)
- [ ] Test: shouldLogErrorsForDebugging
- [ ] Feature: Create error dialog component
- [ ] Feature: Create toast/snackbar component
- [ ] Feature: Add retry mechanisms
- [ ] Feature: Improve error messages

### 4.3 Empty States

**Current Status:** Some basic handling

- [ ] Test: shouldShowEmptyStateWhenNoChatHistory
- [ ] Test: shouldShowEmptyStateWhenNoMessagesInChat
- [ ] Test: shouldShowEmptyStateWhenNoStoriesInPool
- [ ] Test: shouldProvideActionButtonsInEmptyStates
- [ ] Feature: Design empty state components
- [ ] Feature: Add friendly empty state messages
- [ ] Feature: Add call-to-action buttons

---

## Phase 5: Topic Tags & Discovery

### 5.1 Topic Tags

**Current Status:** Not implemented

- [ ] Test: shouldDisplayTopicTagOptions
- [ ] Test: shouldAllowSelectingSingleTag
- [ ] Test: shouldStoreTagWithVoiceMessage
- [ ] Test: shouldDisplayTagOnMessageCard
- [ ] Test: shouldFilterByTagInHomeFeed (optional)
- [ ] Feature: Create topic tag list
- [ ] Feature: Add tag selection UI
- [ ] Feature: Store tags with messages
- [ ] Feature: Display tags in UI

### 5.2 Discovery Enhancements

**Current Status:** Pure random

- [ ] Test: shouldProvideOptionToFilterByTag
- [ ] Test: shouldProvideOptionForNearbyMessages (future)
- [ ] Test: shouldRespectUserPreferences
- [ ] Feature: Add optional tag filtering
- [ ] Feature: Save discovery preferences

---

## Phase 6: Settings & Preferences

### 6.1 Notification Settings

**Current Status:** Basic settings page exists

- [ ] Test: shouldLoadNotificationPreferences
- [ ] Test: shouldToggleNewMessageNotifications
- [ ] Test: shouldToggleNewChatNotifications
- [ ] Test: shouldSavePreferencesToStorage
- [ ] Test: shouldApplyPreferencesImmediately
- [ ] Feature: Add notification toggle switches
- [ ] Feature: Store preferences locally
- [ ] Feature: Implement notification logic

### 6.2 Privacy Settings

**Current Status:** Not implemented

- [ ] Test: shouldAllowHidingOnlineStatus
- [ ] Test: shouldAllowBlockingUsers
- [ ] Test: shouldAllowReportingUsers
- [ ] Feature: Add privacy controls
- [ ] Feature: Implement blocking
- [ ] Feature: Add reporting mechanism

### 6.3 Account Management

**Current Status:** Basic settings UI

- [ ] Test: shouldDisplayAccountInfo
- [ ] Test: shouldAllowLogout
- [ ] Test: shouldClearLocalDataOnLogout
- [ ] Test: shouldAllowAccountDeletion
- [ ] Test: shouldConfirmBeforeAccountDeletion
- [ ] Feature: Add logout functionality
- [ ] Feature: Add account deletion
- [ ] Feature: Clear app data on logout

---

## Phase 7: Safety & Moderation (PRD Phase 2)

### 7.1 Reporting System

**Current Status:** Not implemented

- [ ] Test: shouldShowReportButtonOnMessages
- [ ] Test: shouldShowReportReasonsDialog
- [ ] Test: shouldSubmitReportToBackend
- [ ] Test: shouldShowConfirmationAfterReport
- [ ] Test: shouldPreventMultipleReportsOnSameMessage
- [ ] Feature: Add report button to messages
- [ ] Feature: Create report dialog with reasons
- [ ] Feature: Implement report API
- [ ] Feature: Show confirmation feedback

### 7.2 Blocking Users

**Current Status:** Not implemented

- [ ] Test: shouldShowBlockOptionInChatMenu
- [ ] Test: shouldConfirmBeforeBlocking
- [ ] Test: shouldBlockUserInBackend
- [ ] Test: shouldRemoveChatAfterBlocking
- [ ] Test: shouldPreventMessagesFromBlockedUser
- [ ] Test: shouldShowBlockedUsersList
- [ ] Test: shouldAllowUnblocking
- [ ] Feature: Add block functionality to chat
- [ ] Feature: Maintain blocked users list
- [ ] Feature: Filter blocked users from discovery

### 7.3 Content Moderation

**Current Status:** Not implemented (backend responsibility)

- [ ] Feature: Handle moderation flags from backend
- [ ] Feature: Show warning for flagged content
- [ ] Feature: Remove access to banned content
- [ ] Feature: Display account suspension notices

---

## Phase 8: Push Notifications (PRD Phase 2)

### 8.1 Firebase Setup

**Current Status:** Not implemented

- [ ] Task: Add Firebase to project
- [ ] Task: Configure iOS push certificates
- [ ] Task: Configure Android push setup
- [ ] Test: shouldRegisterDeviceTokenOnLogin
- [ ] Test: shouldSendTokenToBackend
- [ ] Test: shouldUpdateTokenOnRefresh
- [ ] Feature: Initialize Firebase
- [ ] Feature: Register for push notifications
- [ ] Feature: Handle token updates

### 8.2 Notification Handling

**Current Status:** Not implemented

- [ ] Test: shouldReceiveNotificationWhenAppClosed
- [ ] Test: shouldReceiveNotificationWhenAppBackgrounded
- [ ] Test: shouldShowLocalNotification
- [ ] Test: shouldNavigateToCorrectScreenOnTap
- [ ] Test: shouldUpdateUnreadCountOnReceive
- [ ] Feature: Handle incoming notifications
- [ ] Feature: Display notification UI
- [ ] Feature: Handle notification taps

---

## Phase 9: Testing Infrastructure

### 9.1 Unit Tests - Providers

**Current Status:** No tests exist

- [ ] Test: HomeProvider - all methods
- [ ] Test: ChatsProvider - all methods
- [ ] Test: ChatProvider - all methods
- [ ] Test: RecordingProvider - all methods
- [ ] Test: SettingsProvider - all methods
- [ ] Target: 80%+ code coverage for providers

### 9.2 Unit Tests - Services

**Current Status:** No tests exist

- [ ] Test: ApiService - all endpoints
- [ ] Test: AudioService - recording & playback
- [ ] Test: StorageService - all storage operations
- [ ] Target: 90%+ code coverage for services

### 9.3 Unit Tests - Models

**Current Status:** No tests exist

- [ ] Test: User model - serialization
- [ ] Test: Chat model - serialization
- [ ] Test: VoiceMessage model - serialization
- [ ] Test: Story model - serialization
- [ ] Target: 100% code coverage for models

### 9.4 Widget Tests

**Current Status:** Only default test exists

- [ ] Test: HomePage - all interactions
- [ ] Test: ChatsPage - all interactions
- [ ] Test: ChatRoomPage - all interactions
- [ ] Test: NewStoryPage - all interactions
- [ ] Test: SettingsPage - all interactions
- [ ] Target: Key user flows covered

### 9.5 Integration Tests

**Current Status:** None exist

- [ ] Test: Complete user flow - discover, reply, chat
- [ ] Test: Complete user flow - record, release, discover
- [ ] Test: Authentication flow end-to-end
- [ ] Test: Error handling scenarios

---

## Phase 10: Polish & UX Improvements

### 10.1 Animations & Transitions

**Current Status:** Basic Cupertino transitions

- [ ] Feature: Add page transition animations
- [ ] Feature: Add recording pulse animation
- [ ] Feature: Add waveform animations
- [ ] Feature: Add loading shimmer effects
- [ ] Feature: Add success/error feedback animations

### 10.2 Accessibility

**Current Status:** Basic support

- [ ] Test: shouldProvideSemanticLabels
- [ ] Test: shouldSupportVoiceOver/TalkBack
- [ ] Test: shouldHaveMinimumTouchTargets (44x44)
- [ ] Test: shouldSupportTextScaling
- [ ] Feature: Add semantic labels to all interactive elements
- [ ] Feature: Test with screen readers
- [ ] Feature: Add haptic feedback
- [ ] Feature: Support dynamic type

### 10.3 Onboarding

**Current Status:** Not implemented

- [ ] Test: shouldShowOnboardingOnFirstLaunch
- [ ] Test: shouldExplainCoreFeatures
- [ ] Test: shouldRequestPermissionsInContext
- [ ] Test: shouldSkipOnboardingOnSubsequentLaunches
- [ ] Feature: Create onboarding screens
- [ ] Feature: Explain "message in a bottle" concept
- [ ] Feature: Request microphone permission
- [ ] Feature: Show example voice message

---

## Phase 11: Performance & Optimization

### 11.1 App Performance

**Current Status:** Basic implementation

- [ ] Test: shouldLoadHomeFeedUnder500ms
- [ ] Test: shouldStartPlaybackImmediately
- [ ] Test: shouldScrollSmoothlyIn60fps
- [ ] Feature: Optimize image loading
- [ ] Feature: Implement lazy loading for lists
- [ ] Feature: Profile and fix performance bottlenecks

### 11.2 Network Optimization

**Current Status:** Basic Dio setup

- [ ] Feature: Implement request caching
- [ ] Feature: Add request deduplication
- [ ] Feature: Optimize payload sizes
- [ ] Feature: Implement offline mode
- [ ] Feature: Queue failed requests for retry

---

## Current Priority Order

**Immediate (This Sprint):**
1. Complete Story Creation flow (1.3)
2. Implement Reply to Message (1.2)
3. Complete Chat Room messaging (1.4)
4. Add basic error handling UI (4.2)
5. Add loading indicators (4.1)

**Next Sprint:**
1. Authentication flow (2.1, 2.2)
2. Profile management (2.3)
3. Token refresh (2.4)
4. Start testing infrastructure (9.1, 9.2)

**Following Sprints:**
1. Safety features (7.1, 7.2)
2. Push notifications (8.1, 8.2)
3. Polish & UX (10.1, 10.2, 10.3)
4. Complete test coverage (9.3, 9.4, 9.5)

---

## Notes

- Use `/go` to start implementing the next unmarked test
- Follow RED → GREEN → REFACTOR cycle for each test
- Keep commits small and focused
- Separate structural ([structural]) from behavioral ([behavioral]) commits
- Run all tests before committing
- Update this plan as requirements evolve

**Last Updated:** 2025-11-13
**Current Phase:** Phase 1 - MVP Core Features Completion