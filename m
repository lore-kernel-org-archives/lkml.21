Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059604;
	b=R0Q3tVtH/o3H/vdMPfuZ5iVW8Tgnovih4dqktUAu6sH7cvYAHpGbCYtDGaoyaXkE8pmc
	 oIfa4Gay0G0nXm4Ln/OKEPzdUje2537gLz+ml6kdtgKHaOh5+bQmE6yAY2CZqiqhPjGow
	 w0hSj3vCzu6uh+bPEmCvZfYLUCjiA23QGSTL4JIW4JWk0v9Nn+L1gvFbB2bZzF2WSK/wV
	 Xva5GANGjfd+2j/Bp42LYQh+SFdoHjXuHvALzJMueVHBVtSnF+7nJO/z0Kk8fWVBk6ZaY
	 q7XInpCpEW6MiHDi2gvzyoSQFn4IE6ncgw5QTcd2OPrBwe7bxuMUGRInXmKef1U9sEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
	b=gs+i0UXK8/hX7VbfzJ/L8kgDQvKa0QaGtd7oxv39j1MWEdvutuJK08XRVyXH+OMlU6ue
	 w3Mr2nVAmDgfbcWWXYiT2zj1KnK2eqBhTmpVnQtsJQ+l9PMSCtLT8A0vu75SH9Ve72oiO
	 t+S7do8wBz2OHw4CjEDjxp4tz70vbtgzetlnrUOUg65V5iEEiBHxxwkDh9BkX05wJ8s5+
	 CAQaBFawds9/ezU4FAdgu8PTBez87yUsJtO8MG/SekBI/RjAMuBtWHFwKDnSQ7Ku7oU+y
	 P3po4hHSwlfJFdJwnbzvQFX9jX/TC+585kS0Am5Q1g+osJOeubWIzXiAeYI05YTRTTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OauzyXoR;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D8606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800D8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OauzyXoR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380b40312e2so4861836eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059604; x=1795664404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
        b=OauzyXoROzT2uLpm/pcQ2arSHrRbzt+j2+4YSdkQMRnXdoilDlbER6IbMDzJsJydD9
         Hq/U4WDBLneyk9VxkGoAozWFlQvKy1p+xOAHSkQJ63QQiWX4ICUKZlHbC0tJttnVh+VS
         2ZVLxj37lsWOXw29xChTk3FWTUA+EqpCjPBhy3OFQMEsLFEwTl0lJsFwx9hrORNRbC7m
         7Hr7YqoOKdHVsUjiTqtGdWhTjh1nqtwZTLSYFXewpgyZ2xFgxEYbCH7AFErdRtbD6qB1
         bhwxg14P9bK+tcbJ/OywcMfKvCWVdGlbs0VWKZ/LMdLFtvtwTDXzfbxDeERt/+I0EmXK
         MRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059604; x=1795664404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
        b=cf+vxh6CnuGroqTu78rAZAYjLrcx60GKcPIyv4HDhQM9L2Py6NeJkCFU6DD4cEvK3S
         z1Q7tg+vz0PJTZHISeX5E5/cRa1AGx1T2iYSSbgzPiwi55qv4v4N1UwkyVgJ2rFfVv1i
         kBFkDqtQFFvYA9RR7wiAox9lYCnG6ecwtmdu9a9/AAdEz70nyDRPVB5eDsP359k95VyL
         Nq9L5iUufuLYw5w1HLxDX62hCORsccUxHrtoHOCJgzswws5OGhOklqOlGvs41hDUnbm6
         ydpo/eEd4BrEFl6VEwvwYG/CgGVxoeVLioNHh1OhSZM0dFfFagDves0Zh8/0b7HFhZA3
         rUgg==
X-Forwarded-Encrypted: i=1; AL+hErG8tP1GCphTwy5dGt6VU/an4mUGXr4Ke21YKCPhMax3AcMQ4mNb4Bl1dF1SjVFZjLudzNehJkHcBkAOLdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bm7qdHraTYChhysF/UMhsMUU9qT0Oc6RXJ85UXieQAtTjlcNu
	oihg/2FrZuxt5Ut1hKPjhGkKTgiPrFx2yj35pZYJ8iS83+GpGoC42Py9A3iVeQ==
X-Gm-Gg: AZFdTZeFN3aKBJRLCwsz1aY+UKBw8CSM8L66/wwIjAxwG1tJ0XAOvqj+zEHqTjj0V9U
	pwYdIk0+hT4x1QSa+kVj4LFzuTX1Ao+vO9WQ4kopOSTuA0usnjJY2PqAUuVxV9TryAYJDuiBVFD
	xsx5UdYP+lQD8HAckL3g9NtlJR+OUb2j/IYn1jZ9Tz8uQOwWD/urvlVjUAccWi8s867oGcGKiDn
	UgyXt9x0F1tv6lqbdQEi3K6DRHxRZNWJLhLAEdgByGg7Zxh4XWVXwAUnUGMN9Z+7vrpG5seCLZc
	je6EO79S/guIRlAmhYDmqbT8FDYUZZTc+FJF5Nq61qmy21Vv83B8Ka38t6GeYOtdyqp/gfzPmK5
	Pp+LaF23GpFMqoD6s/ypydFVifRhesPLe1iJK3qVFdLYhN6dlGuvUo9I/5lku6MsN8tanJ395Il
	YpmaiHLdoBUlUO/6khjRrrSQD46G+AgwptpimCevBv7qEp73Ro3SLlm4RPyKTCQzTw4yUCwPP3s
	uzIQMMEd1Tzvy97zLX02BbwKIgppDBaH/fz2Cc2ZPptOmCqX3Ky8eTqb7LwVFVXE8a4TOVfkopm
	7VOi60rWAV6GO8q/LqGUJgsqQDASCklXwA==
X-Received: by 2002:a05:7300:6da2:b0:380:d99d:ce1d with SMTP id 5a478bee46e88-3828016fed0mr5982804eec.15.1795059603644;
        Wed, 18 Nov 2026 19:40:03 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:02 -0800 (PST)
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
Subject: [PATCHv2 09/18] powerpc/pseries: Rework hash flush to remove conditional locking
Date: Thu, 19 Nov 2026 09:09:04 +0530
Message-Id: <10471bc512382a2cff1284adb191d738efb63ca1.1795058683.git.ritesh.list@gmail.com>
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

