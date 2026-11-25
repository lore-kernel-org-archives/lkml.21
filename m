Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571350;
	b=GBlDvRXU8ClkiWya3lhqY2OLhUyckF0hS/lUV3APPOrO+iAxN5+iAxBtrOZeg0MqUlQZ
	 +qN46eKSQCBL4FqlYM8PrRZlE6VkOmce1aipaRSUntK/JHcsRlmx+pCvna6yMk04FztCf
	 wH1NZlHH5ouW/8OqYexF98/5wY/9fNB7UZtX7+8IZI8jeLggvh5FF9nfOBoJamWL1OaVP
	 SiZNxXCe4pYpl34xy3b1HOebBz5A7/0apjQvdk89MojRTkiPJqlhLVEE5EFri9YT0xjHQ
	 zB5xWQJ+GjUxKFISXBi+o83xW7IE/sZ2zsy3uAO2wfGhHkr17d7WfXhyGOAqs8WuL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ObqOZxAlfLiw3L36aCRuRKfWllcmuJhnADCFOCSYZA8=;
	b=ZPWPk/TSNpI73ovv6MMa2MyGudv44PGAmZmVqMkyi+XuLwk8PAVZyAmm4rvvVgZGj8n6
	 5587J9xLeRBmZoXl3dxTAv8NrQhyJzvpJmcoFsJNOy6zsmvu8bLcIAA1/ki8ouv7QyCRj
	 5frNaD48izcUoZqODWgppQuFo0xYy0H9Beo1tTflxcSsQoyNNs2Wa4iHYLwcu0hpUunRj
	 OTd+Bf1ZM/nGonbenFdbZdnGtsTsC1jX3q4eA9ViNmXdEN3sQ1MQqP4F6MN/ie0QAg+lD
	 YHO+GxCOj9U4MrvE/9DAK53U/VPULHl/SwLZ8ubE72vwQ8Au5OBSRMEUa72N3nrrCPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=SMVbkYML;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D5606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674D5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=SMVbkYML
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2883651b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795571348; x=1796176148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObqOZxAlfLiw3L36aCRuRKfWllcmuJhnADCFOCSYZA8=;
        b=SMVbkYMLeOLU1SzrH79cFv6MefUcob6mOzOLRwvPjjS0lJ6XIk3OuWXfaWONPBukda
         U69RVMqAmM2fSJokAIYkuvFn6SUIRWzcHboED1ezL9NKfuH8R4l/W5nEq+PLatwv5cTZ
         DFIvnn6ZlQcdSEqCfk9hZmEDz9LaD02ujfWi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571348; x=1796176148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObqOZxAlfLiw3L36aCRuRKfWllcmuJhnADCFOCSYZA8=;
        b=U9xq81Vwx90GwcDS4fH5Ke02YzVKH8cObGT21Pe+Zv+qcA9JCHW9CmY6gBxBg6nxQu
         Qv83EocB9KWH/FYP/8nl9aaZ2ekqI6+GVuA3NjzMGselmRLyAomplu9Y3cUTcJ9rHgj/
         r37S39rL1RnC3m075qaE9F+P5NKadlYVUmXQ164xocTamXzHTFNU6I7e/choRXf2O8ih
         dL1EqN2y3QR+woJ8Vweqab8w6lFvkDyhqdGxBt8riuDYiqWX1IGJVXl5nrUbN495ksrj
         wgJEBybiMnldY8cgBA1vtogbzITl8OK1aEMNdrpFDPms81TdBKl5pTHIBvLt+XE6VOuj
         iazw==
X-Gm-Message-State: APuU4Z8+z589x0xrlLTsOP1erSMhyXDwEyZvZ4y/rxKxXDxMYDlCRFUe
	JdCtwhhoDVmVjG6XrJV+zLZS7x7c1ZvergosjzGathURYj6e4G7PVARpbhjHmk3L1rFtdH/GVtN
	6Yi42
X-Gm-Gg: AZFdTZeKkKs7rpNtKJINLK2I+xo8F7WnH8QHnpDBHtVzFzRP9/co/O76kVe/hEmwM1E
	3HkOMPk+aqe4TWNmZK0CxLLs75I7VrdcShMQPuxAFVvvfNUbWi8sNNzCaUKT/ju2oIeP+NhUTM/
	oJcVARlAbmZBquI9/p0OpGPNGcD1dm+3erHIGbBFVOwXhapZ7uGbJox0C3GavRj7L0PjsBeWT0p
	JSEUYifROmVsyNVBgyKuz2A9giBDfWoMBdipnjArQXutKrK0Ko13JvWFj2uMVWSeRsUS/rQ+4Pq
	Kl+7IVxNTqCNwEb0t9uqLk1EExG08+BzvQlDncYEmEdWpMV66T9ZPh6BHehedDmGt1hiE7j94Os
	4PkEP7DeWN5C7/klEeYcz3tWKuC/iGkVibbOzx1QZ7Q1Oy9riFcGE6BZhqI8LFhyc8IT2f2n/uW
	q0LLywE+Vudl1bjmEI4517IH0GjO9mx1QYDYgqq3Dzs5fkSgOvKkApI99IB18OUrDkLGIQxNFOI
	4oZacG3UNkZ+JERxKrPMw/xn5ywjR6u8GtfMwzkaYUj4jOB1D6XDj6ZjRGE1u7hqQLBfGFph4Sc
	Hux7k/H6kzhxIToA4sehNVFIjrzjq5VKDR6+X7Pw+G//PuTQ4Mp0l/UcMlpT/i+F/KT+fQs=
X-Received: by 2002:a05:6a00:2d06:b0:8a8:5b84:4c04 with SMTP id d2e1a72fcca58-8c87c95bd39mr14220491b3a.38.1795571348479;
        Tue, 24 Nov 2026 17:49:08 -0800 (PST)
Received: from shiro (p1721212-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.141.212])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm7739226b3a.34.2026.11.24.17.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:49:07 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
Date: Wed, 25 Nov 2026 10:47:37 +0900
Message-ID: <20261125014737.2421722-1-daniel@0x0f.com>
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
match. sys_atomic_cmpxchg_32() gets an additional small logic change
to fix how it gets pt_regs as the hack it currently uses is no longer
valid since its code is wrapped in an outer function by
__SYSCALL_DEFINEx().

For consistency sys_getpagesize(), sys_get_thread_area() and
sys_atomic_barrier() get SYSCALL_DEFINE0() even though they don't
technically need it. The generated code doesn't change.

Fixes: a90f590a1bee ("mm: add ksys_mmap_pgoff() helper; remove in-kernel calls to sys_mmap_pgoff()")
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

v2:
- Added a fix to sys_atomic_cmpxchg_32() highlighted by sashiko.
- Converted the argumentless ones too as suggested by Arnd, I considered making
  this a second commit but that felt like adding two extra emails for something
  that looks fine squashed into this patch. I assumed Arnd's reviewed-by would
  carry over so kept it. Shout at me if thats not ok :).
- Follow up work: It looks like the same lump of code for sys_getpagesize() is
  in multiple arches, I might send some patches to deduplicate that later.

v1:
I think this is right, I've tested it on real 030, 040 and 060 machines.

I found this issue making DRM/KMS programs with nolibc. Since I wrote the m68k
support for nolibc I suspected I had missed some ABI thing and messed it up and
I put a local workaround in there. Then the issue started showing up a normal libc.

I fixed the sys_mmap2() place by stepping through the kernel in QEMU and working
out who was messing up the registers. My fix worked but I wasn't sure why
there was an issue to start with so I asked my clanker and it disassembled the
kernel and explained the tail-call thing in the commit message.

 arch/m68k/include/asm/syscalls.h | 16 +++++++-------
 arch/m68k/kernel/sys_m68k.c      | 38 ++++++++++++++------------------
 2 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/arch/m68k/include/asm/syscalls.h b/arch/m68k/include/asm/syscalls.h
index fb3639acd07b..38a0f985fc76 100644
--- a/arch/m68k/include/asm/syscalls.h
+++ b/arch/m68k/include/asm/syscalls.h
@@ -5,14 +5,14 @@
 #include <linux/compiler_types.h>
 #include <linux/linkage.h>
 
-asmlinkage int sys_cacheflush(unsigned long addr, int scope, int cache,
-			      unsigned long len);
-asmlinkage int sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
-				     int d4, int d5, unsigned long __user *mem);
-asmlinkage int sys_getpagesize(void);
-asmlinkage unsigned long sys_get_thread_area(void);
-asmlinkage int sys_set_thread_area(unsigned long tp);
-asmlinkage int sys_atomic_barrier(void);
+asmlinkage long sys_cacheflush(unsigned long addr, int scope, int cache,
+			       unsigned long len);
+asmlinkage long sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
+				      int d4, int d5, unsigned long __user *mem);
+asmlinkage long sys_getpagesize(void);
+asmlinkage long sys_get_thread_area(void);
+asmlinkage long sys_set_thread_area(unsigned long tp);
+asmlinkage long sys_atomic_barrier(void);
 
 #include <asm-generic/syscalls.h>
 
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 1af5e6082467..4cc5aaf74886 100644
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
@@ -515,12 +514,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 		   Make the kernel do the necessary page stuff, then re-iterate.
 		   Simulate a write access fault to do that.  */
 		{
-			/* The first argument of the function corresponds to
-			   D1, which is the first field of struct pt_regs.  */
-			struct pt_regs *fp = (struct pt_regs *)&newval;
-
 			/* '3' is an RMW flag.  */
-			if (do_page_fault(fp, (unsigned long)mem, 3))
+			if (do_page_fault(current_pt_regs(), (unsigned long)mem, 3))
 				/* If the do_page_fault() failed, we don't
 				   have anything meaningful to return.
 				   There should be a SIGSEGV pending for
@@ -533,8 +528,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 #else
 
 /* sys_cacheflush -- flush (part of) the processor cache.  */
-asmlinkage int
-sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
+SYSCALL_DEFINE4(cacheflush, unsigned long, addr, int, scope, int, cache,
+		unsigned long, len)
 {
 	flush_cache_all();
 	return 0;
@@ -542,9 +537,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
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
@@ -561,23 +555,23 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 
 #endif /* CONFIG_MMU */
 
-asmlinkage int sys_getpagesize(void)
+SYSCALL_DEFINE0(getpagesize)
 {
 	return PAGE_SIZE;
 }
 
-asmlinkage unsigned long sys_get_thread_area(void)
+SYSCALL_DEFINE0(get_thread_area)
 {
 	return current_thread_info()->tp_value;
 }
 
-asmlinkage int sys_set_thread_area(unsigned long tp)
+SYSCALL_DEFINE1(set_thread_area, unsigned long, tp)
 {
 	current_thread_info()->tp_value = tp;
 	return 0;
 }
 
-asmlinkage int sys_atomic_barrier(void)
+SYSCALL_DEFINE0(atomic_barrier)
 {
 	/* no code needed for uniprocs */
 	return 0;
-- 
2.55.0

