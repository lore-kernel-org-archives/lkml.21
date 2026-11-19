Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090192;
	b=V2BkHwy8d5U8gq3KK/9Upryh1fRMZJbzXD1fSD5VBfgAqb85Rcmz/MX2c/yxEVC8iYMt
	 hlaFVIf53/6u8QM8K6J9Sj04xvsc9WmhveEaG6weLc6Z/Va+e4vBGCqmowrlz2OY5hjdc
	 /JRUJIIT51pQO2wc8EBLyRaxthj2adhoyM8b2iwUK+51+mAmmpKUtpOSKsoXAY9xrcoX/
	 9O6FV4pXbkjifN4fWWaTM3zrfdBxTniLLkWiJhpSchLNzcIzkxiJr5Uin0pxP3iNfkTej
	 9WwDlPb9G/ByYaC1YuZXHQkiCFuMnGDpnQRaOZ8Kq6bNAirad5fnH53kYbxJ+q6Tn8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
	b=MB4V5DIKYsarinSBKrcd0CjkTvzLh1I3N58uOIZbliYKcy7G3UL9v88GSwH2x05O+r5D
	 2Es14PoIdvirDunkGCPAnZKF0fvEw6enL+XG0BjAf0zL2B7MaJYmc+8BrdIKqvpuNIMwn
	 fXwhMNeBcSI+VTiT0DmlbOQ1Xo6IaQWAhazQRoQvt3xo9Ikf0LELXzyD/eKgffOlKjZic
	 GNAiv4u6SK3UzM6H8T/VCvI2SMq1gqscNvBU+CBNWjApvBa7q0hicHUnos8JTfAUYxWUW
	 tycs/wobjILnE7UvxZQJYq2AB6Ugwvn1slC3VjxbN/i3QctvaiL2VUgt9Bui7EtPQ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="i/y7IcXf";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF24606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADF24606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=i/y7IcXf
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so3703188eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090191; x=1795694991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=i/y7IcXf0zwGemgiNsqbgyLlyIpCBg5BrC6MYRFbLe0zMMYdR8CPiUInf+YtUvRT9B
         aS4uZ8O9wweMkDuRslNIlBBlX82ZeDuEOtJCA9YrxpD3blREpKkin/J+UDO9DSEUPYex
         Cdk3dIpVaSuZRKs+RJDPkVA5U64JWxulVXNjSTwbfq7S56j9A7IFy3SI9jesgcJQg/9H
         vszmXt7E3onYqEHwJckgW8fgPKNcSdgQ2BVKtHfsAJRft3COEMgzzgfAOIxeb6ZBmkQU
         tyBVnCqpSyAO4MzmPBgjynxwWdvW54oY1zvkPBoyh5eVbJcy1eUWJR5yBmK3ktI5ZJE3
         09Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090191; x=1795694991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=p7SELZHYDI4eFI75Vuqors6UXJsYEAoT24cpEhppvWNVU0VwVb6P9/ciSeBQ2XMV+4
         M5eiEAF2pySeVmq7AXETAUyejW9z8mKsUbeiF0ZvohIKLTVkhP79Z76c2Nl3Z/auSh3c
         PkGjb7uhTC4cdXIxldWEFwU2v5sb26ElMR+yyjuxkXY1qDb5XcS/qydHxLpPCTJgQy1U
         Mc4KNpRCjbT3ASGYfeCsc3AOoyss5pYIIjzuvz/kK4WSDVGh+PN2uPrf/ftSeZ+TNDFB
         gdi4eiLwTX0b0Xnq931fDWqNCjVfiESn5bz2y9qzVxYF8czyAaqcAMrlpLO1tCCDe7Zx
         rUxA==
X-Forwarded-Encrypted: i=1; AL+hErGiykxe7hd7NsWojgrn6u+ijh7zi3d2J062Rh3g8FR9rx2S85BKk1TDE6filOGhVgq8pDgwVqV1Z24gR3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iC3UfM5/htLpl8x1M9aOE9yjCFRzuSHS6RLpIb2acdW6XI0+i
	MhAwF7EAYKNRll3lZJ8XEvNRsGNzjK5kBlnve7A1uaQT9xxkzahg+oN7x/5+eZ6rifU=
X-Gm-Gg: AZFdTZdMaem1pvD70Y0ztlNRVXuyot4p23dCjgevmAh91FGkcbknmmpHL7PvNR91yil
	t+pFoKJZOb6+VW7EUht/56JXbA+kNNmLjZiaM1ZC/+/1Ea2CiRtv/NlXkvRr36QM412U5derIsN
	8/s1ZPSX92uUIxHrl+z8cHg3FC9+cfBZ7usZllEF0vhQ885sfKn6WCMdN7/TKovUjUBA0AxsbDf
	5x7Uvf4YSmnhJEW0ZAR0HKPZxVey8HtrvqeiAbKyV1NX4/n05XdYVNx5QAMNlBhP/0XjJO+Kjj3
	VLvHi9ZoGnXrJ7m9QOzAz9mVZ23nyunUscA5DsCytFCpDKMHTUh7JI4s0QryKVckpKMNbGUZBhz
	loMlFNY9uQKB8GS/g8Fb2/oBF2Qc3CSGWDZ/X/jLpkhzIlDzo0oLtmtCrmVOEjtgd+K1ZQq734x
	4TD3bks3O497FQnc2XReHgEMx/4BqNjuzgKQkfHOxyPSJkVMOryx9TVZuCJoQP5TCTKj7WUmaaA
	pHR4IBENHUTVgijxhuR2bZBMkMrIdme4Gs5AtNZ9V3/VIl3d2vNQcebVlGErePcBuQcrIaamCLN
	7Grid2LCMw7nbWMTY4sCZjRMXeZhbSYsMtYeBPvarJTiqxot7Gft+oezSwNNxt5udZMuhSfLv/P
	b+RcBbvI=
X-Received: by 2002:a05:7300:8288:b0:384:6487:b155 with SMTP id 5a478bee46e88-3846487bba9mr1500897eec.29.1795090190796;
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
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
Subject: [PATCH v13 06/11] riscv: enable NMI-safe lockdep irqflags tracking
Date: Thu, 19 Nov 2026 20:08:30 +0800
Message-ID: <20261119120824.13969-19-zhangzhanpeng.jasper@bytedance.com>
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

An SSE handler runs with interrupts masked, but can interrupt code whose
lockdep hardirq state is enabled. Bare nmi_enter()/nmi_exit() do not
update that state. Consequently, lockdep_assert_irqs_disabled() in the
perf overflow path can report a warning despite interrupts being masked.

Select TRACE_IRQFLAGS_NMI_SUPPORT so lockdep can update its hardirq state
inside an NMI. Pair this with irqentry_nmi_enter()/irqentry_nmi_exit() in
the SSE wrapper: these helpers save the previous tracked state, mark
interrupts disabled on entry and restore the tracked state on exit.
Selecting the configuration option alone does not perform those updates.
This follows the entry helpers used by the other RISC-V NMI-like traps.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/sbi_sse.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d2db8f40c616..5501c02a07eb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -225,6 +225,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
index 032fcc07abcf..59e47a39589d 100644
--- a/arch/riscv/kernel/sbi_sse.c
+++ b/arch/riscv/kernel/sbi_sse.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025 Rivos Inc.
  */
-#include <linux/nmi.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/scs.h>
 #include <linux/bitfield.h>
@@ -36,9 +36,10 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 {
 	struct riscv_sse_interrupted_context context = { regs, hstatus };
 	struct riscv_sse_interrupted_context *previous;
+	irqentry_state_t state;
 	struct sbiret sret;
 
-	nmi_enter();
+	state = irqentry_nmi_enter(regs);
 	instrumentation_begin();
 
 	/* Retrieve missing GPRs from SBI */
@@ -84,7 +85,7 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 
 out:
 	instrumentation_end();
-	nmi_exit();
+	irqentry_nmi_exit(regs, state);
 }
 
 static void *alloc_to_stack_pointer(void *alloc)
-- 
2.50.1 (Apple Git-155)

