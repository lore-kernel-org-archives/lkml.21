Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147427;
	b=tWYWEuLCeimsgXL79fjFuEQye548c0z3JbLF7/8yfw0jYY7un5S9Lt3ZQTAxqwQUDjDQ
	 jjv6l6Oy2pKbKqQkPXD2uQiPN+5LsVxKaHLlG8xiBUtQK3ZyS9SKpDq9x30UkcGsM0Gwg
	 qx2Xmsux0j2bH7WwMnx8qXfELlNdKcSrgYg/QMJ4rObK+idBAqFvhUG1MYTmUl19cZgPo
	 tAhOv6v/bD4kiwGJ8u2YYNdIeNwikxtj11Ewp0yQKjcnCUbdBp7rXCPRBECJJu/scOKSp
	 pCqlGitokA4j0z68V3SrztPLRklvEYjKJbxMcMeVvRzNqzKVxH9mS5pgAxWgTvTmung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZ81FuIDGfauj5HCBbvp9ZRfo5q4ugi5e4DfyuSEILU=;
	b=dt/uGyQuyDI1lI/MOGsMUaAheCSGIEKoGafUu3ThAWkxnVMtDyqxFX4k4XFtFfrbyMLA
	 TU2mXRx8dd/LC+fv5Pu9EoI7KKpbv5WXjjjvMlVPlXr6BmfNI/3LTg28eLhGHo1hT47zT
	 JO+LodHwE4P0tnLHIpUk6v92faR63ATyYpYDNcXjmvq2w8BsAKxtMjzQQdgiQVDl6ZtMo
	 iueKa1X8dU/e813Fcqoe+yEzrFdtpDQjO7i8bT5tekHfa9ozYGoAzMFurbcE9xFYm8XLk
	 B1uae8vSC+L0ZYeG7Eshs2oFaUZyw5NDi95Q6QPS5jSMvxfPWXAHHMsxxhLlD+JK8sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vndrVIpC;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686ED606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686ED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vndrVIpC
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-372bdb942dbso581578eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147426; x=1795752226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ81FuIDGfauj5HCBbvp9ZRfo5q4ugi5e4DfyuSEILU=;
        b=vndrVIpCsuT7a2d1qhduZK4+MPZq4hqIwq9iqdd0kKZzaOPRDkqHqMT43k9LyvMAi8
         zZEtEk+SWPX6p+GgrPuv2svTblYwhl1Npzua4uNT2xGduVeavSEyBW98Yw3LYfwxhZQK
         AYR/QTTZuHVNUBHp1pqvRJnr9clUrKSALLhJJzxDXgdKPGrFK7c0XwWxQlVz0v8Nw8Np
         4y/l9E8PlVV/e2jDWwEJBMSriGLyWUY+0WTxiPcsD7bvfLx7zjvNoRsRtvNzVw8y6BW4
         Ozde+wUd2dKvvmMfKwm8rHhyuAyiJq2SJwTQs6AUIpdCYCOWM/PtnwcLTrDdmoGM1Dkp
         3cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147426; x=1795752226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZ81FuIDGfauj5HCBbvp9ZRfo5q4ugi5e4DfyuSEILU=;
        b=IiD8YKVjXm0P5gF1MxbeR5FzfGfyViC/ddJO+ARCu34aOKQiFNvVtV3RMR09ZeQGlY
         ES5/WSFU3PUtNWiSVQ4spjlmpC881b5fkUl9fWuEgQ8LPEj4jLx1xBXbMlOGZ8mDr8sa
         bCzQA0766w5xWnQXuwQDsoohCHz9dXAmqnbsLCY0fXkFiMvdGiATXr83Impg0nFrwphW
         K0JsY1rhAYICKTp1gaWqSIMPq4IG57Tva0rNkYqLLsH/pCgh89PBvRoOAsibRetXTSVV
         D/hbnCmSEdN4S83K726hFvGtJd2US2uGjf4Ss2XZ1v8Dq/WYAvn3wLxkwEWx2u5uAmER
         1Fng==
X-Forwarded-Encrypted: i=1; AL+hErHFsokpKWCRBfpBVdTEQqboSS9v5ozPjQHNW8tGqUD+mR+bj0ODiqzvFKbmZyzPO+4+6w8KF+urhOnjUmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dd/ong5yeuxl7SFvhDC7wfSptmxIHGwPmYDKfnmoDLxjPikKD
	41UpVHO+Eezo7BySe0XVmzpnWp4At1k99MfTOEjjw0KdUqZs2trDPfBy
X-Gm-Gg: AZFdTZeg9uwZICg1AVNAkIBD5GtriVGoEzwG1DXWntAU/rgvjuUv2E8JOwFMgBZB6Ik
	OhTqojLXGuvK3eDXehEwWXDtd5qIj5KakVO18zbFVXqP9/3svZ0jCHyhVHdz3WXwinBNV8KPpmr
	Wxwgil4Xlq0MN8hJZ2IuQfo+/Ipc6xVX0jdNLBcPPU92pqTY6o/SnDL5a0p0zTkOi/gicaFg2bA
	9KB0Qlq961DLPmOEHWlJg5KIY6jrOGJJNc27Al4BTb/nrc9ACyBkQKlOnyshL/iYIWhY8QHvKR5
	MoA1koIpkAaayL1PauVLWLnNam9nkXlf8nhibNbsvs4kT5AhLuMUDzJNNUD66cWbSPziT1cA6lA
	w25qCMBFBJXn8COhJgEz+zOUU8+mzpVhNeW/1n2CjtJeTEZwIXlpm8YUUz+pmYWvR7+ENe859ge
	APb59aBPuWRDgBZ8B/EvnzEiEji6iO3LVVEvKgQ2g0UBrZT225Mhwg61Fsf6hxjkjh/QS+mUjhh
	jjwcSrmRpZ7y8WgptpzhJA2sMUsyRWU6zl1m4hblvarbCraW4LTcqC+3QmwY5CCaJPol3xTBED+
	VV83ziSzQCRf25+tDOx8Sae00LRfavUsLg==
X-Received: by 2002:a05:693c:83ce:20b0:369:f961:ccf8 with SMTP id 5a478bee46e88-3856f65e0a0mr1698374eec.19.1795147426535;
        Thu, 19 Nov 2026 20:03:46 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:45 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 04/19] powerpc/mm/book3s64: Rework native_flush_hash_range() to remove conditional locking
Date: Fri, 20 Nov 2026 09:33:03 +0530
Message-Id: <d485e7b2a344ea9005f69072086c3c1f214f7695.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

