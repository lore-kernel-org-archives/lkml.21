Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665940;
	b=PllS4dsJ7gsEU3McpzF3B837nbT/vPbUmYubAdYptqE4AHwv9hLnTuZwDB7q/ssxNR1R
	 O6Tb1gcdeU9svMb8JHP6nfn+0rO3Fm3fP9KyPHKMoaCfWteTeDxzzSo5c8g0OAHxoo1Wr
	 wY3UEBw79o6zKc0BnTXdObvIii0czcSLrv1GFY32YufZ3RTSv9wOuNhsqgmcebYWeVZSC
	 lU9TlsQaD2bJgy4Yg44jmrag+43Xqfy5PPlVHqahqgUjK7Fdt3J1k46fXnrvJlteRzogV
	 yxBfOK4ja6eBod6JXGEXSRBbzUDG5SUaDDDS4Zh2LHLAbHED9c3mONp0d5Yq4eqWz7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=tmTgOf0vdOyBS8Bx1fFfxvDmlxtGeAtHUM/fN8kwt08=;
	b=pl18AhMc8nP/ExnM1m6/0O5Eh2EkxkeKxbO63dJ23QOEer/6ceYx3Vo+wcz2sjnL1FcV
	 7G4sOjcBnE5MHUTJIOgS+o7rIE5TOb6LUB+zzb0QezmUEeEoFSugZnKj1l1OaCOQm2yeR
	 kUOYQ+uqIv371xlqDorjs/mQQCGY89S+l7oQJco7kRUVHYo7l9D57idZC/rjXjugzqWMO
	 RMFpUK+FCv1qQJThzexcfZl3XAp0E9l6A2VMbQnDVTtRhK4Gj/KFidEw9Aw/eUQ5aoEOp
	 g5cMNWHU6Y9UizV4Jpz8Kh+Maj2qHv0gSicLvGgHvWpX1y2CiqCd8nkEXu3Z++Xu0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uizGunrc;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAC9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAAC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uizGunrc
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so15047935c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665939; x=1796270739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmTgOf0vdOyBS8Bx1fFfxvDmlxtGeAtHUM/fN8kwt08=;
        b=uizGunrctfKEBEI3z66Xytj8npRwCy9yL95LZp6JI19S3i/4LzNNznpCxbGt5fuidK
         cW++nsdZXZgHpbOfzwITVB4BnXJbO+ODUY6ameod3WeUlZ0deVZQjtLTzxnuFlzC9G0y
         h1g6Q3Bny9An+D78aGQ2bcXJU+cmphctg2fuf3AKsqcpmyZIkQFJbW2fLgNjWwF1Kjom
         jxh0s8/+lHPcwmlSggv6hB5XBYCeeY+e2oUlZRZ76TKAi6AsG7F1WHqYj5EWIoW8+7fL
         3RcEm+OXraTa7fy6p1kniRWsZL6sXMv6NgkjyVx94UpApTdx4D/DNw19245on/3LzeSx
         i/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665939; x=1796270739;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmTgOf0vdOyBS8Bx1fFfxvDmlxtGeAtHUM/fN8kwt08=;
        b=rlCemQeT+bTGzqMjdCJ+9VE9jZkkKYfgHkBU4tBDTBoGfYJ5UVdI2QQILjf4K/17BJ
         z+PK/Ei73hfFsX3f6BCDU/OWNzpJAB2AX8gY4AYWUmOJV2zMphTs7o9HZsK5ti0EZFsI
         qsCuXi4W4UIlHf2ReoRlhPRiXiF+Uq5sg3iksWOjJ1Hn6irKCWwEyZwlzCmsCFR1Wp7v
         rC5tYhyK30OqqsN3nF2kyrVIoaG308iV9crQ0T467E6sJALE6s0nzynqrOaotP191SXB
         fNt3LCZku8V2Es7NKRgijR3BoBILukXEYPavJUC1a/1wJ42SLarLAhsaleX/nfwEtqsJ
         qFIQ==
X-Forwarded-Encrypted: i=1; AL+hErH1briQkNai6e2YFJSuRwM/HsGFSnrFvJTeDJO+sy0PtRwn2N7oMWy681jjRMc/S46rY786CL9iEo2cO7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P7I7jx0yFS8yeX9vckjb6AfFEY2SpkZrqPCuvo0WfT4jcuUw7
	g+icXZ+1Y7z9TQO+LCYw1k9WVDz41LEHW7hcstcBm3lZoQMmMyRB9qPb
X-Gm-Gg: AZFdTZcsR8Hcdd6M+5pgKMbHIMO6u4+9i2z/Ghn85jIRSKYz82az9+7dWK4CY7ooU8i
	gu8eG+jXJYtrXyuGzgVKqska48Sr9mYS/eXEz+cx8xx8A8NvlVBtYBk5vRnP907S8tbX57LHA/3
	0MogBMFl9lewXafBeUV/7qCPovuXK0bhe5nmNKU75fngUs8NgAyQWXo14E8qwZyGv3a/VDgoUM5
	nIldLsCb97u3kDTc9Xvnfp0rpD2Fo+Eg40AiXUCAdQMZpcy9SA+kvVFU5MzNtv/JsKya+okoDCb
	DcE357idB4f/bw488NSs4P/n1le9FKj9dY5BBWLYDiFRppcz2zr4dbChwLF2vArakzCsVELQHVB
	fYthfjIksh0tK4+nQ5vLOlF2OGQHC5wc/cGA9V9gLqJvACtUABNdW4i0MKGV5w5kQFWpeM9xGC7
	aJ+uThob2Gc4ozOkQAj3+kQxJ/acvjvz5ms8yaorG3RAt3GNRC2FbWLqSwmFOxjT/x3IdCgHUWs
	JlWFktii1hhaczZII434vxvhMxxfTm6Vhcaqt0n4E6LeqdPRxHpP4o6U8dAqV3Z3Vjyd6TLwY9m
	PAPGLErdrykcNJW919Uo7NC5P+c=
X-Received: by 2002:a05:701b:204a:10b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b5568c0e83mr22286570c88.19.1795665938757;
        Wed, 25 Nov 2026 20:05:38 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm45343201eec.1.2026.11.25.20.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:05:38 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCHv3 2/4] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
In-Reply-To: <92b40ffa-c9bd-4d1c-b60b-f27e89102f9d@kernel.org>
Date: Thu, 26 Nov 2026 08:53:37 +0530
Message-ID: <ld6gjmx2.ritesh.list@gmail.com>
References: <cover.1795625038.git.ritesh.list@gmail.com> <128398ae7491112604572d94778c938bf1e306c3.1795625038.git.ritesh.list@gmail.com> <92b40ffa-c9bd-4d1c-b60b-f27e89102f9d@kernel.org>
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

> Hi Ritesh,
>
> There is a problem with the subject of most of your patches: the space 
> between "PATCH" and "v3" is missing, therefore patchwork doesn't fully 
> understand and it doesn't remove the PATCH word as it does when the 
> space is there. I have not checked whether b4 understands it.
>

Thanks so much for pointing that out. Ealier I used to have a space
between PATCH and vxx, however once a kernel release manager of a
different area, told me that their script is missing my changes, though
he fixed his internal script - but later I decided maybe to remove that
space.

Looking at this a bit more closer, I agree, I should keep that space.
Seems like Sashiko is also unhappy when we don't have that. Looks like
w/o a space, it doesn't mark it as a series and rather consider the
series as individual patches.

> Le 25/11/2026 à 17:52, Ritesh Harjani (IBM) a écrit :
>> On book3s/32, a kprobe on an instruction that can't be emulated and has
>> to be single stepped out of line, crashes the kernel. For e.g. with the
>> following cmds...
>>      ~> echo 9 > /proc/sys/kernel/printk
>>      ~> mount -t debugfs debugfs /sys/kernel/debug
>>      ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
>>      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
>>      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable
>> 
>> ...we can see the following crash:
>>      kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
>>      BUG: Unable to handle kernel instruction fetch
>>      Faulting instruction address: 0xc02b919c
>>      Vector: 400 (Instruction Access) at [f19a9d60]
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
>> Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
>> allocations"), the kprobes insn pages came from module_alloc(). That
>> commit moved them to the whole of the vmalloc space, on the grounds
>> that kprobes use a breakpoint and don't need to be near the kernel
>> text. That is fine on platforms where the exec permission is per page,
>> as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
>> It is not on book3s/32, where the modules area is not only close to
>> the kernel text but is also the only page-mapped area whose segment is
>> left executable. So the insn pages must keep coming from there.
>> 
>> Hence, use the modules area for EXECMEM_KPROBES on book3s/32.
>
> The patch is now correct as it now if #ifdef MODULES_VADDR block, but 
> the description is incomplete.
>
> The description misses the 8xx for the reason explained here: 
> https://lore.kernel.org/all/f7834f3e-6c43-4b58-806d-fe4c07a93457@kernel.org/
>
> And that reason also applies to book3s/32, as reminded here by yourself: 
> https://lore.kernel.org/all/zev77i3i.ritesh.list@gmail.com/
>

I remember updating the commit msg somewhere, however seems like I might
have overwrote it and lost that change.

let me fix that up in v4 like this -


This happens because on book3s/32 the exec permission is per segment
(256MB), not per page. The page tables have no hardware exec bit, only
the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
sets N on all the kernel segments except the ones of the modules area.
So nothing in the vmalloc area can be executed, even when the page is
mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
a software only bit there and the segment's N bit is what the MMU
enforces.

8xx and 603 (which is book3s/32) have one more problem. Their iTLB miss
handlers walk only the current task's PGD, whose kernel entries are
copied from swapper_pg_dir in pgd_alloc(). Only kernel text and the
modules area are sure to be in that copy, the modules area because
prealloc_execmem_pgtable() creates its page tables at boot. Unlike the
dTLB path, nothing fixes up a missing entry on an iTLB miss. So an insn
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


-ritesh




