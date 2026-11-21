Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279126;
	b=U/YCWSOZrO3djteVybv3IKJmaqBidERku40Jm0q5J7Imcq78NY/RSO/cR2Bs9fD9CW1A
	 I9FMS42/oCGXKQTzMBsD2yguX4XlmcUb8frpbPpYJ6s7r9z6PhzFds5cijUhf1XY3rYwo
	 2IOh7ngduanHzlFYc6F7VDmFNdzI/dA/n8O2xIoAAePyySBgmQQbZBuqTI6WIbiU4Miia
	 zJ/uIxAw4gxaKCLF3CKFJ1s5EbaxTtd8SZIewffRpfpQO+R7IHAyLdrf/kORh87TIB8vS
	 ht49peMNI61FGE7ecZ0Azpn3crynmheTeWmFfLXmGhxCitmhfGkEPKW+/KDWfnrvLOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dfLpaiZKgialdhZmLohg/bMfGz6NinnnazUQ52qYpko=;
	b=RpBsXHMrrN+cJLVjiAio3mg6ohJHJaZkTaYAiG+DSsBgHxiEmSdvyQfwT3mQWVWniH1B
	 6rxEJSY+ZMAmZ3ymR2VzMtvnLz3rBkMg7Vp/+XarL1ma48vwYmrosMJLS1OTr84OCCv7E
	 FJix3iZSE71p6QYrcOEj4QsxJMU0pCNcRVUi4NVbbmjAWRQDKZB0IYXdEj4RUAC/JTm1P
	 r4tTRBtXD5dDXwJBjzwFOG0UlubH+ZkF2OFYJTaOLFHqMu6H7YN8APCQtkt7nadIqLla6
	 Jur7HazAPmuc0jCpAmpqCFcb1T+AMmM1xgkmbKrnIFwEfD8AvhLt+LkMxIu0noKKeaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gD2/Nb+7";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A127606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A127606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gD2/Nb+7
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso874738f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279124; x=1795883924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfLpaiZKgialdhZmLohg/bMfGz6NinnnazUQ52qYpko=;
        b=gD2/Nb+7IUgO/G4FfpKXEN54NPKAB1zQMgmY5eoqgeIerjOf8ZFoHZUJOAv0hFOGQK
         Ljp8y5EsU1zXe/60I0ExARiER+L9J1OAm1KleL6FcvFUPOQAccswTJFJbRotQ04v3qtj
         OVDkQtFcJYa/7BG/pFNi0db3Qz+sNH0vWICCCF7lr9YQ5s05v3zW8+71CLSJUYeYv606
         vVXD4sdfCdllrHaVYOM+HGf2IEa+wsmAL6uo4l1ZdqFlSYIE4IU51NzbIOpzzKst5Ea4
         czG0aCdppa2Cb3eWcwQsdguuP+sZXgz2dO6+VJ4GZJevVqFHc9Gq7Cg/a3IncmE6d4ko
         WIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279124; x=1795883924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfLpaiZKgialdhZmLohg/bMfGz6NinnnazUQ52qYpko=;
        b=l8WiJQwdzn9nnBKSf8cl4N3R3We1iZQ6acORg3T5b+IhNI7paomq7NJZuRO5kvKPh2
         vZfAGEko40KQrrWlLVRY5f7adYaUFzLlb9aO1V2WR6Q/283jMmZB4mlb1mRjmRc41tER
         /VqCKo6sJ7F9yFjuW1AUsjtsi95KPZY3xO7SqfuCoX0qSeajqD9crvvmAxROXYq920Fo
         AhlQVo9bsBUVHPXZ1YAIIl/GPF0MH4VucPSq8J3p1aroh4L5EWlC4hrFXiRKT7Z0XSee
         NT/8FYjb2EXU6ksjNRzMhVA1mFpeeJBFt1M3X95TbI3MhXStY8Q+DDTXSp3fwP6Fc8uZ
         v2sA==
X-Forwarded-Encrypted: i=1; AL+hErHLYa4XEcJ9E02n/7dUWDio3h4L+jCENtpBhikTz7yxu84Cd0UL3YYsbc6todaYXm/NcPZqX5wnaIUiUYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lE/T+9mLlEDDFXon7TSvedQnnm60Xv4QC0M0cuValJH93bTXV
	caYfpKL/jrr0ikDG4rI6txpJ017cX2jS5vBiTMOzsvSBg0vAu/EQBWLT
X-Gm-Gg: AZFdTZcg1N9fn5axjG/Nggzxr7EpfGCDVe8QuyJev+nOPpcDlFi/tKH5xoiA4du+MMg
	utWz7waRj7dJy9Vhz/CDY8c015shDUcZEgY9AUOzEgJnD422K2OKluPwy0MkEe4sqRNDIXNWeSO
	F5zhSYk4gvuGcYXytOZ3iScnIe3TdeVfQAAWlcGUKpwS4T84vyLcv0PcRPz7r2tC930NvhyX3uy
	94EVG61g5hcWEXugxIYTmsVAZVyI+FVYvJgN/ouCsVwhRDrbYT/RhNmvP0b/+DVQEioqfR6wJgM
	nkzUQ2nssXAdrc4EdewP0xflmsIpzrMwevcMpG+emaLi3VjKX5iO7yQU40BdnRWZ3QIBwHjEk+N
	6DCIv7xLm98nnRh0eywDd4jZidXvSdSVNppX70P9YRZ3GnMAEKi0jNH4YSFIjBNvTCrJERZvQ2D
	7nETkUQA0LACFbSKjeqC6P7QS10VDRqUstSExi3uTSvKwYb6abnatXLW8ROTPs77ean172RgFeb
	Ef0EuVNXanfdL+JpwAHLR/zbbcKlQ+IAnIDf5xNROMqTCtgb7n8KAxfxc8kKM09Rqvsw5ygfj5u
	Hz/MkQeNar2p9ERee3vcNHrjHoeTQ0Lkd3nMgZYieaAHKLEwarTzW75ai5WQbG+1Bam+tFrqjt+
	B41xGqOiyBYu62a/JJ6X+1xVYOOzzbvvOY0KAl2ek/ec1Y5+eO00c34wqqWkM8xNT1gBKaMgcfC
	c3tm1w9KVrpIxzivB7tYstsOc8UPPfBmfQ
X-Received: by 2002:a05:6000:2c13:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4abab02d216mr13249942f8f.7.1795279124204;
        Sat, 21 Nov 2026 08:38:44 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm12468455f8f.6.2026.11.21.08.38.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:38:43 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mm: Ignore PTE_AP2 in pte_same() for LPAE
Date: Sat, 21 Nov 2026 17:38:34 +0100
Message-Id: <20261121163834.15441-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

For valid ptes, cpu_v7_set_pte_ext() derives the hardware read-only bit
PTE_AP2 from L_PTE_DIRTY and L_PTE_RDONLY. pte_wrprotect() and
pte_mkclean() only change those software bits and leave PTE_AP2 as it
is. Starting from a dirty, writable pte, the software value therefore
has PTE_AP2 clear while the installed entry has it set.

KSM hits this since commit c33c794828f2 ("mm: ptep_get() conversion"),
which made write_protect_page() return the software value instead of
reading the installed entry back. replace_page() then finds the stored
entry different and gives up. After a failed zero-page merge, KSM can
fall back to a regular merge in the same pass, so zero-filled pages
end up as ordinary KSM pages instead of mapping the zero page.

Mask PTE_AP2 like PTE_EXT_NG for present ptes. L_PTE_DIRTY and
L_PTE_RDONLY are still compared, so changes to the dirty and
write-permission state remain visible.

Fixes: ded947798469 ("ARM: 8109/1: mm: Modify pte_write and pmd_write logic for LPAE")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc3, multi_v7_defconfig with ARM_LPAE and KSM, as a
32-bit guest in QEMU (TCG, cortex-a15) and under KVM on a Raspberry Pi
400 (Cortex-A72). 1024 zero-filled pages merged with use_zero_pages=1,
and test_unmerge_zero_pages from
tools/testing/selftests/mm/ksm_functional_tests:

                     ksm_zero_pages   test_unmerge_zero_pages
  v7.4-rc3                        0   fails
  with this patch              1024   passes

Unpatched v6.12 shows the same failure. If this is better handled in
KSM, reading the entry back after set_pte_at() in write_protect_page(),
as before c33c794828f2, also fixes it.

 arch/arm/include/asm/pgtable-3level.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 7b71a3d414b..4a187d7be1d 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -161,11 +161,15 @@ static inline pmd_t *pud_pgtable(pud_t pud)
  *
  * To correct this behaviour, we mask off PTE_EXT_NG for any pte that is
  * present before running the comparison.
+ *
+ * Likewise, cpu_v7_set_pte_ext() sets PTE_AP2 in a valid stored entry when
+ * the pte is clean or read-only. PTE_AP2 is derived from L_PTE_DIRTY and
+ * L_PTE_RDONLY, which are still compared, so mask it off as well.
  */
 #define __HAVE_ARCH_PTE_SAME
-#define pte_same(pte_a,pte_b)	((pte_present(pte_a) ? pte_val(pte_a) & ~PTE_EXT_NG	\
+#define pte_same(pte_a, pte_b)	((pte_present(pte_a) ? pte_val(pte_a) & ~(PTE_EXT_NG | PTE_AP2) \
 					: pte_val(pte_a))				\
-				== (pte_present(pte_b) ? pte_val(pte_b) & ~PTE_EXT_NG	\
+				== (pte_present(pte_b) ? pte_val(pte_b) & ~(PTE_EXT_NG | PTE_AP2) \
 					: pte_val(pte_b)))
 
 #define set_pte_ext(ptep,pte,ext) cpu_set_pte_ext(ptep,__pte(pte_val(pte)|(ext)))

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.5 (Apple Git-154)

