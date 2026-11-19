Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059588;
	b=Od+y2WV5tSH383B0VQ1w5Y4KZMqaEm9QUivFEy2u9PWpaaGcdej3gkap7SxWGwWpNoKl
	 81gkUNE0IXKWQMsUH65rgISyLCV+kZyWA0SgsfSVs8m6wF81ApcYTOKYMyxQtRpUDU5QN
	 WOXvZc1DmzUMldujK9T5tbhAf+nTtamKO5BOzWwYl+ZD3fx4mwKjmaadtO+kutd9FXMX7
	 Az1vWlYuRARdORfo+gVCjpm9i8xBZEgblYNp7TBN0g6dtyvcU/oDQur6TfLllItMFf0+Q
	 MEiFapK9MeeI7Rn9DvA0yrBMwA8eb2g2T0F+MUBDg2jgrrPp4xbhUoThZmPJtUW+Fyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
	b=SYQvsbxiKMjMW+mPltUzuhxr4aaLMqmZmtvu6O0fAZkHH1O0oBVdELh6sGA7ekpQwQ98
	 /nU7j0r0OkVlnrQRTNGTaXAbBIJ5xe3BBadPyN3k3ZGhuijVo6BveZVBBgRg/36z7Ll2O
	 yngbeZRSy9WWH0cBwccwQyVeTc95dE5/khXiBexnWy5SYZiBjKfqXKGm9+ecwBj1blEAp
	 BAnRQ+KLbZl1HjOfk32cjtaVmum5PHMEph1V1tJtA4554zA2nRJXSqO5ngu9WUAkQv0+C
	 mg4Gwa5C0pyJmdVpxSx8mFHjcbev53BlnWpsTnU9DK0xWcSiLnbCIlsp0QDWr5BDICA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fe9dAMUr;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F2606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8F2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fe9dAMUr
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so2333722eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059587; x=1795664387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
        b=fe9dAMUrA+y17JGMSrFCYQpD1MHANtLfcY3ET3bkPQG/mrJKKU+v9WjKc16HvZCkPS
         2c+5AlvQFhG0YSxmyy0XaTckD/ePV3OXgenqhEcr8bzaX3AthZ2YTXOdc0COGLkCl0oN
         wr+WiswB86CaZBSdJcjpxyeBb2oSYUfFQuY3D+aXwYXRLmwgMDD6Dop1ljrywzndt9ia
         s5x4zwxxChoSnib6Xd++7kS69rVjy1FUP3EHnjGwoRsx4LAeQwy6Zdvq1C6jQVZe1ZEC
         g02efAuKhj7J46v0rHKpjYY0qjdVgSbdwezmSFglsPVnVE4PiVGx4UM495aRtBI9Mw3o
         ZzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059587; x=1795664387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
        b=VEhYq08KnfC9gf7N/2uQKTs8LVyuiayN+P8fk5Q/ikgQmR6+j2XTOKUlbzfuwTrbuN
         V5OKOcAMfkSyYSosKyjjZJp3S90lwOjn9Kt4jB8Cf51aEATebJqP7N+JCwJl5e9pwTWW
         Cw4bw0iSMIT/kzRwUUjuAYKzxxqsK4BVyZQaDqXUvJea9XIe/g0sBdGy10h+oO1ZjV7c
         xEJWr1r4+M3z7UWKtsd8YlRMl5MdlILBrMFVI5VpZ13JXmqCiKEFUK9LXYvhbUi/MPxH
         xRu+TXN6bRu+w7L1/Zt6TIlnmqNZDVjoBS9hBl0e6ECQN0D4wIzL32VwFwijijYdMgkZ
         Otag==
X-Forwarded-Encrypted: i=1; AL+hErF3vwHNxgd/MKLj68HNg3X1yJYGB7VIjkuMmopIqJMk7PYCvxgVj7EqHS0KLLRuys8Q6O+LLnjf6aRaCK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xck+VQXiaHRq5QapVe63J5arED1zbJFWrbCc43W+w6txJ5mHK
	N/4b9P35iIWrsT2I9nqQSF38ZHbwF6FaurqmtgUnhzE5i4dW2VGnhHw1
X-Gm-Gg: AZFdTZfaCKHgUHCiZSVWAmacn1kDdnUXWhLz4Ar5hZHTUM92nfA4vWNMez4O32SBPfc
	Mz6U0z8glRtnU0ufzs9aNI14+iyoNRcLH5Ef4T5VeKNShBh0KPpgiY7SbwY7P10Tc5jt+vtocr7
	ZL/PvmCVJKjebBJEx/2Vqx9aB94YrHfQh0J0La7+S3S093XSbO9hXSyuxHr6BQY32Z4cvBhUNbE
	f7ktE/Tm3wu3w8JmU41h9tMlyak0hvL8iyMSQ4K2RfNEwqjyvQL07Iq3Soh1nCfjZjkca1PsMHW
	1kb2EXGT4Dvy6l8PNP2iGxVUVjpEt4MdOJaVMNX/vdifUfxy41fC1T9MF0Bf+tWUGCBSwq8f+CN
	KybJC61GgDKiFcKhn8QnuKvwx7Y9XWb4mFeAxZXKuAPY6fkvZU5HgdTENuI2iBYavUR5Dg81uvL
	Cv96hU1E7toxocOjrEQXoq5o0fdD/fQ4WKODfEDy0O0kfU3P/fCuTdoi3hKRUkvPxCRo4i4F0/4
	uOKIv6dqwIbdpidj7zqiRXiO7QB+94NDux44VJfV1fUjdOZxUzoF1Y/I71TDjWTuSimac3djQ+n
	Ahyh7hzzbdtzMyx0FqEy6DgVFSCgQk2JmQ==
X-Received: by 2002:a05:7301:18aa:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38281523ed6mr4502295eec.28.1795059587100;
        Wed, 18 Nov 2026 19:39:47 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:46 -0800 (PST)
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
Subject: [PATCHv2 05/18] powerpc/mm: Rework nohash TLB broadcast locking
Date: Thu, 19 Nov 2026 09:09:00 +0530
Message-Id: <ce4051abf3e8256e67232880f5381ba2f420887b.1795058683.git.ritesh.list@gmail.com>
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

