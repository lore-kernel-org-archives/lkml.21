Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572387;
	b=g9dwHUK4Ztc2hQpw83SOgRL8LnfK3NiG0S+QgKfGXTWXDNoNn/+DfD4sjLaclRKhf+0Q
	 ulxwZGGNxHCfrxHT8StbGa/DatHFub/15IjVjLVO44T5ie+/XooPVSCnSBbMjibPm63Zz
	 GCGy/NC86QHVtPATORduL3IxtE42ntkpoVENWpP7FyycUiAnMsWLKRmRFvbzJehRjXWyq
	 iC7t1bmXDsA7djuQ5vhMhsvPQJx/Zk4eiElrL8PZeceIBFSJofVv9ejbqCG3pFJwfOb88
	 SMq9li+cez/7H6CHkykHUgH1pVudTNoLvmoTOz5ldSFmvz9dMcO9EFy2O/1HWuAliQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572387;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eax0bQ5nd8SCxeqgF2faVzgSsgk1MJgcH1myeOIjvZE=;
	b=mau1016d2TsoNfcLet5Tn7YgVJLIwHKwz6xtebzvPNni3emXmo0od6aXI4RRtZO1gBzO
	 +sL4aWLxBPdTpsnNb9e6acWpT6FvLp+L+tU21dxfoyNbHw9Is9xtcfC4uwoQYZRh87rI/
	 HJrT9j8zRHPEPciogefeZtVWXIiRHYgeYFh83aa+Sxz8hw4Sv3/Nb/NfkX2ZTlGtQh0jh
	 DVEwklITFig9p9NURZmqvvN/P1MfCWwiDsadiH0Dfom9AGGf4RQUCGupB3EWhXguYxH9X
	 0UzrWPRCD6lO/J9EbuUtmA8VvWuVMF9SKZnaQu2aeqAkMX54vXDNUL9HlcrZ5P4Awfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiGbmAfP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F2606A68F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiGbmAfP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ADF1F000F4;
	Wed, 25 Nov 2026 02:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572386;
	bh=eax0bQ5nd8SCxeqgF2faVzgSsgk1MJgcH1myeOIjvZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KiGbmAfPUnfJIMYGet3XtRzLHSQQkcYBD/46OHQtQyCA6AH7QAMXwZTeZXKzx3hM1
	 NwlRMY2VLEH078B8QGG9IJRoCMNED5yBkY2RT2Hw6oniVZ/+wlw/cIH78nslRbJX16
	 a3Lpz6/K6taIitqcnwIBoXjkv8Ngahy4QaPnZAHgmvAYMlzBDRr9ceTA56+F/TyCvb
	 B6+qrnGm9gQMEHt/WrIpkrTtMBGRvfyKo5qZ7PsEmGiMyqTONZeQIbH1zRE+L/Uv01
	 e1KwrgtV6hzDVJDOg99eMmaIZcomqZ/nN9WHrFyTz3kxnzc/9Y9b1Xg50SQXJdA33+
	 sdO7gJrayYdIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 07/19] rseq: Always inline the empty stubs called from noinstr code
Date: Tue, 24 Nov 2026 21:05:51 -0500
Message-ID: <20261125020603.3934222-8-sashal@kernel.org>
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

The !CONFIG_RSEQ stubs in rseq_entry.h, and the !CONFIG_GENERIC_ENTRY
version of rseq_exit_to_user_mode_restart(), are plain static inline
functions, while their counterparts are __always_inline. They are called
from noinstr entry code, directly or through the __always_inline exit to
user mode helpers, and the compiler won't inline them there when
building with code coverage instrumentation.

On x86 that's rseq_note_user_irq_entry(). arm64 calls the exit to user
mode helpers from noinstr code outside of instrumentation_begin()
sections, so with Clang, asm_exit_to_user_mode() and the el0 exception
handlers end up calling rseq_syscall_exit_to_user_mode() and
rseq_irqentry_exit_to_user_mode() out of line.

Make the stubs __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/rseq_entry.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index 31ce349ed42ce..ac847fcc63a03 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -716,7 +716,8 @@ rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
 }
 
 #else /* CONFIG_GENERIC_ENTRY */
-static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
+static __always_inline bool
+rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
 {
 	return false;
 }
@@ -759,15 +760,19 @@ static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
 		__rseq_debug_syscall_return(regs);
 }
 #else /* CONFIG_RSEQ */
-static inline void rseq_note_user_irq_entry(void) { }
-static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
+static __always_inline void rseq_note_user_irq_entry(void) { }
+static __always_inline bool
+rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
+{
+	return false;
+}
+static __always_inline void rseq_syscall_exit_to_user_mode(void) { }
+static __always_inline void rseq_irqentry_exit_to_user_mode(void) { }
+static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
+static __always_inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask)
 {
 	return false;
 }
-static inline void rseq_syscall_exit_to_user_mode(void) { }
-static inline void rseq_irqentry_exit_to_user_mode(void) { }
-static inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
-static inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
 #endif /* !CONFIG_RSEQ */
 
 #endif /* _LINUX_RSEQ_ENTRY_H */
-- 
2.53.0

