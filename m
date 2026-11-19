Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059580;
	b=JjeqVmq3hNgpWkAZWjtaRS5yLQIiUJh5QkzCYi2po6XeUjST9V/7iQfNiHL36SLrmSJ/
	 sCTCBf0PmhNT3V4tDyeySX5dAqIdLQsjC0IlkfTmUtqvGa2Gb3D8OZuDCY+FfuYM2fXgu
	 pZxkzKWNHvXgNHAIxTQfX357DaRq9xs+r9/YsFCmTg8uq4a9Hra3eUg4wuyYWLSMtbuVf
	 3rfgyM6YrhdjuWJJ0BZK2rcEkcbnglNM+yDMRICIcd6ZwPM9RFhy1XWxTScRmo/nk0fH8
	 FO4OxLS23unvpUKagJwvXWiX+EC5AgT7X1vDvmszhBHU+lACPMfI6VO+5gWKqE1dfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZ81FuIDGfauj5HCBbvp9ZRfo5q4ugi5e4DfyuSEILU=;
	b=1/9rj4LTTGk3ntXeVC0Xm5lE70Q/3L2gIIX57bYZmu9kTb5vKGYOx+Lw9xcjoW4ysZoM
	 B28GUodHeopd/RuEwuXAjegtCxdZl9QCtbPAGeXAjIAC6DTh6jyiE4OcG2BZS3Slva6f7
	 ihVl1zgZGISEyareOeB96wKDVvEzLOYR3tCivIg/MQ67Jvp2lfoYxRfquT7N2E9KK+eTn
	 levzeLeZdwDdHLzisTjFbItE1DH3Cb/JTv2vSn1J+1hcSksp8+2c255HOaYYEVfg/s3zD
	 3wWPyv+heMeWaixLbJ0yfHxMISyzY/Jcg725T6s2r7i59ieBatyplZzUNHUfIr7YTJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXUzslwq;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E9C606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E9C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXUzslwq
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-372bdb942dbso2392538eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059579; x=1795664379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ81FuIDGfauj5HCBbvp9ZRfo5q4ugi5e4DfyuSEILU=;
        b=oXUzslwqIQKGY/7R3ZTG0Ph3Z5HjGyg3aXLkXjJyT121CV8BEQu1iT05P+gsz8h/I+
         UUhUzXnCnVpya9j+5Cuur0Zd8Mxzeh1Ayfy2ksOA1XDdxXAKHa1fzF3Lz4jJWYEscbpa
         pn2IJYALMlxmDnK12e5M/8IrYpFxcmUxk9nT0rCmQGFT4RD94L6fVKgfzzPihbrUJ/IT
         ac1D+pBcT+HoIYYc8LUFTY8RUL8K2jiObIKXuFSY1cnY1HICe3c+JbeUckoeWrhJoYF/
         JuxMMu0KY+IC3CU9wwJxuIoyyBkesMgmhtoaNp7Hg2yrzUvBzKhhTRi065FJgshjlnwY
         xhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059579; x=1795664379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZ81FuIDGfauj5HCBbvp9ZRfo5q4ugi5e4DfyuSEILU=;
        b=tM3bnDwvG5730Q6uXtDzq93JjQHwF+SIxaCVDfcB6m+G6sxCrt9PToAyfk47C/r805
         3hANW/smBr50Ae8UtGsWm5pLgdSkWRg9RFHQ1D9n/wsImNpYotkZiBSAbqm29Fq93ehR
         NJrHKqO98lmPaHW42u/qwBJKkbLhQ3urjP9D2xRwO4XNTNBw7w24QyJpxB9UckwCXGdu
         C+yl6jHwsenrD9x0tahMl0b6YgMRxSmaFDcJ0UJhw/BVa19wBFoAay2LA5eZTWK7m7NG
         jX1SYKjnNHFhlI7mk+I35qv7EuaaBXiLxNkha/28LRGYOnPLhbUnnPGd1TuJmlf7hUud
         SwsA==
X-Forwarded-Encrypted: i=1; AL+hErFEHDHbZ12mvs9nR6J95YJX5LZQbxDOILwCFacR2AUXfQnW4RGKneRFPvl5+dDfhmAr2Bdp06jwDXRUpJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/00cW0M+Tq/9GUBhEkQh/F7rRIAvmReOu0jaBx/TDAl6algFeY
	2mmTsmbe4tPc4isJBkUK8RYgTTIukHHACOys2JuhOE7oHCsw0v/vKr52
X-Gm-Gg: AZFdTZeICEu3H1bTFURPxA37FLtXqvDln+EID5bLtrQVMLAAVjM09xxYT5O9FQrF9Nb
	HA8PscrZgYtjBA5lT1gs4T1A1E00em20iflVd9e0Ac+MQdhtwjg50RW0w222R6PIwjh9irSDUi+
	0uzIHoCcmKgCi68ghgOTOei1DUFe3mbyBiWj8Y8SH3LoN5f67zDuDj+Mp16JrRHoIniFGwqc0rv
	/JZWu/DQ2N2hLLMx2+OfmrOf5Z5lIXFnlniOsNye+CyQDrAaUGQz0PiPrXFrNIP8ZAEpJa7lANS
	1qk6Nhpa9YBNeZfV/bwYYW9IAt6e+z3mWODzRYqESplKA3img17fb0xmB29ndcMi7pIsCbWBYQG
	Z+uSvpoH4hbsCjW3a9ubSdZTRqXQxhvYb0D1yF5rcIgFloITB4tlHI8cMffmiwPL5jd6iJVEG2O
	yZGI60zcgXozuitkulj1fAMEV4mr+izC3HRxG3BlUtR3Q+1HRjQ84g+d70V6/zyzfyZoNPxOqUU
	sbwitBVgWFAV0kT/wCvuF69Q7Vv13vuHnOXsEAJNoDTRxdHTf2tSCTPVNfBjdUII1Us1YVM8UIL
	s7V5n33WV0erJBlCRTRHFOQTlxgfBU2/tQ==
X-Received: by 2002:a05:7301:8613:b0:36f:a651:d649 with SMTP id 5a478bee46e88-3827d821472mr4316901eec.4.1795059578825;
        Wed, 18 Nov 2026 19:39:38 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:38 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 03/18] powerpc/mm/book3s64: Rework native_flush_hash_range() to remove conditional locking
Date: Thu, 19 Nov 2026 09:08:58 +0530
Message-Id: <0822917ce1c1f58fa3f5d398e3df8d876dcb7c10.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
 hash_native.c:851:2: error: raw_spinlock 'native_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
 hash_native.c:868:3: error: releasing raw_spinlock 'native_tlbie_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch reworks the native_flush_hash_range() function to remove the
conditional locking. It fixes the clang context analysis reported
errors. However, this also simplifies the code in native_flush_hash_range()
due to various if conditions.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 88 ++++++++++++++++----------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 6bad0545b57a..2a852dd5049f 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -792,6 +792,54 @@ static notrace void native_hpte_clear(void)
 	asm volatile("eieio; tlbsync; ptesync":::"memory");
 }
 
+static void native_flush_hash_range_tlbiel(struct ppc64_tlb_batch *batch,
+					   unsigned long number)
+{
+	unsigned long vpn = 0, index, shift;
+	real_pte_t pte;
+	unsigned long psize = batch->psize;
+	int ssize = batch->ssize;
+	int i;
+
+	asm volatile("ptesync":::"memory");
+	for (i = 0; i < number; i++) {
+		vpn = batch->vpn[i];
+		pte = batch->pte[i];
+
+		pte_iterate_hashed_subpages(pte, psize,
+					    vpn, index, shift) {
+			__tlbiel(vpn, psize, psize, ssize);
+		} pte_iterate_hashed_end();
+	}
+	ppc_after_tlbiel_barrier();
+}
+
+static void native_flush_hash_range_tlbie(struct ppc64_tlb_batch *batch,
+					  unsigned long number)
+{
+	unsigned long vpn = 0, index, shift;
+	real_pte_t pte;
+	unsigned long psize = batch->psize;
+	int ssize = batch->ssize;
+	int i;
+
+	asm volatile("ptesync":::"memory");
+	for (i = 0; i < number; i++) {
+		vpn = batch->vpn[i];
+		pte = batch->pte[i];
+
+		pte_iterate_hashed_subpages(pte, psize,
+					    vpn, index, shift) {
+			__tlbie(vpn, psize, psize, ssize);
+		} pte_iterate_hashed_end();
+	}
+	/*
+	 * Just do one more with the last used values.
+	 */
+	fixup_tlbie_vpn(vpn, psize, psize, ssize);
+	asm volatile("eieio; tlbsync; ptesync":::"memory");
+}
+
 /*
  * Batched hash table flush, we batch the tlbie's to avoid taking/releasing
  * the lock all the time
@@ -845,41 +893,13 @@ static void native_flush_hash_range(unsigned long number, int local)
 
 	if (mmu_has_feature(MMU_FTR_TLBIEL) &&
 	    mmu_psize_defs[psize].tlbiel && local) {
-		asm volatile("ptesync":::"memory");
-		for (i = 0; i < number; i++) {
-			vpn = batch->vpn[i];
-			pte = batch->pte[i];
-
-			pte_iterate_hashed_subpages(pte, psize,
-						    vpn, index, shift) {
-				__tlbiel(vpn, psize, psize, ssize);
-			} pte_iterate_hashed_end();
-		}
-		ppc_after_tlbiel_barrier();
+		native_flush_hash_range_tlbiel(batch, number);
+	} else if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		raw_spin_lock(&native_tlbie_lock);
+		native_flush_hash_range_tlbie(batch, number);
+		raw_spin_unlock(&native_tlbie_lock);
 	} else {
-		int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
-
-		if (lock_tlbie)
-			raw_spin_lock(&native_tlbie_lock);
-
-		asm volatile("ptesync":::"memory");
-		for (i = 0; i < number; i++) {
-			vpn = batch->vpn[i];
-			pte = batch->pte[i];
-
-			pte_iterate_hashed_subpages(pte, psize,
-						    vpn, index, shift) {
-				__tlbie(vpn, psize, psize, ssize);
-			} pte_iterate_hashed_end();
-		}
-		/*
-		 * Just do one more with the last used values.
-		 */
-		fixup_tlbie_vpn(vpn, psize, psize, ssize);
-		asm volatile("eieio; tlbsync; ptesync":::"memory");
-
-		if (lock_tlbie)
-			raw_spin_unlock(&native_tlbie_lock);
+		native_flush_hash_range_tlbie(batch, number);
 	}
 
 	local_irq_restore(flags);
-- 
2.39.5

