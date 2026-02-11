/*
  # Add Media Links to Posts

  1. New Columns
    - `youtube_url` (text) - YouTube video URL for the post
    - `github_url` (text) - GitHub repository URL for downloadable files

  2. Updates
    - Add columns to existing posts table
    - These are optional fields for enhanced post content
*/

-- Add YouTube URL column for embedding videos in posts
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'posts' AND column_name = 'youtube_url'
  ) THEN
    ALTER TABLE posts ADD COLUMN youtube_url text;
  END IF;
END $$;

-- Add GitHub URL column for file downloads
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'posts' AND column_name = 'github_url'
  ) THEN
    ALTER TABLE posts ADD COLUMN github_url text;
  END IF;
END $$;

-- Update the Post type in TypeScript will be handled in the component files