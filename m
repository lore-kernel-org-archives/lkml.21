Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212216;
	b=xhVbeSSHfaQB+knGIDsFAdMK+mKP3PJUtbfYci3Nvg9noNp2Gs20mc152Uf/6Ww2tsM4
	 nFuqnvUxla2OZbtW4aJvlmpWBAqJQLX2Zw/fkOrIigu7nVPk/6vrRhbPmzG6IJ4yAp3a2
	 zRZzx4opYz0lUsr+vf+Svvf8hvw3ruO72wD6i4NFP8Ue7dMUOAugmVJgTNsTSbJRbf5F6
	 WrdemaE7bZpMPKMJ8MB7JY5TIjhrLojqf0tGfoQHbUEiHGsIY2x8mrJG0Fic1v20P527f
	 u4gxwVLLg45HpnMnc3qz7Ij8F0A1uO8irh/mlj8NohKBv0JlWRTbMbhlx3lsGrHM5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
	b=Mzro5259YG2bb8rupxSOKgFBKaExj4UptYI6qZhV+YWsOCDFzHwnGkCOfFjMNKRkm2xO
	 0708JL6ktIG+uNVveb0Z61kyGymbJQBq/sFv/Vjjr/XjZA/kwImJRoanMzCohsfrPl7VV
	 6P24uL+REH/J3shEmVXhD3ecZ0ayKccDdC1kLB8x+OzJqv0C17LKfvZ7Bxo6h+knTMxgh
	 u/NP1KAG8CKjGb7uMWEc8fCCqQGXASwTILEgnCBSuYdWqnhm5ozqqny2RL4K2GQMXxtak
	 ClohEXyMeFIY+g1VtVUyWqbCUulnmho6gOBg56LXNwi6ztcObYtk6s9z4QHZmmnQh3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOr5oD3+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEA9606A696
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACEA9606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOr5oD3+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so12929585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212213; x=1795817013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=gOr5oD3+13AfWWQTSdFX3WSjjiYlo7c+u8wQ1CpkBAAkYZiHLLdq1kJqz6dWoUFll4
         C1RBB6n0tqmGlNxVAsLs7iuZnWNpLZurwoVPpz21eT+RBA7McTrgbgvy6C7GbelsSc3y
         ypNIFpDYCBppbKgTn8aqp/Y5wa4zdhsm+N1OaSfeCvRCN4fh6mvLvNp0FIDd8tuU8fLy
         ja4Kt6KPmeFNQSKjtu/Sfqd73q+HxLFUQdf6H0ad1TQhO7LztHL7NXupIvdU+PAptgvp
         v4/d/dGFiYBPI/hzuLYytMdzt0BA/YpVi+bDxjZcLZmcbRQQDlUamMb/S51re+P3L21r
         SW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212213; x=1795817013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=l+Sr4UHjbVNqMsutAb+fH/5UQ9YO6B7M1DMv+hJhKFkbGSSfPb/E3SxWYuUdUM6lrW
         QHPh6kTpfwgNROEdWaD+yj3TSZxe+Rt26wIE+3SXXrk5WleZBXjFTd5jMxiSmBAIddsx
         9zoa5HJyx6C2HtF8qap+0SRiMXwoDoGCK3mLWnx5hOKGl3U54km6bfW7v64/H8k+LXA9
         7LJkXykyQ+I5QDdY2OGC1pDvP8BMNHqLANmMleLZzZYihXCIFneJ8XqLMYXob85Hp1hx
         wyXNsRdKc+KJFh+ivACvBb0A1HLc1edEJ6+v3kD1Oezv9TZdSvdmZ32v3qZWFSPoFFXX
         p9OA==
X-Forwarded-Encrypted: i=1; AL+hErFKPOWEdruizNrGBYSDdpDzV5otBDInQVcyw/5h1AFV9BRcx3ZBDUW9JLRbE+16bNO83DSfic1ZcBgUWIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XAk+GZyb01YtHqzJI01nGAhratUFI5NNt0F+S0fCTsifiK1Kt
	PBTBP8VLEOasHXmI8ZNsR3EirKsO4KCmKpr/Y92JmmtM9MS+r6snFEkc
X-Gm-Gg: AYBFou178x+O3qyZgc9c7yYD/GxXEyyY+tGejupT+SwsHEAQaV7I8wOq1vl9mCj6q0G
	dSbU2FtB0I/lbOSo4oZ9aC5ugEvCfbbjFYlPRrJTKipGQ5HfKAgDOe+AOQXc6Ngy2lQOXOkyHYG
	gvGNvanT2LGbdtchdDZu1HIuelpkuxO0E1Lt0xiHkpUB4fqqfC5pkJddEajy+sC+95Z19reWCom
	yEMKoOnm8XblUjwG/dIsWkGii+iEJCU/6KfUynIGlpgmoCAKuHKtD4icO0fj8cBVJjUc+kRDRH5
	CHd+zZE4BScD6AiOQfGPCIhlWPS4uSjqYoDANg+YipUzLAxrItQcX9D3cwAZ8SKxYf55J/9INxL
	NPX1QwF+aXXet3CdwCvBaRjQ/D2mQNFlzKXUNgqEncrIyA6mPjxdy7nTDqXz64g3qBFng5fHc07
	ohglcurzuWUPMP1/A5Nab0hiuB17+obE5YwBFqhw/57kzJ1bviBV+P06h5G8AjUmDBTohitENOS
	Z+MoFCXv0KK5/DIjxh8KOzytbPs1MIUDHeL0WJLnQJZ1c9Usx3iFgK7U4QXZ7VdOduDseEoZVyp
	KSs1VEMB+HDPMX1y1YFAY26j3XXrHeqEN0W0ZTSMimo4TUBQV8APcKsa2vrgU2I=
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr101074205e9.32.1795212212878;
        Fri, 20 Nov 2026 14:03:32 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:31 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Fri, 20 Nov 2026 23:03:22 +0100
Message-ID: <20261120220330.1067165-1-demyansh@gmail.com>
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

Add a single-pass csum_partial_copy_nocheck() for arm64 and KUnit
coverage (plus an optional throughput benchmark) in checksum_kunit.

On ARM Neoverse-V2 (3.0 GHz), this reaches 39.2-45.1 GB/s aligned
(1.8-1.9x) and 36.5-43.8 GB/s unaligned (2.0-2.2x) for >= 1368B buffers
vs generic memcpy() + csum_partial().

Changes in v3:
- Use a 64B carry-tree primitive unrolled 4x to 256B (~21 insns/64B,
  pure leaf function, zero spills on GCC 15 and Clang 21).
- Align @src to 16B for len >= 272, stashing the odd-offset bit in
  bit 62 of the carry counter.
- Add zero-length, 72/256/272B threshold, and dst[-1]/dst[len]
  sentinel checks to checksum_kunit.

Changes in v2:
- Drop the NEON path and separate csum-copy* files, folding the scalar
  implementation directly into arch/arm64/lib/csum.c (resolves the
  <asm/neon-intrinsics.h> include issue noted by Nathan Chancellor).
- Switch the scalar loop to four __uint128_t accumulators (David Laight).
- Canonicalize 0xffff (-0) to 0x0000 (+0) after csum_fold() in KUnit to
  fix x86_64 test failures on zero/all-zero inputs (Jakub Kicinski).

Link: https://lore.kernel.org/r/20261114045500.v2-1-demyansh@gmail.com

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 189 +++++++++++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 453 ++++++++++++++++++++++++++++++
 4 files changed, 655 insertions(+)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.53.0

