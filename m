Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586025;
	b=sj63L+K2kmHp6UKV+oMnBnm0XBDx7nbWxDQfuEefHXbdwbTCGx7FdcxOC004Ab5QzRwv
	 S7qVgW2vXbEWkh6wyDo0dEdlqTXoqrkqkYlpnVWjIJxfoxNZHLjy6obg1VMdvZaebrQH7
	 stdjt9DTaqtWikrEzLWnMJ9iWp+jXUEypQZmGI1HPNr54aLQ8vEDZkGwUlzRTyQNU1Dx1
	 qBYtudLHDnigptdcN5Hf/8V32gpsr9Pmu0QnW0XU3A8aVORr9d/vYN3ka1LWml2g3HWwS
	 Crp0aPg1l2f3C1xOo5xf9Y/cU+3hQFtdobQTtjEF3oOesLtRUo7+uY0UNx3idZXQqOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iMgsgpEKznfx9E2tPu9EJE/6blmi3j8XUJFr/xHJgnU=;
	b=udWUYnQucI3LCYEYEe/GeC7Nk7ylhGZz+Mmx/1K4eDiHQJBD7t3mEtsn2qU/wIt+cMSu
	 FDPOGZhjAdD2FcsoqdAqCxrxrQLWuCQerD+z6RbNCK4sDGNReLxwmfhobqhhQfTBAwVDu
	 rga0dhydzTK3CCvNV+X8v4qcPghaGF2e6zQY+zO+4jMrLXB6ukxC+NFnTMwvE65WRefdZ
	 j9bvT5QGPwL6unom0zBt1BgmVpLtxlYlLRfS3/Chd8SWNWsrqEfkPoZHqRoUVpseCX2lY
	 j/rHqo1FyjrlEVTyCKK7CA1fMrfWKLQ8tYqT3TU20YfXHaGhjTE40/ZZygYz8JXnZ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFVlaU4A;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DD7606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DD7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFVlaU4A
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a07078200fso2781951b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795586024; x=1796190824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMgsgpEKznfx9E2tPu9EJE/6blmi3j8XUJFr/xHJgnU=;
        b=eFVlaU4AiELn0jQHySTu52yAagv9Y98gP99pMo0Bp5hXsbOCq1aHnPwOqZ84fOaWvE
         bg/IFGrK8juukRO6U9HbapVs7osBZx/xLlrZ/pS26L40b8IywfwPpQLVmI/xcctN1TSv
         6AicBNggBCCnDuvMpQbb1xPrm5TYWtEVVE72pmjdQUhHhWdaCdEZapXy4W1PWL7iXm6q
         QuHFKpTzAvrCh8ZznEXd5mxk4bz1UDy1UEnSVwLFDmYsnvItpL+IMBAeobcif7eVois5
         qyNESM18ITf3rIjG6PhJq0D7jwxo96eqiPiAdAOUVeNxbdo+/L5EoP0oPyvnLtBqcZAX
         RWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586024; x=1796190824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMgsgpEKznfx9E2tPu9EJE/6blmi3j8XUJFr/xHJgnU=;
        b=bjtodTBeszPBxUrazN/9+gdN/p5LV60UkxyPrVjYlUNgC+ZViLFH0nOSLsxTc2Z/Od
         KOXWeByTBiBx1z0UF5/pBcl5B6yQB+ulZ81Wk2pJNOFT8yn8SBo0WUHfiFIbIHK7k1B+
         u7nEfpYOLkaxwKYWLNSPTf+ZERhK59jH6bvJIjAvLrBqYrRSY20tJX7HHXhH+TUnp3zN
         rkItGROcReDiBLt/x119nNFTZU1Lyk95CZ3CA1zOSrsBKgDSF8Pj/Dw+H4/DJxc1dILT
         pmb+jHhRQEdhtihs/4Dtk/m9uoOKFBmNdPr8X5QO1R9UYgklsFk2xbLH5aXVj8yiRUVh
         0lyQ==
X-Forwarded-Encrypted: i=1; AL+hErHOmlJbMVNOvxNNgT9RP1XsorMvW88dN4vVw+AjYdMyyId+YgR+wQR2ZzYFwSOEwIoKV0jsYacSk4NqLxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z80LM2REdwE5s89khMApcYZNU/rR4bXj274xtbLzAXCM87vjNiY
	ystD6/K1EP+1abPCRuQdb4vMvlOTJn0W72nOlY948aqT4ioufeQ0wF9t
X-Gm-Gg: AZFdTZecfltApzD6koYSJIC+UFkzLmDsrnjpL6pW1hBodL6oTYtMZ58+pFpn9kADlA7
	9p25Uqpa5xjgl4yRkVlk0+xsbuoW/rmV7gMO6JJF9HtoJoyg3DkqNcjCLf1ToUoGeyvcZMOPRsB
	9ivygB4yEJRyv0pPjd54kHo/ABNSnRzR65qmmGrEH7Q/cPwDLLUj9yh5utMDhUQZsFi3TccgzxE
	Allr5S39gRbDCXwWBQPfJ3mMR+Jh7ZmR/JKUsuHWuanWFImdIlzxgfd+D9JaM5N/9T/P0ivwH+g
	LmJ6kC3T4zgBAjbFZl0BddhHy6OoiT/OOH3RZV0uS3oSxOpR8G5WWCEpP6WCBxIJ1nvnPAP9xt9
	+Eg8ntXAuDpsNL7hvsshM7Uy30qZ5AsYfvQfHyW6iyvZwBXVkXQgfG64YQxPrn33mAxtaNXKSVL
	Agxs9XtSMlSKL6OSnkhVpfQR9sl3hfF51heB/0cnwoMPyQGe3mOHDmqXXdxPah2cE0l2cVe/5jN
	paQqz/EkfwBqcRpPbIriOQw/XWYNJlDE40ztigjOUhhlxklSzdadB3qfRr+jgW2YJ/jvmlczUgz
	WTB7AEzcRhdn4wTA1X4kIhQCNUMjwCNAN4GVaupr1FMR+c+eszafmotfNNyiGFcnpo/xyaonh23
	m
X-Received: by 2002:a05:6a00:2996:b0:89a:19ae:10e7 with SMTP id d2e1a72fcca58-8c87cf29209mr13734304b3a.42.1795586024370;
        Tue, 24 Nov 2026 21:53:44 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.51.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm7958930b3a.12.2026.11.24.21.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:53:44 -0800 (PST)
Date: Wed, 25 Nov 2026 11:23:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 3/4] powerpc/kvm-hv-pmu: Don't allocate gsm/gsb
 GFP_KERNEL allocations under spinlock
Message-ID: <awZ31TppgNv1uBuW@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <cover.1795441238.git.ritesh.list@gmail.com>
 <52381792ff2e208f213cf250d5122a1ab367de20.1795441238.git.ritesh.list@gmail.com>
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
In-Reply-To: <52381792ff2e208f213cf250d5122a1ab367de20.1795441238.git.ritesh.list@gmail.com>

On Mon, Nov 23, 2026 at 07:21:52PM +0530, Ritesh Harjani (IBM) wrote:
> kvmppc_init_hostwide() takes lock_l0_stats with spin_lock_irqsave() and
> then allocates the guest state message and buffer with GFP_KERNEL. On
> a nested API v2 host with DEBUG_ATOMIC_SLEEP this warns at boot:
> 
>   BUG: sleeping function called from invalid context at include/linux/sched/mm.h:322
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
>   preempt_count: 1, expected: 0
>   RCU nest depth: 0, expected: 0
>   locks held by swapper/0/1: 1, on CPU#0:
>    #0: c000000004ad95b8 (lock_l0_stats){....}-{3:3}, at: kvmppc_register_pmu+0x50/0x270
>   CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc2-00028-ge5a8bf3a3ee9-dirty #124 PREEMPT
>   Call Trace:
>    dump_stack_lvl+0xe8/0x150 (unreliable)
>    __might_resched+0x190/0x30c
>    __kmalloc_cache_noprof+0x4dc/0x760
>    kvmppc_gsm_new+0x68/0xcc
>    kvmppc_register_pmu+0xd4/0x270
>    do_one_initcall+0xac/0x48c
>    kernel_init_freeable+0x3cc/0x7f0
>    kernel_init+0x3c/0x274
>    ret_from_kernel_user_thread+0x14/0x1c
> 
> The lock is not needed for the allocation of gsm and gsb buffers.
> Allocate and fill the message and buffer without the lock and only take
> it to publish the two global pointers.
> 
> Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/perf/kvm-hv-pmu.c | 65 ++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
> index aa72b96b5a8c..a58634f656e9 100644
> --- a/arch/powerpc/perf/kvm-hv-pmu.c
> +++ b/arch/powerpc/perf/kvm-hv-pmu.c
> @@ -314,53 +314,48 @@ static struct kvmppc_gs_msg_ops gsb_ops_l0_stats = {
>  
>  static int kvmppc_init_hostwide(void)
>  {
> -	int rc = 0;
> +	struct kvmppc_gs_msg *gsm;
> +	struct kvmppc_gs_buff *gsb;
>  	unsigned long flags;
> +	int rc;
>  
> -	spin_lock_irqsave(&lock_l0_stats, flags);
> -
> -	/* already registered ? */
> -	if (gsm_l0_stats) {
> -		rc = 0;
> -		goto out;
> -	}
> -
> -	/* setup the Guest state message/buffer to talk to L0 */
> -	gsm_l0_stats = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats,
> -				      GSM_SEND, GFP_KERNEL);
> -	if (!gsm_l0_stats) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> +	/* allocate the Guest state message/buffer to talk to L0 */
> +	gsm = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats, GSM_SEND,
> +			     GFP_KERNEL);
> +	if (!gsm)
> +		return -ENOMEM;
>  
>  	/* Populate the Idents */
> -	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP);
> -	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
> -	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
> -	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
> -	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
> +	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP);
> +	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
> +	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
> +	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
> +	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
>  
>  	/* allocate GSB. Guest/Vcpu Id is ignored */
> -	gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
> -				      GFP_KERNEL);
> -	if (!gsb_l0_stats) {
> +	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
> +	if (!gsb) {
>  		rc = -ENOMEM;
> -		goto out;
> +		goto free_gsm;
>  	}
>  
>  	/* ask the ops to fill in the info */
> -	rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
> +	rc = kvmppc_gsm_fill_info(gsm, gsb);
> +	if (rc)
> +		goto free_gsb;
>  
> -out:
> -	if (rc) {
> -		if (gsm_l0_stats)
> -			kvmppc_gsm_free(gsm_l0_stats);
> -		if (gsb_l0_stats)
> -			kvmppc_gsb_free(gsb_l0_stats);
> -		gsm_l0_stats = NULL;
> -		gsb_l0_stats = NULL;
> -	}
> +	/* setup the Guest state message/buffer to talk to L0 */
> +	spin_lock_irqsave(&lock_l0_stats, flags);
> +	gsm_l0_stats = gsm;
> +	gsb_l0_stats = gsb;
>  	spin_unlock_irqrestore(&lock_l0_stats, flags);
> +
> +	return 0;
> +
> +free_gsb:
> +	kvmppc_gsb_free(gsb);
> +free_gsm:
> +	kvmppc_gsm_free(gsm);
>  	return rc;
>  }
>  
> -- 
> 2.39.5
> 

LGTM

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
