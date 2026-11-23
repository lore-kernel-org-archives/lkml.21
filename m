Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439506;
	b=AWwu8cvMuQxksiSWelcKNMsCZUXuMiejbKNXYq/hW1Xm8IrbSNEDmWEQcquFmsn0foHu
	 ++jrqHzPlzLA0rJfj5oU0ys9Y45yne+9M934b36c2vKCiz0kGZ9B0zN/HusGorm19wbtB
	 uonIJT6e06ZxShquhqNgupkyuq2SnRyjFApD9Zf9bzaT9KMHDCXZtjo2rQ1uaT5YciRrD
	 MFFa/8BzAdAt5B4VQJ0bcpDfNrTVSTJ0rxbJhX99PdZYp/vKn4Sh0HBhbj700p4x2H8bi
	 WZG7zFMvZw3fRPQ68648y8VcolkzCP/8AcdqSwb3HLqY9a2t6tvWY+yjusm+fFieTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EdMsunFDcUtQDGISK9BC5BpmhF0KnQn+rijOh7gG9a8=;
	b=TBWRa/SnWiIOoWIsclbqx7JMFIYZqzPgFXsz5nFQ4+u4snlaCV5RAkD34vWNbXEWJ53O
	 PYEnnG2opc0GeHqGTIqe94UJFrzYsmStMH8d+nV5xoG3ewEzVMYmil4Jl2w2GUjU0oXYU
	 p0kUP/q7E3dMZRAXYLInoLFTjJEGDL4wE55soMx/dsyghSblJ7q9APHFncHRgllkwBLx7
	 Jc97OYDAjmc92bG2UDX6IJagpWQ0XJLv8Wy7M7wilOycbiZuYZVrykAofySkYSWf1vIwN
	 NtXLBxiy89Mq+hdxUg9ArtfwbWOuhSkR26dE4XtiIotpEdNRRif38Yfn4dTDk92C7fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7P3m4i7;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7P3m4i7
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so1676489a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439505; x=1796044305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdMsunFDcUtQDGISK9BC5BpmhF0KnQn+rijOh7gG9a8=;
        b=m7P3m4i7mpTAsF5vYQUL2a3YyTEZyXaP5vtj1pseQbnG1cviEluS7w/CpTuyZpfkAo
         ESOXXv1h5Ah7ImMP2vqT4lqwG2AglXSmSQEDVpxvdnxQSXDSsX2v7OjpQe+l/a/4TkbV
         rfliWXysYAm28oJSbD2H807c94SFJXqc8NqVRr2FjOTBx87YjUB8ecJXBZPUWEwtyOES
         yHI5H3KuXuBIrlYi0qmXZjcxHsRq4ycbUy9/IpINj4R5yrdwX2tGMxuAY80YqWKW4VOQ
         g0nkcC435JSG9A6x6dYHjiRGLnyty16lG9urLH+//C+wuxJvqGdsOwiV1snjowuTmgEL
         I8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439505; x=1796044305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdMsunFDcUtQDGISK9BC5BpmhF0KnQn+rijOh7gG9a8=;
        b=l4YsU0zv2e/W1b8SevthtyuCFVEAH1RjFTkJk6//TSKDAS4Njs3kVclPeHlO/4yTfa
         a+ryH0bUFir9Pnosp0tLC+aSlQsadQkevWZobA9hYR+8lFge+lDTNC3dIC5b2cQup4wA
         VfhPbabKgq8O9J+QhYgnnI8zIRXiRMXY7M8XjQbRLZoXAPy+9+81m2rVaisdRrMPy9fL
         FqpB3NpT3gSe4S95Aun3a+uvxBrWzWSgapgtWsFDtJCQndkuPkTxDgDfsA9qWtJvICgu
         mMRtLQ+7WLRwAjCIjrMCuUKR2FQdtUgjNGj79NSfgdNRw828Qdrph8xyo2v7Hs54NP4B
         cmpw==
X-Forwarded-Encrypted: i=1; AL+hErETPPjEUIvzrfh0GkQd4pKejo7fVXkcZb/S1fbsQlV/yzOl04Y1YyTAo6BrCSXxRHCHYciPQ43PDNorBuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wov2Wl+dHj+rKw535Drl/XCj3kR9/JkfjopSndeyCjeHCEOMY
	Q65BAzC8infHQXg7oeZcvc6gESEBkqixbl7ukFNZSBE7dTYrHSsahn8L
X-Gm-Gg: AZFdTZd0AjLBXTW68Yuojb5t60QMcDtc5iO7f7eJ/UCzJrX2F9remoktqg3rYXJVSHw
	0VQRsbI6Wr4KkErSNxNnMU7RO3XeVTz/d4O/dPNpR5tOv6fJvNcoO/oy/36vKl0BPZzL2nk7RfA
	SxViY2/iu+I3aC+YXRWpaDbRB6w5HLgDlLzs658oQDhyL1xLd+j6oNIvmh95JNhbZYj89tZiBfh
	ZQhEJPud46GJf6ZJPBOh+sjK4STHlqKUblLgqlDOwXCS1M+ITjbZJigxaHf8vghIpuN/h1+Cdq6
	NEHbmcLk4IL+z09s2buIa1PXKhxx+mmn9iL68sKXBtkFjww9J8Zj3moOnK6sORKwaxyaslH2/to
	VfTqQpeRixG7Oflo9xQwNgiOZWrEuBeky3lKb5a5r0PDGeYwORygn7yk7jEnXOg+8+qcHXqCtQr
	2s7AjRAUAOz+dcKNEy8dBDYRlXF3TooT8qbkdnQtYqpKAvN9D5+CQzqv9+VIDd3sbIrz+Fmkush
	SmPqPItofjMpIO98DGGwDK1wc9Xgeluvd9P6iyMUipNTrYb5RhL97dgXbGh22O+rFbd9WTjSy48
	uBopVT4uaK19zG8Oi2wGX8TjQId+eK1fkQ==
X-Received: by 2002:a17:90b:2d8a:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b41c952eefmr10186812a91.41.1795439504874;
        Mon, 23 Nov 2026 05:11:44 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm20903469a91.7.2026.11.23.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:11:44 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	Angelo Dureghello <adureghello@baylibre.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: coldfire: Use the builtin fls() and __fls() on ISA_A+ and ISA_C
Date: Mon, 23 Nov 2026 21:11:01 +0800
Message-Id: <20261123131101.639643-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Let fls() and __fls() use the ff1 instruction on ColdFire ISA_A+ and
ISA_C cores instead of the generic binary search in C, as __ffs() and
ffs() already do. GCC emits ff1 for __builtin_clz() on exactly the cores
for which it defines __mcfisaaplus__ or __mcfisac__, the macros that
already select the ff1 versions of __ffs() and ffs(), so no new
condition is needed. Commit a6260ef84103 ("m68knommu: add ffs and __ffs
plattform which support ISA A+ or ISA C") added the ff1 versions of
__ffs() and ffs() in 2008 and kept the generic fls(); the generic
__fls() followed in 2009.

Use the asm-generic builtin versions of fls() and __fls() when
__mcfisaaplus__ or __mcfisac__ is defined, and keep the generic C
versions for ISA_A, ISA_B and 68000. The bitrev/ff1 asm of __ffs() and
ffs() stays, as this asm is shorter than the code GCC generates for
the builtin versions of __ffs() and ffs().

With GCC 12 to 16, fls() shrinks from 28 instructions to 8 or 9 and
__fls() from 24 to 6. With GCC 8 to 16, the functions of each ISA_A+ or
ISA_C defconfig kernel shrink in total by at least 8676 and at most
13266 bytes (scripts/bloat-o-meter -t), depending on the defconfig and
the compiler. In lib/find_bit.c, only _find_last_bit() changes, from 55
to 35 instructions for m5208evb with GCC 16.

fls(0) still returns 0, and __fls() still returns unsigned int.
__fls(0), which is undefined, now returns ~0 instead of 0. For other
CPUs, the preprocessed source changes only in its line numbers.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/dbb44e92-0bc5-449d-9e43-1f93362aa6c3@app.fastmail.com/
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
I have no ColdFire hardware. On QEMU mcf5208evb (ISA_A+), the ffs and
bitops KUnit tests pass before and after with GCC 8.3 to 16.2. In
find_bit_benchmark on that machine, with the bitmaps drawn from a fixed
seed so that the kernels before and after use the same bitmaps, and the
executed instructions counted by a TCG plugin, find_last_bit goes from
52.3 to 38.3 instructions per iteration on the random bitmap with GCC
16, and bitmap_find_next_zero_area_off, which calls find_last_bit(),
from 3302 to 2864; the tests of the other helpers do not change. The
ISA_C kernels were only built, as QEMU has no ISA_C machine.

Under QEMU user mode, with the kernel's flags for -mcpu=5208, 532x and
54455 and each GCC at -O2 and -Os, old and new fls(), __fls() and
fls64() agree on all 2^32 inputs (fls64() in either 32-bit half)
except the undefined __fls(0).

The seven ISA_A+ and ISA_C defconfigs (m5208evb, m5235evb, m5275evb,
m5282evb, m5329evb, m54418evb and stmark2) were built with GCC 8.3 to
16.2 before and after, with the same .config before and after. A W=1
build of these seven and of twenty other ColdFire and m68k defconfigs,
each with at least GCC 8.3, 12.5 and 16.2, has no new warning.

The new out-of-line fls() for m5208evb with GCC 16.2:

	movel %sp@(4),%d0
	tstl %d0
	beqs 1f
	movel %d0,%d1
	ff1 %d1
	moveq #32,%d0
	subl %d1,%d0
1:	rts

Against v7.4-rc1; also applies to the m68knommu and m68k for-next
branches and to next-20261113.

 arch/m68k/include/asm/bitops.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index e9639e48c6c3c..81923a9fa4494 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -506,13 +506,14 @@ static inline __attribute_const__ int ffs(int x)
 	return __ffs(x) + 1;
 }
 
+#include <asm-generic/bitops/builtin-fls.h>
+#include <asm-generic/bitops/builtin-__fls.h>
 #else
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/__ffs.h>
-#endif
-
 #include <asm-generic/bitops/fls.h>
 #include <asm-generic/bitops/__fls.h>
+#endif
 
 #else
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

