Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587378;
	b=JSQA2cy44hNafFQLRZpQRLnoSWOzdF30XjsuFyOth0qMlnaN+mtGy/NZiTFTRoaPS5Hk
	 sZyASQ8YPLHstTJo7tI2VMb01p5awIFMIDxuEipletYgBV2PaNKxCpKxH/sUMqy4AecRG
	 YUx483x+tnl0nU1HWFa6SaaAyTZh8O6oJh89fy1Z9rSn1ucmjrfYj48SKKcQcBxAtQmym
	 P9hJI5z4u0GGVgTUsEhE6ijjT7QRTP+xG1z95v5VRor0HkL1OZ+uH+eYexb12jon+M7Jr
	 Y1d60ArfBeOX7I/uC+/nJXsjEMcxdA1wXwD6efugA1m/ILR9BC7ZtJFZrw5S8SNNu3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
	b=pSpRtqV9VPV2HM+KUQCMgjfYNT4KWeCPeRDgjCusaUPdGHFM7Y5C6D2g9aI6Inj8j4j/
	 +WjtJr3JVDan3wE670KOb+s+naIELVXbtmfGQRF+4ezl8N2SuaQR3zfGzgQvEUJZNLfuR
	 WUeuISPi717JQPNbRAvHOuYfiHla2VQIBtbf8GwVudWcbCrdy3ri+tbNr/8cS+/7PRlRQ
	 luG7+4+QLZHl81yRP57nzwmglz7kyZq7LTA66H5+pGvZR6Fcb4xT4O955uM3VzAXGUwxa
	 12KMkOY+DBZF3Bxcw6TAzFErUKg0XKqGbGC7KtwJBKfUuEmBQs3oF82mO1OXJcsu1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dey8gARL;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817D660A5BC3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817D660A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dey8gARL
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso7370478eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587378; x=1796192178; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
        b=Dey8gARL0zl+HK26wbFMxiGBA8YcmX3NlX3SQdJW4Beg8yIFR+ZQWG9yXAbv1+4+LJ
         HinqCqD4ZUypotxYlZRr76P7/2euNfmqhQJIzZsIPHKr+ZtBqZuG3x7TPActSOHvtcb3
         cZbLonVfOAsQaDw3HEKozAsbJGiSK8+eV8PcU0WCfT0RSGK6qoU8LeOKa/OYv51m5sC6
         WJX84xg4RX0hrRx4C1csROeM5fZKSb1roRQhv2vjGEacBZJO4bXRBqfFN0yXweaKNp+M
         SwLSsIRI68ofoCgg7SV2B474VN9kWJ+XLWEBynRB4z0FRuWcbpPzfG2gOrgPqayAm2TC
         6Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587378; x=1796192178;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
        b=mX6kFT7OJQtlgaR1WHay+Ofk/CyCc3mHRiLBIq+meEaEeeyJd3ZX7w60Y8HERMkaEi
         f8xvKbJeqN31WcIDoxQcXl2h8UsuWQ/bS1navtJ9QLsRwu9aTYG+k2aoGWnVD0SYu1b2
         EO4PDSC67VwfM2/BsGR4pHtDXOVB3Uf+Re/6H0irTB723oBxNNDMqtg0bQLXPksY+iJg
         pzDUP4d74Ew4sHcqZSbVRUU4lkY/MnV5UKzE3tBcs69vAFdVhwjbZa4yS5NeuwTNSYEA
         yhYFE3A9qGStqxwfBenSHL44o3ZpPFYPejuntGhLU8vA4oSRZQ2rPOJv2v+fYd13hXNx
         uQDg==
X-Gm-Message-State: APuU4Z+KohjbAYaJb9xU9IueoZiQZOR0k/yrroZRjp9/Ft3EyaN+kejW
	+mHYcGID4N7s+rvWce/F5B63ZCXFMTWndUmt55R3YsraO+3Wor5sYZbsI6u6tPzsxO7DO+23BHl
	UohwBxrOzeSiwbPDDo8xsvsVKNZkxha1uuICfetYiWglDYIDYZcNjYP+MNh0acJ5LzQyEUITPC/
	rrz0AE6iZa1IF7ZwR2Jlye4HdtUhuxySkCa1sMc6P2EB85S6DDLg==
X-Received: from dyba9.prod.google.com ([2002:a05:693c:63c9:b0:386:a06c:3241])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c72d:b0:369:f9c4:1fda
 with SMTP id 5a478bee46e88-38570845628mr15750428eec.27.1795587377097; Tue, 24
 Nov 2026 22:16:17 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:03 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-11-irogers@google.com>
Subject: [RFC PATCH v2 10/30] tracing: Skip internal ftrace frames under CONFIG_UNWINDER_DWARF_CFI
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Calibrate ftrace internal stack-trace skip counts under
CONFIG_UNWINDER_DWARF_CFI alongside CONFIG_UNWINDER_ORC so stack traces
captured from tracepoints and function tracers omit internal ftrace
wrapper frames consistently.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/trace/trace.c                | 4 ++--
 kernel/trace/trace_events_trigger.c | 2 +-
 kernel/trace/trace_functions.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 65b9d67647e5..6d36c790c2b0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2156,7 +2156,7 @@ void __ftrace_trace_stack(struct trace_array *tr,
 	 * Add one, for this function and the call to save_stack_trace()
 	 * If regs is set, then these functions will not be in the way.
 	 */
-#ifndef CONFIG_UNWINDER_ORC
+#if !defined(CONFIG_UNWINDER_ORC) && !defined(CONFIG_UNWINDER_DWARF_CFI)
 	if (!regs)
 		skip++;
 #endif
@@ -2258,7 +2258,7 @@ void trace_dump_stack(int skip)
 	if (tracing_disabled || tracing_selftest_running)
 		return;
 
-#ifndef CONFIG_UNWINDER_ORC
+#if !defined(CONFIG_UNWINDER_ORC) && !defined(CONFIG_UNWINDER_DWARF_CFI)
 	/* Skip 1 to skip this function. */
 	skip++;
 #endif
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index a2487ad7fef8..c79df5b526e5 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -1597,7 +1597,7 @@ static __init int register_trigger_snapshot_cmd(void) { return 0; }
 #endif /* CONFIG_TRACER_SNAPSHOT */
 
 #ifdef CONFIG_STACKTRACE
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /* Skip 2:
  *   event_triggers_post_call()
  *   trace_event_raw_event_xxx()
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index acaba990aaaa..d601fdedceaa 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -251,7 +251,7 @@ function_args_trace_call(unsigned long ip, unsigned long parent_ip,
 	ftrace_test_recursion_unlock(bit);
 }
 
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /*
  * Skip 2:
  *
@@ -602,7 +602,7 @@ ftrace_traceoff(unsigned long ip, unsigned long parent_ip,
 	tracer_tracing_off(tr);
 }
 
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /*
  * Skip 3:
  *
-- 
2.56.1.831.g720f3f5937-goog

