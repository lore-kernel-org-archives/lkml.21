Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688200;
	b=sDZ2x9eFZnXGTLph9ntvWoG3KA5rQrjYOs41uEodYOGuCFb3H+bjOb/BamubC6MlqOei
	 uC/9EkW1GSG2/LVSiyitDoVKQpHR/GwIWc6K0RL0Ws5IFUQ+uqKdRUS1zYCyzaPNq4ZI5
	 FWFMoTAoQ2ovFuM0mw7upeNa0b/Dj0R5R+REV+MjppINSudZ67g1y7Lxi0Bg1X5nMmxn9
	 QwXG01V7KgOxyg/Jl/VFEUsaEZYuh+srutd7HfGE2JjJ3a29Jt/0xA7T/1LuDeQQoUK1W
	 yJzc80xO+6I3xcNyG+708DWa0dKeRlYz1KvJwYkeYzAviminYz4v6rFJ4xSWEhqniPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688200;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9F3e3qoADYvEtMrkzIhPLVVLYaRfKlHMHElOy4yBHDM=;
	b=mL6q++Xmo50X++hXsxA6O8UFKJK8mO0dl1PRTRs6sGm9HRi+R15ROYZ1BoxIHCe1GvQW
	 aHR9wxMz/IFwNTGPiqaPcVWI8t2o9pTixsBTt036kdvfngKM/R6T3SW976xvcR3Ln1ln9
	 dRiHSzDnkwTHpX6TlMUK4JOxry7uhVvGkJZM/Ktb5oQT7BCd+KoutLqCDcd1383STv4KZ
	 Am7Q/11p2NuOA+c34+JkNt1XzLpqKxzO0nf2yxENhF8O45ZF/2XBpi6Rmemr/i299Fitv
	 dV0vwHnSQm2+mxN1XHBF5BWalU2QInIV9e57n4e0UZlee+k/SkBfcYJYc0T/5y1p3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKqITnP5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKqITnP5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1441F000C6;
	Thu, 26 Nov 2026 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795688199;
	bh=9F3e3qoADYvEtMrkzIhPLVVLYaRfKlHMHElOy4yBHDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jKqITnP5wU/Q5r+vGq93o6JtncPMq5zle1NGmwV+sJcp2oBW20YZB25SKuEk45rCS
	 lJbuesqLdlKooLcZNowtQ677pgvNzxsLG4VamTCS6S8Z2lyENT4v3wbGBk/LeUeNWD
	 yMBY03FT9lAPnZ2gzFMM/BuLsqOP/q6ss9uF92JZ3A6ziAriaARGJhuOBQyXHqEUme
	 3EszC/ZOyJhDYoZ+WPVueYq/TTkZP+LnOGXjZAVTA4EcDHuyfPv7Dcu5Q0dfAmkjf2
	 cPd1OWJyDeGIvSsI0OIW355VTqf+7NrHkiSpRRidig4bsGSEaOEcdcL+jZ3E59IFCu
	 VVMmUsRIGLytA==
Message-ID: <d7633118-f091-487d-993e-38a03f9be58c@kernel.org>
Date: Thu, 26 Nov 2026 11:16:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] powerpc/execmem: Allocate kprobes insn pages from
 the modules area on book3s/32 and 8xx
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
References: <cover.1795666663.git.ritesh.list@gmail.com>
 <e8f8d59f9a3c88f45f873c91a2ff94586b68d928.1795666663.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <e8f8d59f9a3c88f45f873c91a2ff94586b68d928.1795666663.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/11/2026 à 05:26, Ritesh Harjani (IBM) a écrit :
> On book3s/32, a kprobe on an instruction that can't be emulated and has
> to be single stepped out of line, crashes the kernel. For e.g. with the
> following cmds...
>      ~> echo 9 > /proc/sys/kernel/printk
>      ~> mount -t debugfs debugfs /sys/kernel/debug
>      ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
>      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
>      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable
>      ~> ls
> 
> ...we can see the following crash:
>      kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
>      BUG: Unable to handle kernel instruction fetch
>      Faulting instruction address: 0xc02b919c
>      Vector: 400 (Instruction Access) at [f19a9d60]

Unrelated to this patch, but shouldn't the above address [f19a9d60] be 
identical to the one in the "kernel tried to execute exec-protected page 
(f101a008)" ?

>          pc: c02b919c: filldir64+0xb8/0x2dc
>          lr: c02b9148: filldir64+0x64/0x2dc
>          sp: f19a9e20
>         msr: 10029032
>        current = 0xc112e900
>          pid   = 102, comm = ls
>      enter ? for help
>      [f19a9e20] c1a8d420 (unreliable)
>      [f19a9e50] c02e4074 dcache_readdir+0x208/0x2a8
>      [f19a9e90] c02b8c5c iterate_dir+0x88/0x1fc
>      [f19a9ec0] c02b96e0 sys_getdents64+0x88/0x198
>      [f19a9f10] c0014400 system_call_exception+0xf8/0x20c
>      [f19a9f30] c00191ac ret_from_syscall+0x0/0x2c
>      ---- Exception: c00 (System Call) at a7596164
>      SP (af802310) is in userspace
> 
> This happens because on book3s/32 the exec permission is per segment
> (256MB), not per page. The page tables have no hardware exec bit, only
> the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
> sets N on all the kernel segments except the ones of the modules area.
> So nothing in the vmalloc area can be executed, even when the page is
> mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
> a software only bit there and the segment's N bit is what the MMU
> enforces.
> 
> 8xx and 603 (which is book3s/32) have one more problem. Their ITLB miss
> handlers walk only the current task's PGD, whose kernel entries are
> copied from swapper_pg_dir in pgd_alloc(). Only kernel text and the
> modules area are sure to be in that copy, the modules area because
> prealloc_execmem_pgtable() creates its page tables at boot. Unlike the
> DTLB path, nothing fixes up a missing entry on an ITLB miss. So an insn
> page in a vmalloc area mapped after the task's PGD was allocated can't
> be executed.
> 
> Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
> allocations"), the kprobes insn pages came from module_alloc(). That
> commit moved them to the whole of the vmalloc space, on the grounds that
> kprobes use a breakpoint and don't need to be near the kernel text.
> That is fine on platforms where the exec permission is per page,
> as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
> It is not on book3s/32 and 8xx, where the modules area is not only close to
> the kernel text but is also the only page-mapped area whose segment is
> left executable. So the insn pages must keep coming from there.
> 
> MODULES_VADDR is only defined on book3s/32 and 8xx, so use the modules
> area for EXECMEM_KPROBES whenever it is defined.
> 
> Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/mm/mem.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 77b63b52d8f2..8a0fdfd028dd 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -391,6 +391,7 @@ struct execmem_info __init *execmem_arch_setup(void)
>   	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>   	unsigned long fallback_start = 0, fallback_end = 0;
> +	unsigned long kprobes_start, kprobes_end;
>   	unsigned long start, end;
> 
>   	/*
> @@ -410,9 +411,15 @@ struct execmem_info __init *execmem_arch_setup(void)
>   	}
> 
>   	end = MODULES_END;
> +
> +	kprobes_start = MODULES_VADDR;
> +	kprobes_end = MODULES_END;
>   #else
>   	start = VMALLOC_START;
>   	end = VMALLOC_END;
> +
> +	kprobes_start = VMALLOC_START;
> +	kprobes_end = VMALLOC_END;
>   #endif
> 
>   	prealloc_execmem_pgtable();
> @@ -428,8 +435,8 @@ struct execmem_info __init *execmem_arch_setup(void)
>   				.fallback_end	= fallback_end,
>   			},
>   			[EXECMEM_KPROBES] = {
> -				.start	= VMALLOC_START,
> -				.end	= VMALLOC_END,
> +				.start	= kprobes_start,
> +				.end	= kprobes_end,
>   				.pgprot	= kprobes_prot,
>   				.alignment = 1,
>   			},
> --
> 2.39.5
> 

