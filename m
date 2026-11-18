Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981111;
	b=49ejuFoh6mLp4Lmg2A/MYoaNKwoS6xp4g7tqO4uWfuJvYJXZDz6oaPItAblhXwT5kNz8
	 vQu69NnIYiXkP07tp2ftEMpHoVkBWmIyHaj0znFPec5q2YFS2V3R6Z0eywTsBLC27vq0b
	 PN0YTyIHBH34HVP1MLq849AkuaDJsuyFrtiQe8f9uknONfT2wcP7Zs9KQLhCSgPOlm5n/
	 bE4A+bh5l9MCLFZ8fl0nTfTzmPcJ7IikrDXfj8xYzkY7gXp9otAKtYDo8npKQVV/4SLfp
	 y/ZkArn07qmZIEbXecsQDGZWbEyXTZ4woSYyk8alibbv8uIVdoKwvPQOwV6vq8D1sVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K1+i37zow9fs4Cjhvsoa4TL0ORjDFPoMRJ9lYrcteHs=;
	b=rxaG1FTY7kLE971JOajbEMsuNpCWXfl0ypYOpxQx9QXAW/BEMzukWesr5m+6AN2Q39bH
	 mqzehtH8w8xfC41VX5UuZcbbgtDVgbt7zEwuTTv6fTV3dw8LyS5/TIptRln/aOtV6QOEN
	 LGZgDvyC/QGbqZ1OLqFonAVJVKkiswl4xv+6AXRJuz3fd1/bbEOfb4j969rI2yh9lDdX8
	 hSXCP6HW31yIoWG7MshKR2GWPT2rA3rdESYfTxmVUjA4Uz5QR6mJhfd2v1N7dvfPcXoBw
	 y3nrSj3k04bm/PJBo3Z+kDoCUTIJLnalHBls+9SrAXvf94QtlU2LXupGcz4/muaE3zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vd/EX1dG";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E07606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E07606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd/EX1dG
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso245851a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981110; x=1795585910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1+i37zow9fs4Cjhvsoa4TL0ORjDFPoMRJ9lYrcteHs=;
        b=Vd/EX1dGfPPzGZIAFvwXwdUGOy6S5WcVDgtb5R/ElF4C5UBqrpTkw9S52UNFkBCRok
         6DDo1HsyC0TbhfSxM7ipXDHTyXb1V2YQ7fcwMo+9VlydNw2z1F3vD4uN4wqbBUxAv+XR
         DqlBkwWXB4KN/QuEftXr3Q5+9MdWCTFwDVNEeak0igtmvcQxqtofSO5RqMgoxVIJujTr
         Tn4hlW7pwJg9jII7HdhlBWuLrrIMriIIk+M3H0DSuOSscb6x4JERMCbIL8bK1bkSxGEp
         1drroGKQJH4qQQiVwGBQ4RVcsF88VwkfQUAanitLHXHYGlkkBxTpMnz8Xs4DxPsRpsMh
         AcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981110; x=1795585910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1+i37zow9fs4Cjhvsoa4TL0ORjDFPoMRJ9lYrcteHs=;
        b=r6y7G/fbbTLTbQBUIuDErKVpOt3lNcE8CnZWa+tabzsu6tQdESgjUSr2MC03YXrjTq
         zi11Q2P9vmiDFDgxsqR9ZWD1CkinacKNOlbidpC0H3o7Bf9l0xJSYPiSaCoyHqCqhigz
         8LDVWsiA2/uGOW0YiD8iiV5rjHjVM9A+OHTi2Hc/0e65inC6GZF8xlz9TLMmfbByGZl+
         0AqhT7i1PRn+YVbvu6tvRqr7h8JWb1tVVlI3A1w5hDvF8NQ9/XXcyS8r7rDCln57oQOa
         ZlE5kXvkxiuaAvMdcfqe+66mfiZ9SLusvWV8/ed72luXn18U8iL6rak93drhwABufPja
         U/xw==
X-Forwarded-Encrypted: i=1; AL+hErHp24yTs8Ti9Khckyo9TufWK53E479o/N8SFmzZo0bxC/4nXHJ4aNm5PPK2qg7Csfg6jD0CE8M2C3iNTF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/42i9J0mnjYXJUqNU0UiU7T8CfOppj1MWjgARjgOQZ5euatW0D
	L5otSOKe1zjpzeeqN7OOBs0JEkjPZ4UzhT2lXfMMFKBVv22nZnUeUNpSihjWGg==
X-Gm-Gg: AZFdTZcgksZyFUBDt7VJu+7GJzjGVsjiaIoopHIGX8LbbBwLlQDu8cOW8+ZqAgAAsxK
	Q510NMSlL2zY7J5Q83g6sy88aAyYDIuKAsGr33Gt+iwVlplZTsl1qHR3xGn/Y76Qi8ufnwdW8xQ
	Ga/neXtbEY+YVeN8QzRORMqwq3qnO61V3+sSuH5mvm4z2+4wlZ8WQl1Pbcz+buaf3vtJAhxWG+c
	7XEyTosMbIsOhWLF7eta8+v9pshbZ1paZtSC/oASy/JFh6QkNAGMmMs6Cae4CxfPYDNd3w5yU8Z
	zQOIz7IbfglieDQ8IzBKqJ3ouvSJ/eISCW/6+BrwLv4owfpgUHcAv7e79KJKDiXOAEL4AgCBzfa
	qUNIjlZjHyHH4+jKciCbLEjBaeU0+LKxKkJNkeDIkUQZJd//nHxP8oO+NgLmePm9u5ktez0g6uZ
	WfFr4LNZwGPSMvGf9ykiibpE7F+KCudRpyLobsGQFgMCf7S73B6piKcGDG985CZvSqX+8HPD5oa
	RzCOIEfz/HY4JPn/SurNwgr8ElTtCLFq9mcGlBpgt6DSTu5tcQr8HGynVl6LeTpQwDWSh7mAL7k
	x7oJoudq9goKB+0he21/aZIpp+cAaKKAF3XbfdeY1gstnvw4kthWGzJn5U9K3oU=
X-Received: by 2002:a17:90b:4b8b:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b3d07e377fmr1556470a91.57.1794981109874;
        Tue, 17 Nov 2026 21:51:49 -0800 (PST)
Received: from ?IPV6:2401:4900:1c44:97d3:280e:619:20ff:54b? ([2401:4900:1c44:97d3:280e:619:20ff:54b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac606d8csm7704241a91.16.2026.11.17.21.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:51:49 -0800 (PST)
Message-ID: <af1d4e40-9d2f-4a7a-bd0c-3661b07a4599@gmail.com>
Date: Wed, 18 Nov 2026 11:21:43 +0530
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
Subject: Re: [PATCH v3 2/4] openrisc: Add KProbes
To: Stafford Horne <shorne@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, naveen@kernel.org,
 davem@davemloft.net, mhiramat@kernel.org, pjw@kernel.org,
 wangruikang@iscas.ac.cn, namcao@linutronix.de, kees@kernel.org,
 linux-openrisc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-3-sahilcdq0@gmail.com> <avAo140Wc1CerVwf@antec>
 <33becbe3-867a-4e54-8471-7f0101af8623@gmail.com> <avkOmdojYYJkeer4@antec>
Content-Language: en-US
From: Sahil <sahilcdq0@gmail.com>
In-Reply-To: <avkOmdojYYJkeer4@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 7:14 AM, Stafford Horne wrote:
> On Fri, Nov 13, 2026 at 10:43:55PM +0530, Sahil wrote:
>> On 11/8/26 1:16 PM, Stafford Horne wrote:
>>> On Tue, Oct 27, 2026 at 01:42:38AM +0530, Sahil Siddiq wrote:
>>>> Add KProbes support for OpenRISC. This work is primarily based
>>>> on similar work done for LoongArch, MIPS and RISC-V.
> 
> [snip]
> 
>>>> +++ b/arch/openrisc/include/asm/kprobes.h
> 
> [snip]
> 
>>>> +#define flush_insn_slot(p)		do { } while (0)
>>>
>>> On openrisc I think we need to implement flush_insn_slot.  As our
>>> copy's only affect data caches instruction caches may end up being
>>> stale.  This is really hard to detect as context switches invalidate
>>> a lot of the instruction cache lines, but not all.
>>>
>>> I fixed this for text patching recently with commit aca063c90245
>>> ("openrisc: Fix jump_label smp syncing")
>>
>> Understood. In the same commit [1], you have also mentioned that
>> invalidating all the cache lines is less expensive than keeping
>> track of which line needs to be invalidated.
>>
>> In case of KProbes, where a KProbe at a specific instruction is
>> armed or disarmed:
>>
>> void arch_arm_kprobe(struct kprobe *p) {
>>      patch_insn_write(p->addr, KPROBE_BP_INSN);
>>      flush_insn_slot(p);
>> }
>>
>> void arch_disarm_kprobe(struct kprobe *p) {
>>      patch_insn_write(p->addr, p->opcode);
>>      flush_insn_slot(p);
>> }
>>
>> Should only that page be invalidated? Or is it ok to invalidate all
>> lines?
> 
> I think you only need to flush the part of the kprobe data structure that has
> code that is updated, for example p->addr.  Since you have all of that
> information tracked for you in the kprobe structures it should be pretty simple.
> That was not the case for text patching.
> 
> Note, I had a look this is needed for init_aggr_kprobe() which copies code from
> one prope to another.
> 
> Note 2, for arch_arm_kprobe/arch_disarm_kprobe we use patch_insn_write which
> internally does a icache invalidation alredy.  So I think the call to
> flush_insn_slot() in arch_disarm_kprobe()/arch_arm_kprobe() is not needed.
> 

Got it, thank you for the clarification.

>>>> +#define kretprobe_blacklist_size	0
>>>> +
>>>> +void arch_remove_kprobe(struct kprobe *p);
>>>> +int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
>>>> +bool kprobe_breakpoint_handler(struct pt_regs *regs);
>>>> +bool kprobe_singlestep_handler(struct pt_regs *regs);
>>>> +#else /* !CONFIG_KPROBES */
>>>> +static inline bool kprobe_breakpoint_handler(struct pt_regs *regs)
>>>> +{
>>>> +	return false;
>>>> +}
>>>> +
>>>> +static inline bool kprobe_singlestep_handler(struct pt_regs *regs)
>>>> +{
>>>> +	return false;
>>>> +}
>>>> +#endif /* CONFIG_KPROBES */
>>>> +#endif /* __ASM_OPENRISC_KPROBES_H */
>>>> diff --git a/arch/openrisc/kernel/Makefile b/arch/openrisc/kernel/Makefile
>>>> index 150779fbf010..2ac824867963 100644
>>>> --- a/arch/openrisc/kernel/Makefile
>>>> +++ b/arch/openrisc/kernel/Makefile
>>>> @@ -14,6 +14,7 @@ obj-$(CONFIG_SMP)		+= smp.o sync-timer.o
>>>>    obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
>>>>    obj-$(CONFIG_MODULES)		+= module.o
>>>>    obj-$(CONFIG_OF)		+= prom.o
>>>> +obj-$(CONFIG_KPROBES)		+= kprobes.o
>>>>    obj-y	+= patching.o
>>>>    clean:
>>>> diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
>>>> index c7e90b09645e..cd28bf1f7a3b 100644
>>>> --- a/arch/openrisc/kernel/entry.S
>>>> +++ b/arch/openrisc/kernel/entry.S
>>>> @@ -15,6 +15,7 @@
>>>>    #include <linux/linkage.h>
>>>>    #include <linux/pgtable.h>
>>>> +#include <asm/asm.h>
>>>>    #include <asm/processor.h>
>>>>    #include <asm/unistd.h>
>>>>    #include <asm/thread_info.h>
>>>> @@ -640,6 +641,7 @@ ENTRY(_sys_call_handler)
>>>>    	/* r30 is the only register we clobber in the fast path */
>>>>    	/* r30 already saved */
>>>>    /*	l.sw    PT_GPR30(r1),r30 */
>>>> +_ASM_NOKPROBE(_sys_call_handler)
>>>
>>> How is this working for these not function symbols?  _ASM_NOKPROBE registers a
>>> sybmol (in this case just a macro address) into the _kprobe_blacklist.  I think
>>> withing kprobe.c it uses these _kprobe_blacklist entries to detect ranges that
>>> cannot be probed.  However, in this case I think you are not able to get range
>>> information.
>>
>> _ASM_NOKPROBE and NOKPROBE_SYMBOL (for functions in C) expand to the
>> same thing functionally. The kernel treats these labels as symbols as
>> well. I verified this using "nm".
>>
>> When a KProbe is registered using an address instead of the symbol_name,
>> "register_kprobe()" [2] at kernel/kprobes.c indirectly calls
>> "within_kprobe_blacklist()" [3] which performs "kprobe_lookup_name()".
>> It then checks if that name is in the blacklist. This blacklist
>> includes the names of the asm functions as well.
>>
>> I wrote this test module [4] to verify that an address in memcpy's range,
>> for example, is also blacklisted.
> 
> Right, I think for C functions this is fine.  But for OpenRISC assembly I think
> we do not provide enough info for this to work correctly.
> 
> For example above _sys_call_handler, is just a label.
> 
> In other architectures they do something like this:
> 
>      SYM_CODE_START(handle_syscall)
> 	    UNWIND_HINT_UNDEFINED
> 	    csrrd           t0, PERCPU_BASE_KS
> ...
> 	    bl              do_syscall
> 
> 	    STACKLEAK_ERASE
> 	    RESTORE_ALL_AND_RET
>      SYM_CODE_END(handle_syscall)
>      _ASM_NOKPROBE(handle_syscall)
> 
> The SYM_CODE_START/SYM_CODE_END macros or similar are not used in OpenRISC, I
> think we need something to define the beginning and end of our asm macros
> in order for this to work.

Sorry, I am still not very clear here. My understanding from the implementation
of kprobe_lookup_name [1] is that the kernel determines which function's/symbol's
range an address belongs to by fetching the symbol that appears before and after
this address in its sequence of symbols (kallsyms_seqs_of_names [2]). Since the
kernel is treating the labels of asm functions also as symbols, it already has
the symbol's offset.

In OpenRISC, some symbols like _sys_call_handler are wrapped in ENTRY() which is
identical to SYM_FUNC_START() [3], while other labels don't have this wrapper.
Labels without the wrapper are being treated as local symbols while those with
ENTRY() are being treated as global symbols.

I agree that none of the non-C functions are suffixed with SYM_*_END() which is
where the symbol's size/range is being set [4]. But I don't think this is required
when the kernel performs a lookup on the address to get the corresponding symbol.
Please let me know what your thoughts are.

> 
> -Stafford
> 
> [snip]
>   
>> Thanks,
>> Sahil
>>
>> [1] https://github.com/torvalds/linux/commit/1be031de802ba486a7605b52eda825f128b026e2
>> [2] https://github.com/torvalds/linux/blob/master/kernel/kprobes.c#L2002
>> [3] https://github.com/torvalds/linux/blob/master/kernel/kprobes.c#L1730
>> [4] https://github.com/valdaarhun/or-dev/blob/main/home/kprobes_blacklist.c
>>

Thanks,
Sahil

[1] https://elixir.bootlin.com/linux/v7.3.1/source/kernel/kallsyms.c#L170-L224
[2] https://elixir.bootlin.com/linux/v7.3.1/source/kernel/kallsyms.c#L160
[3] https://elixir.bootlin.com/linux/v7.3.1/source/include/linux/linkage.h#L122
[4] https://elixir.bootlin.com/linux/v7.3.1/source/include/linux/linkage.h#L165

