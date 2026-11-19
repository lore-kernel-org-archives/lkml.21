Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090180;
	b=wxo9OmpW6cqa25cdHau2V5Kzqfwj9zxlj7oFmJyRe9bkYgCONqO0Oh5Zdxy/8Wi/SeqZ
	 w0RG5rW3Kvtvoh6VDzq0N/tglBANWCm7pvPpCQKHM1VeEP0YSDt9Xnq0LOMrHXT4jR5+h
	 0+4X0Zoz3F3G+KwxiKkor6RSb2+3U6+ZRzuWp1ziH4ceY3sgj2yAp43P795jBW8db9B3i
	 1MqlLcONS7WBLID6ujO6JyfJJR8BDFUlazbG2hCxf4vZqMPlHI6Zeo4dzgqfdRIoCQTDA
	 MWNUYQpN+X/ExQ3u4i+4Krxjk2bzh2owWWUxIXEoAwtB6jzWergFuWCjYypzh4q18lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
	b=xH96juwbvCcEPb1ubisDVrLY6syEsFtQypQI2gF7VeZCBnWVU6SzrNGcxGg937fL9GHV
	 hxPkYbC8jU2xJdIb85j6/DgnStAJXImj+msqLPNTh6b9/bxR5/So6mbuIRJ1xRo//sl0j
	 QqAUtWMukx6fpv48ZEzGxRZD6NhFr58wbcbUIxBHv6ow5A992OeC3WFmWGcEzKdeMrrnS
	 XLpZshZYJ+OsU5Eju99N4YMlaTcTDxgmLA8DTd0T9yzi1tWYWIozbU/vUr54Uov4KGrx4
	 WL83YHaTuNM0nBbnVWTDkqmw1yfQnLVn//xR3L7NkwtDm9zxds/hj5Nc9jF/5uraD7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LM9bUZT8;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AF606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LM9bUZT8
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38431138772so1026611eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090179; x=1795694979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
        b=LM9bUZT8k3cGQJUUG7eD43z4pVutnUr27pPDXThESBxF7ZhMDdQUWhvcDgWnH9XxKH
         mchcPcBrOACFSfMTAax9uGAMl/WAwjASV3Ow81p+FYSCxq5MHkXXSTlHHj7GmlZnx1VD
         dtFMe9dqMhyJrWIOXEpz1ERAEf+nSyUbpXUlm0Me8lUKBbDn+pfiGZUhP3r/z1v4qmsX
         wAVTe3e9+H36PDiUul3i2jiL6l9l9g1HcOenQ3o0BwbPmyLLJOLJRuQMFaLgg1fIek+i
         xZZ56Jr2OEosC+Jpuz3NjANLOlP+wJ86nQAgEwllXqamti7QjNw7EJN3HDUb9/EHpvlt
         yfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090179; x=1795694979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
        b=RGgoQab0+0pqIfVv3qd57FH31LMKTnYJ1mgHSTSQVbs7oqnNqqr4YAbBMu4B7PhljA
         0IMG6X4wXILqU5XjM7z/nVeuzYZlzEawWzp2ZTBFs3/wAP687+JMce7qJVykZBQTtPRu
         SsiS7etr4qu+GzGFKkPAtKMx7Ct5E7BK9HCyE2wpHw6Kwy73Dd2lzvMWeJhCShg7c9UM
         mjUiP/ijemzmKvOC7C5yfxPILEubBGcx7K3iK3wTpytWqQMdaXm84nwoX287Phs3o2yt
         /yoYAgAgC2A2iYMO4ZFkaEYHodLImIk/LWYD7HS3LdILXldeO5Ee0v/krdxJ+dYaClLu
         GtpQ==
X-Forwarded-Encrypted: i=1; AL+hErHERp861TTsXDHPrEPoBDfdilbfU8RFVyjW2tfvcClcl0rFanhp8xJl/iGNAO18U5f1pGgL8EAKiLLzV5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R8Jg9b8NpGei3m6NrC1XbKMIm0xIUnCJ4LDP3Tl4cPcbproR9
	P0z+vD83Aq834d5Ncfczv7461cOCxn/+ahZrToIXGxx3BvRh4bhBg0yt1fB65mfwwCg=
X-Gm-Gg: AZFdTZeZAHalEbQLQKDf3be5sn7+fGN2cGDsCmGkwShmv/mbfYgCTggnXbNYhIf2WiP
	x99Ypz2EoOAA3DVJo/tj5ryOLjp8S0aRFpwQnuDZsI6rgynoCWWTA2A+8UXYbuiNMPibGSw4Ovh
	aw9kQJNj7zMbPvJZxXp9f1P4tDsjDIQix8j33HsC7oGzCegW6y7y6YCYfw4Mp/RUIt0eeaWWQHG
	CNNbXkUFdCfvMXP9+z70wbs+oxvKXl2x/F0N4n6DhuVt+d5+uduzsd+yyFLapLyc+PNUsiAW4Jr
	YfEoQ9uglw7f7wCQagJe96FyzWAFUtvw3rdDCo2PySgoOeY3RalENlEFeIrxN0gUIVzMHCD5Ulg
	+mZkvZjsS16ZAUwsU6Hsyqxcyk3oThv/E3lGVDVlZs6BUvDPtUj3yNU6yZDt6FbIqJr3mIxmSXB
	sSpOt03OWvpXXp5Qr9aoVfbcuphI4A0D++n6QZYGfsI92LZ05T8y9Ei6NobWhf1R+ePELavKKHC
	BRRp+XnKULNWykP0zEFrLsq1MSTEkR9v335zjhK4rEq0QoRebPSqW/Gbyu2or5Emu4W9dEE5eJi
	QaM0o78R9QSJ8zBJ4h0g/9YjwU4rwqPL/XliPZj8kjcIdydVyyrlbObtZGb9PH5yVnHMOVdxytY
	b+2oidt8=
X-Received: by 2002:a05:7300:b594:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38281eebbb1mr6614536eec.39.1795090179031;
        Thu, 19 Nov 2026 04:09:39 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:38 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 05/11] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Thu, 19 Nov 2026 20:08:29 +0800
Message-ID: <20261119120824.13969-18-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
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

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

On 32-bit RISC-V the vmalloc mapping must still be synchronised into the
current page table before that fixup runs: otherwise a nofault access to a
not-yet-synced vmalloc address would take the exception-table fixup and
fail spuriously instead of being resolved. Order the vmalloc
synchronisation ahead of the nofault fixup. That synchronisation only
copies an already-established kernel mapping, takes no locks and waits for
no I/O, so it is safe in the nofault path; if the mapping does not exist it
falls through to the existing no_context() error handling. This early
return skips the page-fault tracepoints, as before.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..3934248f7a27 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,19 +294,23 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-	if (user_mode(regs))
-		trace_page_fault_user(addr, regs, cause);
-	else
-		trace_page_fault_kernel(addr, regs, cause);
-
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
 	 * The 'reference' page table is init_mm.pgd.
 	 *
+	 * This only synchronises an already-established kernel vmalloc mapping
+	 * into the current page table; it neither allocates memory nor waits for
+	 * I/O, so it is safe in the nofault path. It must run before the
+	 * exception-table fixup below: otherwise a nofault access to a
+	 * not-yet-synced vmalloc address would take the fixup and fail
+	 * spuriously instead of being resolved. If the mapping does not exist,
+	 * vmalloc_fault() falls through to no_context() error handling.
+	 *
 	 * NOTE! We MUST NOT take any locks for this case. We may
 	 * be in an interrupt or a critical region, and should
 	 * only copy the information from the master page table,
-	 * nothing more.
+	 * nothing more. This path returns early and therefore skips the
+	 * trace_page_fault_*() tracepoints below.
 	 */
 	if ((!IS_ENABLED(CONFIG_MMU) || !IS_ENABLED(CONFIG_64BIT)) &&
 	    unlikely(addr >= VMALLOC_START && addr < VMALLOC_END)) {
@@ -314,8 +318,20 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)

