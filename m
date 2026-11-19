Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059584;
	b=aA837+SoaO7Hwq5Bm6ByolMBEp6WKbqNPr463NJ5MeJ+gCVwwULxw/25qy/3fSbwGM7g
	 JwuDoSF7K2y9hX0JHgUvBBLmmVnw7kolz4wOY+Erqp8yfdYjGJ4L/r1KTvQQki1qkS4fq
	 vqKjkGY5blpAaZBwg9LO9qH4UyTeayRAyLalwDbdvkTVc6bf6NXidffBhSwBpAx6zUMLT
	 engBhX0xphdFDuZlhhZiTFKOHWPik3jQCO6LNgXze/xLL/NaefhSg0+erTKXdy3RdiZwc
	 gNEi0+1x6s/ClxRluuYbwVtd64BnW3GTVb6dSqootmZh8ilz+0eOznYT2QB3PmTgzig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
	b=hbsiz94WByZ8hmhMKepvnlRMAaPK578mCgYrrsC0h1ahtWBnQlGbChmENdfLp7yUpnrD
	 wOU8/Cm1XTm1MyqTuOyeJe7YuTPQJT+z7WKLKWEViPXiHfFOFU3UNdY9oj0irtyjXPo/2
	 l/tNuWXGiVFxhPMZYip4ed9dPCrp+IKsmvFmrhK6ITl6koIb5PqRlFO/eHZdjgN1ofqkj
	 oYlZ4oZW0PcsuSnN+l/uHZxVuL7kvIL8jks5Y759oOTBHV+v7N4OZoyqVGShZpIgX//T7
	 ty7iQPwPk4cKSP6uGVHO+7pmyMifPHgzSR/1hbnPP37U9vNryEji4avjf+RF/jCtEdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmLj65hK;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D660A260D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3D660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmLj65hK
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-381d542bc29so3309744eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059583; x=1795664383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
        b=xmLj65hKinLdTxFD3w1e/BJURxv3gBCOHBd3Lf5n4AshT9psk9Q232keGysiidvKrm
         H4qD15RRto9hZCWrjUaFNp7mMKySimX9lJ+gZL3mmbDf6cJTxokRr5HnHROYFEomwTpY
         M+IRp/iNnsh09d8BP+JN8FxNfGDVsS5Qsg3a79jdJTREZbKFGZpOxtMZjuHZ3Wyt3Rdq
         Knzty9NXNWUrHq6vvQc5nagQorG8RPBotDd9k6f69K+4dwfuGbXH78H5CAxaoqWSO9Hz
         jLGLYJm9e0E0F/YzsTJ40rzbSmM9JIGcZQ+tOeWjl+/ud5xrUtZHmLryzhxXYshneCPU
         MIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059583; x=1795664383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
        b=2YF9ha05t0N1VS1rF0tx+ZgQRvOGg6mfdmvvutoysXW6yOiBDPrCIgqqfhk/tnosKX
         zHESWenc1husbMOyAcoi0pwFKhYXx1gBy5fbHKpLMtvukvhvxrF6NHC8uR3DABQ13Fde
         hNCJkit2zcDNTfUM1OxdhcmEO3kknkiXVYH2LWp+hK69OvgrtfcyILWX7uVsSk6gw1H4
         xXCkkxABSeKD2FXCJBwdtF62ohSzlJ7WovYjEFvnEKFPuF1oLn5RoxD8SwzTbQeS6GN6
         Gfiw7YMzHUc0Cc1gRg6YFCmZGO144ngbtJ9c+ngzD/01wIfBM8V5J0tlRVyNeAVSDTuA
         /9hA==
X-Forwarded-Encrypted: i=1; AL+hErFWcD9LXRIRIBw5ZR3mifjH26I2bk7DWbJ2GnTomQpaDLjQBiwu6FcnS4XU/76LPgxfpFUco+FWXjW/FSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cHGhOidOKAAE7OXVaStQ6huna4OxaRbbtDnGBGDEi8TE/Icmr
	g7Raze/epih7TPBmY1AHhf4YvzPcHThU78Bc5z5HhxiJcIgR4HF9YkKH
X-Gm-Gg: AZFdTZdvhRPPV6w5aSx7s1Xesx/g5Y6CLS+OrJb8o35z/qDq3+75HJ9BIYyPucG1j7A
	aRi7Kc85ONCwGqY7KetjFx3Y88BhhTSyHX/q3V/Ud/sZIBYJqHYegRJdRSwEz0ixuTOjaqNQi1l
	18LTn3Ev18+vA1TfZEr1qJrvTriVoh2Wi42CcM2gMYVkBtVM4l6zKD4AVz015xM3uakJRs3Svh1
	6foor5WdXb9yL1tEbzegny2+jDI3u6pHcXieEjpHxxGE5qZUb5O/w0Db/7F1rMC5zcY2BRTstA2
	IfXtTQgbdaYnHob9uMvjRx/Ji+B/Lf87EcSzcxwKmW6rfs7ZIwKg299GlqElGeQoSmy33yK4KjD
	0GFHc4s9e+tlGvpLpVi73+SUqu6fHc3DfxsmstL5lV44XQsom2k/q6ZwMRrwh7zqQO+Ym+A8rNZ
	L15+iu1tLUQjRqolnLtL0pIz1lpINbZiHo8bJnZpdZIC8798VyaqTBL618djjA1Z92u4DXyW6Xn
	09ZK3eD3evtONzqdvLEVOcz/0c3DZrFFlXcPaeplQXk66enr1I+BOb0fJKabBpDLOo/p74UNaxZ
	x6JL6liixDFA+EhbMVDM7JuewrxzuLIqQw==
X-Received: by 2002:a05:7300:dc05:b0:36e:c07a:426f with SMTP id 5a478bee46e88-38281cf6a2bmr5272970eec.39.1795059582944;
        Wed, 18 Nov 2026 19:39:42 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:42 -0800 (PST)
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
Subject: [PATCHv2 04/18] powerpc/mm/book3s64: Annotate the subpage-protection PTE lock
Date: Thu, 19 Nov 2026 09:08:59 +0530
Message-Id: <7ae38230aaf14a87724f02ab955a9196acd27ebf.1795058683.git.ritesh.list@gmail.com>
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
  subpage_prot.c:83:2: error: releasing spinlock 'ptl' that was not held [-Werror,-Wthread-safety-analysis]

pte_offset_map_lock() holds ptl when it returns a PTE and
pte_unmap_unlock() drops it. However since the lock is taken inside the
helper, which is not annotated, so the unlock in hpte_flush_range()
looks unheld.

This patch fixes it in hpte_flush_range() by adding the needed
annotation here. IMO, should ideally be added to pte_offset_map_lock(),
once that happens (since it might need larger enablement), we can remove
it from here.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/subpage_prot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index 37d47282c368..d641c35c408d 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -73,6 +73,8 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return;
+	/* pte_offset_map_lock on success returns with ptl lock held */
+	__acquire(ptl);
 	lazy_mmu_mode_enable();
 	for (; npages > 0; --npages) {
 		pte_update(mm, addr, pte, 0, 0, 0);
-- 
2.39.5

