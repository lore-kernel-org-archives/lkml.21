Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440964;
	b=LGRLMpNytcF481QaB3H9RADq8zEcjMFcF8Z3LVmjeIvadT6RR2kP23kgjIpfKeR8E93k
	 ZrkyEBMLI6/9vkkYGDy6zjzyFwV8mSVG2zBUC1mn1u0mz6fzu2c1zPJMw2utuXciRpLiz
	 5QrPFBmt7dIfMNT79IEKuJNZpxka0DB0y7nxedasI3zE5jd62SheXU8DG5JD2tjp9nxOp
	 0HmQ+oxyhdqs7LNx/qjqFTdvqT/+/KPsgh6/UbwT8yFOAZaZ6r+YpWXdiT9VqhjupIk7a
	 7H+lXEPPfxo3UopJp7GJ/+qS12llSP8rcgOX5+oshLz33jA0gjfrJ0//Lv85y2jss3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=VbiiQPdCmN34F2RgnnrrSRWQpzSbde3XUaxkRXW3wms=;
	b=ztBHTAg6QiKYB0jtJqd5GqEedxtVdLf9A85h6n3X67rjqLV4N/A26vh9q1hFp/InRpk/
	 nRt+8kJUERSmUUPtfJ0pSgccab0X0iYPFP/LL2CNA8JxU8acLnaQZtMN6n2jfE+cIWoWl
	 /wFjMMzLnerqbMDWLo1ch2co+Q6lAGEjXXxGLIQYb+PbdpqIAIHz9AHBEtkPVwXIlmJa0
	 ZGn4p6apPaMlOjmjVdf+ZWOf0T2NT7IITeu6dFIiw95Hi9Y+bBhMZBUuMCmoX7k8mw/Tu
	 21+j8sULba/JRnDI9IdaoSGkCyH/06dp2Ui+Pgvz5ZohTEi5kiAe8Ctau6OiidPcryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1xVWSL;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB9606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AB9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1xVWSL
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so1596662b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440963; x=1796045763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbiiQPdCmN34F2RgnnrrSRWQpzSbde3XUaxkRXW3wms=;
        b=pz1xVWSLaNiAHw9NmTweCnkkNa3fo0CToxQAAxVtxpgf2vmpmM2c6/vPCQxquar/Vp
         /3KK4+keJQey2E6ZIwe6+iD2dLckhrHmtD+V+YurZs40lV6m+6cT9IPTFvFWuy1SP1IC
         zEm2qblCpq2t79kLnrGRKAcHJY7U3nk/YTi7MoNJHroRYDeYRtz2XwDqJ/ZYaqPgrrq8
         nHlOFh4NMpSkP6dH6nAj4TG1LGSQ1ZLbLUEWjN/K8C3Fe1yc3tyleIE02y3dYnxCxHIu
         HySXw+nn7htIvZALZThKWqFHvHzDeSWyHACdYjzYVQRVy1hNVudXE+7cmZLSu9fxxB0B
         3z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440963; x=1796045763;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbiiQPdCmN34F2RgnnrrSRWQpzSbde3XUaxkRXW3wms=;
        b=hLDcRwV7ret2vJgBtEQDn3euTRdHzeggah10PjpMdu3qJVHc9qZrr49Hnb+8ChWrjT
         /3z+W1GGvhHvg767JV0BrMENwT+XQ2JVxh8e2cIhUHjkXdW6qpKxT7bDlm6cG5Hp84Kn
         ZqD0NTMSG5cXHxK4LHVeKcwk3245koBolKqny7Jp4NTzuTWAexNjWTyBQlM7auEql+8a
         p6+FlsE+1NkXwyo/GY7OLtHTcblCa6fEWDfjag4zGZBonJCTuFjrJxJTrnc5b2krNCta
         ZAI13ySSz+qmWVl4z7u5r+v2LnHAm1FJasqiverT/MYM37vwYBTy2j04CzUW/d8bdAXN
         9+GA==
X-Forwarded-Encrypted: i=1; AL+hErHHXTzKro2cdD8NNOsDQ9/qyj1H+z4PPlCNpg7oiLPh+XzBYFXmfOxadeLI0RQ6qIpkYGuZFyuI3INmCdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qAP/v1j5qZNdVyVygptKMhjTMPtoiFcBR0uDY9XzsuXHyyWxp
	l3Ox9gtW2drPljenCT1wn8m8IuBZnXdGUL7sCEX6f02kjKW3dDzkyoc6
X-Gm-Gg: AZFdTZfg03Nmsko9ERyu88oYQBiOtMOOv68VqGOLKMIx3iN9m950KCi+kWu8mHJuTJc
	MPFmPnk11ky5V4loqf033bf7NSe/3H8MZYP0fZVIaiz0Wm0N8KWsXS4yLRDa5sEL2pLIBIR770s
	s4leia4SUokydALjmf0FURhL+ATpVKuIbhto3l41kG4rJ80xWLu16lLt5RFayqe7aWu2RbacLlF
	kI6UL6xBEnvveIXgbnEspYHzO7VMlV39Ocnkyg+0L4W9Sc3jWZvSwbXqFdjJG1qBM+NLKRfILXx
	yQ+WDQl71NvqS+ZYanm6n153c+l9fpm1DiUdXMDOHtlY+c0OiAXmbYyNx+Oir9fQackTH20hk5X
	zILd8JL2/htshis2gQ0m/ikkxAInrxbAgchX+S6L7p50egOoirP9eRjSLF+L0mv9JCBbAk/1Ni7
	be6y6OgYDntQPkWoIe+u0L7kdTGOqKVSjgI8a7WJgJa+RSUA7gwdiKRYOvE0ojruf6IdYbIztBo
	SirJMG+qf1x1zv5xmEoT0nOwPOCf2GN8JG7YEHJnjwobm8G0SmA/L6JfZfs4Fv647ab/0AtskBA
	Rdng6KFpeuvsfgHBTKvgMmIu4/Zj
X-Received: by 2002:a05:6a00:4094:b0:8a0:70d8:a2ee with SMTP id d2e1a72fcca58-8c87ded6498mr9540643b3a.60.1795440962556;
        Mon, 23 Nov 2026 05:36:02 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm5570564b3a.11.2026.11.23.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:01 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv2 1/3] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
In-Reply-To: <v75v752e.ritesh.list@gmail.com>
Date: Mon, 23 Nov 2026 19:03:55 +0530
Message-ID: <se0rk6yk.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com> <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com> <9a7963a6-0033-45ab-90d5-b1f580a4882c@kernel.org> <v75v752e.ritesh.list@gmail.com>
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


Hi Christophe,

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:
>
>> Le 13/11/2026 à 13:31, Ritesh Harjani (IBM) a écrit :
>>> commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
>>> CHECK_WX default STRICT_KERNEL_RWX.
>>> 
>>> Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
>>> we can see the following warning splat at boot:
>>> 
>>>      powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
>>>      WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
>>>      NIP [c0000000000ac204] note_page+0x4dc/0x4fc
>>>      LR [c0000000000ac200] note_page+0x4d8/0x4fc
>>>      Call Trace:
>>>       note_page+0x4d8/0x4fc (unreliable)
>>>       ptdump_pte_entry+0x70/0x94
>>>       walk_pte_range_inner+0x15c/0x260
>>>       walk_pgd_range+0x6d8/0xd5c
>>>       walk_page_range_debug+0xa4/0xf0
>>>       ptdump_walk_pgd+0xec/0x304
>>>       ptdump_check_wx+0xd8/0x154
>>>       kernel_init+0x94/0x26c
>>>       ret_from_kernel_user_thread+0x14/0x1c
>>>      Checked W+X mappings: FAILED, 1 W+X pages found
>>> 
>>> This happens because CHECK_WX noted a writeable + executable mapping.
>>> 
>>> This happens because execmem_arch_setup(), checks for
>>> struct_modules_rwx_enabled(), while kprobes depenency on modules was
>>> earlier removed via commit:
>>>      7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>>> Since the insn slots are only written with patch_instruction(), which
>>> does not need this mapping to be writable. This patch fixes it by
>>> checking for strict_kernel_rwx_enabled() instead.
>>> 
>>> Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> ---
>>>   arch/powerpc/mm/mem.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>>> index b617b69452cd..77b63b52d8f2 100644
>>> --- a/arch/powerpc/mm/mem.c
>>> +++ b/arch/powerpc/mm/mem.c
>>> @@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }
>>>   
>>>   struct execmem_info __init *execmem_arch_setup(void)
>>>   {
>>> -	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>> +	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>>   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>>
>> Looking at this, I'd use PAGE_KERNEL_X instead of PAGE_KERNEL_EXEC.
>>
>> Then we could get rid of PAGE_KERNEL_EXEC completely for powerpc.
>>
>
> I think it's best if we keep the definition of PAGE_KERNEL_EXEC on
> powerpc as PAGE_KERNEL_X, I think the core expects the arch to define
> this, if not, then it defaults to PAGE_KERNEL e.g. see this:
>
> include/linux/pgtable.h:
>   #ifndef PAGE_KERNEL_EXEC
>   # define PAGE_KERNEL_EXEC PAGE_KERNEL
>   #endif
>
> Also mm/execmem references PAGE_KERNEL_EXEC in __execmem_init().
> Although it references only when execmem_arch_setup() is not defined by
> the arch (which is not true for powerpc).
>
>
> However, even though nothing breaks today, but later if there are other
> users of PAGE_KERNEL_EXEC, then PAGE_KERNEL does not have X (execute) bit
> enabled, so it might break in future. Plus looking at above, I believe
> there is no harm in keeping it - since core expects the platform to
> define it's own definition - due to all the other references it has.
>
> Thoughts?
>
> However, if you still think we should remove it (?) - then I feel let's
> do that as a separate cleanup patch. Since this keeps the usage of EXEC
> same between prot and kprobes_prot variables in patch-1, which we also
> need to backport.
>

Gentle ping on above queries!

-ritesh
