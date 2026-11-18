Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045830;
	b=wYBdesMn/K2J0g52BSgRiWXogxDpmBDIU9xHbeagi38CIPDbptIZlzvLV/xRCFfh6LUj
	 QxlR13nFZXYpPaIwDjdk5hlyho1HaEDHx4PdcwOxMEcexv6oudPW47RR6M96RSIKf9vn9
	 DULUkdR5xqrRgqwvTQiLkLjbCe2rtMtgF4r5KTRn+rU09eh7Rm1vLLarTdEBzE4Ulx5dC
	 wsy9UHs+n1y8j8J+2I/bkFbVivWBLNjTu9NEXVhzMi1z/G+ganTKKL4OVFdS8VGvEPMuc
	 Uq+4cDYixOhAmYAj+HhoDcbUzdqMHHvJYPcqJ2IuyW6WRdcTWAA8HD7yzPg9tTZGgFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ubqPWeJTwTZYZ6JWo58kLzJgB3q5AxyjbXK9VjEgDRk=;
	b=qzWZrlg9fB03ao5S3zAeIy2EhY2/vGTcqFu8A/4IzoQscxkD7MsXk9sUQpC+zBPNMdZB
	 JgVWTwHqz/aFrLVB+lrkBhFjkNs1afVPMermc4RScoHAbBr98ZDrkq0ZsiZ9wt2mLczye
	 qMSQdfFGdVxLc+dyfvSugrjKjGyl25AliTXrDUbsQGRxsP+t/A42bR+jjumeAeK0nD1gb
	 yHbyhUlbgjrCST+Rlnib0YbsPQ9aZHFK438SrdiW1krfcV1Sw/UZwlypiRFGnHQXEfdSS
	 4evdWUNGZKeWg5DXdRSaMAtI/+LjejnhU0avYtHo5FRJeIf0u/0IS9fVH5PKgj7Uh8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LYRTzxuC;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBA606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFBA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LYRTzxuC
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-86288992de5so292185a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045829; x=1795650629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubqPWeJTwTZYZ6JWo58kLzJgB3q5AxyjbXK9VjEgDRk=;
        b=LYRTzxuCbuF3jxZspOIrUliZwI5TbKqNalpuAbdLkvX5n63pZyStvF+GmWdcyegdQl
         /ACtj+R8aFsPHyLkCJ7qZZFm6ugLgJPEx98LcKCe16kwGONA3z8YcnHoxfSWlxoidqRS
         sjFgoOWJ047Nhf4eXxOH2XW0kjr/BoXhTboP1EhMxU64piB+hA5v9eTY3B4AF0x3Xfu4
         IoLYauYPeJhN3ujc2nB3VLpXmbbpXG19lEKLttFNxMj1C6osaKimsJ+i3FpRPIzpXtll
         d4B7Leca7kxcc0BxSanYk5KugpNWxZxMaNSoaPnl1SMwm0+7SFcWubVj031N7H5pTeOl
         4mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045829; x=1795650629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubqPWeJTwTZYZ6JWo58kLzJgB3q5AxyjbXK9VjEgDRk=;
        b=nel7YXctXUMftiSzVN4t6XkHyrpvaDhbvc+ZC1BBhuA7++3lBE/ivOvhxEJcXFpYYI
         6SPHny+4JQYqh+A678ybaRqRwdQdMzhxVqQqHdZ01XwsdA5zVZ/TPDvwIC8gUTimWYlG
         si58UJtSFufyYEKIoaAyV7mQxlh536AoI+u88SoIDltgx7FQDz8KpWHYDGeDFZys3sWC
         ushi8k+iBptIAP90p7mr3y3BlawkctkgKEljCgFwsYUxEd7MTLwcWDVeeP3eQrC+/zni
         GqHbSBa/+r23s8AfPjXdS6ayR9Ju1Nr9Gt/favD02nf645iIqiXl157igs48I0CvyJfY
         ssYw==
X-Forwarded-Encrypted: i=1; AL+hErHeUZKmBn5EfdOm5annIacJj4I4PnWlWtPcEULDmX8xNfvrN718AJf5YuELrWLchphJ5lc4JXZRVnoGxkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c6vSL5M/SfacUpYlxyfRM+efn2RwBzU0RZ6W2m7z5I5ATz1E4
	jwA9Vcwtchw8kAAG73W9Wy+bL1R/hv3+XtLiRNIu+FsuVVjBksz+bIKc
X-Gm-Gg: AYBFou3iSh2oLDQ6RNuBEK2zeajaZrS39tltJERwSEs5B7smdelsEZ/2gufJjXfgMM1
	EJwMCrrY4Fnh9eAUmr/nqBDoiKRUQ+S/9T2xsefiysj6dHCxX3EnyIxx74xC17QOSwe162yQhi6
	kw1P7FP0glKWFaMdMmCbRDnOskOy36Ik+jbJjQX8APKJ64e8yEW4YA+eryL+eq3x62KAgWNpAiF
	K7GVriPGVCQTC1WCh1EpNAbk3OjSXBdZAQRCTxfX0TMZqohxY05Kv6OWgk4Yh2Kn0kZNVIcPTMC
	P6rh7Fns/jSNBVfW2h7KdMV0P+/iPw5Vz3Ita2O05oKOivxoKFZQM7LhO0AA2OxhvAgyRVZd72T
	9AbRAyQBND7ryo/7BMMXtrWbgsrjpgr6aqAwX2KByvot9JFmilzhbJFZlx30p+hCeXR/PIldJyC
	bljX1Ywfk6uha/RQ8OedVxcrc2v7MjpxhIJ1BXzsn3KHrr/weD2nAt74IChBPJd4jM08KPQa/lQ
	D37lBRiRXXQBfmVgLi+fNiJOMa3PKk0smzG/bHHC4KTE20D8HQkoISKSjwduEaLJkznhqpfOUMN
	KUTsGPXwCLMhQ9THCA5gmanXygtABtaa1bnj070OxipYIshozL63qi+BGm0FnreIi/tqggqH9z6
	0m/dkIw54zKkuxEmEO4GPauj2t/V3rVyPR/x9mw==
X-Received: by 2002:a05:6830:6413:b0:85c:e511:ee04 with SMTP id 46e09a7af769-863040ea2e9mr131360a34.16.1795045829136;
        Wed, 18 Nov 2026 15:50:29 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f00891e6sm3102871a34.0.2026.11.18.15.50.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 15:50:27 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Jiri Olsa <jolsa@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] x86/fgraph: Fix the unwind hint at the end of return_to_handler()
Date: Wed, 18 Nov 2026 15:50:23 -0800
Message-Id: <20261118235023.14978-1-evanfengff@gmail.com>
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

return_to_handler() reserves 8 bytes of stack for the return address
and marks that with UNWIND_HINT_FUNC. The hint stays in effect after
"addq $(FRAME_SIZE) + 8, %rsp" has dropped the slot again, so the ORC
entry of the following call has CFA = sp+0:

  return_to_handler+0x41: sp+0	call .Ldo_rop
  return_to_handler+0x46: (und)	int3
  return_to_handler+0x47: sp+8	mov %rdi, (%rsp)

A stack trace taken from an interrupt which hits the call or the mov
ends up at that entry, the stack pointer does not advance and the
unwinder prints:

  WARNING: stack going in the wrong direction? at return_to_handler+0x46/0x50

The return address is only in %rdi at that point. Mark the code as
UNWIND_HINT_UNDEFINED again, as it was before the hint was added, so
that the unwinder stops there without the warning.

Fixes: 20a0bc10272f ("x86/fgraph,bpf: Fix stack ORC unwind from kprobe_multi return probe")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
QEMU, function_graph + 20 kHz perf callchains: warning in 2s before, none in 10 min after.
Found and written with the help of an AI coding assistant.

 arch/x86/kernel/ftrace_64.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 4b20673a3395..8b488f99de02 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -387,6 +387,8 @@ SYM_CODE_START(return_to_handler)
 	movq RAX(%rsp), %rax
 
 	addq $(FRAME_SIZE) + 8, %rsp
+	/* The return address is only in %rdi now, the unwinder cannot follow. */
+	UNWIND_HINT_UNDEFINED
 
 	/*
 	 * Jump back to the old return address. This cannot be JMP_NOSPEC rdi

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.39.3 (Apple Git-146)

