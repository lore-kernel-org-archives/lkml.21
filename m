Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672446;
	b=f5zScorQc6pXu37ntLOBOAIAhV+t19me1wCakBkasFdBlCZFEUOIqr+6EDh5GCxXn5h+
	 u+C4x8d2wZtPZrLspQdEGokeDZjMv5fZnsoM4Kk21DbG4PoFC4mzz273l4tRE8RTV99Df
	 ZoFMUcfc7ibZKpi79vRj1p1xGc/3l7hh7tkmTFdg9j8tD/ktyb3Nxb70Dq6OKLzexzIOZ
	 0sIbekv1tGFy6PSp9nB/FraEjqOPF4SvUE2rNn6F0wlj8WJtadk5wxbUKckrNtCuF8Nrx
	 BUwC0d1A5ww8qBqHR8awzAItO1EfMmvxAtW+IhIP2EHTP4PQM1lXWEBvG2dsyJCxefg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672446;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sy8OCHsSECMY/f4pzR3nMQfXTLgjwJahY/PuIuEYUM4=;
	b=KJkGvlsoQquzzEaaydRIaPfSlgqzcZqZAkCQ/FT82105kjVlPe7DCLNpebjOd22wl9Pc
	 r0VSXvq2UTyDZARqXlxMO3aVP++c2L6k7B5Av96iBRydlJivbg3TrmmhNGyD2ZzCyPfbu
	 leJIlWfGfNf7n94qDvjtiRuYZ3C1NVxIDuHQiEAdq7FbcWtk7tYr8RKTVNqc+/8oSRzbj
	 tpp48fQTONhBuNhtLihl7hW1PFSnbNIgf0Zs5ePGkuub9w2f/0a3dB8DXrplHTNyybazE
	 t6zbB3Hp6KpZfMNfxSJMASdGdxXFmNBuVGMxR6tYpelLcltOUsSdM4ZkUHrC06yTQgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FncFVUau;
	arc=none smtp.remote-ip=91.218.175.105
Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261FC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FncFVUau
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MhyRJ8jiUP4r8T6n581TUC2swBZMvDYOP+3qPSW8ysk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672444; v=1; x=1796277244;
 b=FncFVUauXD3srqbg+KPdw4vnFEP7kR63DWnz5xWAvJ6ykNIS7H1ybZrJs7NFJMS0OVCWwcFH
 rkwZ+2lypkMw1oqs82UjzaIFpPcopNt1XYMgBp5Zlo8xmRMnxUjhWQXdGV+vpgWZUJHIa/4h5VQ
 mt6s2kZv1dOW+wQRJGczl9JI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a832319221069530;
	Thu, 26 Nov 2026 05:54:04 +0000
X-Mizu-Trace-ID: a832319221069530
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH bpf-next v1 0/5] selftests/bpf: Enable private stack, large stack and arena tests for LoongArch
Date: Thu, 26 Nov 2026 14:53:49 +0900
Message-ID: <20261126055355.9967-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

This series enables the BPF selftests for the new LoongArch JIT
features, and fixes a libarena build failure with clang 19.

Patch 1 fixes the build of the libarena buddy allocator selftests with
clang 19, which refuses the signed remainder in test_buddy_alloc_free().

Patches 2-5 enable the following tests for LoongArch:

  - the 2 KiB private stack test in verifier_large_stack
  - the struct_ops private stack tests
  - the arena LDSX tests in verifier_ldsx
  - the arena load-acquire and store-release tests in arena_atomics, and
    the libarena spmc and bitmap parallel tests

The LoongArch JIT support for these features is in the following series,
which goes through the LoongArch tree:

  LoongArch: BPF: Add private stack, exceptions, large stack and arena support
  https://lore.kernel.org/loongarch/20261126034048.7370-1-dongtai.guo@linux.dev/T/#u

These patches were part of v2 of the LoongArch BPF series:
https://lore.kernel.org/loongarch/20260702022322.51033-1-dongtai.guo@linux.dev/

Since then:
  - Split the selftests patches out of the LoongArch series and rebase
    them onto bpf-next.
  - New patch 1: use an unsigned loop counter in test_buddy_alloc_free.
  - New patch 2: enable the 2 KiB private stack test.
  - Patch 5: also enable the libarena spmc test, which has the same
    guard as arena_atomics (Sashiko), and the libarena bitmap test,
    which needs cmpxchg on arena too.
  - Drop "selftests/bpf: Add LoongArch deny list" (Tiezhu).
  - Reword the subjects and commit messages.

George Guo (5):
  selftests/bpf: Use unsigned loop counter in test_buddy_alloc_free
  selftests/bpf: Enable 2 KiB private stack test for LoongArch
  selftests/bpf: Enable struct_ops private stack tests for LoongArch
  selftests/bpf: Enable arena LDSX tests for LoongArch
  selftests/bpf: Enable arena atomics tests for LoongArch

 .../bpf/libarena/selftests/test_buddy.bpf.c     |  3 ++-
 .../selftests/test_parallel_bitmap.bpf.c        |  1 +
 .../libarena/selftests/test_parallel_spmc.bpf.c |  1 +
 .../bpf/prog_tests/struct_ops_private_stack.c   |  3 ++-
 .../testing/selftests/bpf/progs/arena_atomics.c |  3 +++
 .../selftests/bpf/progs/verifier_large_stack.c  |  1 +
 .../testing/selftests/bpf/progs/verifier_ldsx.c | 17 +++++++++++++++++
 7 files changed, 27 insertions(+), 2 deletions(-)


base-commit: 486b5ce7184f7449ef2fe1e951455b0b8a114060
-- 
2.53.0

