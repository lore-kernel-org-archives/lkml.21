Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700684;
	b=fm7RQ11dUo8+Ig9rOmCfMx2emoa2TYG5tTYUIC21tdY9cXmPoJCesTmQUC17jDenKAjv
	 3daFc2zutpHDbybWTnRkDMsUKgXqKMPYfYLZhRmFEiqzxeyKZnc/5wsfuQ9dhoOXVo/oj
	 YSSceJCrokETX0r09h8YFl5t493srCUyxq4fRW/AOUFv64l9RkkHYNz1UCtCANVqfCLRq
	 aStzU2pq4pOy8/fj/hRJYjhy70JWkK5aiMsbKhxtlXXI1yzNgi399yJvI1X9zB6MC8gnj
	 QR76FfR2wEc+0XhPT/rXtXrIXrh5i7jqpIAOanPNEaCrXuBaj7QbNR371BRaRjAW1Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=FutE3Dt4WAYQzSyNTGkp0eGUi0NDw5s5dO55H2LHifs=;
	b=ywige2inNs9k+Mv9TOXflcVzj2LAe8Jn+5790W+xu5Ba0ZiKG0oGUvabQyJGwS1fpERf
	 yTFwT52z6kLHwlNR92BpnhuK863uxW/CcwTIcZ20B2vFhUwDJIB5ldY3RlUo1rrsu34KZ
	 EH22V/cBc0FjSheTyHBCEAUuBQQrAfqsJZsC5B6dzd7o5Xr2n3T18tRf0fUse0lxpW6nr
	 bUQraRGYgQuguSWAcuV68kKgETfPXlmEi6nlNi3aT/AObIKfoXq73WjX7sSWPqBPmeLbw
	 uvCiC74qIIZikrwHYTq6IZcXxM09GXQ5myptb5VaJElKxrfHjB43/9dAAFaPtC9bJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b6E9y2/e";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2CA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6E9y2/e
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b546061d58so16142687c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700683; x=1796305483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FutE3Dt4WAYQzSyNTGkp0eGUi0NDw5s5dO55H2LHifs=;
        b=b6E9y2/euebQQQiN3JvEbHXkCpr5hwWU+Hgt3KmglK6HO5n3DQWE3JTpr99YNQ+bw4
         nD/x+yWMYZiZxK0urtLaxJauEZmY3DAGmv3B5D8OXDAbglU8T/TCV7fL9p25lPF9TZmF
         MuMv0sv04W6FMnyOBK5u3UbA/bjghVwK1FFKowsSGN1fkcMFC5JtqsLQFMkcVwoDYVyJ
         jCH15gjb64MIJBqeXNA06AMxOXRn56duw/CGVjPgJxBiLxm5PLjIw6fLuJ6IIAF7jQBm
         3VuVLtx+2avdw5miWkHYYULPIXV6X8Ca0EMYWgC96freW+CNQqsXwJsyph1C8POCKHYb
         vrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700683; x=1796305483;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FutE3Dt4WAYQzSyNTGkp0eGUi0NDw5s5dO55H2LHifs=;
        b=KVD8bRFf0z073WudKPrZcJMdWcr9cfOzK18XuzDeJNDSm8A+J/9w78cvO+ROqaJnKM
         AXZXWE0+a7pdaeOXk07UPjw2kTBu+GDZRS9HSHZnan7XqeqAvtFpwd/xQuW0GYAqvqnk
         m38PcHConiNwr0hFWVb7iC2bybAwlGf435dBd6SR7QUmwpWra/W2VUkP+mLuuiTvAskU
         cdIN+xY3RI4NhIUi+cNZtcyGePj+qY0FndAJMSK+91+CjO7p5RCuCnMqMxmREz8xe/sb
         i8NkkPAJE0PoQvHida/GnL1bG9llg2Cb53mLZq9+RWHYlhMdWMmRWhVEnttIdG3dj0LL
         JIfw==
X-Forwarded-Encrypted: i=1; AL+hErEq4suqPsOy1wAMsqt8cKp39cujHa6sjGwHfYkcIqqTsjAFBcugHWO3N+9O1bg2634kuy088HsZtfOObb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rvdcVqH7/vtD51cerJnbSab51qSsTi8PS5FSFo4kjTLOTYoXH
	2va/Gswf1PDzT0xmpmf+72IiIbaoiVH7/HoXSZ1fAehDHiSIaZ5mMo7mR9mOMQ==
X-Gm-Gg: AZFdTZf5N9Y363WuC/FariYWYfc+71A3ttmLhHEWgRTOzmzTAVAVPi88ZIcW/S5DKWK
	VKhGJoGiumGU61cN1HHGvHaQ1OboOinrT9OqltWCE8Y/W0S4ETK6Qt2ZoyC4eDiYOSmm730AcEa
	Zv2L+m4yuljTK1UrYo1Od9kyE/Ch1YoF5EYkRECoCimN62q1bR4JvvRvGvqjXmd7cksUJj9RFkZ
	2n/sBCRNyrcw/yCqNvD299wSoAc3s5WDpZF9k2rBP530gZrlHG2Muil2IRBefluDjv/eVotYvM1
	2f7Q7mGtfP2u1kAdkPZ8PPB2efCakZpw8+8anm7Dms8bj2+FZVOZdHDfNnytGqYvYRQh4W7gJKe
	x0NwQRQzXsauAZhxar9PwI0DJRRO+LTi6ovOFhAwCSXaqh3/s5TWwJkj1gCeer5zNbHfWQ6f59X
	G1cVDj55lfZUKslcIwyVTNpQxZ+xTmYZx70jx+G3L0DIIgN0HYR1+twXFIO909u+B0PB1EVR6As
	kckUzD56J5R7XaoaXhasriE+zPWw+x+R8xYXTbE6NGsOCvy/B9ZAWfJNsHplLVIohiqcoE954Dq
	DIpp9cyyCt0maxdwfW9ZdyXLjHcuPls2/MhVYL1iIS91RhYr
X-Received: by 2002:a05:701b:21cd:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b5568bc08amr20788013c88.18.1795700682366;
        Thu, 26 Nov 2026 05:44:42 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm50563787c88.10.2026.11.26.05.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:44:41 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 2/4] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32 and 8xx
In-Reply-To: <d7633118-f091-487d-993e-38a03f9be58c@kernel.org>
Date: Thu, 26 Nov 2026 18:56:46 +0530
Message-ID: <ik1jk9k9.ritesh.list@gmail.com>
References: <cover.1795666663.git.ritesh.list@gmail.com> <e8f8d59f9a3c88f45f873c91a2ff94586b68d928.1795666663.git.ritesh.list@gmail.com> <d7633118-f091-487d-993e-38a03f9be58c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 26/11/2026 à 05:26, Ritesh Harjani (IBM) a écrit :
>> On book3s/32, a kprobe on an instruction that can't be emulated and has
>> to be single stepped out of line, crashes the kernel. For e.g. with the
>> following cmds...
>>      ~> echo 9 > /proc/sys/kernel/printk
>>      ~> mount -t debugfs debugfs /sys/kernel/debug
>>      ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
>>      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
>>      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable
>>      ~> ls
>> 
>> ...we can see the following crash:
>>      kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
>>      BUG: Unable to handle kernel instruction fetch
>>      Faulting instruction address: 0xc02b919c
>>      Vector: 400 (Instruction Access) at [f19a9d60]
>
> Unrelated to this patch, but shouldn't the above address [f19a9d60] be 
> identical to the one in the "kernel tried to execute exec-protected page 
> (f101a008)" ?
>

Actually this log is taken from xmon. So [f19a9d60] is not a fault
address. xmon prints the address of the exception frame (pt_regs) there,
i.e.

arch/powerpc/xmon/xmon.c
static void excprint(struct pt_regs *fp)
{
	unsigned long trap;

#ifdef CONFIG_SMP
	printf("cpu 0x%x: ", smp_processor_id());
#endif /* CONFIG_SMP */

	trap = TRAP(fp);
	printf("Vector: %lx %s at [%px]\n", fp->trap, getvecname(trap), fp);

    ^^^ it comes from this print here 

>>          pc: c02b919c: filldir64+0xb8/0x2dc
>>          lr: c02b9148: filldir64+0x64/0x2dc
>>          sp: f19a9e20
>>         msr: 10029032
>>        current = 0xc112e900
>>          pid   = 102, comm = ls
>>      enter ? for help
>>      [f19a9e20] c1a8d420 (unreliable)
>>      [f19a9e50] c02e4074 dcache_readdir+0x208/0x2a8
>>      [f19a9e90] c02b8c5c iterate_dir+0x88/0x1fc
>>      [f19a9ec0] c02b96e0 sys_getdents64+0x88/0x198
>>      [f19a9f10] c0014400 system_call_exception+0xf8/0x20c
>>      [f19a9f30] c00191ac ret_from_syscall+0x0/0x2c
>>      ---- Exception: c00 (System Call) at a7596164
>>      SP (af802310) is in userspace
>> 
>> This happens because on book3s/32 the exec permission is per segment
>> (256MB), not per page. The page tables have no hardware exec bit, only
>> the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
>> sets N on all the kernel segments except the ones of the modules area.
>> So nothing in the vmalloc area can be executed, even when the page is
>> mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
>> a software only bit there and the segment's N bit is what the MMU
>> enforces.
>> 
>> 8xx and 603 (which is book3s/32) have one more problem. Their ITLB miss
>> handlers walk only the current task's PGD, whose kernel entries are
>> copied from swapper_pg_dir in pgd_alloc(). Only kernel text and the
>> modules area are sure to be in that copy, the modules area because
>> prealloc_execmem_pgtable() creates its page tables at boot. Unlike the
>> DTLB path, nothing fixes up a missing entry on an ITLB miss. So an insn
>> page in a vmalloc area mapped after the task's PGD was allocated can't
>> be executed.
>> 
>> Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
>> allocations"), the kprobes insn pages came from module_alloc(). That
>> commit moved them to the whole of the vmalloc space, on the grounds that
>> kprobes use a breakpoint and don't need to be near the kernel text.
>> That is fine on platforms where the exec permission is per page,
>> as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
>> It is not on book3s/32 and 8xx, where the modules area is not only close to
>> the kernel text but is also the only page-mapped area whose segment is
>> left executable. So the insn pages must keep coming from there.
>> 
>> MODULES_VADDR is only defined on book3s/32 and 8xx, so use the modules
>> area for EXECMEM_KPROBES whenever it is defined.
>> 
>> Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
>> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>

Thanks Christophe for your reviews and suggestions!

-ritesh

