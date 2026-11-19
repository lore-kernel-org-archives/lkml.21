Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059567;
	b=wgLzubvw+yWQwD7yeCgaW9i11wO5HhV/TSDST7i8NUDtRF+Bn20t717j3aiiZwAdsCTa
	 6X7vgOQQzzHrd2RAO6ziVkSbvpLeG/kW4xQYvZdmzR7JGrJbVEQ1hBdZT/jEZH4FRXoTw
	 RNRXUpkSMo1Nme5QFv6SWGVVQaSHMZfbLTYszm/H7tiR4ieSuxcHdSa5NM+N9jYCbakAG
	 leixNX+hk45AApQ5biK+ar4I79A/AbV4yqJyGhkffegJLBkd1t4ChUVYAKSRLGQd5nsYW
	 F7L19cdUUsqAzy9h8drpJWpcZ/3HMBwhL9aZnLkMivhHMy/T7/ewrMQ0zPOUV4nNYVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RTEugiXeVDB7kvXI871yYwSSBbfkJE4r1t14Xfi0eHA=;
	b=HOX3/jWV89j8CJnIAKMlf2v/SUON1nRME/sLLc7+SkhvjEFdixWVETQgGS0nHQg6B6lJ
	 8/Rh+1KpcMH72RiJ2R2pM5eOQTkb0l7Z+ggrK+p9WdP3GClb7yBHx5sA7qqkuG7jfqJ6t
	 ZiWqUHJbH/aCnwGGn8b/o+BXOeheTbmWVhkRkCoyhdOSlh/Eam5AWKnNTe5pEjDLRAUlL
	 nFMriTtH6VLEg9eyw/dh8Xl2NlCPF8YGtF0CVmzyQocBhc+jM3o8J2i9vJ3Zqy8qHyYMq
	 VsLi0JpMC6OyWEk6vY+FHDJjlIgeV1HmtMIWbGMjIUg8r3tHlJzy+TNR8Ma2LQyTX7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggFrKaj1;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDCD606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDCD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggFrKaj1
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38318d69173so2092717eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059566; x=1795664366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RTEugiXeVDB7kvXI871yYwSSBbfkJE4r1t14Xfi0eHA=;
        b=ggFrKaj1gq7WlR/zuZITCKe/sIK0ERBEtbwEhnY1fFv2PPuk21sLavW1O4y2OyDS7e
         nsPhCCHQFke0aRE7JTR9qh7vix5D8TybCw1y844fRWS1mZVmK5g60IAOlg2aYtG/gi7W
         wBpEeq2AlZx6BOkbPoqCwid1fw+SPmJ3RlfrdONz1OPmuVu8yRnVv6XHZmDb33v8NunA
         cSilOB7J/1/iFGt6I5lte/LpaYKpeKhRwltTbx1LfszvAGqdriEIfZ0swm2Isu5seuy8
         sIwQ/KS+tIlWp0UuQgt00nFQw8f2OBJUucxIE6drmZ81LZv3U6II8uqv/4GbKUg1xnVj
         7DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059566; x=1795664366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTEugiXeVDB7kvXI871yYwSSBbfkJE4r1t14Xfi0eHA=;
        b=SaAQqQkpxBKcCG4yF1kG45nU07ZgC8RrlNTJ4oY0UBde6VaxhVYyAlefAuLEQG+wn7
         /C/rAI3PCNAy8qVhYvTA5/omOQvzqVx7LuErVl97rCszxKxUIxn5c0S1MOKgyL/X+jY2
         GsXu06/roLBCwuNpFjb6QXHvPSNUajlnTYe8em1N1PsBA2nqyhl0Vi27gMaKe+pXdpJz
         AEV3plPcKSOVNFVbfL/23IFhKn9l6UOa1Ikk6uuly0Hhh05wUcwICy67clswLMRAFFkq
         sxJwnztBiKZMxPIk3ntiq7722KMqh97jIIDcAP7OypaMnVX0LpX5m7epE9zTI/70I5Ez
         Bl8g==
X-Forwarded-Encrypted: i=1; AL+hErEWWRIuk3YjRmmP6H4oBSCnZfZl3sHy9eIDHjr1mNVYJu1meLDAmsOjpxeVtBre/eI3WWhbtgDmlGXQmho=@vger.kernel.org
X-Gm-Message-State: APuU4Z94qxUNAlQHXshtL9K05RwmCFz3LdA4VGz0HoYWLfrvZqDlRpZt
	5MH2KYy2Gbu63OXdIlhKoqzHkUe8nZhz3DgWxc0MO7OI1dsjGjyTKjTX
X-Gm-Gg: AZFdTZcfSO1cq2r56L4Ayk+7NR6Xqbd0nkPeRCMVXSVA/uKf7dzqzJ9hEBujwm1sSGC
	nTdg86NPP7vr4lAKljEn+dcBQVe9EWC3kHk56yJU3xexOYUb3PGxEtCeX72MuNSd2zuzqBYHt4O
	TJIp4kvGI02DmVdSTEuAgB6yLKms0m4TU2zTu0Y0OlTSVLlojBzMnUK/bjIaoB90yHUOAkcEBGi
	o5E4CZTQ1XYeAuD077t0lAC6pPFPCeqz4HYzfrbU27ev2+krTlPYfZyktMFEkY9BG2RQU/hChak
	o2bJEGtPzVzF34SDakwc+NylYd8qdOM59o1Bi+G3tS0jAy7qPRPkgEnSIMzlVYkOmymRcGZsWvw
	8OMaCGB7yCKe4EwD2wjGxyjBOkfPr6kV7tcqPVouIA6DcbKHpK+ntgm+VyWhsBDOtWtzd9keAo9
	KKZTmPYmfae0xi96tMDduKzIlyrQNTrwMDOLZ+AhkMQCsXkxIl8LmWWlgZsUAz2wEiFK6krWn0G
	UpLW8aEnim8iccBNZ8a/kDg4T0cva199+u9svcG4YeUURvKbvyvofEb979yVdjWqwctRuVKSOpn
	vwgeDlxnrrn/SdS2RZ/cCueuzxOOJdC8FOevbf+T3plJ+Hc9U2jVDB0=
X-Received: by 2002:a05:7301:18aa:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-38281813bc6mr4014262eec.30.1795059566086;
        Wed, 18 Nov 2026 19:39:26 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:25 -0800 (PST)
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
Subject: [PATCHv2 00/18] powerpc/mm, pseries, powernv: Enable clang context analysis
Date: Thu, 19 Nov 2026 09:08:55 +0530
Message-Id: <cover.1795058683.git.ritesh.list@gmail.com>
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


v1 -> v2:
===========
1. Dropped RFC tag, since this series is looking in shape to be included for
   v7.5
2. Clubbed both RFC series {pseries|powernv} and mm into one.
2. Patch-3 changed the type of i from "unsigned long i" to "int i"
3. Fixed commit msg for patch-14 - as pointed by Sashiko


Ritesh Harjani (IBM) (18):
  powerpc/mm/book3s64: unlock RCU before returning from mm_iommu_is_devmem()
  powerpc/mm/book3s64: Rework tlbie() to remove conditional locking
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
 18 files changed, 179 insertions(+), 81 deletions(-)

--
2.39.5

