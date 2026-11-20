Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147419;
	b=c/oH512FsFyFdy8SC3pVip3tOjGvinCXLCd22d9qcVsU02mMYKKV7L7cpQg1sXPCcKdB
	 z64U1t/AkoVUlWgg+6wGXjITidqrysh73DwdmGhQPRx8gDJNrfsC9O6TCjWlxjBB1WbTy
	 ldBmjXNQHkYxKgvF3MdE0J66A8VAo6EeV2t3ySat1abobdhFUuWdu911ubVPRZfEtimFq
	 FRHEJs2yFPz/gtImiJGKlG3FJHcD8YIWVF8zUZJUOTlLXr5L1WEO8iaZDT5WtMoqQ0UwQ
	 PO5PDNaA/2JfIkTzXmELThyBbMGDw0whdlofyHWAZ2bSiGv3YqWy9uxyYC08zUaJRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
	b=pdlR+7WjcRk2coiILaq2oKY/Ixn60tmRZh/vS1lAMdszT8OCpYNWGd0fsJHf87Te5zkZ
	 CCYy9obt5/UOgH/Z8dJKg2aylPoqFRtD+4GMEDcad0PZP6koa1SiSODevn5SW/DqlOjhB
	 0X8QKOl/H2rLZa17FsJKH6b0KaZrDW1tLHUfpBWpAZ4ySywr4psYmtqr64TdTB/mT3do9
	 xxkUjMyZqvTcWtI4SkuGHCzzLZtNMQvttNSDbehbc012gSYU/4jDYi+hJ/tuFvycOloVT
	 4Z85iMwIigDmh85zm+3xvQRP47zX+2Od3cW84Y2dJ62qTyD7es0J7pMe+9OR2D/gYOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SeGEzLj3;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396F606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6396F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SeGEzLj3
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3ada81853so530981c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147418; x=1795752218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
        b=SeGEzLj30NGhm91FVAZiFpLxprT3lffmDzmznMDmOWYHzMZ7n+RjZzAzRZL1X07U/X
         D5MVQtE/CoDgERerbLmZIyydupPASMTqMlUtyVXXqMW2aDQqis18dwV5uzCNIA5F+1xe
         oTmSUw+g3l7pMlqMUgDY/ATeKXlJ+LW/xu1EsyUVRHBuT/M4WADKR2FAzQ/uVRTm/fU0
         sYgKGx2nk4IW/foMF0WUo/wDi5K6kBg/0MlO4DNK3K/K94PZwzGmJ2SI8JMLEqNwc/98
         cXnIit0YuAg0J0A/Gy1a9kCYFfnG7MCu10uT35VgBX53PP6iIVSey6f5pWtIflV455si
         N9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147418; x=1795752218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
        b=2v1qJ1fz2Eelz15zcSOFXe/Itl4f1/ZljQ2YFNFm8byZwoI66KCFU2zijL9Bocc0mt
         z2OPEGcWQ9ncOevfDFbI/oSgL0yRnHENy92Hiql6nrsgUs7WGoa/4lRp+Txg8/z+N8Fc
         BpVwZaNne48WHLmpxraXp2K0NW4mAUKQEIZWQo436gatFYuqL+sf8kmSl6PpBm8U835l
         DpaafToA8IQ3QmJmHU+zVDHa135Ndjq+4XDHUBq6eCba9m6geQRUJgdKo7FShzO8xOGC
         g2BzuZ+Sc7tyNIuZBf+wOvWwiOxBPlaoijErCDywYtheUOZVThzLyUxbW9UO7w1DYqq3
         mJJg==
X-Forwarded-Encrypted: i=1; AL+hErGR2quANs4A+q3FdljG++nvvNBvD0rRUTgmZvhjZv6hJnVpdl7xluwN1MAl3SRAqHp/Qr2Oc4MCQh02RnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/OhweXJra88Xi+pBeYOPF9MFxmilyc10QAJwlC39+DPshMg9E
	kUUSSfKLhFDj5s8f8+uCSFydTAE/sqj/KCQ1BsmCFMnWp5s7mqRSrsvf
X-Gm-Gg: AYBFou0FMDlh79yXTIa7UFAZsCAPG39hOy1gbYZ9MWkI5kNQEj65HedVHsq+NMsRBr7
	IPtdvNdmlbNSMxhICN1IsBw8L2fD/RDi4kgeHqwd8/YxMDfQIzdu8MLaY0vcDsb9V033X1Kg15t
	PiPquGGUuJIvYYCfXyWMYxm9n2lmiyOOpOe7hNcCqQPZD5uRQmRjry/NROdwgRoUH3M+LOrp2NY
	Uj29fMemB4G/oyRCYI9FHlEyGq/+Z89n/alUP0iJ3pUoMORT7PH46ezN6FUYp9Xh2iXKIEwPmcG
	kWJMq87iPz4TAf7fqNpBQOAPauwqCxGHmwzhjDnJm/mT+CMz6+lzJ0bj3ZvfVIPngqlyqEsLtj3
	dTow9dLfaPhouhhTenTcdpfgPZbyriUUZMrEVL1ojzttVkCTK8FPLXkTpCv45XPjtGmzmKenuha
	gtqBxNmF6TOCxIb/ymIQqQ90exGP6FXnFdhUZ0qsIGMg5VR7Vf0l2wmqjZWgog6g6spfK9V/Vea
	TUR00AXB/8qxDVvBKvhdXdV1v0LGylaUglM46tlaKy32pkAhoKjs11NEQ859MfJqaZ6S8/NgquS
	4wwgRPRud0U2Ppt/HLw50FuseJOCFKAC7/4=
X-Received: by 2002:a05:7022:290:b0:191:444:425 with SMTP id a92af1059eb24-1b5567c0fbdmr1640506c88.2.1795147418460;
        Thu, 19 Nov 2026 20:03:38 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:37 -0800 (PST)
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
Subject: [PATCHv3 02/19] powerpc/mm/book3s64: Rework tlbie() to remove conditional locking
Date: Fri, 20 Nov 2026 09:33:01 +0530
Message-Id: <f6de49ee75ad37cceb9b67bc1d79ea64fee19258.1795147055.git.ritesh.list@gmail.com>
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
 hash_native.c:235:2: error: raw_spinlock 'native_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
 hash_native.c:245:3: error: releasing raw_spinlock 'native_tlbie_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch reworks the tlbie() function to remove the conditional
locking. It fixes the clang context analysis reported errors. However,
this also simplifies the code around tlbie[l] - which is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 34 ++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index ab2a80e59011..6bad0545b57a 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -222,6 +222,23 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 
 }
 
+static inline void __tlbie_sequence(unsigned long vpn, int psize, int apsize,
+				    int ssize)
+{
+	asm volatile("ptesync": : :"memory");
+	__tlbie(vpn, psize, apsize, ssize);
+	fixup_tlbie_vpn(vpn, psize, apsize, ssize);
+	asm volatile("eieio; tlbsync; ptesync": : :"memory");
+}
+
+static inline void __tlbiel_sequence(unsigned long vpn, int psize, int apsize,
+				     int ssize)
+{
+	asm volatile("ptesync": : :"memory");
+	__tlbiel(vpn, psize, apsize, ssize);
+	ppc_after_tlbiel_barrier();
+}
+
 static inline void tlbie(unsigned long vpn, int psize, int apsize,
 			 int ssize, int local)
 {
@@ -230,19 +247,16 @@ static inline void tlbie(unsigned long vpn, int psize, int apsize,
 
 	if (use_local)
 		use_local = mmu_psize_defs[psize].tlbiel;
-	if (lock_tlbie && !use_local)
-		raw_spin_lock(&native_tlbie_lock);
-	asm volatile("ptesync": : :"memory");
+
 	if (use_local) {
-		__tlbiel(vpn, psize, apsize, ssize);
-		ppc_after_tlbiel_barrier();
+		__tlbiel_sequence(vpn, psize, apsize, ssize);
+	} else if (lock_tlbie) {
+		raw_spin_lock(&native_tlbie_lock);
+		__tlbie_sequence(vpn, psize, apsize, ssize);
+		raw_spin_unlock(&native_tlbie_lock);
 	} else {
-		__tlbie(vpn, psize, apsize, ssize);
-		fixup_tlbie_vpn(vpn, psize, apsize, ssize);
-		asm volatile("eieio; tlbsync; ptesync": : :"memory");
+		__tlbie_sequence(vpn, psize, apsize, ssize);
 	}
-	if (lock_tlbie && !use_local)
-		raw_spin_unlock(&native_tlbie_lock);
 }
 
 static inline void native_lock_hpte(struct hash_pte *hptep)
-- 
2.39.5

