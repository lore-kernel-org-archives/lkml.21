Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851593;
	b=v3NdY/aIlsrYnurUioB1RaCPaoji3IMXMlAplhSFsC3mExBJtFuPfB3HPY+Mj762kRFX
	 Mvk8e3D1Lc0X4mguBeFLMy8ZV/wPWpcAM87xKgPhZPdGct5Ef0aOvDbvH/Qp8PW1kMV+L
	 YDtZvYhnufQdHL4L8gfVIZFmyD95z6mrbEWkBWtuk+U7RDkqV7WayqT2ZgbA7mtrcmSsG
	 gZKHHqv/SGtFNj/oKVPRB5UIsOnCL+6QxIG/xJH08JYx6YT1yG6bYbjRNa438yW7LgomR
	 N7yIxF2zkqjJRVn+nW841aIbV130NW/MfBeRfabO0KqbFQ0NLklN0lD2y1sHJN2c9qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k9y3bMursUy3wpJn2rgu9TuWODUOLA/aZV1VAd6X7oQ=;
	b=1oq7MWf0dcypSPeMhHesy6V4squGQkzgxdddYFsyMPVxflZ5IZ4CZSdtIcvMGQoyff2H
	 j8TMeSAEdzjU9L3wchlsvL0TmqTbOCe48j4fOYe7UxVWNxXwklZ9uCVYh5zsYDtKc8bNF
	 7wXnPguQaqLscfAkMpbNX3frS6ckLgzInxYoXRuKbwxWfnpqIqHRI8hlG3yk2Xm75rv6F
	 O08zq3L6qhbSgDXXIp5iJZn4qD8j0otq0YcMeSe1tZtxALMQuyFySHGzwFxZNoAFVKeQO
	 apDlxe+r6cYkHnsFpIm6HdU6wW5jG2armqJrCZPt3po9NmzRTAHqx9VRojzGknpc5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLZWOO6B;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD5606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CD5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLZWOO6B
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so31836445e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795851590; x=1796456390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k9y3bMursUy3wpJn2rgu9TuWODUOLA/aZV1VAd6X7oQ=;
        b=PLZWOO6BB/irMU2VX1CU+Rts0OMgXwGkEpk+crIqnwDZeR/GsqpNZxtuPQesed9P4X
         AAPtbbkGkf/eNiljKJmC3dSbH4NmHhdOdehCgM0yIB1AJK0dWixx3xOvAwhOC15O/dDI
         6KwFPldv7Ofi9yvT2R0vavnS/LRVaijRdTMjQon5E49KDat6KHyDbLv1SfjT52/Uzfva
         p4NNKBgEm4C5Suv6WynDjPPNPe4rRmHD3SsrA8I6wGDRnX7eVha+MBFjmewXkuFvyFQq
         ZanIowFRxK+1s9rzdoUWokhMQqXfwckVz2uzUcOr4ODEIqk9yRBrsYAM46ToNvllscHN
         e91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851590; x=1796456390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9y3bMursUy3wpJn2rgu9TuWODUOLA/aZV1VAd6X7oQ=;
        b=snjJRPWiw01MXCjFgdAqWw2JzUxo1xmV1wC29bPxHpLzuiJOwO4z60/B45Kw9uJ900
         5PQJW4NjaQ84pme6SwHmtf5ZO3uKdZ338NRbE7XK2HULMbMtOrmMD6tQG9DoFYycsHTi
         j7lIfyIoRZJDZQRHg2vlyWxldWvZp1rKPXFQ+XdRIWsV+c09dZnDikCEZ4Nus1PQG60J
         sqNH+2kz7J8XPZS8BGj4uUMAmTlFqXnLm01+S7A8AOnxLj3YdXOld6O7fkXMrO8+TM5K
         qUz5LZFS6xFrJaPHOvVbUBpwJjRuRLsWtSnlFvwMIhpnzycGSpX6CxVaXly3jkuMmBTn
         sajw==
X-Forwarded-Encrypted: i=1; AL+hErG8Xqzs3njJ6EW422mgB0IBoRhxOENpMw0zTPBAT+p6GPfw7HB03LmZ8rKj8IkdXPDlQxIApbf13FBsHOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bkF+gQmBrwcK8SWLMKxh6uQ1NiY8LGAqRvnnTTWpkB2FLu58r
	eHEnZ0SZdkY7HuUEu9woHL2g+i9j0k7ymukhmziJjO1Rkff0p8b+OG/C
X-Gm-Gg: AZFdTZdWQiFYEQeYa02RZjDL3rNy73kOxNZvHDUqO7cPxNePqD/KSNRar2vDMLHH0id
	S8ork2xar7EGCf2eCknZ68fyAKsRb1w9Fu9LztX6mHlOWilnr3WCQb+HalQ+XxqzJV8KMzYzJ+k
	rgzpCOMUK0prUeZMrnx4hj9ffH6VFepCepqArzgLFbgzMaoi3W50uEdmhFS73jK9AsFXthxVlXd
	Ge7clY3ctoAUdYtj25DGE9Asbd+ZgJvUG7NY0Yz8vmA7wXMB+ZuMHrU4qROmnHHGEcRIXdY/RqU
	WwqtUWoIvX+EbxZ+APT+s6BjJuLgzYkKGJQG24BGSqe59sPxDMR2WOxdVRsfhenqDD0C1/P5eiZ
	8WQg+PUwZ/pA16Z2qEY4pT4v4gPqjgRg7tV4lBXbDvkrfxJ5qZwC7Jwl3LLMTuluR98utmlooZS
	K/pFdxw4IMJtYCviEnJhm6Ivy2ApP+AV6x4PF1aLBVSytBl5aVF0vhgmCmf1x8Ftn32ZqY82Fdo
	v6h4r1t4xdjLhfqvZWJAqAM97F+SBLN1v1OpfNlZJsEnBVSlWMlpOT2sueINsONaWqojSAETksS
	r17Er9EuBanqRS6NaVHeV9B9VETldIpbMPJgmjTO3BCuD3Jxeiw9wJ8GR8ne8sxzkNx79cMNI5e
	2Riu2wDi+tkBBCcECt5kAkChAybez
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr555018665e9.32.1795851590084;
        Fri, 27 Nov 2026 23:39:50 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm647603755e9.2.2026.11.27.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:39:49 -0800 (PST)
Date: Sat, 28 Nov 2026 07:39:48 +0000
From: Stafford Horne <shorne@gmail.com>
To: Sahil <sahilcdq0@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org,
	pjw@kernel.org, wangruikang@iscas.ac.cn, namcao@linutronix.de,
	kees@kernel.org, linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] openrisc: Add KProbes
Message-ID: <awqFRDdsH3S47XgT@antec>
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-3-sahilcdq0@gmail.com>
 <avAo140Wc1CerVwf@antec>
 <33becbe3-867a-4e54-8471-7f0101af8623@gmail.com>
 <avkOmdojYYJkeer4@antec>
 <af1d4e40-9d2f-4a7a-bd0c-3661b07a4599@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af1d4e40-9d2f-4a7a-bd0c-3661b07a4599@gmail.com>

On Wed, Nov 18, 2026 at 11:21:43AM +0530, Sahil wrote:
> On 11/15/26 7:14 AM, Stafford Horne wrote:
> > On Fri, Nov 13, 2026 at 10:43:55PM +0530, Sahil wrote:
> > > On 11/8/26 1:16 PM, Stafford Horne wrote:
> > > > On Tue, Oct 27, 2026 at 01:42:38AM +0530, Sahil Siddiq wrote:
> > > > > Add KProbes support for OpenRISC. This work is primarily based
> > > > > on similar work done for LoongArch, MIPS and RISC-V.
> > 
> > [snip]
> > 
> > > > > +++ b/arch/openrisc/include/asm/kprobes.h
> > 
> > [snip]
> > 
> > > > > +#define flush_insn_slot(p)		do { } while (0)
> > > > 
> > > > On openrisc I think we need to implement flush_insn_slot.  As our
> > > > copy's only affect data caches instruction caches may end up being
> > > > stale.  This is really hard to detect as context switches invalidate
> > > > a lot of the instruction cache lines, but not all.
> > > > 
> > > > I fixed this for text patching recently with commit aca063c90245
> > > > ("openrisc: Fix jump_label smp syncing")
> > > 
> > > Understood. In the same commit [1], you have also mentioned that
> > > invalidating all the cache lines is less expensive than keeping
> > > track of which line needs to be invalidated.
> > > 
> > > In case of KProbes, where a KProbe at a specific instruction is
> > > armed or disarmed:
> > > 
> > > void arch_arm_kprobe(struct kprobe *p) {
> > >      patch_insn_write(p->addr, KPROBE_BP_INSN);
> > >      flush_insn_slot(p);
> > > }
> > > 
> > > void arch_disarm_kprobe(struct kprobe *p) {
> > >      patch_insn_write(p->addr, p->opcode);
> > >      flush_insn_slot(p);
> > > }
> > > 
> > > Should only that page be invalidated? Or is it ok to invalidate all
> > > lines?
> > 
> > I think you only need to flush the part of the kprobe data structure that has
> > code that is updated, for example p->addr.  Since you have all of that
> > information tracked for you in the kprobe structures it should be pretty simple.
> > That was not the case for text patching.
> > 
> > Note, I had a look this is needed for init_aggr_kprobe() which copies code from
> > one prope to another.
> > 
> > Note 2, for arch_arm_kprobe/arch_disarm_kprobe we use patch_insn_write which
> > internally does a icache invalidation alredy.  So I think the call to
> > flush_insn_slot() in arch_disarm_kprobe()/arch_arm_kprobe() is not needed.
> > 
> 
> Got it, thank you for the clarification.
> 
> > > > > +#define kretprobe_blacklist_size	0
> > > > > +
> > > > > +void arch_remove_kprobe(struct kprobe *p);
> > > > > +int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> > > > > +bool kprobe_breakpoint_handler(struct pt_regs *regs);
> > > > > +bool kprobe_singlestep_handler(struct pt_regs *regs);
> > > > > +#else /* !CONFIG_KPROBES */
> > > > > +static inline bool kprobe_breakpoint_handler(struct pt_regs *regs)
> > > > > +{
> > > > > +	return false;
> > > > > +}
> > > > > +
> > > > > +static inline bool kprobe_singlestep_handler(struct pt_regs *regs)
> > > > > +{
> > > > > +	return false;
> > > > > +}
> > > > > +#endif /* CONFIG_KPROBES */
> > > > > +#endif /* __ASM_OPENRISC_KPROBES_H */
> > > > > diff --git a/arch/openrisc/kernel/Makefile b/arch/openrisc/kernel/Makefile
> > > > > index 150779fbf010..2ac824867963 100644
> > > > > --- a/arch/openrisc/kernel/Makefile
> > > > > +++ b/arch/openrisc/kernel/Makefile
> > > > > @@ -14,6 +14,7 @@ obj-$(CONFIG_SMP)		+= smp.o sync-timer.o
> > > > >    obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
> > > > >    obj-$(CONFIG_MODULES)		+= module.o
> > > > >    obj-$(CONFIG_OF)		+= prom.o
> > > > > +obj-$(CONFIG_KPROBES)		+= kprobes.o
> > > > >    obj-y	+= patching.o
> > > > >    clean:
> > > > > diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
> > > > > index c7e90b09645e..cd28bf1f7a3b 100644
> > > > > --- a/arch/openrisc/kernel/entry.S
> > > > > +++ b/arch/openrisc/kernel/entry.S
> > > > > @@ -15,6 +15,7 @@
> > > > >    #include <linux/linkage.h>
> > > > >    #include <linux/pgtable.h>
> > > > > +#include <asm/asm.h>
> > > > >    #include <asm/processor.h>
> > > > >    #include <asm/unistd.h>
> > > > >    #include <asm/thread_info.h>
> > > > > @@ -640,6 +641,7 @@ ENTRY(_sys_call_handler)
> > > > >    	/* r30 is the only register we clobber in the fast path */
> > > > >    	/* r30 already saved */
> > > > >    /*	l.sw    PT_GPR30(r1),r30 */
> > > > > +_ASM_NOKPROBE(_sys_call_handler)
> > > > 
> > > > How is this working for these not function symbols?  _ASM_NOKPROBE registers a
> > > > sybmol (in this case just a macro address) into the _kprobe_blacklist.  I think
> > > > withing kprobe.c it uses these _kprobe_blacklist entries to detect ranges that
> > > > cannot be probed.  However, in this case I think you are not able to get range
> > > > information.
> > > 
> > > _ASM_NOKPROBE and NOKPROBE_SYMBOL (for functions in C) expand to the
> > > same thing functionally. The kernel treats these labels as symbols as
> > > well. I verified this using "nm".
> > > 
> > > When a KProbe is registered using an address instead of the symbol_name,
> > > "register_kprobe()" [2] at kernel/kprobes.c indirectly calls
> > > "within_kprobe_blacklist()" [3] which performs "kprobe_lookup_name()".
> > > It then checks if that name is in the blacklist. This blacklist
> > > includes the names of the asm functions as well.
> > > 
> > > I wrote this test module [4] to verify that an address in memcpy's range,
> > > for example, is also blacklisted.
> > 
> > Right, I think for C functions this is fine.  But for OpenRISC assembly I think
> > we do not provide enough info for this to work correctly.
> > 
> > For example above _sys_call_handler, is just a label.
> > 
> > In other architectures they do something like this:
> > 
> >      SYM_CODE_START(handle_syscall)
> > 	    UNWIND_HINT_UNDEFINED
> > 	    csrrd           t0, PERCPU_BASE_KS
> > ...
> > 	    bl              do_syscall
> > 
> > 	    STACKLEAK_ERASE
> > 	    RESTORE_ALL_AND_RET
> >      SYM_CODE_END(handle_syscall)
> >      _ASM_NOKPROBE(handle_syscall)
> > 
> > The SYM_CODE_START/SYM_CODE_END macros or similar are not used in OpenRISC, I
> > think we need something to define the beginning and end of our asm macros
> > in order for this to work.
> 
> Sorry, I am still not very clear here. My understanding from the implementation
> of kprobe_lookup_name [1] is that the kernel determines which function's/symbol's
> range an address belongs to by fetching the symbol that appears before and after
> this address in its sequence of symbols (kallsyms_seqs_of_names [2]). Since the
> kernel is treating the labels of asm functions also as symbols, it already has
> the symbol's offset.
>
> In OpenRISC, some symbols like _sys_call_handler are wrapped in ENTRY() which is
> identical to SYM_FUNC_START() [3], while other labels don't have this wrapper.
> Labels without the wrapper are being treated as local symbols while those with
> ENTRY() are being treated as global symbols.
> 
> I agree that none of the non-C functions are suffixed with SYM_*_END() which is
> where the symbol's size/range is being set [4]. But I don't think this is required
> when the kernel performs a lookup on the address to get the corresponding symbol.
> Please let me know what your thoughts are.

Right, I am talking about within_kprobe_blacklist [1].  This is used when
checking if an address is OK to add a kprobe.  I think this is the main reason
for adding _ASM_NOKPROBE.

This uses a list kprobe_blacklist which is initialized in init_kprobes [2] >
populate_kprobe_blacklist [3] > kprobe_add_ksym_blacklist [4].  It starts like
this:

	err = populate_kprobe_blacklist(__start_kprobe_blacklist,
					__stop_kprobe_blacklist);

If symbols are not registered with a size attribute the registration will not
work correctly.  Blacklist checking will not work.

If we look at our kernel binary we can see that memset, _syscall_call, etc
are registed in this blacklist.  However, _syscall_call and memset have a size
of 0. Registering it with kprobe_add_ksym_blacklist will likely not work.

This is why we need SYM_CODE_START/SYM_CODE_END or something similar.

    $ readelf -sW vmlinux | grep kprobe_blacklist
      1912: c0c16dd8     8 OBJECT  LOCAL  DEFAULT    8 kprobe_blacklist
     43341: c0132154    88 FUNC    WEAK   DEFAULT    1 arch_within_kprobe_blacklist
     43752: c0cdf6f0     0 NOTYPE  GLOBAL DEFAULT   11 __stop_kprobe_blacklist
     48130: c01321ac   400 FUNC    GLOBAL DEFAULT    1 within_kprobe_blacklist
     55159: c0cdf5f0     0 NOTYPE  GLOBAL DEFAULT   11 __start_kprobe_blacklist
     56666: c0cb00a0    36 FUNC    WEAK   DEFAULT   10 arch_populate_kprobe_blacklist

    ## Dump the list contents of __start_kprobe_blacklist
    $ readelf -x .init.data vmlinux | grep -A5 c0cdf5 | tail
      0xc0cdf5b4 c0cdadd0 c0cdaddc c0cdade8 c0cdadf4 ................
      0xc0cdf5c4 c0cdae00 c0cdae0c c0cdae18 c0cdae24 ...............$
      0xc0cdf5d4 c0cdae30 c0cdae3c c0cdae48 c0cdae54 ...0...<...H...T
      0xc0cdf5e4 c0cdae60 c0cdae6c 00000000 c0014ac0 ...`...l......J. <-- start
      0xc0cdf5f4 c0014b70 c0017000 c0017180 c0017f7c ..Kp..p...q....|
      0xc0cdf604 c0a38668 c0a3869c c0a386bc c0a386c8 ...h............
      0xc0cdf614 c0a386e4 c0a386e8 c0a386f4 c0a38744 ...............D
      0xc0cdf624 c0a3879c c0a387c4 c0a387d4 c0a38868 ...............h
      0xc0cdf634 c0a3932c c0a3932c c0a39348 c001b130 ...,...,...H...0
      0xc0cdf644 c001ac5c c001afb0 c001aeac c001ad00 ...\............

    ## Check a few symbols
    $ readelf -sW vmlinux | grep c0a386c8
     10568: c0a386c8     0 NOTYPE  LOCAL  DEFAULT    1 _syscall_call
    $ readelf -sW vmlinux | grep c0014ac0
     52728: c0014ac0     0 FUNC    GLOBAL DEFAULT    1 memset
    $ readelf -sW vmlinux | grep c0017000
     39750: c0017000   384 FUNC    GLOBAL DEFAULT    1 simulate_branch

-Stafford

[1] https://elixir.bootlin.com/linux/v7.3.1/source/kernel/kprobes.c#L1472-L1490
[2] https://elixir.bootlin.com/linux/v7.3.1/source/kernel/kprobes.c#L2770-L2771
[3] https://elixir.bootlin.com/linux/v7.3.1/source/kernel/kprobes.c#L2582-L2609
[4] https://elixir.bootlin.com/linux/v7.3.1/source/kernel/kprobes.c#L2511-L2529


