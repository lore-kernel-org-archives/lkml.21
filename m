Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804844;
	b=WoLsriRqk49xaMZ4f/ZRuQD91eofgyk7QHhpoaer9LpjXFktR0NKq6YYWPLqAryDK/o1
	 Te9GUOIu9fYtmlNeygySGK26ADZskQWLBeXawSE8isWMotn39ryo2IkgyGHdWeKWK2636
	 8IDd4u64jL3//TAhUqDPDByt6vyeMYRfjr44hlV6tgHz9wgmLolAB1jJuloeM0dC4aUEA
	 d20sX2zRDRJ0x46e3ZKBt9pRnHmzZkDQOorrCeJ2vDN8gsRNlk63bPosiVKuciq50di0e
	 M8pXe/Ooxi7/horxVREVAPGgN4GlhDdm1gG4W8uA6e2oQ6v85zp3plKnFeiTs5kWV6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wFT8y0Zr1HX3ZhgJaJpc87Z3ipUTEpMR36YcJXlJe98=;
	b=G6GJFfdmHuBRrz9flTARt7e66wMEJi1DBmnB/l0clGHqvpj3KPPaN70aoxq4o+OIfzgY
	 l2MeT69WRZQ1g0eXjUKI0nKuLVp7moPNuyV5gzl7Z/a66ZS4RBsrjbsaKyPlb8e5o+hJv
	 +yzyU4GN7FG1omT8KtxVf/MAzJo2CmE7uv8Vny7uROnTyguHhGkSlANzjzd/CV8f7g1M/
	 zNAs0XcczG76kQeshjezaLdrupHYNo5Gw28rL4SRCBZU811hKY3oTEB71jQdnnzMfb6Ek
	 ozu3CALTcs7bG7NFpkOFaKqbX1iesP9dd3IAo0DxkXwI3C0P6ChoQTtAijQZJbk3xSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qaAlchj/";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E76E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaAlchj/
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so19510456c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804843; x=1796409643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFT8y0Zr1HX3ZhgJaJpc87Z3ipUTEpMR36YcJXlJe98=;
        b=qaAlchj/Ucow5nofE45YHfqxqw9Pc7Y7hUAk00bBshPSe3wFe8QQ5CHjBqpZzOcxy7
         OTH8bt9nzoVzkj45hNAJDjgOUadHBp+/ItdgZxqr5Pq71SjFPG8xA1QZTxUgTRZVjhMu
         OzX5AfG6tbiYZp6Z4GAUW6LILKPZZpGYTR3iNFHDhaOKp3FjgF6EY0sBp+JWpAmJEVew
         Jyd2keWP8WR1dYlOpw+oyKK8docypLKQ1/SGuJRZVACiSWGwZ+mUTWTXlU6XS+FFT3Yu
         jP8X42kCuhfparPRp0hlhnNMX+x2RVCfu046sNMc5QVyl6ZEg21MQ8lZ3URltnCBpENp
         vRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804843; x=1796409643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFT8y0Zr1HX3ZhgJaJpc87Z3ipUTEpMR36YcJXlJe98=;
        b=RYyexLhp9pZltxmN0+IWF6vXCEWAZzlsOHLfH2sNlFQN+HKToBTnkRRmM1qgJngqaZ
         Rj5LSdr1FeTfiqfmhs9N0+98OJMXfDeEPu2/Hz3Ftu1P+UWL0mTcNWCBMcXWg1od74Nd
         15yerXHN1+9ucAOVIon+xhwAO97B5A9PAaPtJfh24iy5KV1+dChoGD18YuZWREZu0OfC
         Qc2GcExPXZKNX8PjT+N5lVlMKG4ZaiFloX+FANOkPwDxsU4/fn4/FewK1PDyP9iiYwqB
         kWVPOdG4w8hDLRCgFGbYuKmre4Q+fRwhZU+YN7zkz+uK1V5dAW3eUnzdHjsh6fl0/GgU
         wong==
X-Forwarded-Encrypted: i=1; AL+hErFMt6L/sFiJOBIxWFnoc837p4hsqCNl/+7ZdFLs3N8KdyEEeD17YyIsmfsvIKPWNjppTPx0PKACZR/aPvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1PhnpW5I+Jt1Mq/UWRIcbLUZgUntoQaKcJllbnRQQCRQ0IHI0
	SS8gMCCkPXlNV7NujBs7ihhhVjNv+/AWulq6V9IZa7nQ8RhYj84gSKWo
X-Gm-Gg: AZFdTZfSvVDabnDOrynJlMYQWT5vzooi8Oh51AaHsVbt+HfFkHTPCH80fKz1HSndWzE
	W7hzKWwVyfHBmOVkIO3K6Fuo5LVvYy2dvtBX7pNXtqQhLFSluWFYBJnVIA9ORtIJbX+yP34Ybid
	kp2rVGW8ugEMbERCEqi2dS9t9Vr2dOoOuySrgTJWzD7tqrhoi84gz6JNQFaGp9+ZEUAVk5+x5fJ
	HVvg7ADtpFRzzY81bbeaVWpsWrGsGpaEtS2NipRljVnhdZFUt9y2Upw9JN4+NvoAwGkO3by+pvG
	LKQOQAoCTVwkpEadnf6JiOSapk6iq8YHFSYb6kgra755p3pqR6K475pYN5XpU8EA3ehRDUN/hMA
	qCbU7p8XKi/8MjU1vXKVd/h4FWKFICJdT7/6joOc5Agifeab8SPD5BpPfB37Zh6iUmG+r+l6zrn
	7S5h+byV9g1BJOgN964ZCg2YaJYIURNA0y3JqD8DnjsNf0tyz4fZ1REq/tWiYwQH5TF7RSYqR/t
	FrO2zHYQ2rPp1qm4hiXRV3E778IBAJC0fhiiPxjydKR9xlXM3Btff1i7y7b1tXwKA7rhgbb4JLt
	DiV3rAZbMU1qYaJ92/giTW/TVpfiup0yvFEBMmuJHZm25wNPkNzBMGf0WNCjwyoN2tmi4SxHuB/
	zqkzk/EWpaFJgjOjOCp3KHS3Sv/A1S2VkRhQIILfHdIW8b8PsiO9oIm8bX0A=
X-Received: by 2002:a05:7023:a8b:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b5568fe775mr28302005c88.32.1795804843148;
        Fri, 27 Nov 2026 10:40:43 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm88425895c88.14.2026.11.27.10.40.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 10:40:42 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] rethook: link the node before replacing the return address
Date: Fri, 27 Nov 2026 10:40:37 -0800
Message-Id: <20261127184037.71903-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

rethook_hook() calls arch_rethook_prepare(), which replaces the return
address of the probed function with arch_rethook_trampoline, and only
then adds the node to current->rethooks.

A stack unwinder that runs in between, from an interrupt or an NMI,
finds the trampoline address on the stack but no node for it.
rethook_find_ret_addr() returns 0 and the stack trace ends at the
probed function.

Add the node to the list first.  Until arch_rethook_prepare() has
filled it in, give it the trampoline address as its return address and
a zero frame, so that rethook_find_ret_addr() skips it.

Fixes: 54ecbe6f1ed5 ("rethook: Add a generic return hook")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
x86 in QEMU, kretprobes on 44 functions, call chains sampled by a cycles perf event: 388 of 119922 chains ended at a probed function before, 0 of 121436 after. kprobes kunit and the kprobe ftrace selftests give the same results.
Found and written with the help of an AI coding assistant.

 kernel/trace/rethook.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 87a27f3aa4a6..c0d89720e1a8 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -196,8 +196,16 @@ NOKPROBE_SYMBOL(rethook_try_get);
  */
 void rethook_hook(struct rethook_node *node, struct pt_regs *regs, bool mcount)
 {
-	arch_rethook_prepare(node, regs, mcount);
+	/*
+	 * Link the node before the return address is replaced, so that a
+	 * stack unwinder never finds the trampoline address without its node.
+	 * Until arch_rethook_prepare() fills the node in, make it one that
+	 * rethook_find_ret_addr() skips.
+	 */
+	node->ret_addr = (unsigned long)arch_rethook_trampoline;
+	node->frame = 0;
 	__llist_add(&node->llist, &current->rethooks);
+	arch_rethook_prepare(node, regs, mcount);
 }
 NOKPROBE_SYMBOL(rethook_hook);
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.39.3 (Apple Git-146)

