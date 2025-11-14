CREATE TYPE "public"."oauth_provider" AS ENUM('google', 'kakao');--> statement-breakpoint
CREATE TYPE "public"."user_status" AS ENUM('active', 'suspended', 'banned');--> statement-breakpoint
CREATE TABLE "users" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"email" varchar(255) NOT NULL,
	"username" varchar(255) NOT NULL,
	"first_name" varchar(255),
	"avatar_url" varchar(500),
	"voice_bio_url" varchar(500),
	"oauth_provider" "oauth_provider" NOT NULL,
	"oauth_provider_id" varchar(255) NOT NULL,
	"status" "user_status" DEFAULT 'active' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	"last_login_at" timestamp,
	CONSTRAINT "users_email_unique" UNIQUE("email"),
	CONSTRAINT "users_username_unique" UNIQUE("username"),
	CONSTRAINT "users_oauth_provider_oauth_provider_id_unique" UNIQUE("oauth_provider","oauth_provider_id")
);
