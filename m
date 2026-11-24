Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514814;
	b=Jk3oDUPARdGRe7j9+M44rTOw2auRoctasJC2+SpE3lbwsj7PqXNWROkfIO8ocPC9yhwJ
	 mRf1ROvfbkmMyT0GnZro52td6mn9ciyv8MrsGAOxI7VDSa0IHMsU7Q3FRJFzixYXW4x9l
	 egAW51dRnRTNYJ3tmd25izhIBVgZPhx5kHMjqulo7zeI5BM2wNidVURXfF9JIFO3I/tNk
	 5b26q+P5P4kn4T3WsRC7o0+PF1cBLl58atMsLvOoxuxe9g4OIbEANlKaDAAnFajGu8BTx
	 35oeguZKPizk0aD+NmGJYbbhPctZQASoIApiJetBo3dr6tURB/ekfYs0E3a3iZfBt+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514814;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SXEF56RrG5y5FAdKWjS4+NoaPcHn0Sj4aJ75nFCxeYA=;
	b=mEv/kVPW41Zciwq8q7n6h+hJ1Wk/HuIFtAU0Ezln+HH7dh3GjrjR3SKFNL5fYiy/FSfP
	 xVcK7kJ2hKLC3XDC99eubIDb51CC/XjMzTagQTnm5yxonFuz7HE5dNMjiwHxdNwQ0i2aV
	 xrmaANNeyR7KyZrwfwznzb/xVJDuM0WJ2QAsH9Se5QhB1U/WpX8ZFaaUz93IPO6THuhNC
	 O7bK9hf+Zc5jh8Cdfr6Wc0ptyaAYSStS4Rf3OYJalaU6zVzRtb7HWfP8wAfBZSAg7oKB+
	 eM5a+z8VRqDlF5T7K+75f8Sr2LSHxOb/kyTzCuxCVjHAInQCAIRA4pPC+Nhz0FtUSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flCBnIDd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03AC606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flCBnIDd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1481F000C4;
	Tue, 24 Nov 2026 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514813;
	bh=SXEF56RrG5y5FAdKWjS4+NoaPcHn0Sj4aJ75nFCxeYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=flCBnIDdaewb+skQc1KO+Zef0Qf1B9wCc2dAgiever4x7MW5nx9zb/+o4sW1y0BxP
	 H+IOx5Xu65qNlumufAS1gkDIpdCSgTbtLOpDv8tw1OOoe6sRtQUhl1VkzLwcJaER3j
	 md4cj3iCazQGmmzT1pC9W4eHz46jAvTCt5kXrutsUJNG9Hn6yl+H93EbOFLtLKCB0t
	 OpWPUQuqHCCtHYm0v+p0KZP71uiro0wOGOEd01kh4kRj+pxmoaSCrDg5ktTjqQc7KJ
	 xcYJ6y4kVJ2/YQsZcE8pS2hwRrk+OqSFVdQabFF3FIuXMEmv7AI8WviQ9Ug/FIUJxz
	 ZklrsoCYmQ7DQ==
Message-ID: <0a6fbbd8-6339-444d-bcb0-a74980fb77c8@kernel.org>
Date: Tue, 24 Nov 2026 11:06:47 +0100
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
Subject: Re: [PATCHv2 1/3] powerpc/execmem: Don't leave kprobes insn pages W+X
 when CONFIG_MODULES=n
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
References: <cover.1794572365.git.ritesh.list@gmail.com>
 <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com>
 <9a7963a6-0033-45ab-90d5-b1f580a4882c@kernel.org>
 <v75v752e.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <v75v752e.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ritesh,

Thanks for your patience,

Le 17/11/2026 à 18:15, Ritesh Harjani a écrit :
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:
> 
>> Le 13/11/2026 à 13:31, Ritesh Harjani (IBM) a écrit :
>>> commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
>>> CHECK_WX default STRICT_KERNEL_RWX.
>>>
>>> Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
>>> we can see the following warning splat at boot:
>>>
>>>       powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
>>>       WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
>>>       NIP [c0000000000ac204] note_page+0x4dc/0x4fc
>>>       LR [c0000000000ac200] note_page+0x4d8/0x4fc
>>>       Call Trace:
>>>        note_page+0x4d8/0x4fc (unreliable)
>>>        ptdump_pte_entry+0x70/0x94
>>>        walk_pte_range_inner+0x15c/0x260
>>>        walk_pgd_range+0x6d8/0xd5c
>>>        walk_page_range_debug+0xa4/0xf0
>>>        ptdump_walk_pgd+0xec/0x304
>>>        ptdump_check_wx+0xd8/0x154
>>>        kernel_init+0x94/0x26c
>>>        ret_from_kernel_user_thread+0x14/0x1c
>>>       Checked W+X mappings: FAILED, 1 W+X pages found
>>>
>>> This happens because CHECK_WX noted a writeable + executable mapping.
>>>
>>> This happens because execmem_arch_setup(), checks for
>>> struct_modules_rwx_enabled(), while kprobes depenency on modules was
>>> earlier removed via commit:
>>>       7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>>> Since the insn slots are only written with patch_instruction(), which
>>> does not need this mapping to be writable. This patch fixes it by
>>> checking for strict_kernel_rwx_enabled() instead.
>>>
>>> Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
>>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> ---
>>>    arch/powerpc/mm/mem.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>>> index b617b69452cd..77b63b52d8f2 100644
>>> --- a/arch/powerpc/mm/mem.c
>>> +++ b/arch/powerpc/mm/mem.c
>>> @@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }
>>>    
>>>    struct execmem_info __init *execmem_arch_setup(void)
>>>    {
>>> -	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>> +	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>>>    	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>>
>> Looking at this, I'd use PAGE_KERNEL_X instead of PAGE_KERNEL_EXEC.
>>
>> Then we could get rid of PAGE_KERNEL_EXEC completely for powerpc.
>>
> 
> I think it's best if we keep the definition of PAGE_KERNEL_EXEC on
> powerpc as PAGE_KERNEL_X, I think the core expects the arch to define
> this, if not, then it defaults to PAGE_KERNEL e.g. see this:

Yes, which is consistent with what powerpc does when strict modules rwx 
is enabled.

And indeed it doesn't matter, because module code does a rw allocation 
at the begining then convert it to ROX or X later in 
module_enable_text_rox(). See comment :

/*
  * Since some arches are moving towards PAGE_KERNEL module allocations 
instead
  * of PAGE_KERNEL_EXEC, keep module_enable_x() independent of
  * CONFIG_STRICT_MODULE_RWX because they are needed regardless of 
whether we
  * are strict.
  */

So really PAGE_KERNEL is what is expected nowadays.

> 
> include/linux/pgtable.h:
>    #ifndef PAGE_KERNEL_EXEC
>    # define PAGE_KERNEL_EXEC PAGE_KERNEL
>    #endif
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

Yes but PAGE_KERNEL not having X is on purpose, module first allocates 
non-X mem, sets up everything then converts to X or ROX. I don't think 
there will be any more users of PAGE_KERNEL_EXEC in the future. It is 
going in the other direction I think.

> 
> However, if you still think we should remove it (?) - then I feel let's
> do that as a separate cleanup patch. Since this keeps the usage of EXEC
> same between prot and kprobes_prot variables in patch-1, which we also
> need to backport.

At least we should stop using it in our own arch, it would help with 
readability. And really I think we shoud drop it completely. But OK to 
have it as a separate patch not to be back-ported.

By the way I also see CONFIG_ARCH_HAS_EXECMEM_ROX, maybe we should 
investigate in using it on powerpc.

Christophe
