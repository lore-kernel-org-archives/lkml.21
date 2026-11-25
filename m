Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640955;
	b=HeEoUb8I/+A8QLNYHgj7zm/vorW2O00u4EDvIgHmmYWOJ+BLv/87DvBwW84hXMdQDelL
	 ypG2gBhu1alDbBDIW5YOCdkO5T4e1Sp+nfvuk7GV+BzsM6sZQaAPyctqLrqq3//wRAUXd
	 KxetZmOYIWWkWzOJtPnL7XMF8qjHfvHm1kzRXkhQJi76fTGNaKrwPNfgH7Ycqy0JSQXVF
	 JzmnO2hBPUEJuTskgIgxBI1lHlmqI3m2LRZlMi+qUtciONzmA1rtkHX2tGQ0SRytLeHur
	 dXH22QGiAV5y/Q1kRCACj6aR6WwsKZy05P7Gc9IhdMXIN3Vx6IzYVCdA1I6axDTfO4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UGooGTMeDb+bMWkU7jfUFCCnp+YQzwe+jXP8cT49pnM=;
	b=E7RVZ/INbMOPav9AO1n0Yd0oU94QRMiFG9Tb/Koyhr9xUpj3VF9x/Yboea1nKxRJzBCf
	 rlvOxaXWn/1p8VUGYq0P/23GjRcc6JY4fHBE22r0T6qApS0Z4BM6ILV4FfSAvgX5y/SxM
	 E7oM1xhfh3Du44nUdYQ0orxn1rcWY3br2GG1F4WvfsakhHEIGhoJuWAleqd/rq9UNbDf9
	 Ks9BjPjXzVctOFpw1nYF2UrcCRPEG3jrbahpuRyMBOczepUFtciModBGd7K9gPJa/9fJx
	 +aElYFTXrevt+3E7eBMqI6pOhNXlkwjfbtXwIECWjAobSxV1L3m2N6SSDwSFwV9tC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5VpqPIn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C64F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5VpqPIn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so56579375e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795640953; x=1796245753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGooGTMeDb+bMWkU7jfUFCCnp+YQzwe+jXP8cT49pnM=;
        b=t5VpqPInnOChueEZpL/BqAq8rSR+DvA+ibVYNxZsXvUDJbjAbKxoOoK6FcguhZGhPs
         Xa9gn6E0pJs+Ex7L+KcKnhiAJxBfICeBwPQUDHPszrnp6O9UG+vh0L59FwkfNseg178H
         rVDJlINGNYZvSUTOQ7D8VQ6WFq9rYxaD5U+4R/zIj9d94X/7IScbtJ/G8VGuc5X6eP3c
         qWVRfWqi6b8U2VX1mIIs5cvv1h/74YsI0eJm3Jkv1CD1trAFBiGrMasolzyvAXYmmY11
         Gzyk/IAdR05mw1j76RJdzRJl3p3HGw58pN7nEyHTAf+Ulh8QMd395gZ9x0/RtnU1exqd
         I17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640953; x=1796245753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGooGTMeDb+bMWkU7jfUFCCnp+YQzwe+jXP8cT49pnM=;
        b=AcHcodfwOTOtW5bsi6+oWslpWHD2Y1Uw7CQm4tv7xd4jST90R8koU6E6D357Fumklt
         u5RberVmJfN8RlX5Y9vo+LL4k9IjbpEAQnT9wbrdxk9o/E1nsbbVClUt+hL8dNblxQl4
         oujiZBTxVhFgTKONdi37yuPQZRR3p51up2IYE/DiuNQjP8tNupJ7E/+uPQpjNHBPl37p
         nJ7DnKupZmkaty9p4llbtABZghPqeUUTMDDsPGzNgOELsGqbFyZCmLJLmqb7WEDwm8TY
         lzUQSNJY2D+nNGGqk9kSFYkQByg4FRaegw+CF+SVIM6GcHSgPVXKYkyRSM6xtu+pNe2u
         U1gQ==
X-Forwarded-Encrypted: i=1; AL+hErGmRRQEfnJLht/ySrtBBtyJ70rfSBYUaAsBQEOqPobA/9oGo11i3aISBAuWo7KMdNlV2WMCAwSju40oIhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CSHGXnbB+6wfaWsBIByC9LVqwdMGsowuSJVi7yLcpwUfiSOHK
	Pw7bBhDPrDDdPXpy5mlX13+x01/iMnLoiJ7TSG7BrMKcs8F06wnPIslf2t8YyUcOu79lDg==
X-Gm-Gg: AZFdTZfvve9cheJJJdpd+LQ8TtwApN0Onab1q3IyVfhbgrVHgdtoYjbiPIoHKfktOP3
	jbZSTk0PkIAL7LIeJPDuAoF574BfAe0THMUwYkqOXbEllgFVwhFJWawI0KUK1tkdZ9rh+MyLtva
	zSxZiJiRQXUuRrsGGccQUrf52mOJmQ49dasurD3u19W4ktrdJaYvrs5Ysez7X4XyWQYhqOB5/8G
	LgZoTy25eXvq8Hob9gZs/LqEqWb7FPfxeEojkpqJhkWwRsSxKsCmL+6V9MPWHTz3KBKEF3Vqxlu
	nGF1Sx4Ktp+f0iQL+bS9PGo1rWUsl83XGGwpj+Ffdy0ysQ6f9gt/+cS7umlVBQMUNBiuv9sl3j+
	jsE9sTHqL9FnaArddF5kV9FAZstC6jRU5QmwhY9y1Fb9XW8rqcxd2ptSR/8id5fsQ+yA16xMKPM
	Vf6eAEA6u/590RXmH0jkZ8b2ZIxgjxTBOQHEF3bWiGdQKwozUS9N54HpOJ5mY42JAE8doUqMNzD
	dGj4ZaBugfHMIr7xBz/swU8nCOrBVz676Mq8kxHCKSciFY3NK4CPiLOeUGbps/XFIKI24Y8OG9P
	EZGxCupGWquyN3O4zZcHLLLm7/1nGlGt2MIA8vnzVnGqEOCfJNcX2AgGLli4IKnIMNjlB1xFk/N
	HsjjCLl/zGNHX7De8EGNUCUtNCk1uHq2JaVl0QmA9fxiaqq8PTDlunzzVPYDCZ0/saAcBLfHCOq
	XA37eHty7RqU7Nixg=
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr380703695e9.25.1795640953395;
        Wed, 25 Nov 2026 13:09:13 -0800 (PST)
Received: from localhost.localdomain (ec2-3-68-81-44.eu-central-1.compute.amazonaws.com. [3.68.81.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm542355145e9.1.2026.11.25.13.09.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 13:09:13 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] x86/unwind: Recover the fgraph return address behind a rethook
Date: Wed, 25 Nov 2026 13:09:05 -0800
Message-Id: <20261125210905.33319-1-evanfengff@gmail.com>
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

unwind_recover_ret_addr() asks ftrace_graph_ret_addr() and then
unwind_recover_rethook() for the original return address. That works
when the function graph tracer hooks the return of a function after a
kretprobe did: the stack has return_to_handler(), the shadow stack of
fgraph has arch_rethook_trampoline() and the rethook node has the
original address.

When the kretprobe hooks the return last, the stack has
arch_rethook_trampoline() and the rethook node has return_to_handler().
Nothing translates that address, so the stack trace ends there:

  => rw_verify_area
  => vfs_read
  => return_to_handler

This happens when the kretprobe is registered before the function_graph
tracer or an fprobe exit handler is enabled for the same function. It
also happens in the other order when the function is reached by a tail
call from a traced function, like ksys_read(): the rethook node then
has the return_to_handler() of the caller.

Translate the address found in the rethook node with
ftrace_graph_ret_addr(), and repeat while that gives the rethook
trampoline again. Do it in unwind_recover_rethook(), so that the
unwinding from pt_regs gets it, too.

Fixes: 19138af1bd88 ("x86/unwind: Recover kretprobe trampoline entry")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
QEMU: function_graph, fprobe exit and kretprobes on vfs_read()/ksys_read() in 6 orders, stacktrace trigger in rw_verify_area(): complete in 0 of 6 before, 6 of 6 after. kprobes kunit and ftrace selftests (kprobe, dynevent, ftrace) give the same results.
Found and written with the help of an AI coding assistant.

 arch/x86/include/asm/unwind.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/unwind.h b/arch/x86/include/asm/unwind.h
index 7cede4dc21f0..7ded718a8d6b 100644
--- a/arch/x86/include/asm/unwind.h
+++ b/arch/x86/include/asm/unwind.h
@@ -108,9 +108,16 @@ unsigned long unwind_recover_rethook(struct unwind_state *state,
 				     unsigned long addr, unsigned long *addr_p)
 {
 #ifdef CONFIG_RETHOOK
-	if (is_rethook_trampoline(addr))
-		return rethook_find_ret_addr(state->task, (unsigned long)addr_p,
+	/*
+	 * The rethook and the hook of ftrace_graph can sit on top of each
+	 * other in any order, and more than once after a tail call.
+	 */
+	while (is_rethook_trampoline(addr)) {
+		addr = rethook_find_ret_addr(state->task, (unsigned long)addr_p,
 					     &state->kr_cur);
+		addr = ftrace_graph_ret_addr(state->task, &state->graph_idx,
+					     addr, addr_p);
+	}
 #endif
 	return addr;
 }

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.39.3 (Apple Git-146)

