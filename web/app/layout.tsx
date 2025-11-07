import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Listen - Voice Only Chat',
  description: 'Send your voice into the world, like a message in a bottle',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko">
      <body style={{ margin: 0, padding: 0 }}>{children}</body>
    </html>
  );
}
