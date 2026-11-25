Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572381;
	b=NgZaJlYv1ZA5RrBIGIwimFYMFRZ46H+gmK6fdd3ejOR+oDjUaU4yIQ4RYAouI4PnYCDl
	 T5doh4lWC9HhMxK5nrnooHGuPOqZP+231VyyxQE5EqBCogM6VC81o9ANuH6I5JHYSfm1M
	 lyLZ7a+dtukFFnm1pWOPgWtgBQBbAos2YX4Mm00GEAzckPSMUxxpcI077cCdl4zpGV4/K
	 d93S5KrhnjN4Oe4VKEvN5W8eMqosT/nVNovk1x6s3qMhMh4VLiNMCgQ1A0kYDZO6db/wS
	 yNfXyZ++ZiJdFqGWyG4ikEY1iBleR+B0FZ+pPhzihuazPUCBVClk3yn4nSUbdy4YgMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572381;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZDSjTgXv/4Por/TZQS5mnyfp69SLks+picO45gYeB1U=;
	b=ulLxfg5qY/Oo+4Y0IdaEP2NNLKIONcwaDikllUh38v0Ft2o7GYBkALpNx9HHtC4JNWQM
	 xil6AxJYq+YQWQJuXKJuGGO9WwINMqVLMYL3xwH6S8A/c+QQfce5wD54MznHI6s1+Q4/z
	 hW65580zFiQkN5jCCDXcBemYqNjsY0wbWZ64UxccmbL3Ca4kywpo8C03hym837AAShuz1
	 YaEVFqCd7it8sWPKuPQY8alA/pP28Twd5hhpgUhrne/SuROW/KuvILEsc9+vJ2w1CbK4B
	 1L2Nsz9m1hcNugu1O14+ESJGhjqRc56oW841FSAi7IhgFxZ3ezWONnRyttCUV5qUT+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eoQOmv4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514EC606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eoQOmv4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C191F000EC;
	Wed, 25 Nov 2026 02:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572380;
	bh=ZDSjTgXv/4Por/TZQS5mnyfp69SLks+picO45gYeB1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eoQOmv4dpLIiTT/SGeTOnnYtMGxjD95gXlkyY0hMXFIMO6VNWkI5X/XSKNKI39RAD
	 3e3TqDZuua4vDaQApzJ/12S+bPlz6QOyQ5yQdEWXuROq+j7uG4lMTHO7JdPUmuU+03
	 /vHku+NYc49XyEiuwie00+JOguQuR3oqMFSdSuOjkZIws2TCViMKMbKYf52ZompR52
	 SRmnzUZSoP6W2RPDNwv/7HlpGbxorOu2yqRQUhqhM1eDrc1F9p/VYa2BpK4Ymkgx4P
	 gN7dhAsNDRB5flvS1cByReUn8PT33ECP7hpvpzo79wGiNvE2Bt+PeyZLNFhk+8bI5w
	 Q3BwtAj2vseVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Frederic Weisbecker <frederic@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 04/19] context_tracking: Always inline the empty stubs called from noinstr code
Date: Tue, 24 Nov 2026 21:05:48 -0500
Message-ID: <20261125020603.3934222-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The !CONFIG_CONTEXT_TRACKING_USER versions of user_enter_irqoff() and
user_exit_irqoff(), and the !CONFIG_CONTEXT_TRACKING_IDLE versions of
ct_idle_enter() and ct_idle_exit(), are plain static inline functions,
while their real counterparts are __always_inline (user_*_irqoff()) or
noinstr (ct_idle_*()) functions. They are called from noinstr code, so
when they aren't inlined that's a call leaving the noinstr section. This
happens with code coverage instrumentation, which makes the compiler
refuse to inline an instrumented function into a noinstr one:

  vmlinux.o: warning: objtool: do_syscall_64+0x81: call to user_exit_irqoff() leaves .noinstr.text section

Make the stubs __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/context_tracking.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/context_tracking.h b/include/linux/context_tracking.h
index af9fe87a09225..d0672916fc1d3 100644
--- a/include/linux/context_tracking.h
+++ b/include/linux/context_tracking.h
@@ -93,8 +93,8 @@ static __always_inline bool context_tracking_guest_exit(void)
 #else
 static inline void user_enter(void) { }
 static inline void user_exit(void) { }
-static inline void user_enter_irqoff(void) { }
-static inline void user_exit_irqoff(void) { }
+static __always_inline void user_enter_irqoff(void) { }
+static __always_inline void user_exit_irqoff(void) { }
 static inline int exception_enter(void) { return 0; }
 static inline void exception_exit(enum ctx_state prev_ctx) { }
 static inline int ct_state(void) { return -1; }
@@ -162,8 +162,8 @@ static __always_inline void warn_rcu_exit(bool rcu)
 }
 
 #else
-static inline void ct_idle_enter(void) { }
-static inline void ct_idle_exit(void) { }
+static __always_inline void ct_idle_enter(void) { }
+static __always_inline void ct_idle_exit(void) { }
 
 static __always_inline bool warn_rcu_enter(void) { return false; }
 static __always_inline void warn_rcu_exit(bool rcu) { }
-- 
2.53.0

