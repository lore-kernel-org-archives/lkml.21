Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672414;
	b=an93l13M0DDKPj407EV/Yifa6GQHToyIZXbCvgNBXwL5DI8zTh5NmiuBseaoMOQvEh1O
	 +iz+FZuuyDTcvnzWwDnqp+zIzLxKWY6k6r5a9+4Bv40BQ8TAyZ53E90fYQU2+EnLZWD02
	 laUDda06uZqNU0KwpU+GgIQdVcHp0OYB+iwj/I/ZhBmSbRx2oOsb4RG7DuHnVQTMHmVUQ
	 eR1pHBDnGbKwFPugZNi02Q8u/L6pNaoCrXEVZVD6Es6foDvwngo4zVTqXoyjKW5XT+oWr
	 XmENmHHUJpO8568H9bXPOsAwqYb7etfIpuk/e/YVksKSXRZyWU0hLO5fI431MgRFoqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RNFx/EgbmUa2oSZLcgIiIgG0cChruBrBpYoE7jjVeQA=;
	b=3ZRnDJWyb4YJ7zuJnmpXbp/G2nyPu7DOcGjC8d2Ypu/qloeLSiYo2Ca05hqVl//mtYHJ
	 9xDu8wDSipKBr9iIrUb7ltVi5NfaRxJlG91aiS/kVPf9L1dj8E76ejtZsmZcuajarB286
	 qYsnWCsjj8F3ra+N38S1UkVglTnEEh8Cko7CEPfoFlbpjlBdN+A9MvdMpwEfYHhZIpcPe
	 lhbnWBHZFi8CPADwxV4wtjLMhhvvFSPP3o4HIFH7UTjXO+1uzfHpJutE+lXB0gQYwUHev
	 jOek4e95hjLukSF3bKqgdDuFVmN11YZg78R+hSvIu4bY92GRt+UyQWXCOe2j8QbOFIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjNH1fxB;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B0E606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjNH1fxB
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f01f296937so51032395ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672413; x=1796277213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFx/EgbmUa2oSZLcgIiIgG0cChruBrBpYoE7jjVeQA=;
        b=fjNH1fxByJRym/yf6ls5GpEmg7EM/q27j1sDep3Ij08UDsi73ei6cvbz9AQ8wLeMy2
         twljquQKAa8SOKpMZu3DEd0FGum8h8U4+Rq95epZvesb1Qzj5MbDGiLjv5A4+4TAOT04
         a/uYZGt6S/x0IyuF6X/XWD7Ta86DY1g32dQ1D01jQMFS5mUdVicHHwZZuqmWycx1wwmx
         Hjj6vN41rBOG9UqTKaVxXdhzHwcbyQKILRiERhMmEp/rE8pMWyM6Vz9ujOnRIINHAYpp
         PKcxmevPwpAkApxVx+uNlF5w7qIrOeS4f7WEXGdQyaI4ZO6Hj00Z5/zTak8toNeZwyVq
         fWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672413; x=1796277213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFx/EgbmUa2oSZLcgIiIgG0cChruBrBpYoE7jjVeQA=;
        b=N3GyXH46vygCpxCU5EfGA9RG1cHdymQcsYez4IOB+SDwBUC+DW39h+wmWIbgoZVShK
         RBmParNZtlsM+IXn0ifYK9/OxrPGAfEhLNxpnJConA7WRBE8NlIbNunmsvYj4Sw31p/T
         NMMpkcQAhLCZfszLw1YKq9pC2CxtJFyBbQesRwdOd0pylEykwDo7Nr6RnyGYaaaeENSw
         XbUqh3Xuz1Fan4JPAOZqNBAExmkxsarRJDA3wYRud6tasUu0EGqLYllbQHJbYaDxx3F1
         LvHgoSvBVprv0zfq3y4+FoXHUjpCaO0DsOIsG8FqxbBmUMXucgKDR+NMU4zIFXiLHX/x
         lysQ==
X-Forwarded-Encrypted: i=1; AL+hErEziIbGzQYeX8dH/J1wB8JnOX6dFk/LQvsMrXD7V9szCspVweVqrm7Bpzle29ke9Ix/MkvW16pM08mQYms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rmtdeW4BADuEMO/8vLBB5+Cewl0RT2snfej785nmC+y5PJGGW
	0XhEfeLgvELxp2hFpgF6bfH9y5VEWe+SMOrT32ODxnbRw91MxSapdrPG
X-Gm-Gg: AZFdTZdezG4G9g6IQOH1PFJLJ3BE8gPsx9MAdZqrs6MRUwVQYKYm5v0YDj2+w9tXeSC
	YBelG0EFcysScb9zUD4zG5OoKkyQPoO5Ks2Ry8zKu3UITSKFnA9INjTOtZXaZrPv1lNQKX7/fSc
	b0nzIROnExjCFavLo6tvvBZMNi3qwB6WA1O4/qjifg26iKelA9XH3lje0pdsVJMi11QQrKSWa24
	dF+calpPHAVoKXpj6ggbvhDlxoVi+Zyb+uTrJrYYT6ywFPfSMRBWHesxB3ZobkQ0Q/AciIW5miM
	0FnSvl42fr2ObdF/U/En6X6/+OVoNezrRuUtv9g8ByeK4iO1T9R7u8d4OFz7f/AY/lmVB7t/KBf
	zbf6QIVa6LVcT7bckIjjw3l4KWWbteBI4pFI+K0U8u0qfCaw8Z8bXtCsriuTPfJ0aCDGyM35+qv
	xGO6FvrJYsPpwdA/+O1tw2DHbm+PYj4TRBPGnsdsLwbWVtWOih1YhMOkfCeASLb0WsMn8uhc0M6
	vnyij0siKZaPydCLiEwfzvaXYwFzbRM5DgARB9OehWvjmiEUBn9CYc5U+uomQ5rYKDUB5F9YwBc
	sJRwAQCmGKr4lruIIOUy7vrH9Oti+pjkzS3GyxW+XD+lo3iDKiq4qSw=
X-Received: by 2002:a17:902:ef49:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2f03f1cfb70mr191222975ad.20.1795672412937;
        Wed, 25 Nov 2026 21:53:32 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm98478035ad.75.2026.11.25.21.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:53:32 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Thu, 26 Nov 2026 13:53:24 +0800
Message-Id: <20261126055324.3562889-1-shingekinocore@gmail.com>
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

On 64-bit r6 kernels, __fls() and __ffs() never use dclz: they always
run the C binary search, 37 and 39 instructions with GCC instead of 4
and 6. __ffs() calls __fls(), which uses dclz only if cpu_has_mips64
is a compile-time constant:

	if (BITS_PER_LONG == 64 && !__builtin_constant_p(word) &&
	    __builtin_constant_p(cpu_has_mips64) && cpu_has_mips64) {

cpu_has_mips64 ORs cpu_has_mips64r1/r2/r5/r6. On r6 kernels the r1, r2
and r5 terms fold to 0, but the r6 term tests cpu_data[0].isa_level, so
64-bit r6 kernels have never used dclz here.

The r1, r2 and r6 macros were run-time tests until commit 1aeba347b3a9
("MIPS: Hardcode cpu_has_mips* where target ISA allows") made r1 and r2
constant in 2018; it kept for r6 the flag test that tells MIPS64r6 from
MIPS32r6 CPUs. Commit a2ac81c6ef40 ("mips: Fix cpu_has_mips64r1/2
activation for MIPS32 CPUs") later added cpu_has_64bits to r1 and r2,
and left r6 alone. Every other cpu_has_mips32rN and cpu_has_mips64rN
macro is a constant on the kernels built for its ISA (the 64-bit ones
for cpu_has_mips64rN); only cpu_has_mips64r6 still tests the flag at run
time on 64-bit r6 kernels.

Define cpu_has_mips64r6 like cpu_has_mips64r1, cpu_has_mips64r2 and
cpu_has_mips64r5, as cpu_has_64bits && __isa_ge_or_flag(6,
MIPS_CPU_ISA_M64R6), and remove __isa_ge_and_flag(), which has no other
user. On 64-bit r6 kernels cpu_has_mips64r6 then folds to 1.

Because __fls() and __ffs() are inlined into find_*_bit(), cpumask
iteration and ilog2(), the functions of each 64-bit r6 defconfig kernel
(64r6, 64r6el, eyeq5, eyeq6 and eyeq6lplus) are then smaller than
without this patch: in total by at least 105340 and at most 108352
bytes with GCC 16, and by at least 124340 and at most 146692 bytes with
Clang 23, depending on the defconfig (scripts/bloat-o-meter -t). In the
64r6el and eyeq6 builds, the users of cpu_has_mips64r6 other than
__fls() shrink 3 functions, by 148 to 248 bytes in each build; the rest
of the reduction comes through __fls() and __ffs(). __fls(0) now
returns ~0UL instead of 0 on 64-bit r6 kernels: the -1 that the comment
above __fls() documents, and the value on 64-bit r2 kernels.

On 32-bit r6 kernels cpu_has_mips64r6 is the run-time test of
cpu_has_64bits (isa_level & MIPS_CPU_ISA_64BIT) and gives the same
result as the test of MIPS_CPU_ISA_M64R6 that it replaces, because
set_isa() gives r6 CPUs no flag of MIPS_CPU_ISA_64BIT except
MIPS_CPU_ISA_M64R6. On pre-r6 kernels cpu_has_mips64r6 was the constant
0 and becomes a run-time test of MIPS_CPU_ISA_M64R6, as
cpu_has_mips32r6 already is a run-time test of MIPS_CPU_ISA_M32R6. With
GCC 16, the functions of 64r2el_defconfig are 264 bytes larger in total
than without this patch, and the functions of 32r2el_defconfig 3352
bytes larger (scripts/bloat-o-meter -t).

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
Changes in v2:
- Define cpu_has_mips64r6 as cpu_has_64bits && __isa_ge_or_flag(6,
  MIPS_CPU_ISA_M64R6) and remove __isa_ge_and_flag(), as Maciej
  asked [1]; v1 had cpu_has_64bits && MIPS_ISA_REV >= 6.
- Commit message: describe this definition and its cost on pre-r6
  kernels, in place of the reasons v1 gave against
  __isa_ge_or_flag(); add Suggested-by.

v1: https://lore.kernel.org/r/20261030140430.1857741-1-shingekinocore@gmail.com/

Function sizes of v1 and v2 relative to mips-next (bfe97f12a0a6), in
bytes of bloat-o-meter -t:

  defconfig   compiler   v1        v2
  ---------   --------   -------   -------
  64r6el      GCC 16.2   -105340   -105340
  64r6el      Clang 23   -134840   -134840
  32r6el      GCC 16.2         0         0
  32r6el      Clang 23         0         0
  64r2el      GCC 16.2         0      +264
  64r2el      Clang 23         0      +168
  32r2el      GCC 16.2         0     +3352
  32r2el      Clang 23         0     -2500

- r6 kernels: v2 gives the same vmlinux as v1, byte for byte, for
  64r6, 64r6el, eyeq5, eyeq6, eyeq6lplus, 32r6el and malta_qemu_32r6
  with GCC 16.2 and Clang 23, and for 64r6el with GCC 8.1 to 15 and
  Clang 21 and 22. With Clang 17 to 20, which cannot assemble genex.S
  on this base, v2 gives the same objects as v1 for 64r6el. So the r6
  measurements in the notes of v1 are also those of v2.
- pre-r6 kernels: v1 generates the same code as mips-next, because
  cpu_has_mips64r6 stays the constant 0. With v2, cpu_has_mips64r6 is
  a run-time test, and the function sizes change as in the table. On
  32-bit pre-r6 kernels, each check of cpu_has_mips_r6
  (cpu_has_mips32r6 | cpu_has_mips64r6) tests MIPS_CPU_ISA_M32R6 with
  mips-next and with v1; with v2 it also tests cpu_has_64bits and
  MIPS_CPU_ISA_M64R6. The -2500 of 32r2el
  with Clang 23 comes with build_clear_pref() and
  build_copy_store_pref() in arch/mips/mm/page.c no longer being
  inlined.

Testing: no 64-bit r6 hardware was available, so the kernels were
only booted under QEMU. 64r6el_defconfig on the boston machine (I6400)
and malta_defconfig on the malta machine (24Kf), built with GCC 16.2
and Clang 23, pass the ffs and bitops KUnit suites and test_bitmap
with mips-next and with v2. W=1 builds of the configs in the table,
also with GCC 8.1 for 64r6el, 32r6el and 64r2el, and of loongson3,
cavium_octeon, malta and ip27 with GCC 16.2, show no new warning
against mips-next. A run of the ffs and bitops KUnit suites and
find_bit_benchmark on an EyeQ or Boston board, before and after, would
be welcome.

Base: the mips-next branch of mips/linux.git at bfe97f12a0a6; the
patch also applies to the mips-next head dfe3ece66313.

[1] https://lore.kernel.org/r/alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk/

 arch/mips/include/asm/cpu-features.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 3f11e5218e6c..301158e704d0 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -57,7 +57,6 @@
  * Similarly allow for ISA level checks that take into account knowledge of the
  * ISA targeted by the kernel build, provided by MIPS_ISA_REV.
  */
-#define __isa_ge_and_flag(isa, flag)	((MIPS_ISA_REV >= (isa)) && __isa(flag))
 #define __isa_ge_or_flag(isa, flag)	((MIPS_ISA_REV >= (isa)) || __isa(flag))
 #define __isa_lt_and_flag(isa, flag)	((MIPS_ISA_REV < (isa)) && __isa(flag))
 #define __isa_range(ge, lt) \
@@ -317,7 +316,8 @@
 				 __isa_range_or_flag(5, 6, MIPS_CPU_ISA_M64R5))
 #endif
 #ifndef cpu_has_mips64r6
-# define cpu_has_mips64r6	__isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
+# define cpu_has_mips64r6	(cpu_has_64bits && \
+				 __isa_ge_or_flag(6, MIPS_CPU_ISA_M64R6))
 #endif
 
 /*

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.34.1

