Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147431;
	b=POeq/9EeJPTnFUcomXGa/Wf7XYjXfG2AyaeRfsPCERKcMiqO0TLmH9VNTcq7Fh9KBmU0
	 Xtbnkn0Y0mThrYADTftIUF9tuP4Xe183rokgpN03/kgyEEOro4rqzC09hQTUU4FnZwAgV
	 Hql+EiVZDnF2fGzddn8aEhLx7SlZgVyHFQDEdN4TzwyUF7zkydDPZeaxvMbs5cUqqP3kb
	 0ywtIJirOsL6I92xTcQ3vNfo1IrHij2nBLoUKYttuunW9a9bm+k8Ddy+BpDMcvkLW/56Z
	 yRqSStpo8zfqr1BmnY9jJb2SGD8K9OCTgYwx4EN9MM+fZA2oOfdFNOqJ25oxSHjn8wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
	b=mIw9eXnTZf8QGqJs6D0qJIOeVXShhT5BCZrm1waqUmvcuK2iXQ0vFkyBOxQvDutnw0j1
	 MaYApmCcfg/lGQ5sxTBOgo4Ai87hF5KdTbB5vpqsQ96h3CdzqQ1Rmf32ql0f5HruM33LB
	 bAuxZCbriWsfRBjMTcgdXt/QCPgalLv9WgTm862PQiT7P8tC2z3UiJdlfvuJR/N++ynL9
	 DbalPcn3C9D3bJ3JQNHQWPeleFojjOoV+znEpFzWvDYKVC0Xdgej+KLBIHhlnOJQ3C7gL
	 ZVifVfMT32Ulht+aKjnIj3ZIODdm3l1anvktWvZgItE6zO+/v8aL5Xdxkfmyd2p0rAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTn2V4zh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DD606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTn2V4zh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38431138772so541578eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147431; x=1795752231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
        b=ZTn2V4zhkqpYSqWthpIsCR6D9kHAVOel5gx+/bF0Pa7LpaMbourpUODFY7ScmVbkTe
         Nrt1ZwRwC6LqoDaD9i6dqxm12v5qFKtevpbhkmJqNq/sJ9w8UKJY0musbXEtVjq6ML1e
         kjPRwvWamI/muRXW40E3+TIh9g9W0A11RfePcFUTjCEb+Nbn7HQrug20OqvHwvlSSvhN
         bwFDrNGqGrzzjF0zyvT1rX8KJ9iBIdkYesUljLzQIClv/gVxD7jZNhO0b4bpGYQ/azvX
         /NYwOlfKz694YkrFrKuVkssI+YCgHcnQ6pQrOcXzN0W5P+mehxDAKhgGi74zAam8/ehb
         tUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147431; x=1795752231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
        b=rZRJmUR/8bl7j4cV9iFXJGdeeSk3igEyRw/5wZvtDbrcu10msUFPD/PszOuY6dDGof
         LNhguIDMtyjpDen293Jy4+UdoqnGRi1GFHjNlkpwcUu4bjw4y8WyohAyTw73G7ZzpGXW
         Tl7POgh2Zlu/ND79Fu+dW64qYzLyOxPNkVUw2PrmIZqFVL4zKbHDxohgwKCHwPugoNRk
         P7b0QliyKhnzNswzArno2G6T1rMnsX9aFyl69hhUR+zjIM+o6f0CA6M4Nd2cF4IJGuED
         Sqgbt5esaq77dzfB7cni8a9q6flPGSH8NnPkYkPrWUIA4/9bTJP7uGQGiVPUptsLsOVE
         92iA==
X-Forwarded-Encrypted: i=1; AL+hErGkry7vCnJfJCNdnlofErJhGTam8JxVOFMVIaoyyKQ3u/lLriwnZpm90JLTPVOyoqYG112anJuquvTtngE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9utDRiSIkq/VlEQ+x6zCwfdpMeQIyEncx6fUMGQPkBOE9a79t8
	ljzGLBbZN/8PeEDN/TLNUI9CmTxHh0Cc1TcdZXbqyxzJqBaYZ9SSrj1C
X-Gm-Gg: AZFdTZcn8kDexqMe+73T0iI0abZUa/Jh79ux8uWczHXpAYoMUHJuGVvXwl0rEiVeacs
	ZbuVNT4Imph/MfeFo27Tq2NBkkOcWFl6e2sj2QW3nyJOdKJRxRuCwSMcL/mbHZC9fonhSqjWk1S
	sfvzyiZ5B5ktw9HT080xGTx5J78GDZcigPdM5MzD+U/iLZKfzK+1pw42LG9eG+FwdgexoSOciw4
	mYUi7nXPfz/PF7JoahEhkAfHK7+6ufFrkHHnEiZBxB8EqGUueYQ1pbw+0WwVZftu4T87SqxTzAa
	JxOXCJqB/hiZo74gy/zurF4TLOE1FyG6J8vZLL6YLo6q7JNfM0cWtESagkv+Lx6yCXpP78jWnO5
	SNn8SBK5R0JyK8OskIGPpqk1gzpxushUJo7SxY+eoZBA8Olgryof3FJ1MHN0mUcBhzPNj+daAMY
	rbX/DDKbTwL+6Z9dSWL223u6TrpPcndbLjJvDkOD0tzkclEg6xx/7/WG9ka7KzqXlGUIKbTgT9o
	wAyI2hzRGLKbJBkK5DBkE1J35VRPCzATuX4Z/fy2L6vbLdRGHQY2ojpyNjAHydqh5B1CZhu2+DN
	7l1c2EBoFlH9e8vudKAtzjol2J56sfFGpg==
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr2141216eec.21.1795147430620;
        Thu, 19 Nov 2026 20:03:50 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:49 -0800 (PST)
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
Subject: [PATCHv3 05/19] powerpc/mm/book3s64: Annotate the subpage-protection PTE lock
Date: Fri, 20 Nov 2026 09:33:04 +0530
Message-Id: <2f7b796319697323ba44241bef7d5a979213b79d.1795147055.git.ritesh.list@gmail.com>
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

