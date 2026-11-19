Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059600;
	b=Xss7E1mpcBZAQ2DlGKcaCNymbkU1Q8VphSpsPjwEGY6mpC4JCQo6RO0L8N07/TTJhdak
	 1xIRMCMKwdGeitQ0Uv+6vGYWsYZwgN8RMZ1kD0IOLgPxh1JJ6dWETURDOC24QNQQFLfZP
	 YP1QYbKXM8BXstWMYNcx1bBNXEK0worKuHw6DFpSmo5iM7WCd9sJxX+428W+uy69/Lexa
	 NGpbwWI5IQEoXlSON0WJr/G93zKHCtmDyG6hJ7QIkD1D2l+k6aoesow8c1RRsqU1oOKkv
	 FIDG5/7+QUkTjhlyibsSNYblN1I+SrDN1IWoeO4L4dQp0eCDDVTeatFHJmKd13wKTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
	b=gRjl6sv22TS78YTlxZW6Qt17yYyLHrMpwLjChIc60RoALdwQW2hbs6RKrTv4CsuMtoHO
	 YOW1Q0fYDUixK2b0IccPuhWlBAsYxgrKlfo1WDJ8ewHYV8FrRuLf1WhFpPoqUeh2TKBNv
	 sdSfl1YjAC15x5cnsZ/0i9ogH6MQj4XAqTQTRV+EhlIeOWD30fgBSf45D8yu6bgJ1nSLH
	 Hb86O7o7jBhrd0ZkeIwYtmpNq5HwNJi8//BUzg2TjUWrHBsLBpB5t9Hr/VUUx25B8B6y5
	 Bk1qbGnuI/FVqF0IrBNnbF79qKnSr5Uujk8tr8U9sZlFqS4duj+T49SNNGT1OiKlydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rbl8YG2c;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3C606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B3C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rbl8YG2c
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-381d542bc29so3310035eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059599; x=1795664399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
        b=rbl8YG2c6WXonQFpgaCBpwZgKabw0zTgnMN6CuD+uoozHMqv7o72PkmqVjRlxjl6qA
         UoL3waH9i/6qcsU1T0IslyEoH+EHBYEZuCO/GFo6Z8G2xsQmqTKM+N+juTUR/Z5TtbYq
         gbYuU2u02BjTyPOZ7Q5tjwUfTDT1LPx+uOis2jUiHDyAjqNcnJ4vgkf/jS54mvqAxkNe
         B3h4Omw+cYC0jfifsDBLHPZreafnbIDVxxQU4LbCpLquE+23JwRtu55CgIuletoz8i7f
         Z0DAKBhZROi5oPqEkTcfYd6aJOhS0aAyxKoUt6e1gIYrZK4rHYohSitYCz6gOkJwbQQ6
         BFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059599; x=1795664399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
        b=cqORjC3dYPFJJnn81Ogu5pe+jbDu9VEf+3dilJmExCGyLHe56yO2f89F6AgjXWcckx
         sxzYfn3t8RDkABBgriCZN//bYlQeYWKNm+rTN/yfUw2nEsSssRH4OG+KGuVCwvOI4qOO
         rY/iqi6Zs4x6ORw4B+0cyPVIM958FqAXut4ypaep6PHSwxFPTkaSVGP7+O4wjYBnus/r
         +VRr2ndWBYNo7ulbB3rSEuGJe5zc9phUpIp1aNh1aj8ZGEwrawJM5A9hGExermSotDK9
         3m6jGU9Nu9SsTwBVXYxMMN92Rv68ocygh+rPK/PqhEF6+6EKK7Ex4arBR5av8fSrHKKh
         /rUQ==
X-Forwarded-Encrypted: i=1; AL+hErH+xHXsf3qDKXO9tAs/XYcdzmcI89Gs+3yQE2fs4Yvj2SaTXIOoQqdjajcFuaq9OGQN2lz89YmgfIeqTlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L39h3o2ip3W6wRknpSGrlHC/ZhXSZ6YrZVmyqlGKNX4DDT+d+
	QGer8qEAfkGPp4X3vTSNrBHc4kd+OKPmUtmDrFVbC75ApibEZVn6A4D1
X-Gm-Gg: AZFdTZdXrXmv3uhgrbj2r/rxpWthtP8z9WZz5qVahqE5634I4yd+D9Pmy90cgaQr1Yk
	J5VzF/9/1vQ8JyLDJuHwQpfq2A9X01Xqppl3NALGPdBecXY4LjRF9uH0PS4QoD2S817UllVuLuq
	/pbQIVGHRmOnY4EDeg6Ops4IhIPzX4caApgMuKkBmaTOWu3M3z8qcwvUdzBGzJXhioq/0RcBKOP
	PVEYxrSYK+jtKhmWvwUBIp6FmQzFyqpzEFkSSAZkbEpOdHcv7t5R76aVqCjZEsSGHaMK9MkABke
	HqssEWdYoMIMrx69gZLmJDnRzJ10MyTmAo6JNiTicJENoBm9t1BAmShMxTM+PPL5wQPFK/Ee6Se
	RWvJopgCBxu/Ne8q6jdZXrxwUNMNnkF0DPZWbKnfmcp32ESGqpREpCyMfgoPlF8/6l40X4qntLh
	F4x8GZ9FKSdXKIohvlKyD8vxpjHG9dGMn4Qrcq6J9a80fAE5FRodjUrP+qQ/Gw3dZoI/+iBSgXh
	RKi2h9hopVX3ej68Cb0FlPZ3VT1tnddSW+PFEadjHJgkqWjVDUu1/LsHceyg1Tk0H94n3KaBQ9O
	T0WK761vwlAeO/D2mu3jz2L5AUBguRjGkQ==
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr3947040eec.2.1795059599514;
        Wed, 18 Nov 2026 19:39:59 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:58 -0800 (PST)
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
Subject: [PATCHv2 08/18] powerpc/pseries: Rework hugepage invalidate to remove conditional locking
Date: Thu, 19 Nov 2026 09:09:03 +0530
Message-Id: <17455e3582d4c5c88b20cdb74ac340794268654f.1795058683.git.ritesh.list@gmail.com>
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
that are conditionally taken like in __pSeries_lpar_hugepage_invalidate().

lpar.c:1240:6: error: spinlock 'pSeries_lpar_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]

But this also simplifies the function definition in my opinion - so this
is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 94cd30e9f6e1..abd77c45cbf4 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1224,26 +1224,33 @@ static void hugepage_bulk_invalidate(unsigned long *slot, unsigned long *vpn,
 		BUG_ON(rc != H_SUCCESS);
 	}
 }
-
-static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+static void __pSeries_lpar_hugepage_invalidate_unlocked(unsigned long *slot,
 						      unsigned long *vpn,
 						      int count, int psize,
 						      int ssize)
 {
-	unsigned long flags = 0;
-	int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
-
-	if (lock_tlbie)
-		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
-
 	/* Assuming THP size is 16M */
 	if (is_supported_hlbkrm(psize, MMU_PAGE_16M))
 		hugepage_block_invalidate(slot, vpn, count, psize, ssize);
 	else
 		hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);
+}
 
-	if (lock_tlbie)
+static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+						      unsigned long *vpn,
+						      int count, int psize,
+						      int ssize)
+{
+	unsigned long flags = 0;
+
+	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
+		__pSeries_lpar_hugepage_invalidate_unlocked(slot, vpn, count, psize, ssize);
 		spin_unlock_irqrestore(&pSeries_lpar_tlbie_lock, flags);
+		return;
+	}
+
+	__pSeries_lpar_hugepage_invalidate_unlocked(slot, vpn, count, psize, ssize);
 }
 
 static void pSeries_lpar_hugepage_invalidate(unsigned long vsid,
-- 
2.39.5

