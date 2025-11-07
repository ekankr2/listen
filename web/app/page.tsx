export default function Home() {
  return (
    <div style={{
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
      color: 'white',
      fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
      padding: '2rem',
      textAlign: 'center'
    }}>
      <div style={{ maxWidth: '600px' }}>
        <h1 style={{
          fontSize: '3.5rem',
          marginBottom: '1rem',
          fontWeight: '700'
        }}>
          Listen
        </h1>

        <p style={{
          fontSize: '1.5rem',
          marginBottom: '3rem',
          opacity: 0.9
        }}>
          음성으로만 소통하는 새로운 경험
        </p>

        <div style={{
          background: 'rgba(255, 255, 255, 0.1)',
          backdropFilter: 'blur(10px)',
          borderRadius: '20px',
          padding: '2rem',
          marginBottom: '2rem'
        }}>
          <p style={{
            fontSize: '1.1rem',
            lineHeight: '1.8',
            marginBottom: '1.5rem'
          }}>
            채팅은 없습니다. 오직 목소리만.<br/>
            당신의 음성 메시지를 바다에 던지듯 보내세요.<br/>
            누군가 그것을 발견하고 답장할 것입니다.
          </p>

          <div style={{
            fontSize: '2rem',
            margin: '2rem 0'
          }}>
            🎙️ → 🌊 → 💬
          </div>
        </div>

        <div style={{
          background: 'rgba(255, 255, 255, 0.1)',
          backdropFilter: 'blur(10px)',
          borderRadius: '20px',
          padding: '2rem',
          marginBottom: '2rem'
        }}>
          <h2 style={{
            fontSize: '1.5rem',
            marginBottom: '1rem',
            fontWeight: '600'
          }}>
            Listen Pro
          </h2>
          <p style={{
            fontSize: '1.1rem',
            marginBottom: '1rem'
          }}>
            월 3,000원
          </p>
          <ul style={{
            listStyle: 'none',
            padding: 0,
            fontSize: '1rem',
            lineHeight: '2'
          }}>
            <li>✨ 원하는 성별 설정</li>
            <li>🌍 원하는 언어 설정</li>
            <li>🎯 더 나은 매칭</li>
          </ul>
        </div>

        <p style={{
          fontSize: '0.9rem',
          opacity: 0.7
        }}>
          Coming Soon
        </p>
      </div>
    </div>
  );
}
