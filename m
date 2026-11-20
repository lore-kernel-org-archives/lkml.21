Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147411;
	b=uBJT1hJUQ5Yg4GJL2DZFDRN5LAEy4Re8t6E/0WQ0cJM1nBtB4MWzQ5RtIS2KwlU4v9LH
	 iw5eTVtBTy+Ye2QgRKMKSvLk6ha55XOfVkQMsQI7gzN+ostZwtpj60baTgRPkigmMQr0W
	 Wo8eBnwDKJdt1vShjggchRwdmqlvvdvoaACj3DaKKRjyS+zTD4KDBOjNds966pztItxH5
	 l0fsqHj28ejGqMksa7TDK5NQnkB/lOGGqOH6fWuGSsDXe68r+ouHpiUdNsg5BcJZTPQxv
	 R657XFxg0EqPbK9q31CJSLx3SdFQKKopJK7G3uCHPGssmpAMzVy3f5wY1kE9jGt3PdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VrGBV7RnHyqY/luoSQkqMxgQv+Ks7bSq84D1rzXmpdg=;
	b=AQ0xy+i19lsb3tLrY2ZfU6kQOrecXuASbXn8esHKd1ZttJ93g3OLvgtDepuGnLF7cLxn
	 qPCzpRPpZr/wtLZiuBGo+YcdeVSlVmSE+9igTca1NjvASOXr6FVeteHlkb0nlWg7U4xYQ
	 urJLik4ek+NcmrfdUekHuM+bGsKqYgMrWBinSx+pUTJjZYgW6rlwsLL/nj37F6GM95Mds
	 pdVqk+QbXfN8FMbPwHtbpGdep+75jaSFdKiHLATSAClmulDQT7oL+KJScnBExsPVIHBrL
	 VnArgOaZeoFx7qeYC5X+G0PDL55IDoncjLjAQZD2UrNQ7KJAJiH2+zMy6M7cEfszreQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vL1XCew1;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37019606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37019606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vL1XCew1
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so707660eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147410; x=1795752210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrGBV7RnHyqY/luoSQkqMxgQv+Ks7bSq84D1rzXmpdg=;
        b=vL1XCew132usZhKw292/n/AihosBpCvqZ9p3SjiEdTT1ayQ9aD1NHF4TCmNwDoNEkH
         BZjBjXZ/dYlcBSd4+YndoIFALhEvjRiLUIaOFOc3ubXD8ARHDDKio5SamKfynvur6+xw
         1sYVyRfBOBsyEar1/6RmdFrCsmOZau0e/++6WARFhsxpJo/XNJWXQXDJEQE8x7+r2NJr
         O3G+LLfg1o0JRDEznDKc5SaOEsw2RBElrCvJNh33nF5s7RzwtonHZTtf5TPrAfFnCSLp
         a2vyrHgmyGtVIFVowY0qjf3W7GDwu1ZtAnZHLARc/PchiM4edgZnB1E7LyvDNWW55tr1
         Gu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147410; x=1795752210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrGBV7RnHyqY/luoSQkqMxgQv+Ks7bSq84D1rzXmpdg=;
        b=ASOczHwyjwEvP6YefBNfjtNBan+gnRDVPFodH9Ruv723SzYP3UJ+Lft8H1fujb0sKW
         Lh1do9FnsCHr4iEqEu7B+F2Cc/otMScCxPbV3mwX4fzRF4wMfVUzFI/3u+HePeGaAkSm
         Bi17+vTxwF2Kw3DgZHuEBnF5eO5tIAbLUNqRz9U/ThxlQ98e5bGpIOx7fKmuYA39lreI
         /VC16t5Eyp6Oa2/M/LamjN+rXfrzz8Nl963N0MdPJxaZMOn+C1ZAnb4QBIDIunsJgstA
         0rA0KP+oZmJMeyn3cBykpU+KsXLvfpKT4Jis526Q9Af/6bfQikcarUUqWivL8vXrkT3r
         fs9Q==
X-Forwarded-Encrypted: i=1; AL+hErGxH9tK4nd+2sg+w03tzQ5ouDswBIHihW7Cud52CDOKIfVq7Zork3J/wOxvKqLfvml4JSt2h57HUuL7pL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IY6OtoDvoeR9HTTpJOZjXPEgdDYv9MWHVCv4hu+5fg9KfS3Jm
	IU0URzxsMbo0RdRauCes0rhd+oyQzM8n5qL8FRzuY9LFiqyVrhYHUmS+
X-Gm-Gg: AZFdTZfCq/VRlVGFMsoivyVml7DKNd4/Y5mXjov4JCWEelTd3wNtaHQhiYDpUdnMNEx
	JdJjdGqhJzaeOKxAhZLDfSGtQVUwcCb0xF/G6vl3UcLOPjclKojVRI8vuLJb98E+pVSxoKYhLSR
	ul3ooYXqO5mQSL+Tv+YO17tJoxhx4uisLgcYW/YG8T0i9NI/oXci21lWmYdRJEfhokz0Pw17FtS
	xhgfh7TxEfvn1rTKMasmAjEGuId1OP2Vewdu44BTzOKey5QWi4qAE19exfZoAlgNPsYSLepAZK7
	kYngf72nHrFUwPKtzO7KbbdmV1KMXogHs0H667L7WFvgitW3xFXRw62cvFS/laoU3Wk5o4W1bps
	4IOfusX+uCQW7oDwHZv2NUtZgbfec0gg0OAgQnSR+1nQsTFEJ/vQAXRi9S+87Fo+7bJHxXczV0y
	9BI6oprXHRSeNxvurdoQIQg1Gyhx6bFf12dvkurGS/6GvP9OM3OKpIMW5icjGyJr6K43JkjQWOh
	kHyWOk9fiygEUVa6qOthCSMJzPCT36mbmFFKnCtbt2Veca0ezT69t7n7io+KF/MDXxubAZxBjQo
	2OB94ue7DY1nIgYWV9LTipTjDi2xdt7jug==
X-Received: by 2002:a05:693c:864b:10b0:377:1ad4:1947 with SMTP id 5a478bee46e88-3856f14d3c8mr1630324eec.6.1795147410323;
        Thu, 19 Nov 2026 20:03:30 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:29 -0800 (PST)
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
Subject: [PATCHv3 00/19] powerpc/mm, pseries, powernv: Enable clang context analysis
Date: Fri, 20 Nov 2026 09:32:59 +0530
Message-Id: <cover.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Enable Clang context analysis checking for most of powerpc/mm, pseries & powernv
platforms.

Lock acquire and release checking used to be done with Sparse. That support was
removed [1] and replaced with Clang context analysis [2].

Note that enabling this caught a real locking rcu bug in arch/powerpc/mm
(Patch-1). Note, more invasive checkers to check what each lock protects
is deferred for later enablement.

The series was build tested with LLVM/Clang 23.x

[1] 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse support")
[2] 3269701cb256 ("compiler-context-analysis: Add infrastructure for Context Analysis with Clang")


v2 -> v3:
=========
1. Added patch-3 to remove -Wunused-but-set-variable on 4K with Hash (reported
   by Sashiko).

v1 -> v2:
===========
1. Dropped RFC tag, since this series is looking in shape to be included for
   v7.5
2. Clubbed both RFC series {pseries|powernv} and mm into one.
2. Patch-3 changed the type of i from "unsigned long i" to "int i"
3. Fixed commit msg for patch-14 - as pointed by Sashiko


Ritesh Harjani (IBM) (19):
  powerpc/mm/book3s64: unlock RCU before returning from mm_iommu_is_devmem()
  powerpc/mm/book3s64: Rework tlbie() to remove conditional locking
  powerpc/64s/hash: Reference all arguments in the 4K pte_iterate_hashed_subpages()
  powerpc/mm/book3s64: Rework native_flush_hash_range() to remove conditional locking
  powerpc/mm/book3s64: Annotate the subpage-protection PTE lock
  powerpc/mm: Rework nohash TLB broadcast locking
  powerpc/mm: Enable context analysis
  powerpc/pseries: Drop inline from hugepage invalidate
  powerpc/pseries: Rework hugepage invalidate to remove conditional locking
  powerpc/pseries: Rework hash flush to remove conditional locking
  powerpc/pseries: Add context annotations for the DTL worker lock
  powerpc/pseries: Annotate the VPD sequence lock context
  powerpc/pseries: Annotate the RTAS indices sequence lock context
  powerpc/pseries: Annotate the RTAS physical-attestation sequence lock context
  powerpc/pseries: Annotate the DTL debugfs read lock context
  powerpc/pseries: Disable context analysis for the CMM hotplug notifier
  powerpc/pseries: Enable context analysis
  powerpc/powernv: Rework OPAL console write to remove conditional locking
  powerpc/powernv: Enable context analysis

 arch/powerpc/include/asm/book3s/64/hash-4k.h  |   4 +
 arch/powerpc/mm/Makefile                      |   2 +
 arch/powerpc/mm/book3s32/Makefile             |   2 +
 arch/powerpc/mm/book3s64/Makefile             |   2 +
 arch/powerpc/mm/book3s64/hash_native.c        | 122 +++++++++++-------
 arch/powerpc/mm/book3s64/iommu_api.c          |   6 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   2 +
 arch/powerpc/mm/nohash/Makefile               |   2 +
 arch/powerpc/mm/nohash/mmu_context.c          |   1 +
 arch/powerpc/mm/nohash/tlb.c                  |   8 +-
 arch/powerpc/platforms/powernv/Makefile       |   2 +
 arch/powerpc/platforms/powernv/opal.c         |  30 +++--
 arch/powerpc/platforms/pseries/Makefile       |   3 +
 arch/powerpc/platforms/pseries/cmm.c          |   1 +
 arch/powerpc/platforms/pseries/dtl.c          |   8 ++
 arch/powerpc/platforms/pseries/lpar.c         |  59 +++++----
 arch/powerpc/platforms/pseries/papr-indices.c |   3 +
 .../platforms/pseries/papr-phy-attest.c       |   4 +
 arch/powerpc/platforms/pseries/papr-vpd.c     |   3 +
 19 files changed, 183 insertions(+), 81 deletions(-)

--
2.39.5

