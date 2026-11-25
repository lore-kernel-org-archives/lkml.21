Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587418;
	b=wQchGBg0j+G+SGagZdUjcjGh+2o+dXajn8xt8K643mx288n32wFCSZTlGa2opgbXEBpM
	 1tQ4FNrBqaOurrujqIyz0SDBgowM/yd6Zm9zkG+PXhPqbDnrsYi/4Bxsoem4Rmn+QZf/L
	 drU7K+GehlcGfiZXd/v90Dg9BTjsLP8EMQPKvh+NHo4v5S4taa8XolRvaqNQU7GItkRAI
	 v3lJR+Rl7bIUxJTrxI+rgnStqZsV2idsF8x4Tt48fHUqH118QJD6gvEoElZKvH7Z9YtN6
	 lDyI04wOi06XHovoKAmxnsb+FJsHcjiSk1nzG/6ECaO6pAQTaxzALSOD+eRbOiog+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B0szZcyaY7NP1HowgKnJWSVhbM1uN8jco8rE2rfxzUA=;
	b=Doz/VIuYW3fk4smMOMmG9d5+++dpdT4fpaqoksgRc6FeCye7M2zxBlNZX31GJIJQiSqy
	 7EopBKvciikDcdj378fhTzE004qkXp4YBjbz0nPADyuXPyIQX8M9RL9QdnCa6NSK4075x
	 Jxq3ul3jGkRS8ftPkVv57SHv0QTXN66VrjT3nEdNbNdDA1gOTe0yh1Ch5mq69PZfHHYNH
	 rmJvDPtqvqw0Gj/Nriqyd5Yfq5WlwRtCgmuiVFq9vgINdG/wsSLSMZNgC3A1te2XXMlJl
	 qgLVG8DWHgFzy0GrT4/Ab72SuCWrUG4pbI2/NHIPJEEohbbHwhp5e6/w1o/5tA1fqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LJpTIGT8;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445E9607DD82
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445E9607DD82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LJpTIGT8
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cddf142187aso2605951a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587418; x=1796192218; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0szZcyaY7NP1HowgKnJWSVhbM1uN8jco8rE2rfxzUA=;
        b=LJpTIGT83cKcxQDhhMuek4OwdgkdQKkLxYONCLmTepeyOwwiDEqpA9PI3PrOY8XcnW
         qBDwpKFXtz0XIpAR5Dq9NgplU/l2p/ADVoH7Mm5ymwO7xGNy/SpVvRtOaXSdsLLi5G25
         i79iMt6EXqwRF1s3apdVBesej5O7itpdAfaK/CheRhK+FRwAZgRLX/ob6cSskRGhwqvV
         ZWWo8Me1Ubrs4vQJqXgefYbt/X8NmL0zrd4kz2ZMiZlml0oGdd/AuWxGQnVIhh1z+uZh
         pzdWsnNoz6uGgypKUUOT4Uf8kjKdew9+9OF4Nu8IUXmfkp/lVmFql3ye6f7qmIGe1LLq
         chkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587418; x=1796192218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0szZcyaY7NP1HowgKnJWSVhbM1uN8jco8rE2rfxzUA=;
        b=oRdGZX5rJ64P5sH0jWs6Qr7sP9Nb1GDEiHd1DLWnyGqA+C2EqH6SmtdnMLFhcZ9C6w
         EAuGl6OC7g+dGAOUl5IAveDjSaIZ23yITVycpD3im+gIuATecDNsWVhUaPYWPo7ovtQD
         UrtnkLFxNCz9IKaefuupkgAJzKKriCLlRokAxVLEVOf+czjFoSoHQggrYeiLBBRldDFT
         txc0xqAiFzyVQbVYF92va8bpGKeoEXH3mIXoUxld7LmA6duFEIJEabgXkvOmoA6gGdwH
         9+G2oIHYF7IoW9CFRotrIFDjGT/ypwcKuIRhhVFyv5gXZVwTGvrT9SanONAL4ffPG6tU
         Deyg==
X-Gm-Message-State: APuU4Z8BXE7UotdzZ/LKt7vyUqSs+mQENm3gvhbY2Wx3XqmyxLBB2lGh
	9vOhWKoqRBmOgeSC/6aIsdICr2LliPcywfR+QPR8SiAtppaI1ZuzHwWWEqjbF32TrUOTUf1KKFA
	1fxLAI6V1/3BO/CU/EBnmpihKEYP95cVavPs00mMW/0MaLjbMpe9tI62vtsCPRdgu+D4BMTa6iv
	aWue+p5HOI70Y8j7s80STpiA+SWOu88Lk3zLJxkTcaP2fJ8OCv5g==
X-Received: from pgin21-n1.prod.google.com ([2002:a05:6a02:8795:10b0:cdb:932c:948b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8095:b0:3dd:85a8:cac8
 with SMTP id adf61e73a8af0-4014c949c92mr14160775637.31.1795587417428; Tue, 24
 Nov 2026 22:16:57 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:23 -0800
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
Message-ID: <20261125061523.1540234-31-irogers@google.com>
Subject: [RFC PATCH v2 30/30] MAINTAINERS: Add DWARF CFI stack unwinding entry
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

Add a MAINTAINERS entry for Minimal DWARF CFI stack unwinding covering
the core .eh_frame / .eh_frame_hdr bytecode interpreter and KUnit tests,
the user-space PT_GNU_EH_FRAME VMA unwinder, the x86-64 DWARF CFI kernel
unwinder, the build-time .eh_frame minifier and analyzer scripts, the
standalone tools/unwind/ CFI verifier, and the deferred user-space CFI
kselftest.

Also add arch/*/include/asm/unwind_user*.h to USERSPACE STACK UNWINDING
so architectural unwind_user headers on x86, arm64, riscv, and future
ports are routed to the user-space unwinding maintainers.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8..0584279d745e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9496,6 +9496,21 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/usb/dvb-usb-v2/dvb_usb*
 F:	drivers/media/usb/dvb-usb-v2/usb_urb.c
 
+DWARF CFI STACK UNWINDING
+M:	Ian Rogers <irogers@google.com>
+L:	linux-trace-kernel@vger.kernel.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	arch/x86/kernel/unwind_dwarf.c
+F:	include/linux/unwind_dwarf_cfi.h
+F:	kernel/unwind/dwarf_cfi*.c
+F:	kernel/unwind/user_cfi.c
+F:	scripts/eh_frame_min.py
+F:	scripts/min_eh_frame.c
+F:	tools/include/linux/unwind_dwarf_cfi.h
+F:	tools/testing/selftests/perf_events/unwind_user_cfi.c
+F:	tools/unwind/
+
 DYNAMIC DEBUG
 M:	Jason Baron <jbaron@akamai.com>
 M:	Jim Cromie <jim.cromie@gmail.com>
@@ -29300,6 +29315,7 @@ USERSPACE STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	arch/*/include/asm/unwind_user*.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
 
-- 
2.56.1.831.g720f3f5937-goog

