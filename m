Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622837;
	b=G0FgkeVHRPJeSBnoRnD0fxzVLPF7gMZmdELvUQiM1AUtzSCM0ItzFD1izXfI3b+Z8r5n
	 U3p6Ij6FsVPJfytz4CQ/OMLC0h9+U+i5tJLTd4dhfwzRjNSN9omofHraBK03SuSDj7iVO
	 TWUmz3LwIsV2JptuTk+/BBoKsOa5o8S/HmIkLtqISX/wpwHXXXn28R/nzWOWchdMp+8Yi
	 G0jY+WsnIBb7vrJ7szF0Bk1gq2KUpzKyxphF9KwGIa5lm5Nj7majDtAkdgq5gQI87zej+
	 thMdSdzoqrnWD0N2+s0Mv/7U1UDv3+H/fDTH9qCzlhYOeCBh9A57Z1w7o2fJWYQYHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=V+c7efN+kejpOWutWyfpTAMXZ8OZ1LgKeXSCI+Lspfg=;
	b=5S6lcm8uhAhes6Uaf+kJvVGQBYtvNS44M8UbC2vvOGJIHWMabNG9Nu5ZqcRSyDVcMUfX
	 kE7xT76JBkDDWevq9oEYUCPCgr4+YN6AjW3x5kCNk7UM4mI11hiH1XeSIXmQkXgXh6cvP
	 AUxPMdvLtCfUQW2/BoA1LNJOIviQG+nD62Tjf6vjRc3FXRoWxobCGk+UJTvVS5G75QbT9
	 RhgQcT25ESn44rPROyTbB1Y4ij9SkPh0EqMk4HUKXOD7I2oztXcCQxXooUuL8MS3eWhO1
	 +wzMD7gmfTPRVjpNw95buqEcVbJ7wkJfSblva1XSs4KjdPOFQg0TXyjX/39Kn7i2y2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAOzwET8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733C606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3733C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAOzwET8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so7323229eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622834; x=1796227634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+c7efN+kejpOWutWyfpTAMXZ8OZ1LgKeXSCI+Lspfg=;
        b=AAOzwET8SXAhG1gannlnkZMy28aI1pzko/NNx4Jve9pBJZZHOixcq+pAmZSJfO9Krs
         /Tc6+/Bbh91fAVann2YKm+BBZBE0b4tA620ZZIAcAsdrokJ768pGnjn2DH2Ou1Usebrk
         7Eg38EFA54Yz/oQJc9f/fYl+Et6uUxBme5b+LSQ6acoYFw5EnzyeXhrLQ8ZWthBOsji+
         hhZFJp220Yvidy3ZXMkZN93cMRFXxEjzWStmn2tvXnCKRWOT/iOIisP8lYYVV/6gEu/k
         K9b00YKoh2lJuZrKOPb67lxR1fdUAH7hS7KmRn9wJEpMx4hRwDKPZXjXzVOfbpXbEF12
         zfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622834; x=1796227634;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+c7efN+kejpOWutWyfpTAMXZ8OZ1LgKeXSCI+Lspfg=;
        b=hB48Z62Vu/AqDMp5THZq4or9rGH6D3PB7tvcDzAuBPSp2LYP8MvlLUmEHved0eZmyg
         5CKWKd2o2p9iw49/vbbQNSMq2t6cMAxQuc3tafzV/Gdpg4eVzNUeOwbEIgN99xnGo3xo
         DaNfed9RmPq0D7z8sqeeiS3cwAYFaeU2dMrlbziPf4GHkz+leTrY8T6lElQ69eYbrSht
         VeeNkGrUw1/QCyzEm+MOoavY+MN91VKWtYg5fVqFCKIStHcNzW9UsSNGcuEmr+8MbKpP
         xmgLlhnyC7Ih9ewW9/36n+eoKy9Kkmi5qia95KMbp9oukIjt+lEP6Ux8BFD006VZUSHT
         zNkw==
X-Forwarded-Encrypted: i=1; AL+hErGyu4xc1JMUuMKjcVLIlTdla4S+W2rC+gZtWhUEQH63iuGdSbruikBcUaaIU1GPWJrzqfzonFhYf76w8oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z91ArEevlJqOH7dhpZ9nWnLWjgcR5kJdzh4eqU/O7Iaz+V7cW0U
	lwqwvWvlq368pzXhPUxL/Lk0dFAMrsddYhCkWpzclIGOTPxp/I1c7GLc
X-Gm-Gg: AZFdTZcDhToDHIGCgBGiqczd+RxLXEBbt4502ibXMpZ7OUaXAZUjzMRzICLXPtNnEPQ
	7fyN3z0TUQl2wEute94IVF+ofznW6HMZAwTelwrA9vr+8ovQkw3ri/kmT0kF/0h80cUs/glSLRk
	sWgCr6mteQDtF31rM+kxiNQFk+7WePUkFRnFL3Nphndj253sPv/tEPQgibkHtnvEhG2kkMAxDiZ
	mfH53LStjSuJJC/yyqYzx3xpfMzSLl5dNGc/BkgX/i2IZFw3cJwM/ewxpCQB6d+VSuaB8/tWxVq
	2h95YtEH1RA8J6redzTvcYJ5hmSchtzfnLLpEIWx6sNR13z6le+N1ZB+retIYhrsmkfC23pqIE4
	2mY0sp8wMtuPx+9tMRkFUN+S7cwoQQ07Pqxt7pgdxGbwnUOkwPFpqt2AJr5PCW3DHAsBwlNKORp
	aCaW+5FLlnxTJAGNdF9mkxqbrO5L43XT8gfHBzRkJHQ3TpbTyoGJLBm9J/gkhnJLNzewwWNwW7n
	Jpxv/A06GxkYCHySgC4vUuiGWcqAg1LE+pzbbcCEL+DXdSy2iO9yt/erikYRG+7D5aogppL3Fve
	RT1NiIdN5NKKAyeGN2hmqS6h9Hw=
X-Received: by 2002:a05:7022:f109:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b55689fca6mr14160449c88.9.1795622833867;
        Wed, 25 Nov 2026 08:07:13 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm43726453c88.12.2026.11.25.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:07:13 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv2 1/3] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
In-Reply-To: <0a6fbbd8-6339-444d-bcb0-a74980fb77c8@kernel.org>
Date: Wed, 25 Nov 2026 18:35:47 +0530
Message-ID: <mrqxjc2c.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com> <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com> <9a7963a6-0033-45ab-90d5-b1f580a4882c@kernel.org> <v75v752e.ritesh.list@gmail.com> <0a6fbbd8-6339-444d-bcb0-a74980fb77c8@kernel.org>
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
> Thanks for your patience,
>
> Le 17/11/2026 à 18:15, Ritesh Harjani a écrit :
>> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:
>> 
>>> Le 13/11/2026 à 13:31, Ritesh Harjani (IBM) a écrit :
>>>> commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
>>>> CHECK_WX default STRICT_KERNEL_RWX.
>>>>
>>>> Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
>>>> we can see the following warning splat at boot:
>>>>
>>>>       powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
>>>>       WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
>>>>       NIP [c0000000000ac204] note_page+0x4dc/0x4fc
>>>>       LR [c0000000000ac200] note_page+0x4d8/0x4fc
>>>>       Call Trace:
>>>>        note_page+0x4d8/0x4fc (unreliable)
>>>>        ptdump_pte_entry+0x70/0x94
>>>>        walk_pte_range_inner+0x15c/0x260
>>>>        walk_pgd_range+0x6d8/0xd5c
>>>>        walk_page_range_debug+0xa4/0xf0
>>>>        ptdump_walk_pgd+0xec/0x304
>>>>        ptdump_check_wx+0xd8/0x154
>>>>        kernel_init+0x94/0x26c
>>>>        ret_from_kernel_user_thread+0x14/0x1c
>>>>       Checked W+X mappings: FAILED, 1 W+X pages found
>>>>
>>>> This happens because CHECK_WX noted a writeable + executable mapping.
>>>>
>>>> This happens because execmem_arch_setup(), checks for
>>>> struct_modules_rwx_enabled(), while kprobes depenency on modules was
>>>> earlier removed via commit:
>>>>       7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>>>> Since the insn slots are only written with patch_instruction(), which
>>>> does not need this mapping to be writable. This patch fixes it by
>>>> checking for strict_kernel_rwx_enabled() instead.
>>>>
>>>> Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>>>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>>> ---
>>>>    arch/powerpc/mm/mem.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>>>> index b617b69452cd..77b63b52d8f2 100644
>>>> --- a/arch/powerpc/mm/mem.c
>>>> +++ b/arch/powerpc/mm/mem.c
>>>> @@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }
>>>>    
>>>>    struct execmem_info __init *execmem_arch_setup(void)
>>>>    {
>>>> -	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>>> +	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>>>    	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>>>
>>> Looking at this, I'd use PAGE_KERNEL_X instead of PAGE_KERNEL_EXEC.
>>>
>>> Then we could get rid of PAGE_KERNEL_EXEC completely for powerpc.
>>>
>> 
>> I think it's best if we keep the definition of PAGE_KERNEL_EXEC on
>> powerpc as PAGE_KERNEL_X, I think the core expects the arch to define
>> this, if not, then it defaults to PAGE_KERNEL e.g. see this:
>
> Yes, which is consistent with what powerpc does when strict modules rwx 
> is enabled.
>
> And indeed it doesn't matter, because module code does a rw allocation 
> at the begining then convert it to ROX or X later in 
> module_enable_text_rox(). See comment :
>
> /*
>   * Since some arches are moving towards PAGE_KERNEL module allocations 
> instead
>   * of PAGE_KERNEL_EXEC, keep module_enable_x() independent of
>   * CONFIG_STRICT_MODULE_RWX because they are needed regardless of 
> whether we
>   * are strict.
>   */
>
> So really PAGE_KERNEL is what is expected nowadays.
>

Thanks. Yes, I looked at the git history and I agree with you.

>> 
>> include/linux/pgtable.h:
>>    #ifndef PAGE_KERNEL_EXEC
>>    # define PAGE_KERNEL_EXEC PAGE_KERNEL
>>    #endif
>> 
>> Also mm/execmem references PAGE_KERNEL_EXEC in __execmem_init().
>> Although it references only when execmem_arch_setup() is not defined by
>> the arch (which is not true for powerpc).
>> 
>> 
>> However, even though nothing breaks today, but later if there are other
>> users of PAGE_KERNEL_EXEC, then PAGE_KERNEL does not have X (execute) bit
>> enabled, so it might break in future. Plus looking at above, I believe
>> there is no harm in keeping it - since core expects the platform to
>> define it's own definition - due to all the other references it has.
>> 
>> Thoughts?
>
> Yes but PAGE_KERNEL not having X is on purpose, module first allocates 
> non-X mem, sets up everything then converts to X or ROX. I don't think 
> there will be any more users of PAGE_KERNEL_EXEC in the future. It is 
> going in the other direction I think.
>
>> 
>> However, if you still think we should remove it (?) - then I feel let's
>> do that as a separate cleanup patch. Since this keeps the usage of EXEC
>> same between prot and kprobes_prot variables in patch-1, which we also
>> need to backport.
>
> At least we should stop using it in our own arch, it would help with 
> readability. And really I think we shoud drop it completely. But OK to 
> have it as a separate patch not to be back-ported.
>

Right. Agreed Christophe, thanks for sharing the pointers.

After looking at the history of changes in there, I see that since commit:
  4fcc636615b1 ("powerpc/modules: Make module_alloc() Strict Module RWX aware")
module text is allocated with PAGE_KERNEL, when STRICT_MODULE_RWX is
enabled and only made executable later, so there is no longer a reason
for a separate name there.

So, let me add a separate patch in this series, which will drop
PAGE_KERNEL_EXEC definition from powerpc and it's last remaining users
will be converted to it's alias PAGE_KERNEL_X.

> By the way I also see CONFIG_ARCH_HAS_EXECMEM_ROX, maybe we should 
> investigate in using it on powerpc.
>

Yes, while doing this work I came across it too. Surely, will take a
look at it from powerpc perspective.

> Christophe

Thanks for the reviews! Will soon spin up the next revision with all
comments addressed and add this cleanup patch at the end.

-ritesh

