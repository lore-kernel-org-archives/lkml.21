Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335689;
	b=AuBy9Z5lU3dA8GrrUl2Jp1/ai+QSYVN4fk4S2zpVJIqG1KjlQaCyVre8vCwHrWEjaAp/
	 FHi0LLIajlvigoi8zGETjkoJf+uxMC2E9uwBXZxuxb+5ejT6No2EeX5vc6tNot0AeMzxx
	 FtkqPUGnT5t5pdsjtL32kqpFKvorYnVP++7EQooKXr2sQQFGG3cfzs2hO6Ms2mJP2B+tI
	 fFjmbGYow/oZK2Qp86jXOyDI5xU8TU2vBTxyKeVyqwoTto4wNiQlXMAXM/lGc1AshVuv7
	 mL6Q+d/kmay+GBg+gCgjGUavuuIuXsFlpoi7jIcY+LPc9U4afz0urQ0u29TMvkSjGsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O52id1vP2OUILCk7HYo2vnwJl3jwq5cnzddDtYYJKmw=;
	b=0DExoK7n3lLY3nxOU7aJhzpSTJ+xTLxKvdf1Oj6wu4hI1OPOiiF3ygbk5cc0Mq6d8U/G
	 jLp+Zf7M4nT890KjmwyXLbOFBbjfDk4MfIZzzoV6GzU5YomaQRmtWGGHGyHJRAPG8lL1R
	 BxMH1ZrWTn0sTsTViS7yw//p2Kto/dNy4/bNkiQqLE7kLEphddJ1+KeyzmYAJhsmjmLCL
	 S8xEY9ZRKtf+fCTKD2MRWbTacksZMtSxG+VcF6fpyN/C2r7U53d+E8GFbOP6X9OUZZf24
	 YHKcY4+5ZDBLqDzYc6tF++Lr9g1zmJ5vVnR1gXEFLsaGlYgab0B2SHizoiqogqLA6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcOV82w+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38E606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F38E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcOV82w+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5074886eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335688; x=1795940488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O52id1vP2OUILCk7HYo2vnwJl3jwq5cnzddDtYYJKmw=;
        b=rcOV82w+QjHd8ILFmtDWyo1vMDsXnq/k0/Zv705OXVDDyKQ5doij7kWuj5Ryx06SVQ
         Q20Hc6vF7VJr33HxEfvur0QqAe7X0t2AcLyDIBHhKG6y8KI3v4M6efsfvSodAtbCneH/
         lR4ZHsKaT5KxNlUSIGgmO9dbs7UnsOKs1LQIc0eupfgz8jZQ80s7u3+R9e/OxzHAS5cc
         3sNKEGdArp4yptbFeg3+KgJxSCIt6nT6AtjdrTs+v8QSLLhr++vdBGFdlcpS1Iqi/1ZN
         VEHS/8nuJ9/VQG8cB1TCM1eJbtrYQuc0ctlXKPGJS2iearGBmmRSrIz3MS30q+f96ISy
         ChNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335688; x=1795940488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O52id1vP2OUILCk7HYo2vnwJl3jwq5cnzddDtYYJKmw=;
        b=r4uj3LC7jM+iRqYqAmu+i0zz209JR64K/tNf/iIORXfB9gqo4iZg5PrC9XFjJFf/Ai
         IbDm0GU0a4zgeez4pQX+3+9RyNQl+0iquepVL2pIk4e7zy0tutIHXcI4bj0P3U1xvDQn
         yACA62E4NJb499CMq4pBwFmVJBaEjxJBm+2KAHJZy443sgtXKK+sQRrBEW636nmgt+6R
         aDCmi0lcjPPtsLOg/E4P/lXE5eTocbQ0+HjzSBmmpzBubk9GrcsaHmZNwQKOwt9q9JoR
         Cm7GGKElu+MSV+eeg+RnxMquPBf8vk52c6kVyzAWC6et2N5UC7pCjDFgdQ/QrQbOENBF
         Onwg==
X-Forwarded-Encrypted: i=1; AL+hErEg5RIF//StBhenEkTfW+ogXD+2JU0kILvJj2vh6sb8AYQTmcVJWMD6L+2tTvya1ZPK9ukT7l3iHWYx14s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9llBp7YOH0QFUgH/YL4qmn4A14boJkQ3HOb8qzpGXy6VjFFi1I
	HM+eKQwHZ5FCbGsRgDoYfuCksCB1DXC/KntNTc/AVJuVBiBgHcQE/VHX
X-Gm-Gg: AZFdTZd4JXM34NbSWR1rKhkAnUubRo8bA/KRmTmgWiGQtSeKXkULd/3N7e9WcY0O/u3
	DbUdLcBnDte6lRr/I7GOwmyhJgczpAB9m+9cc7ZvU9OiO+0TrKleeBZjeEOIY96M/99fb+V4gKD
	FXNIyTzYKTCHLArl7FsM25QCIBCaGiHCvUIALvFlIXbj8YZQtCDVUvDtheaTWFFFaLRDOJOj2ch
	Rpg0E13FegFWr2oJy9PnmV39mPeFbPyTnP/Daog2impvaZ6teJKyRpzVAqiYs8KECNTucxcGsLb
	AC+uyYgS0bus9BbT1WyeCzTKFA0eFr3oBcjI6InfpSgqpiSPr1oBq7NOeuCOgve8pQH/u7xdScq
	kJB5nnsw09g/+OC+HefZ5CxbTmLlkszdpDGAzOGsz7cb6ihw6HW4MlYxnPb9J/kAjK+6ibhiiMz
	yvTxXJvU6lGl5PVwukSgSoaVwyztTkQTG0c6IZeq7IfyXKc4JjRKsOWKV8sags9KVafXLYgtdjB
	LnIlBJlbs2kpRucKZBfuEHGMJGxrlGZRFXcLZhBEcSPsUc+eSKWN4fbpf+72C36xamEkeLsDZJV
	SjXDq7nqv4nSmtBlSAlXryXHVRxuaw==
X-Received: by 2002:a05:7301:152f:b0:381:c532:3d88 with SMTP id 5a478bee46e88-3857093c38bmr9213125eec.23.1795335688188;
        Sun, 22 Nov 2026 00:21:28 -0800 (PST)
Received: from gentoo ([49.204.145.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm24062447eec.23.2026.11.22.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:21:27 -0800 (PST)
From: Shreesh Adiga <16567adigashreesh@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/crc: arm: Support partial blocks in NEON crc64_nvme
Date: Sun, 22 Nov 2026 13:51:11 +0530
Message-ID: <20261122082122.664360-1-16567adigashreesh@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Provide vqtbl1q_u8() for AArch32 using two vtbl2_u8() lookups, the same
emulation used by lib/raid/raid6/arm/recov_neon_inner.c, and derive the
partial block blend mask with an arithmetic shift right by 7 instead of
the AArch64-only vcgezq_s8(). This lets fold_partial_block() be shared
by both architectures and removes the AArch32-specific requirement that
crc64_nvme_neon() be called with a length that is a multiple of 16.

The AArch32 dispatch code therefore no longer rounds chunks down to a
multiple of 16 bytes. Each chunk is now either 4 KiB or the whole
remaining length, so the tail is processed by NEON instead of falling
back to the generic table-based implementation.

Also document why the arm64 PMULL helpers use inline asm instead of the
intrinsics, and turn the 4-way fold loop into a do-while loop, since
callers guarantee len >= 128.

AArch32 was tested for correctness only (KUnit under QEMU), as no
AArch32-capable hardware was available for benchmarking.

Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
---
 lib/crc/arm/crc64-neon.h   | 16 ++++++++++++++++
 lib/crc/arm/crc64.h        |  4 ++--
 lib/crc/arm64/crc64-neon.h | 12 ++++++++++++
 lib/crc/crc64-neon.c       | 24 ++++++++++++++----------
 4 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/lib/crc/arm/crc64-neon.h b/lib/crc/arm/crc64-neon.h
index 645f553220ff..0d0071a92071 100644
--- a/lib/crc/arm/crc64-neon.h
+++ b/lib/crc/arm/crc64-neon.h
@@ -32,3 +32,19 @@ static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
 
 	return result;
 }
+
+/*
+ * AArch32 does not provide this intrinsic natively because it does not
+ * implement the underlying instruction. AArch32 only provides a 64-bit
+ * wide vtbl.8 instruction, so use that instead.
+ */
+static inline uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
+{
+	union {
+		uint8x16_t	val;
+		uint8x8x2_t	pair;
+	} __a = { a };
+
+	return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
+			   vtbl2_u8(__a.pair, vget_high_u8(b)));
+}
diff --git a/lib/crc/arm/crc64.h b/lib/crc/arm/crc64.h
index de274288af61..ce0ffe590596 100644
--- a/lib/crc/arm/crc64.h
+++ b/lib/crc/arm/crc64.h
@@ -13,10 +13,10 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
 
 static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 {
-	if (len >= 128 && static_branch_likely(&have_pmull) &&
+	if (static_branch_likely(&have_pmull) && len >= 128 &&
 	    likely(may_use_simd())) {
 		do {
-			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
+			size_t chunk = (len < SZ_4K + 128) ? len : SZ_4K;
 
 			scoped_ksimd()
 				crc = crc64_nvme_neon(crc, p, chunk);
diff --git a/lib/crc/arm64/crc64-neon.h b/lib/crc/arm64/crc64-neon.h
index 700a3a8619f4..d872f4d4e2e7 100644
--- a/lib/crc/arm64/crc64-neon.h
+++ b/lib/crc/arm64/crc64-neon.h
@@ -1,5 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+/*
+ * The PMULL helpers below use inline asm instead of the vmull_p64() and
+ * vmull_high_p64() intrinsics. vmull_p64() takes poly64_t scalars, so the low
+ * lanes have to be extracted with vgetq_lane_u64(). For the fold constants,
+ * compilers fold that extraction into a 64-bit immediate: recent GCC and Clang
+ * build it in a GPR with mov/movk and transfer it with fmov (Clang also
+ * rebuilds the high half used by pmull2 with mov/movk and dup), instead of
+ * loading the constant pair with a single ldr. With asm operating on whole
+ * vector registers, the constants are loaded from .rodata and pmull reads
+ * the low lanes in place.
+ */
+
 static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
 {
 	uint64x2_t r;
diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
index 03b46d0abcc4..5b39d6ae1e9c 100644
--- a/lib/crc/crc64-neon.c
+++ b/lib/crc/crc64-neon.c
@@ -32,8 +32,15 @@ static inline uint64x2_t fold_single_round(uint64x2_t fold, uint64x2_t temp,
 	return temp ^ temp1 ^ temp2;
 }
 
-#ifdef CONFIG_ARM64
-/* vqtbl1q_u8 is not available on AArch32. */
+/*
+ * Fold in the final 1 <= len <= 15 bytes. With A = fold, the remaining
+ * polynomial is A*x^(8*len) + B. Rewrite it as C1*x^128 + C2, where
+ * C1 = floor(A / x^(128 - 8*len)) and C2 = (A*x^(8*len) mod x^128) + B,
+ * then fold C1 into C2. t1 selects the len highest-degree bytes of A to
+ * form C1; ~t1 selects the remaining bytes to form A*x^(8*len) mod x^128,
+ * since tbl returns 0 for any index >= 16. The sign of t1 then selects
+ * which bytes of C2 come from B.
+ */
 static inline uint64x2_t fold_partial_block(uint64x2_t fold, uint64x2_t consts,
 					    const u8 *p, size_t len)
 {
@@ -52,16 +59,15 @@ static inline uint64x2_t fold_partial_block(uint64x2_t fold, uint64x2_t consts,
 	a  = vreinterpretq_u64_u8(vqtbl1q_u8(vreinterpretq_u8_u64(fold), t1));
 	t2 = vmvnq_u8(t1);
 	t2 = vqtbl1q_u8(vreinterpretq_u8_u64(fold), t2);
-	t1 = vcgezq_s8(vreinterpretq_s8_u8(t1));
-	b  = vreinterpretq_u64_u8(vbslq_u8(t1, last16, t2));
+	t1 = vreinterpretq_u8_s8(vshrq_n_s8(vreinterpretq_s8_u8(t1), 7));
+	b  = vreinterpretq_u64_u8(vbslq_u8(t1, t2, last16));
 
 	return fold_single_round(a, b, consts);
 }
-#endif
 
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 {
-	/* Assumes len >= 64. AArch32 also assumes len is multiple of 16. */
+	/* Assumes len >= 128. */
 	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
 	uint64x2_t fold_consts_4x = vld1q_u64(fold_consts_4x_val);
 	uint64x2_t fold_consts_2x = vld1q_u64(fold_consts_2x_val);
@@ -76,7 +82,7 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 
 	p += 64;
 	len -= 64;
-	while (len >= 64) {
+	do {
 		uint64x2_t t0 = vreinterpretq_u64_u8(vld1q_u8(p +  0));
 		uint64x2_t t1 = vreinterpretq_u64_u8(vld1q_u8(p + 16));
 		uint64x2_t t2 = vreinterpretq_u64_u8(vld1q_u8(p + 32));
@@ -88,7 +94,7 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 		v3 = fold_single_round(v3, t3, fold_consts_4x);
 		p += 64;
 		len -= 64;
-	}
+	} while (len >= 64);
 
 	v0 = fold_single_round(v0, v2, fold_consts_2x);
 	v1 = fold_single_round(v1, v3, fold_consts_2x);
@@ -113,10 +119,8 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 		len -= 16;
 	}
 
-#ifdef CONFIG_ARM64
 	if (len)
 		v0 = fold_partial_block(v0, fold_consts, p, len);
-#endif
 
 	/* Multiply the 128-bit value by x^64 and reduce it back to 128 bits. */
 	v0 = vextq_u64(v0, zero, 1) ^ pmull64_hi_lo(fold_consts, v0);
-- 
2.56.1

