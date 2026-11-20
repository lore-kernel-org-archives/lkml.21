Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147435;
	b=byGOCpMdymzD/SDGE6x0ydQh1FDyAXoQV/SqkmuNoGNOTDnRLcc0ooWPBMTIzA9GVuJa
	 si3d8LGeVaf9pry/okP7dmjM3qseLc7WDDZglebscNPaWi9TNpPsST3MePfjXESypIHVG
	 y9Wq37z6B9zEgAbMjzM6tkAsacGrKu9nCfC+gnkwWSxCK6lgcJOWRIdPWVtEt731vlO19
	 YdB0VA//CVHosb8qxxXGT3j+P3s9BzTfebch5aDYj3IZb+TgMYHNwu5KX1QFL16d5lFX/
	 pZcUx3g+W9mLH4m9Pf6kWoKwG1uI0i4Ey2g8t22YIXZIejnN9Ze09YuELtdok4oaDmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
	b=izFvrKX2hDBkCl5BbpxZ4sFAiHKwZKrBeOFLHsPKO+KGcjCnxwiOnOPaC4Ycw3on4+lK
	 fw/Zy7bmg/mZnA2AlVLGwzpOTzsPVMChK7eSr+l6OJaFK0W0Bn3OMOP4TFOZFhgS2/EVY
	 QtKrmEYzbBs0hbVu2r2AuZ4p1n3WDnqtwNyvDOXdevOfZ/I8TXNXMHYt6SUj4CUl57/UE
	 S7L6P/8AWRJDFmlVN/KuOYZlhFPHTYJEqCd+tZGgopmB9oPfvR2QfdqQZ1tOexQfkAGPV
	 2Wic3b+vFqumXTIXwXWvswxVD5Onf8zjjTh7uaCpVs0w8DXkwyGiLmtT3ytN5JNx0YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aga6YuzL;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C0606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6C0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aga6YuzL
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-380b40319bdso559618eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147434; x=1795752234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
        b=Aga6YuzLIRacZGeh4+1zzH0JFuo16nY0NUkng2IXwMyZgV+Yvit2/gJdb3KVJNv4tI
         QWUgKq0MUVPnPfULabt+aF2z/8Vnlf7Cv//E8WMkyUjTl71gyCRkUSdfOdNbYqvqa0yl
         YBwMiSbI3Yn6vBM5htzC5xZwqAVS0sv/l+YK+37ORhQ9441emFyJ4iN4u8pQAw7WhDtF
         /YL3RjYC1gaCwDuB5R98YyRxgpqtM/+6W605Z6fHelKSAgeJnBTXNWXWU7LjdXP7AVFi
         VdgUzazgGRCVabe0vWO9S1B0TcR0lQNBZHAY2RZ+/PsXas2mjkVwRKVRgBV8bgQKCIwp
         GCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147434; x=1795752234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
        b=EflCn79t+a1qHEzOhLKUscmyiOtUbtJtJUNaLjKOG+TLPK1kPqBWIrhJ2UVLZVoTqY
         ITA/3QILvGCMcHZ+o3v4sqFmRaAvZuWUFDp4+nHvVItvYngP7Dv8C+nCBtsbtsqFRdvO
         pxgc6JljbhfXykfrYJHi3s9ZyBPEQ/ALnWYhPAEQD8UuHe+NKewm9SnBYUApYumjj7UN
         xjK3ZbLRlWFDWCTfvQs0hOCEgc56Wpvf5q/78urJr0aKEeUf743RUvOecsKaugYFSE6r
         vIDzQDeRkiR21qHcdoD90k4iMv1ZjudJAQbG489xIFaSeUD9kaUU8h/DmgO61bXv6ROH
         vG6Q==
X-Forwarded-Encrypted: i=1; AL+hErGTDNHG8DEYOgrJSBSaDHq/uK+jDN1SowyZQKnTJ7EvnyRFu02P8y2taWYKYTLf/2k9WOuIpRlpVnm5SRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+REyX8XkRCLrCS23HM024ZL1QU9MF/CVXYD/E8kG107zH2jqOF
	hf6eWcJcnk52XgQEO8F0v6LLu7rQ4VMUjdtaaFoh33bIEvylmjsAjycq69VJtQ==
X-Gm-Gg: AZFdTZdjqAxOgwEdMUnOWIiEwSrGof7I6F8ItUN0FOf97oMJY5C0c15F9HcNEJ/PT6C
	wXpdLeVn7nVYZbhtiz9MYh/3BX+HCJggCcd7s1pPYbyXnKqwiugyFA+B855x35z7n/RxwFM9Gjy
	HkDI94LNPYQtoejgbZnK5p0POUXf8V6bXGOH29Wq7WsojT4BCsBbVO/FyYpVj0rUfzAvYvaEI12
	yk7t1kFdDKLEQv87t5QH22YUs6dFUdsRS+0q0UgjyPOny/Imj5Rc0FAatlTzCvySt+XJnwpgwYr
	W7l/sMCn+Iu2pZigjWUaMYxBNNCpmjgfMUc733Dkvov8QEBXPOWa014+gfakMTWT1+QL+sXjzGe
	PnOj2hZgSiWXcSjVVKyxTQrrSONOwzGgtrC9fVXBnu1eg5liwX562TWGPqCSjkYY/zmWCclosFT
	cc/WeCjct9+tSsesk9I7ZR2x/wtxJU7NoR5pixl4hvUprXvyAdKd08D3uWvoF7nYGkjnoZK+ZZW
	Wxj8X9UNMh96xw1uSp/uwM4kRqYtUUtVNOztCqkQd6xHn/Ec/6v6q4dZ9cuLxG2ycZnFlE8cCuL
	Vci2XcllsD28+vf8Ne+Eb9tadbgp8YHoMA==
X-Received: by 2002:a05:693c:62d9:10b0:383:d3d1:f315 with SMTP id 5a478bee46e88-3856fd5a67emr1690093eec.19.1795147434540;
        Thu, 19 Nov 2026 20:03:54 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:53 -0800 (PST)
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
Subject: [PATCHv3 06/19] powerpc/mm: Rework nohash TLB broadcast locking
Date: Fri, 20 Nov 2026 09:33:05 +0530
Message-Id: <b40b6042422310e8f27f0285e7c6086c32e29d45.1795147055.git.ritesh.list@gmail.com>
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
  mmu_context.c:141:2: error: releasing raw_spinlock 'context_lock' that was not held [-Werror,-Wthread-safety-analysis]
  mmu_context.c:147:1: error: raw_spinlock 'context_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]

  tlb.c:257:4: error: raw_spinlock 'tlbivax_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  tlb.c:259:5: error: releasing raw_spinlock 'tlbivax_lock' that was not held [-Werror,-Wthread-safety-analysis]

This reworks the locking in __flush_tlb_page() a bit to satisfy clang
context analyzer requirement.
Also steal_context_smp() drops the context_lock, so it needs to be
annotated with __must_hold to inform the clang analyzer that this
function holds the context_lock.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/nohash/mmu_context.c | 1 +
 arch/powerpc/mm/nohash/tlb.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 28a96a10c907..bdbe1f55f388 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -95,6 +95,7 @@ static DEFINE_RAW_SPINLOCK(context_lock);
  *  -- benh
  */
 static unsigned int steal_context_smp(unsigned int id)
+			__must_hold(&context_lock)
 {
 	struct mm_struct *mm;
 	unsigned int cpu, max, i;
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 07a2db16c2b1..9297549aef41 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -252,11 +252,13 @@ void __flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 		/* If broadcast tlbivax is supported, use it */
 		if (mmu_has_feature(MMU_FTR_USE_TLBIVAX_BCAST)) {
 			int lock = mmu_has_feature(MMU_FTR_LOCK_BCAST_INVAL);
-			if (lock)
+			if (lock) {
 				raw_spin_lock(&tlbivax_lock);
-			_tlbivax_bcast(vmaddr, pid, tsize, ind);
-			if (lock)
+				_tlbivax_bcast(vmaddr, pid, tsize, ind);
 				raw_spin_unlock(&tlbivax_lock);
+			} else {
+				_tlbivax_bcast(vmaddr, pid, tsize, ind);
+			}
 			goto bail;
 		} else {
 			struct tlb_flush_param p = {
-- 
2.39.5

