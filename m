Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318186;
	b=1/E8bpeCBX8bdrXnv5sajwSUxXsu93Kww/pPcO7qySPXaoPwtQyIwr6/Zb3W6uklR0oG
	 qfeWqPSIf2ubVKsrqmKn+aLj1y2rgNyRJMu2YMkXG/NbECIEvAqK4FbNWF5iba4csSQmj
	 y6u2NdAIHg0S57pCKWRh1dTTqXUqwMpif1XAfjrAELcJIEmUhTgS3f7/hi0U90nWBuEBT
	 sZkdfR9OzJTNClqgpu3Qj//og+I/kL2MMegyUsEZBkE+XOq+pKlWMB+CdecL7UEAHasq7
	 FAOXpqJA17x6qYj7xtn4f74s7FDsRlLkoMU2mnx0X9yInARdkcGMMVRz6XI/7ofhEDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318186;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zw0RFWxkK80ZDQsxTqIzOsK9ms1kIlwgwAxsFykNLbQ=;
	b=F6ES+RzR1L8y/yMBcnyVEvbQdOZOlZy/IYA1WBgsA+zcPlip1FJFDt9RJz4sJHpMx/vm
	 JvbFMgOSFtvSuzucVIv8GCDsXsbx5m4FzUzKcHUlyiKEfUzgfRTi/cRdksWUNJZ8gNL7P
	 Sy55pC5zMu1b1MLu0GYY1EWfjAqL3jLbHZ6j5HLNlB+W9Zw5nVi8yMR5ypzOuh+Vn9qN9
	 DdGutmCeoqh+G7QqI2pyjtmEy/HPBLtrY6EuBRnGi2n82wb+gfPuw8Ce+WDQu6FwVlwto
	 M9TPXO8brZTRMFTE1y2etbF6qgzOUcZWWTHZC6ANxCPKMQ1sP0JKlHAO4+DlsjL1rfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=Q65JK0UL;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AD606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079AD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=Q65JK0UL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795318182; x=1795577382;
	bh=zw0RFWxkK80ZDQsxTqIzOsK9ms1kIlwgwAxsFykNLbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Q65JK0UL6eBWGjEOAdL6rgJAc62Wx8Si0vZTrbmyOGCofBm1yRVzBZi5opQWFDg15
	 6CgZ2vuyNureHVX4TR0NP56Cq/dZPoHvGs/0GM1Q3MNaT2zRnxZGr5ecBj0asP8E4Q
	 qZSBwY1GqrO/bm/g8ftd/dba38jFXPSwpkuHTaPo12AE2spdM7sibSNvh/hbNkmgW7
	 BG67MYrrqxVFJ6OezCmp2w7MstwmvmqyFPlNMjFsUHQzihstp3DvTidJ4Dpsw2h6hZ
	 P1ZUcDZ5kc4N1Z4tQTEipfSFEEtKa3dNOvxoypb6l437DrNgjXOYHBjqoQ3+JzqtvC
	 k4MsueUf58Zkg==
X-Pm-Submission-Id: 4jXF1c4hg1z1DDqy
From: Miroslav Cimerman <mc@raidlab.org>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	David Laight <david.laight.linux@gmail.com>,
	Markus Stockhausen <markus.stockhausen@collogia.de>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] raid6: x86: asm constraints, sfence and prefetch in xor_syndrome
Date: Sun, 22 Nov 2026 03:29:30 +0000
Message-ID: <20261122032933.2306875-1-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
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

This follows up on the review of "raid6: use normal stores in the x86 x4
xor_syndrome functions" [1]. With that patch, none of the x86
xor_syndrome() functions uses non-temporal stores, so their sfence
orders nothing. Christoph suggested removing it [2]. Eric pointed out
that the AVX-512 functions list P and Q as asm inputs only and rely on
the "memory" clobber of that sfence, and suggested prefetcht0 for Q [3].
1/3 fixes the constraints, 2/3 removes the sfence, and 3/3 changes the
prefetch of Q.

Based on mm-nonmm-unstable with [1] applied.

Testing:
- Builds without warnings with W=1, gcc 15.2 and clang 21.1.
- With 1/3, clang generates the same code as before. gcc reloads the
  data pointers inside the loop of the AVX-512 functions (up to two
  more instructions per function). With 2/3, the sfence instructions
  are gone, and apart from alignment padding the code is the same.
  3/3 only changes the six prefetch instructions.
- The raid6 KUnit test passes in QEMU with -cpu max under KVM on a
  Haswell host (avx2x1..x4) and with -cpu Westmere (sse2x1..x4). All
  8 test cases pass in each run.
- In userspace, gen_syndrome() and xor_syndrome() of all nine sse2,
  avx2 and avx512 variants match a scalar reference (gen_syndrome for
  2-24 data disks, xor_syndrome for every start/stop): sse2 natively on
  a Core i5-2520M, avx2 natively on a Xeon E5-2699 v3, all variants
  natively on a Xeon Gold 6130, and avx512 also with Intel SDE (-skx).
  The AVX-512 functions were not run in a kernel. I have no AVX-512
  machine with root access.

The patches and the tests were prepared with the help of an LLM. I
reviewed everything.

[1] https://lore.kernel.org/linux-raid/20261109030805.25709-1-mc@raidlab.org/
[2] https://lore.kernel.org/linux-raid/avqegZd_W0kce0UA@infradead.org/
[3] https://lore.kernel.org/linux-raid/20261116210440.GE229817@google.com/

Miroslav Cimerman (3):
  raid6: declare the AVX-512 P/Q stores as asm outputs
  raid6: remove the sfence from the x86 xor_syndrome functions
  raid6: prefetch Q with prefetcht0 in the x86 x4 xor_syndrome functions

 lib/raid/raid6/x86/avx2.c   |  7 ++-----
 lib/raid/raid6/x86/avx512.c | 37 ++++++++++++++-----------------------
 lib/raid/raid6/x86/sse2.c   |  7 ++-----
 3 files changed, 18 insertions(+), 33 deletions(-)


base-commit: 609cd6a5e6138620c16d8818bb585e8766064c23
prerequisite-patch-id: 0242f328222b644b2b329d90c8d50aad322b7655
prerequisite-message-id: <20261109030805.25709-1-mc@raidlab.org>
-- 
2.53.0

