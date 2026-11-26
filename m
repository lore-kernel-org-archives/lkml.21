Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667186;
	b=Cle+Sz6rNlvAufy3zP4pjB2Ds5SVBj3mZFNI0TIUqhh2HTPXJk25yi7WOpR8+znbc0WG
	 7U56R+vsXn8uzrSeR1q08qfVtjQxD8YEDqDHWrePv5EjTC+DuRwUnlv53jGF8m6CA1lgP
	 /SvZ8Wcx+BNAEqKt+WXaa66/YzzE+Oi3eAqxrdjfqiZuPd1tlcTLFkC8W2SnmsgkECOa/
	 iwwp3FQ6L1PxAXJwJu3xXYeZzVqcmHC6AivP28iS1FiOL7L17+WKnpW7ZWA8xcw4gKe/z
	 uWP8GsnQNzeWGFQmvKNwZGaDTuRaIYuq/tz3cyxYOwa7iLIWXIvFQKqTZ7tJGHWFIqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HoA80N2orfJ66rdg5nw/PZVM0UN3b4vM2UXwegzYYDE=;
	b=j+KqnG++/iS/6o21bXYTQSNIOGCiEfGuWgT/R068AiTs7A5dtvUhAFVJQR74QcPlTC1c
	 2K7duz5v37+tfKdnCl7WHMQ7tqPYiebVYVMZN8tkSYXjkqH/7uR7AGiwgpMuzs7l1KQJR
	 BeFJyGGSeeS2eR8T9UtMvheTxomdTm0b+gDdkkvYpftDngLd2MOsDHD3vunqPVaH57xO0
	 wKna7bIvq8dsH3ODwaLryBvPnqpWTXiY/NrZ8uybcBy0C/asQaMjFIEYaOJS0+OgWR/gJ
	 XVf01Uj1J34dhCEhdaZRa3msrLwp5egClhiJz2qeVUHxyknm3yTrNH2yME6dl8OwB9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FicxAhYH;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433BB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FicxAhYH
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so1647370eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795667185; x=1796271985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HoA80N2orfJ66rdg5nw/PZVM0UN3b4vM2UXwegzYYDE=;
        b=FicxAhYHzQHTRV1khRks781urVV39sFmj/tPVYi/yaSvUFyeRQfRH6K4cP9mP+Cnm9
         Z79gqvlUMiLb7eJl538NHaJAEXjrSkIiSNXBauC7T6+HkZdvf+rCFx2NjXOSpxv6vXBe
         h7GnGsUD+5zzue65JR8nK296HkgPrWQu0RRWtudWuMU0z2hTwb5WTs7zBlgHCdMtK3m5
         VhU94LlzffUcCcWPoRZWP6IZHYfS6lqVD+WWV/6cfup9JW/YjBJU5VxbUQgA034DSaMw
         YvltD/SiDLOj2eZQ3tbZuwbGdb1h0qvDWe3vMN3+QYCcxaoKip6iElQHFp/ZP6axN82f
         8JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795667185; x=1796271985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoA80N2orfJ66rdg5nw/PZVM0UN3b4vM2UXwegzYYDE=;
        b=tn0zk73OcB3zHnRQ50Yg6mJB5VHieerFxhlJ30TlL9LiNPcBCjokfvWRZAhQQMcK8/
         dUO8FW3cgcu52fvqzLTU0yaNe3Q6uRm2PGg36PLnOYDKg7HABeEHL8NVv6OKqVuPYe1P
         B0DLB+sPlwd1Mvlh7XvN82AA3UXQ7+VsKi76L21BQWNwQ/cZbb529aJQHPbdNMGkoL60
         sF9QoshtbajYCDIwhQvLD1db6LkUtANV8krOiknFTXILTTFb0QVRFBANayScB3rq25AB
         wyZw/c2/M3p6w32TUjr8ohUTSkgRTzxCwdUvQOlLijIdLc5HBmYjjafQ1ma1x2lupVf0
         q5mQ==
X-Forwarded-Encrypted: i=1; AL+hErG3D49SbuzDY9UdDHym99/ptoUPMbe8QKSMpkkEVTe1aURn4k2u6mLyLtz538/lnVhewszt7HYJ7gdWZo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WX7/Vg93belQdAD/Yp4KHo3vQTLBjXSlO/F2BTZ9qSP4oNbYP
	9z+EPborwdlNoqGlUm+2DxmNWWNVVhbVk6cBCQJNhWZ6jfHbShqnuvAV1KYhhQ==
X-Gm-Gg: AZFdTZfKYsF0o7CA2hN/0axkhR8nZM/IAirwJL40TKXZfDBcIIF4DkSWDejfU/xZgHK
	XZ2jn3EVy7qeUMM3HFG7zoKqraOBRvCDKUXKwQisTRVa3NxQDNn44OHRR0j50burzYmzgst2O6c
	DVPBzEdr0ktBKc7OOxQEoFw2wFWp65msIn3Vt486qC+Y9Vizj17XcCTEfR3B+32bVn2CbDW3En2
	YyX0T5PgLH1tHwFCi9ob9T/AqzwLnLjInw1Im6/prQwnkcdkpBrp1N89h+OMxnoKp5dO5HokOAY
	IZT7SBIDyZi/twKT2HE28qWEq+Rrd5f66Rhcf1xo8L8Gd/6VldYPsUJTUEJuy09GHpwRfHHOkWT
	j74Rb7v7n907sRh+nwni4o9W7CDR0eincDiG8wnX5SKkp0Zvob9j8pV5lAhDfMUMkBHJDKHxCXa
	WvvIAA7rdZJHI219H5S6ADVP6sn3DLtKhOAxODYSrhZ9uyin32vKLBEzZPZTInnhroxjq53QNEX
	f9Jy4/6XRY2CKUxsb6iTfjNSUXguW4eAlqKIYcEI9yAIAIBZeL6ZZC1Qoc7nVZ20tOUiUon4Zpj
	XFQxC/SmQAMeMYlPKwiiHX7aQghxRmyUmA==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr14198703eec.31.1795667185369;
        Wed, 25 Nov 2026 20:26:25 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54542185eec.7.2026.11.25.20.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:26:24 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v4 2/4] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32 and 8xx
Date: Thu, 26 Nov 2026 09:56:00 +0530
Message-Id: <e8f8d59f9a3c88f45f873c91a2ff94586b68d928.1795666663.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795666663.git.ritesh.list@gmail.com>
References: <cover.1795666663.git.ritesh.list@gmail.com>
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

On book3s/32, a kprobe on an instruction that can't be emulated and has
to be single stepped out of line, crashes the kernel. For e.g. with the
following cmds...
    ~> echo 9 > /proc/sys/kernel/printk
    ~> mount -t debugfs debugfs /sys/kernel/debug
    ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
    ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
    ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable
    ~> ls

...we can see the following crash:
    kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
    BUG: Unable to handle kernel instruction fetch
    Faulting instruction address: 0xc02b919c
    Vector: 400 (Instruction Access) at [f19a9d60]
        pc: c02b919c: filldir64+0xb8/0x2dc
        lr: c02b9148: filldir64+0x64/0x2dc
        sp: f19a9e20
       msr: 10029032
      current = 0xc112e900
        pid   = 102, comm = ls
    enter ? for help
    [f19a9e20] c1a8d420 (unreliable)
    [f19a9e50] c02e4074 dcache_readdir+0x208/0x2a8
    [f19a9e90] c02b8c5c iterate_dir+0x88/0x1fc
    [f19a9ec0] c02b96e0 sys_getdents64+0x88/0x198
    [f19a9f10] c0014400 system_call_exception+0xf8/0x20c
    [f19a9f30] c00191ac ret_from_syscall+0x0/0x2c
    ---- Exception: c00 (System Call) at a7596164
    SP (af802310) is in userspace

This happens because on book3s/32 the exec permission is per segment
(256MB), not per page. The page tables have no hardware exec bit, only
the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
sets N on all the kernel segments except the ones of the modules area.
So nothing in the vmalloc area can be executed, even when the page is
mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
a software only bit there and the segment's N bit is what the MMU
enforces.

8xx and 603 (which is book3s/32) have one more problem. Their ITLB miss
handlers walk only the current task's PGD, whose kernel entries are
copied from swapper_pg_dir in pgd_alloc(). Only kernel text and the
modules area are sure to be in that copy, the modules area because
prealloc_execmem_pgtable() creates its page tables at boot. Unlike the
DTLB path, nothing fixes up a missing entry on an ITLB miss. So an insn
page in a vmalloc area mapped after the task's PGD was allocated can't
be executed.

Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
allocations"), the kprobes insn pages came from module_alloc(). That
commit moved them to the whole of the vmalloc space, on the grounds that
kprobes use a breakpoint and don't need to be near the kernel text.
That is fine on platforms where the exec permission is per page,
as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
It is not on book3s/32 and 8xx, where the modules area is not only close to
the kernel text but is also the only page-mapped area whose segment is
left executable. So the insn pages must keep coming from there.

MODULES_VADDR is only defined on book3s/32 and 8xx, so use the modules
area for EXECMEM_KPROBES whenever it is defined.

Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/mem.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 77b63b52d8f2..8a0fdfd028dd 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -391,6 +391,7 @@ struct execmem_info __init *execmem_arch_setup(void)
 	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long fallback_start = 0, fallback_end = 0;
+	unsigned long kprobes_start, kprobes_end;
 	unsigned long start, end;

 	/*
@@ -410,9 +411,15 @@ struct execmem_info __init *execmem_arch_setup(void)
 	}

 	end = MODULES_END;
+
+	kprobes_start = MODULES_VADDR;
+	kprobes_end = MODULES_END;
 #else
 	start = VMALLOC_START;
 	end = VMALLOC_END;
+
+	kprobes_start = VMALLOC_START;
+	kprobes_end = VMALLOC_END;
 #endif

 	prealloc_execmem_pgtable();
@@ -428,8 +435,8 @@ struct execmem_info __init *execmem_arch_setup(void)
 				.fallback_end	= fallback_end,
 			},
 			[EXECMEM_KPROBES] = {
-				.start	= VMALLOC_START,
-				.end	= VMALLOC_END,
+				.start	= kprobes_start,
+				.end	= kprobes_end,
 				.pgprot	= kprobes_prot,
 				.alignment = 1,
 			},
--
2.39.5

