Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572382;
	b=MYpJFO1mm89RJGdk19Jo4oQFaP7dGloF9wCcv5Bjwa6ij/OurfnTNy3GMNYsmTC/yl+a
	 3zG+tJCg0r2BtGsyWkZdWeRVV2CmzQIq++opNtdXzwy0uyhg43WRACzBTEOWYrDSFLe/w
	 aOqh72EX6XRMNh2N1KvXdtG7uepcxy2akMMbFXJ3iSyycQDOOXCH2h/FPGKE2uA9mtzaI
	 30l5tCJQcbKfOlQIU0jbrSjiXOEjZECtwF3+xTnFRwbBoreiPw44plbtcc8JwNknkxZKn
	 jJ5ZpQOa/kkATKnwpTWhWYIn9H8DictDg/g1fd+V6zpKy2Yw/hR+myMXy1+PMpVIB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572382;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qNBH5wSw6SnvHcIC43dQoq/LLpdoAfR/77hDRNKZYpM=;
	b=1ZMNEd1rLSqBmwqN6aNQKT5DEZBH7QWxWroqITLD8zwytQFeHp/0tzJl0uqvQZYsHGyg
	 McWkqjtJ1p7M7UTeGcCCNlCCGIaiEhiBgWF4+fqKyFaTYma1QfdtFpupC1sdyqmOBOy4L
	 fIIrHDj2B6xqNvKRoQBhfCiOY3KLgCNFFbuP7pTO92TIuEpWWl6P34U6dcXZCI29UpNfd
	 hXz4zmTCtsA33vabbiqfcfcpXR7htC2MgVuPEzdk/OII3g4Y32GUfyRRF3vk7UznEhyRM
	 m2TPWs/b+KyVCwnVIy1/i1vLjUQ73AQu/uNcTAfuUgx18WNfxbGufz8M/A/cqp0ENUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inP4sxQ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C4606A695
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inP4sxQ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4205C1F000C0;
	Wed, 25 Nov 2026 02:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572382;
	bh=qNBH5wSw6SnvHcIC43dQoq/LLpdoAfR/77hDRNKZYpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=inP4sxQ3NEPxpp9jY/CazC7MYcW6RtXArufGYoLPMkZm8/bRi2npDdYIjf9Zov5Ka
	 B7No0/NAYtu2AXXeTsSRAtvGNhWC5mkK0szObk9o//XnnYnOQRJgMYE54G3TikrG94
	 IxUogGpBhmVpNvNtCa5jnXVMYbY1DF8u9GJ1mzkXsYpCSfD3ktJDKG9tHXK2IWplep
	 u6s7gzNhXkv/xiFStZNfbqM16XWQ1uvetpP6cOG71SLLzxTHZf42h4rGnijLJ8nmDF
	 qtypBZvw8ZPtJtQAJ5PcpjVFqlUPq4Ytx7D66tYvBNysriGi9We+nWoqwaAdI6tP8J
	 9lqb1ThLGwwqg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun@kernel.org>,
	Chuck Wolber <chuck@wolber.net>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 05/19] lockdep: Always inline the empty stubs called from noinstr code
Date: Tue, 24 Nov 2026 21:05:49 -0500
Message-ID: <20261125020603.3934222-6-sashal@kernel.org>
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

With !CONFIG_PROVE_LOCKING, lockdep_hardirqs_on() and
lockdep_hardirqs_off() are empty static inline functions, and so are
lockdep_off() and lockdep_on() with !CONFIG_LOCKDEP, while the real
versions are noinstr functions and macros respectively. They are called
from noinstr code, which the compiler won't inline them into when
building with code coverage instrumentation:

  vmlinux.o: warning: objtool: do_syscall_64+0x7b: call to lockdep_hardirqs_off() leaves .noinstr.text section
  vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4: call to lockdep_off() leaves .noinstr.text section

Make the stubs __always_inline, along with the neighbouring
lockdep_hardirqs_on_prepare() stub for consistency.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/irqflags.h | 6 +++---
 include/linux/lockdep.h  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..e06004255e3d8 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -32,9 +32,9 @@ struct task_struct;
 #else
   static inline void lockdep_softirqs_on(unsigned long ip) { }
   static inline void lockdep_softirqs_off(unsigned long ip) { }
-  static inline void lockdep_hardirqs_on_prepare(void) { }
-  static inline void lockdep_hardirqs_on(unsigned long ip) { }
-  static inline void lockdep_hardirqs_off(unsigned long ip) { }
+  static __always_inline void lockdep_hardirqs_on_prepare(void) { }
+  static __always_inline void lockdep_hardirqs_on(unsigned long ip) { }
+  static __always_inline void lockdep_hardirqs_off(unsigned long ip) { }
   static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
 					      struct task_struct *idle) {}
 #endif
diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a0..85b864880d069 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -324,11 +324,11 @@ static inline void lockdep_init_task(struct task_struct *task)
 {
 }
 
-static inline void lockdep_off(void)
+static __always_inline void lockdep_off(void)
 {
 }
 
-static inline void lockdep_on(void)
+static __always_inline void lockdep_on(void)
 {
 }
 
-- 
2.53.0

