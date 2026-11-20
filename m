Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147452;
	b=ib3cOEbF+6E5Czn6gQNIuA2tWM4ODzVxz1JBfF/jelt+ep+5na5pcwlWt4MIt2++ICnh
	 cMbNnVd2KzWZUvr+RLkfV4hX3l+98B92J02ADvz7oGHSXz9G9tGLdejD+3Yq8TFLbl3ti
	 64lhfzrKRl8KP5DLJKNvSahp12oW8g6z1ZhIuTKt+ssZhLREMa1ODKWWl83XAX521Ovn3
	 e4dMP/OUdtA67zDg6N9buElCCqNFid2pG0iAE47fvA1XgPquk604D6mgCdG91Zysz9P3F
	 V0iVLFEDpofgmBMgml0CBh1bfJwVbmyZoUEeHQDp3VBV+m5Q10lIfkMdrXrW83dftVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
	b=agksIyteKfalpR0V1Vs1BIeIcaLet3QXYHC0eiiXst/ZkvY3oEhr23F+PrIahbAgOP9l
	 nQnDUa9SNLtVZDbxUk8DeTW2bYuTJQgisI+hHSjiifyvaHOz+hNEiSe15fgMAj3DDtEdT
	 y0aiRRQngnxyM79jAfJS9W8fKB+daAD3xNy01sNj55icCK1o8pkG/uq6iXeXxgVzCopXF
	 Yt1aF0WlS+KQEqw9V8OC4uUBmYR9M5uwapaY7hmNUFwRlA/btJRe+NigjAzuvOafRU7PJ
	 T8ByFq2CnojNKMcFZps5/rICzc18iUauRjxkeJRXaYbwVJLYEDTff0B8e/QkADR7B5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap5LpJPh;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1122606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1122606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap5LpJPh
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso621945c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147451; x=1795752251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
        b=ap5LpJPhnoyMREhlIMimLEPmTKP+OPhD/rk38QMcmHlB6FAVkSlz6Uqb+KbcE6th6j
         0fSOr7d1WgH0cr6ACEDSH0fhzVBSfi73rHCfUPlkLxB9ArLinqYYfDGA+wmrcZr8tOgi
         g5aeeSVZNy3+baATuSiuyFG1HPQ7p5ZayuGLmMFwJkFVraA/VBc8KMMW0rw4iD1mIWLb
         +ZeWNXilK7DgtnrIIQSE1eYz9EIEuVTmM/dmnLh00IG7b9n0ozoeSCO5q64oCtqLGHPj
         SU5db6ZM+NYL7blg1W3F9XRhcT8u5Vnf1/qGBBji0w7eOZDzT/z7YEnBWDjGzKONQC3t
         uF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147451; x=1795752251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
        b=gWp2prt1b11Sxs+50kc4y1zjD0y4PBQGPq+9fXG1N4g72G2oCyGXmGn8beUZQcMEwp
         9b3Kk0Zhb71oZPaJfyCZMI8OBxUQrZrr7R8LmxuEYklZpkeDAzgXPC6YGS2HSXeoBHvs
         EYmPyZs6E5RPJzu06Kl1kQA4PTxjUHUD4VwdH4p9y8/5LHmH6j6pBnneeEzsv/5Hw0b1
         iEGd4XSn5vfV3RylwFDr/8haGWH8uYH2zOGbn4Y3d0Hn+VUgHTCoN62Ne7qKtI9reJrP
         w4A+PKz3DfbY1BPhNeQFRLpyaBqLLHqXvHn13DW81pCEh/1wozi7FSt5FtlVLAKWZlNr
         /aBw==
X-Forwarded-Encrypted: i=1; AL+hErHNc+ZrItDBoovA+FZw/DqEct3TMIf+uHrZD53jEkaHmAdfwa/I5mgVwY+iF2EbFh9p/iGqbKD0XyEsxgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OPbPS5oKaL2JiM5vRktxykqCiRvIVSrv2GBZOl+pOQizH5PND
	FYrj3FVcTZvEnu89ji6efOjZs2ThIqdOEvBL1xhyngJyBz2G6OBG6CI3
X-Gm-Gg: AZFdTZdk/iA5FIGH5lRWflbdcaUh0mZUvicrlECgQeFG2pfz/HKnJ+2cQJXFOxDChof
	AXDpe7vVxTCcj4LTgwBgVb3fUvaSUMcj6iaGx2v/kb/Cmjrc6aKZyCnW+/VnxqSmJFgn1tmkqYS
	hhKfYDatY0jmgC9LUKeQFoADZUQXgRWULJkw7JzjTD8FLpNpNHBaMqTrJeSs8qsC76ezykpmIAD
	M4Tuw9qcYfHkURWD1+AJ8Gk7ly7P2aTH/Ofr0kX1aVBgiMxgEKjU2MhGin5Y+0e0qTf4tlYHsQP
	dKzQAbRoLUkvZl4aHh31dPLAk99MtappPhkGU9YHXxyeRAWRjjMvrlf3Z1qpb4wIyTb4f8Jz+/L
	8Pq6fJR3WHfgdEQJiBD8HDVdj98aBQlNUl9sbSlb5FRWFpS8rgltV0Bmv0R2f5E2ORo1xTM81ar
	MzRrz8wznGENZ0ATMANNA3Ozg2GZHChRJk7IGFgwldGAsDG5oH6Q7UZ/4CJvt5dU4ccklRRkdt6
	VPHV5tvonVcunsiuC+Yud2OCU6AXW2qK+RrzAaqsoVEyWYomrW0+XgSuGav9PFCkCBjfRZP7+1D
	vJ08zHAaSVVdERTBHQFqibn67cHULqNdcw==
X-Received: by 2002:a05:7300:3e93:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3857015eaedmr1563624eec.21.1795147450757;
        Thu, 19 Nov 2026 20:04:10 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:10 -0800 (PST)
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
Subject: [PATCHv3 10/19] powerpc/pseries: Rework hash flush to remove conditional locking
Date: Fri, 20 Nov 2026 09:33:09 +0530
Message-Id: <03832ac89faab1cbd16d0e9503ed44ed38b82cd0.1795147055.git.ritesh.list@gmail.com>
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

Clang's compiler based static context analysis does not work with locks
that are conditionally taken like in pSeries_lpar_flush_hash_range().

This also simplifies the function definition in my opinion - so this
is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 31 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index abd77c45cbf4..5dbf447d3a83 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1526,28 +1526,19 @@ void __init pseries_lpar_read_hblkrm_characteristics(void)
 					bpsize, idx, hblkrm_size[bpsize][idx]);
 }
 
-/*
- * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
- * lock.
- */
-static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
+static void pSeries_lpar_flush_hash_range_unlocked(unsigned long number, int local)
 {
 	unsigned long vpn;
 	unsigned long i, pix, rc;
-	unsigned long flags = 0;
 	struct ppc64_tlb_batch *batch = this_cpu_ptr(&ppc64_tlb_batch);
-	int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
 	unsigned long param[PLPAR_HCALL9_BUFSIZE];
 	unsigned long index, shift, slot;
 	real_pte_t pte;
 	int psize, ssize;
 
-	if (lock_tlbie)
-		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
-
 	if (is_supported_hlbkrm(batch->psize, batch->psize)) {
 		do_block_remove(number, batch, param);
-		goto out;
+		return;
 	}
 
 	psize = batch->psize;
@@ -1587,10 +1578,24 @@ static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
 				  param[6], param[7]);
 		BUG_ON(rc != H_SUCCESS);
 	}
+}
 
-out:
-	if (lock_tlbie)
+/*
+ * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
+ * lock. Firmware with MMU_FTR_LOCKLESS_TLBIE does not need it.
+ */
+static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
+{
+	unsigned long flags;
+
+	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
+		pSeries_lpar_flush_hash_range_unlocked(number, local);
 		spin_unlock_irqrestore(&pSeries_lpar_tlbie_lock, flags);
+		return;
+	}
+
+	pSeries_lpar_flush_hash_range_unlocked(number, local);
 }
 
 static int __init disable_bulk_remove(char *str)
-- 
2.39.5

