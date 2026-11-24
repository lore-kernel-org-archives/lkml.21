Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488978;
	b=s+PbOss0zpaxcqR+T2PFJeXoVh8NDasuvGut+K4ncGeFhARinReCKr8CjHOWmjM47H5n
	 QyT4GU+5iPvXhWfyP4oTwUYtBRtDQshqIADpdM++L/Rmti3yTcywPl+lF46ieUOMNl47o
	 nj1lndsibhicHVTPhnqhjKE9D52u6SN3QPFmne+qAJR6/gaMHa2I/55CwsZspHGoiM23I
	 0JP/M81V03fU3sJKuBO9VC5t29q9BEix0V02GMAXwmMgUbyKhaPEzMpU/4SzRW7W1zN1L
	 s0ZOm17v3jZ57veo/VQHlRzNQ8V/G6wGXaiGEo0L3K+3Y+HVG70LuQYemxCNppee8zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VTJx4zOZOCq27U0Jzn+4GN03jUopCsjAx/64NooQBH8=;
	b=R5woQplYxzEHzvYINlrbtURX7It6I0FoCDdQ5Pcmtdn/9Vzoz2RtHC+c1byImJR4cyN8
	 TnOAko/Aw5w4geD4rwOp8oiO+3xkHo35yrIOplgHXt6q+r82wQRyoqvCIOi5VSl7IB0a1
	 zKcWhVRVILNaz+IZ21B0Ntscouzp3UzxUUDso9qnTBZFrz08eAmcB+/s9CdNFIfZXonaR
	 QPFpx2V2BUomz5O35+M0wFueHGri7d6U61NOugVhVNOiqS/JIJPABnyuj6b6PiSPKkbGd
	 buRq2+QOmsIK6i2PkmxrgpZlc3sqvsgj6d+ZA1rr8UEFkIIASIGAjAEJJ8DmDZJv2Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=HmTnWZH0;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6183606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6183606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=HmTnWZH0
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efddf749e5so20023795ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795488977; x=1796093777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTJx4zOZOCq27U0Jzn+4GN03jUopCsjAx/64NooQBH8=;
        b=HmTnWZH0m0H3K2McF3SCBNeZbhc5TVXZiJrh8cF1sp8PHZsn3ZUt2Mm9xjMmU+Me61
         uE02t3y8CQam64xKQR0I9X0SaYz73qqQzM2SgWS5QRMPHRKluSeYTobcBBuGFjKu6X4s
         olD2hBr3grgUWv5XUKsyPSUGVCY7bbVRQ7Ya0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488977; x=1796093777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTJx4zOZOCq27U0Jzn+4GN03jUopCsjAx/64NooQBH8=;
        b=c9gQlnicTD8cr7+otJJSBfTrP5alTAxxXjFBuzcm0bxJEjLBlDr8DtmXVjyPda3/fG
         SXBkhUJh8qN+4OuimJ2fDemkdXs2NGrJG19oPgMQp1DmMFzjBOsnLAiwU7vd32XY5vCW
         cVGl8JC1LsGQ27k8JgwxtMOKdE59r9552HCNi8Ghq1OFSf5O8xbKnGLv4ZaIBvxVcOsP
         dUgmDSRoXzcczyuf5uqg29bnuCFb4GSFvqci/iNoE7gdgLFzCnXd2JCZWgVokBVwElg+
         SSwhtZfcno50nWWXiuUpITPOq4iNT6gVEHdsrJPhCxU/RrRnmyVDFB6ut8t5PDLjnVbu
         7MiQ==
X-Gm-Message-State: APuU4Z8exTTaaTBmSrL+FIdSA379vF4o9PAZVBIDOFzCxzmCAcQ+8kLI
	3uf1Hm9zcDuQCO0kV9IUhENlCaaX7JWdv2M9ycOljvaXx50AjAp8p8mYnyf4ap5jnJY=
X-Gm-Gg: AZFdTZfx4DuspBedokitHB4Fxu6msfigifPAltM6oxjjmHdEACAURsVhrrtNmH5Y1K+
	TkVNgrrzUvHW2rsRLc0v0UAkWGGD7CszjqietiuDqeW/Z0aCdSI4CF9piMXajACrCMGfS6aaqSX
	PgTtcNrlNIWmkwXeO9uclHS4T8Kvytj+vc5Ik38oznt9MJ5aluy2aQPnZRemNHCHrZaMJuo1SW3
	D67scmj4qduDZf1vKNraiIcJlhnOWawkp18+EOjK89EEM3yHLesA8wzJL2SvCuhw5eJcf5L1ATe
	45jNbohUnHFAj4HMohHRcVUou4zBQPgdRW3UKeappM72qLTPddiD/YTONtyA/mMC7TGgS80jJvy
	NFU1ygA13/0AUqBtZTbljnyJhqcQYMOsVp5AS8LFNU1C4y0tVug3DibzHm0oNHr17siJJbq4zEP
	6CLr3mAAnn+CA0REFzkITQ6t+I5OcIpUD4AM58eGPGrphkLwBUZBAG42oKS346QDnfcyphW7u8c
	dVW0zvAB4KXgvdHNBqt4sY+vDfPxePx2Ogx18mJbcyEfC7qLTN9INeQaxzXCT37Uj6TZ9NRLhQY
	suOZ03zVQeCWKCAP+qvmFGwfCwBsCLtBsgS7gzdFBa5GZZi2eKRWUlytSe7cLZO5rfVbXOo=
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr8634213a91.33.1795488976892;
        Mon, 23 Nov 2026 18:56:16 -0800 (PST)
Received: from shiro (p1721212-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.141.212])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm20764273a91.9.2026.11.23.18.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:56:16 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
Date: Tue, 24 Nov 2026 11:55:55 +0900
Message-ID: <20261124025555.2348580-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

On m68k a syscall handler's stack arguments are the user's registers
saved in pt_regs, and RESTORE_ALL reloads them on the way out. The C
ABI lets a function reuse its incoming argument slots, so anything the
handler writes there ends up in user space. SYSCALL_DEFINEn() stops
the compiler doing that with asmlinkage_protect(), but sys_mmap2() and
the other m68k-specific syscalls are plain asmlinkage functions.

With GCC 16 and a kernel built with -O2, sys_mmap2() becomes a tail
call to ksys_mmap_pgoff(), which builds its call to vm_mmap_pgoff() by
shifting its arguments up one slot in place. User space gets d2-d5
back holding addr/len/prot/flags.

This issue was noticed in nolibc programs that are using mmap() and
I initially thought nolibc's m68k support was to blame.

Define sys_mmap2(), sys_cacheflush(), sys_atomic_cmpxchg_32() and
sys_set_thread_area() with SYSCALL_DEFINEn() so their arguments are
protected, and make their prototypes in asm/syscalls.h return long to
match.

Fixes: a90f590a1bee ("mm: add ksys_mmap_pgoff() helper; remove in-kernel calls to sys_mmap_pgoff()")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

I think this is right, I've tested it on real 030, 040 and 060 machines.

I found this issue making DRM/KMS programs with nolibc. Since I wrote the m68k
support for nolibc I suspected I had missed some ABI thing and messed it up and
I put a local workaround in there. Then the issue started showing up a normal libc.

I fixed the sys_mmap2() place by stepping through the kernel in QEMU and working
out who was messing up the registers. My fix worked but I wasn't sure why
there was an issue to start with so I asked my clanker and it disassembled the
kernel and explained the tail-call thing in the commit message.

 arch/m68k/include/asm/syscalls.h | 10 +++++-----
 arch/m68k/kernel/sys_m68k.c      | 26 ++++++++++++--------------
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/m68k/include/asm/syscalls.h b/arch/m68k/include/asm/syscalls.h
index fb3639acd07b..f317b35d6970 100644
--- a/arch/m68k/include/asm/syscalls.h
+++ b/arch/m68k/include/asm/syscalls.h
@@ -5,13 +5,13 @@
 #include <linux/compiler_types.h>
 #include <linux/linkage.h>
 
-asmlinkage int sys_cacheflush(unsigned long addr, int scope, int cache,
-			      unsigned long len);
-asmlinkage int sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
-				     int d4, int d5, unsigned long __user *mem);
+asmlinkage long sys_cacheflush(unsigned long addr, int scope, int cache,
+			       unsigned long len);
+asmlinkage long sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
+				      int d4, int d5, unsigned long __user *mem);
 asmlinkage int sys_getpagesize(void);
 asmlinkage unsigned long sys_get_thread_area(void);
-asmlinkage int sys_set_thread_area(unsigned long tp);
+asmlinkage long sys_set_thread_area(unsigned long tp);
 asmlinkage int sys_atomic_barrier(void);
 
 #include <asm-generic/syscalls.h>
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 1af5e6082467..9e6d38e57495 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -37,9 +37,9 @@
 
 #include "../mm/fault.h"
 
-asmlinkage long sys_mmap2(unsigned long addr, unsigned long len,
-	unsigned long prot, unsigned long flags,
-	unsigned long fd, unsigned long pgoff)
+SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
+		unsigned long, prot, unsigned long, flags,
+		unsigned long, fd, unsigned long, pgoff)
 {
 	/*
 	 * This is wrong for sun3 - there PAGE_SIZE is 8Kb,
@@ -374,8 +374,8 @@ cache_flush_060 (unsigned long addr, int scope, int cache, unsigned long len)
 }
 
 /* sys_cacheflush -- flush (part of) the processor cache.  */
-asmlinkage int
-sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
+SYSCALL_DEFINE4(cacheflush, unsigned long, addr, int, scope, int, cache,
+		unsigned long, len)
 {
 	int ret = -EINVAL;
 
@@ -459,9 +459,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
 /* This syscall gets its arguments in A0 (mem), D2 (oldval) and
    D1 (newval).  */
-asmlinkage int
-sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
-		      unsigned long __user * mem)
+SYSCALL_DEFINE6(atomic_cmpxchg_32, unsigned long, newval, int, oldval,
+		int, d3, int, d4, int, d5, unsigned long __user *, mem)
 {
 	/* This was borrowed from ARM's implementation.  */
 	for (;;) {
@@ -533,8 +532,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 #else
 
 /* sys_cacheflush -- flush (part of) the processor cache.  */
-asmlinkage int
-sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
+SYSCALL_DEFINE4(cacheflush, unsigned long, addr, int, scope, int, cache,
+		unsigned long, len)
 {
 	flush_cache_all();
 	return 0;
@@ -542,9 +541,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
 /* This syscall gets its arguments in A0 (mem), D2 (oldval) and
    D1 (newval).  */
-asmlinkage int
-sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
-		      unsigned long __user * mem)
+SYSCALL_DEFINE6(atomic_cmpxchg_32, unsigned long, newval, int, oldval,
+		int, d3, int, d4, int, d5, unsigned long __user *, mem)
 {
 	struct mm_struct *mm = current->mm;
 	unsigned long mem_value;
@@ -571,7 +569,7 @@ asmlinkage unsigned long sys_get_thread_area(void)
 	return current_thread_info()->tp_value;
 }
 
-asmlinkage int sys_set_thread_area(unsigned long tp)
+SYSCALL_DEFINE1(set_thread_area, unsigned long, tp)
 {
 	current_thread_info()->tp_value = tp;
 	return 0;
-- 
2.55.0

