Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625572;
	b=dEnE5FAOONjO3nK3+gHrL4XuzFG7PRCDTR/uz+FrUYKuAiE0u4bkGqPtF64LjAXUM4Fm
	 ugWPiZ/tOWuO+AO/dQOIbtN8dQK2J9XCa2AsCGjhtXeR34svCOCLQrzTEGmMv1rIhrBoY
	 1h8cDY6DiIVJr4qSGmKFlT1WWtHxP3aW00UVp6EwAZFX4uqpwTzsReI/1HwPeUXJHJa9t
	 ifilZvJNeMbQRLse+z6Gar3eUBWnReakWHQ/Q5IX8QMaSh2lN2EogZ6KgGYwtGRAb6wZB
	 f1bhOlFnrT3KzQvg0PlrsTWJjORqdG3aZ+6M2yI+hrcmZ+7j6IWHY9QnpADczKdDSkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+h8/JWqvHXnTrakvtQCV9/1JAI1KduPnktbk/z9Pmlw=;
	b=4XBcz3ejRiQVE0Zq9dUuG454DYAP8xAo3/B8YPE2gXT5t5g8c4xFcg/ccRe+XyW5s5Hr
	 dNvQe1+b/LMP5K+qg9lh2spbKDpFK2oca39FlydC1Nj+IpFfsp7dRma/IzDqyX0F/kvN/
	 nnpg+5+T+InzwerxqYJlN72kZ3v96Kc8xJnmIjRuafV54oD9SoB2jwea4uAIPp4EQM6aX
	 B6jepCoMz6Jc0HYKSRgL3cTNtJglCced39/iMtzHsFUho1CSUbAC9RnLZcQZv0UV9fOZK
	 s2AAWAHC6jxX1RyI1+EKNuxeUSTY3N6pQRj3UaKS8/4dOTIPGLiGESycvFKLI1YFatw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmXUy9+s;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7CF606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmXUy9+s
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so8109559eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625571; x=1796230371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+h8/JWqvHXnTrakvtQCV9/1JAI1KduPnktbk/z9Pmlw=;
        b=gmXUy9+sHM2JO4hhIweU5j1y1V1QJdXUrDkRcjZu6URAGKs57c8oh7eOrrvbXfS/Cp
         zMz2RDc9fiOs2BhLsy+tdt7l5NPS49xBbl7MySJ58mdCdZLnMnlLOAToBNWw4LJuox88
         s1G0Ouhz/7ZTKoGQcYPTG2e8onlqvTf9GQokWWDhXN9DJGLQC7H5mBvRj6D2nQGt53lk
         6EIDY8bLlt/yQxaGSHB8LuMAJuf5IBVNE1AbHMjYhc9m/n+GYX8/qWgE8QXIlxpPz3/v
         PCArWzLgpKYzae3yGxfJHgmYy9SE54c2cZXsvo51jLk98nINWfKxcx13guv2CkJdT70c
         0LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625571; x=1796230371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+h8/JWqvHXnTrakvtQCV9/1JAI1KduPnktbk/z9Pmlw=;
        b=KEMLAuKu2JQf2ZqVTXiq/sz2iR7+Jw3GWjJkZy6OvQPrKb1lnIuCGG6duBahfaYcaj
         RCLhZVx/jqsUFIchdnjxDk3q63ZZuJFRb5MPG7y9hPvmNV94HIJUx+ziZoXyYuZJAf3s
         WquHKaD1rSnbnXN1AZGb/youu2h/wY3yjd/KvcGxoWKGhYuJCY1pEpE2F5h/KdT6YHrN
         +H9g4qXlDCIDuVwSBC4AS4KA03Ivdm9ysVIL+HPp4q/7MFOschg3nczvfYCr19JvWp48
         EuMOzbuIItdyRMAmCp3qbQyTe1V5hDGaxLtbOJhetsMDe+i3igK/Mr5hRgd/96pecOAP
         R+VA==
X-Forwarded-Encrypted: i=1; AL+hErHC4/iEbQWx0naOosBAH4rZwzYHPrIBIlk/lvn5HVSk88yxaMOAqNldL+feFRUg7NBvDRmDwcaoN5xUBUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sO2JOV9D8tRAxD/pMvlZxJzGR08+4f15LMSVU1tqktPSStJ2L
	c6TZ1FDAw2Ba9E2X9TYj3D7DvVBSOsFR6uHQyuY2giKgJ+4kheQuxdUr
X-Gm-Gg: AZFdTZfDqs0jOGnCZAwXiiA2Bc1O94UN4uSqH1hbXeugHIjBxtuuLv84aXhq6nm77sZ
	aYxybijcIVHoHFF+mIlNFyvH7G0hqpQH4R5rYZpTUmd4KKUj5hyXnC9joi6A2MmfXm/SYdkEL0s
	KIDc3TBawfxSwto5Vz+TeasROMIeJCk03dj4vRgd16DTEYcRSPpt3U8o92YXGvDqeNvXOF6ezBg
	ywv8aOypLgWjSGFeKRkKk03phiCLWa8GBfXhV8RmtqUXAnE0ov0VOWvcEcGnkHEC1KuFkrURH1Y
	/8qJg1Vg3pc4+qcn7X57++8/6NAWfOrpjkiVuEgK4KFRzRYAJQ0vBKbwB5EN0th0O9YulAwW159
	DYxfGw+lybNWlDLWpPhaDusOR5XUhKbkYL2VMwwHhrzPCwjoyVKBvqrBjyY5U4mMEnmMChDgbsB
	lcoXEScvZNHtA/4oHT2UclH+CI9xIvxLqbBpWT8dT2pNGEXa6QtucD6A8A8HGVPa4TD4+tUrU0H
	BDyMykWWZxcOdgyE9s1AVL9rE1qJkJNLU44vAXLB2HHFtPhrRogolSemZ9VE0bnPkBMtZc/Hr4r
	qtPQhMX0OEFAEzKABDjt1sNvJJ/RmTnQoQ==
X-Received: by 2002:a05:7301:787:b0:386:c6f9:b56d with SMTP id 5a478bee46e88-386c6f9b68cmr4498467eec.16.1795625571242;
        Wed, 25 Nov 2026 08:52:51 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98545358eec.3.2026.11.25.08.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:52:50 -0800 (PST)
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
Subject: [PATCHv3 2/4] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
Date: Wed, 25 Nov 2026 22:22:31 +0530
Message-Id: <128398ae7491112604572d94778c938bf1e306c3.1795625038.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795625038.git.ritesh.list@gmail.com>
References: <cover.1795625038.git.ritesh.list@gmail.com>
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

Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
allocations"), the kprobes insn pages came from module_alloc(). That
commit moved them to the whole of the vmalloc space, on the grounds
that kprobes use a breakpoint and don't need to be near the kernel
text. That is fine on platforms where the exec permission is per page,
as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
It is not on book3s/32, where the modules area is not only close to
the kernel text but is also the only page-mapped area whose segment is
left executable. So the insn pages must keep coming from there.

Hence, use the modules area for EXECMEM_KPROBES on book3s/32.

Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
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

