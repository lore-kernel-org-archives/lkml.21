Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577847;
	b=p1dnCqXzUFQ/DegXgGM0Au+74hpbg9xZ8nS3rXHQ/GgYgcuLnnmbQkPDPzdfyzAAOElk
	 j2mtaGprjfizUdlchasBq+SBdn7JWr4AoNpl4E5LBjCfvmkIj0wGv47CyhLmf2GxQpbHI
	 yMr/+D6Lf7aJIAerUz6ycYV1OKq4p3/BlG5Xgb58Rr4/XIkCQ8QWXzfJV2MZnOpvbTdNy
	 gDT78tiT1bD2QMtNWV5fAxtttsaT3LSdrUmtCz0JLvuk8dUjeabhlw15yYjX0oQrBHMa7
	 aLaHfx4kln0LTdb1LVyHFGRvDVOvizsy8oByRg3B1YxI54MLUkOfkN3a+U6Ca7hNT0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577847;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Dn4Pl/vSqDKbDCHRYWbo1ykykLKkAdX5FKT7AzFEyp4=;
	b=WxfMrCCbyLTXcLPxGUn6/94FyvWaWxtiTEczgC6L92ySALuy+FuXeeQLz0WX3vVpW370
	 iPORoo6RScP8N+QbOjcPYLLcjt3spiiv1XbK6f4SDxPxkFfdCeZrnyF1Qgg1F5hJuKllW
	 4W4JNnmPCwahIy+IToJqhSfmta7BxkgjaHKwT3XWsHmzv6M1DzqdVQc/hq55ai5h0utBM
	 Ba1YGVnraBr5DOvBPgaTshsoL++j8Wv8/7jhWQDOb5t6OIrG5qqeFjvM6tQPBAzkg9X5h
	 duk7b+tWdhWaU5MhVyvSATioMsNkhM5GUiwMXJfYsvFsYLQv6tFxBbHceVlxj8KvhTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HdAz0KN8;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41750606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41750606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HdAz0KN8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dn
	4Pl/vSqDKbDCHRYWbo1ykykLKkAdX5FKT7AzFEyp4=; b=HdAz0KN8YcOpEFxeAn
	kU/BtjfQ52e1uqChW04umz8GrHSd1NLSo+VlhqS2A8ZFmZipSoilauKkuz1I2SRi
	Udskl9fnFvAXJXqMvR8DGCzE2xHVea3qZNOD1DNQ+ztBa5+FYpLQK3jxZqtkmV2S
	e8YYStnvZ6IsG3olO883TAw5w=
Received: from atx2 (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_6jGVwZrc5xjJQ--.15963S2;
	Wed, 25 Nov 2026 11:36:50 +0800 (CST)
From: Xionggui Chen <evers_chen@163.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xionggui Chen <chenxionggui@lanxincomputing.com>
Subject: [PATCH] kcov: Defer PC canonicalization until tracing is enabled
Date: Wed, 25 Nov 2026 03:36:35 +0000
Message-ID: <20261125033635.3990-1-evers_chen@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:_____wD3_6jGVwZrc5xjJQ--.15963S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1DAw4DJry5Ar1xKFykKrg_yoW8CFyUpr
	s3W3srJrWIqFy2y3srJ397uFy8G395J3y7CF9rC342ya1a9F4Fq3s2gw1DXFyqqr4kZ3Wx
	tFZ5WFy2y348ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzpB3UUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7BNmcGsGV9OXZQAA3y

From: Xionggui Chen <chenxionggui@lanxincomputing.com>

When CONFIG_KCOV_INSTRUMENT_ALL and CONFIG_RANDOMIZE_BASE are
enabled, __sanitizer_cov_trace_pc() may be called during early
boot before the kernel's virtual memory mappings are fully
initialized.

Currently, canonicalize_ip() is called before checking whether
KCOV tracing is enabled. On RISC-V, canonicalize_ip() calls
kaslr_offset(), which accesses kernel mapping information that
may not yet be accessible.

This causes an early boot load access fault even when KCOV
tracing is disabled.

Move canonicalize_ip() after check_kcov_mode() to avoid accessing
the KASLR offset when KCOV tracing is disabled.

The comparison tracing path already performs this check before
canonicalizing the instruction pointer.

The issue was reproduced on RISC-V with Linux 7.4-rc1 using
CONFIG_KCOV_INSTRUMENT_ALL=y and CONFIG_RANDOMIZE_BASE=y.

The fix was verified on QEMU and RISC-V hardware. KCOV PC
tracing collected 124 entries, and comparison tracing collected
63 entries on the RISC-V hardware.

Fixes: ded97d2c2b2c ("kcov: support comparison operands collection")
Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
---
 kernel/kcov.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 9402227bd7ba..9dc8ce9f7563 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -216,13 +216,14 @@ void notrace __sanitizer_cov_trace_pc(void)
 {
 	struct task_struct *t;
 	unsigned long *area;
-	unsigned long ip = canonicalize_ip(_RET_IP_);
+	unsigned long ip;
 	unsigned long pos;
 
 	t = current;
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
 		return;
 
+	ip = canonicalize_ip(_RET_IP_);
 	area = t->kcov_area;
 	/* The first 64-bit word is the number of subsequent PCs. */
 	pos = READ_ONCE(area[0]) + 1;
-- 
2.53.0

