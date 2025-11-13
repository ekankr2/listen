# Product Requirements Document: Listen

## Product Vision

**Listen** is a synchronous voice-only social app that brings back the magic of serendipitous human connection. Like casting a message in a bottle into the ocean, users record voice messages and release them into a shared pool where strangers can discover them, listen, and respond—creating authentic, voice-first connections in an increasingly text-dominated world.

## Problem Statement

Modern social media has become:
- **Text-heavy and impersonal:** Typing removes vocal nuance, emotion, and humanity
- **Algorithm-driven:** Content is filtered by engagement metrics, not serendipity
- **Performance-focused:** Users curate perfect personas rather than authentic moments
- **Asynchronous and disconnected:** Real-time human connection is lost

**Listen** solves this by creating a voice-first platform where:
- Voice conveys emotion, personality, and authenticity that text cannot
- Random discovery creates genuine serendipity and unexpected connections
- Real-time voice interaction feels intimate and human
- The ephemeral nature encourages authentic self-expression

## Core Concept

### The "Message in a Bottle" Metaphor

1. **Record & Release:** User records a voice message (thought, question, story, joke) and "throws it into the ocean"
2. **Drift & Discovery:** The message enters a shared pool where it drifts randomly to other users
3. **Listen & Connect:** Someone discovers the message, listens, and decides to respond
4. **Voice Conversation:** If they respond, a voice-only chat begins between the two users

This creates:
- **Serendipity:** You never know who will find your message or what you'll discover
- **Authenticity:** Voice reveals personality in ways text cannot
- **Intimacy:** One-on-one voice conversations feel personal and real
- **Low pressure:** No follower counts, no likes, no performance metrics

## Target Audience

### Primary Users
- **Ages 18-35:** Digitally native but craving authentic connection
- **Urban professionals:** Lonely in crowded cities, seeking meaningful conversations
- **Creative individuals:** Storytellers, thinkers, curious minds
- **Night owls:** People awake late wanting human connection

### User Personas

**Persona 1: The Seeker**
- 26-year-old working professional in a new city
- Wants meaningful conversations but finds dating apps exhausting
- Misses late-night dorm room talks from college
- Values authenticity over curated social media

**Persona 2: The Storyteller**
- 30-year-old creative with thoughts to share
- Enjoys podcasts and voice-based media
- Wants to practice storytelling in a low-stakes environment
- Seeks audience feedback without performance pressure

**Persona 3: The Curious**
- 23-year-old who loves meeting interesting people
- Fascinated by diverse perspectives and life stories
- Finds text-based social media superficial
- Enjoys spontaneous, unfiltered conversations

## Core Features

### 1. Voice Message Pool (Home Feed)

**Purpose:** Discover random voice messages from strangers

**Features:**
- Random feed of voice messages (no algorithm, pure serendipity)
- Voice player with waveform visualization
- Minimal metadata: duration, timestamp, user's first name only
- "Reply" button to start a chat
- "Next" button to skip to another random message
- No likes, no shares, no public comments

**User Flow:**
1. User opens app to home feed
2. Random voice message auto-loads
3. User taps play to listen
4. User decides: Reply (start chat) or Next (skip to another)

### 2. Recording & Release

**Purpose:** Create and release your voice message into the pool

**Features:**
- Simple one-tap record button
- Visual feedback during recording (waveform, timer)
- 15-90 second duration limit (forces brevity and thoughtfulness)
- Optional: Add a topic tag (e.g., "late-night thoughts," "ask me anything," "story time")
- Review before sending
- "Release" button to send into the pool

**User Flow:**
1. User taps "New Story" tab
2. User holds record button and speaks
3. User reviews recording
4. User adds optional topic tag
5. User taps "Release into the ocean"
6. Message enters the pool and becomes discoverable

### 3. Voice Chats

**Purpose:** One-on-one voice conversations that start from a message response

**Features:**
- Voice-only messaging (no text, no photos)
- Real-time voice message exchange
- Playback controls: play, pause, speed adjustment
- Visual indicator when other person is recording
- Chat history persists until manually deleted
- Option to "close chat" (end conversation)

**User Flow:**
1. User discovers message in pool and taps "Reply"
2. User records response
3. Chat room opens with both users' messages
4. Users exchange voice messages asynchronously
5. Either user can close chat when conversation ends

### 4. Active Chats List

**Purpose:** Manage ongoing voice conversations

**Features:**
- List of active chats with most recent first
- Shows: participant name, last message preview (waveform), timestamp
- Unread count badge
- Swipe to delete/archive chat

### 5. Settings & Profile

**Features:**
- Minimal profile: First name, voice bio (recorded), avatar (optional)
- Notification preferences
- Privacy settings: Who can discover your messages (everyone, nearby, filtered)
- Account management: Logout, delete account
- Voice bio: 30-second recording introducing yourself

## Non-Features (What We're NOT Building)

To maintain focus on authentic voice connection:
- ❌ No text messaging (voice only)
- ❌ No photos/videos (voice only)
- ❌ No follower/following system
- ❌ No public profiles or profile browsing
- ❌ No likes, hearts, or engagement metrics
- ❌ No group chats (1:1 only)
- ❌ No algorithmic feed (pure random)
- ❌ No direct search for people
- ❌ No voice effects or filters (authentic only)

## User Experience Principles

### 1. Voice-First Design
- Every interaction prioritizes voice over text
- UI is minimal and doesn't distract from listening
- Visual design supports audio content (waveforms, timers, states)

### 2. Serendipity Over Control
- Random discovery is a feature, not a bug
- No algorithm to game or optimize
- Embrace unpredictability as part of the magic

### 3. Intimacy Through Simplicity
- Clean, uncluttered interface
- Dark theme for late-night usage
- Soft colors and gentle animations
- Focus on one conversation at a time

### 4. Low-Pressure Authenticity
- No performance metrics (likes, views, shares)
- Ephemeral by nature (chats can be easily closed)
- Encourages real thoughts, not polished content

### 5. Safety & Respect
- Clear reporting and blocking tools
- Community guidelines emphasize respect
- Moderation for inappropriate content
- Age verification (18+)

## Technical Requirements

### Audio Specifications
- **Format:** AAC-LC (.m4a)
- **Quality:** 128kbps, 44.1kHz
- **Duration:** 15-90 seconds (stories), unlimited (chats)
- **Storage:** Local caching + cloud storage

### Platform Requirements
- **Initial Launch:** iOS (Cupertino design)
- **Future:** Android, Web
- **Minimum iOS:** 14.0+
- **Permissions:** Microphone access required

### Performance Requirements
- Voice messages load within 500ms
- Playback starts immediately (progressive loading)
- Smooth waveform animations (60fps)
- Offline mode: Cache recent messages

### Backend Requirements
- Real-time message delivery
- Scalable audio storage (CDN)
- Random message distribution algorithm
- User authentication & authorization
- Moderation tools & reporting system
- Analytics (privacy-focused)

## Success Metrics

### Engagement Metrics
- **Daily Active Users (DAU):** Users opening app daily
- **Messages Released:** Average messages posted per user per week
- **Reply Rate:** % of discovered messages that get a reply
- **Chat Duration:** Average length of voice chat conversations
- **Session Length:** Time spent in app per session

### Quality Metrics
- **Chat Completion Rate:** % of chats with 3+ exchanges
- **User Retention:** 7-day, 30-day retention rates
- **User Safety:** Report rate, block rate, moderation response time
- **Audio Quality:** Playback success rate, audio clarity scores

### Growth Metrics
- **Organic Growth:** Word-of-mouth referrals
- **Geographic Spread:** Active users across regions
- **Time of Day Usage:** Peak usage hours (expect late-night)

## Roadmap

### Phase 1: MVP (Current)
- ✅ Voice message pool (random feed)
- ✅ Record & release stories
- ✅ 1:1 voice chats
- ✅ Active chats list
- ✅ Basic profile & settings
- ✅ iOS app with Cupertino design

### Phase 2: Safety & Quality (Next 3 months)
- 🔜 Reporting & blocking system
- 🔜 Content moderation tools
- 🔜 User verification (phone number)
- 🔜 Community guidelines & onboarding
- 🔜 Audio quality improvements
- 🔜 Push notifications for new messages

### Phase 3: Discovery & Connection (Next 6 months)
- Topic tags & optional filtering
- "Nearby" messages (location-based discovery)
- Voice bio for profiles
- Conversation starters & prompts
- "Favorite" chats (pin to top)
- Chat archives

### Phase 4: Growth & Scale (Next 12 months)
- Android app
- Web app (listen-only mode)
- Invite friends feature (limited)
- Multi-language support
- Accessibility improvements (transcription toggle)
- API for third-party integration

## Privacy & Safety

### Privacy Principles
- Minimal data collection (voice, first name, timestamp)
- No tracking or advertising
- Users control their data (delete anytime)
- Voice messages encrypted in transit and at rest
- Location data optional and never shared publicly

### Safety Features
- Report button on every message and chat
- Block user (prevents future matches)
- Content moderation (AI + human review)
- Age verification (18+)
- Community guidelines clearly communicated
- Zero tolerance for harassment, hate speech, explicit content

### Moderation Approach
1. **Automated:** AI flags potentially inappropriate content
2. **User-reported:** Users can report messages/chats
3. **Human review:** Trained moderators review flagged content
4. **Action:** Warnings → Temporary bans → Permanent bans
5. **Appeals:** Users can appeal moderation decisions

## Monetization (Future)

**Phase 1: Free for All**
- No ads, no paid features
- Focus on growth and product-market fit

**Phase 2: Optional Premium (Explore Later)**
Potential features (only if they enhance experience):
- Extended message length (up to 3 minutes)
- More active chats simultaneously
- Priority discovery (messages reach more people)
- Advanced topic filtering
- Voice message analytics (personal insights)

**Never:**
- No ads (breaks intimacy)
- No pay-to-win mechanics
- No selling user data

## Competitive Landscape

### Direct Competitors
- **Clubhouse:** Live voice rooms (but public, not 1:1)
- **BeReal:** Authentic moments (but photo-based, not voice)
- **Slowly:** Pen-pal letters (but text-based, not voice)

### Differentiation
**Listen is unique because:**
1. **Voice-only:** No text, photos, or visual distractions
2. **Serendipity:** Random discovery, not curated or algorithmic
3. **1:1 Intimacy:** Private conversations, not public broadcasts
4. **Ephemeral:** Low-pressure, authentic interactions
5. **Message in a bottle:** Romantic, human metaphor

## Design Philosophy

### Visual Design
- **Dark theme:** Primary interface (easier on eyes at night)
- **Purple/teal palette:** Calming, mysterious, oceanic
- **Minimalism:** Clean UI that doesn't compete with audio
- **Waveforms:** Primary visual metaphor for voice content
- **Gentle animations:** Smooth, calming, non-intrusive

### Interaction Design
- **One-tap actions:** Record, play, next, reply
- **Gestural controls:** Swipe for actions, hold to record
- **Audio feedback:** Subtle sounds for actions
- **Progressive disclosure:** Simple surface, depth when needed

### Tone & Voice
- **Friendly but not cutesy**
- **Encouraging authenticity**
- **Respectful of user's time**
- **Mysterious and intriguing** (message in a bottle)
- **Intimate and personal** (late-night conversations)

## Open Questions & Future Considerations

### Questions to Answer Through User Research
1. What's the ideal message duration? (Currently 15-90 seconds)
2. Should we allow optional text descriptions for accessibility?
3. How much profile information do users want to share?
4. What topic tags resonate most with users?
5. Should we allow users to "pass" on replying but save for later?

### Future Features to Explore
- Voice-only "stories" that disappear after 24 hours
- "Deep dive" mode: Extended conversations (3+ minute messages)
- Seasonal themes and prompts
- Voice journals (private recordings)
- Collaborative storytelling features
- Voice-based icebreaker games

## Success Vision

**In 1 year, Listen is successful if:**
- 100,000+ active users having meaningful voice conversations
- Users describe the app as "late-night magic" or "like talking to an old friend"
- Average session length is 15+ minutes (deep engagement)
- 30%+ of discovered messages result in multi-message chats
- Users feel less lonely and more connected to humanity
- Press coverage highlights authenticity and human connection
- Organic word-of-mouth drives 60%+ of new users

**The ultimate success:**
Users say "Listen helped me feel less alone" or "I had the most interesting conversation with a stranger tonight."

---

**Document Version:** 1.0
**Last Updated:** 2025-11-13
**Status:** Active Development (MVP Phase)