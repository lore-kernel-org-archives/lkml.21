Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672194;
	b=5B2cg0b4EMiMFvIk4ansJs2BbjddhczbzWz8wZTapQyAsQuTp3tYiUsWIs6gZUgWnYIJ
	 Nq8jvy5OvMh3PMGl2vNlOdNqpHTpfgYIi6Cwtjz2qoIFWCBuZ+Jiz4HnH1dpQnQqrqQ36
	 hUcHPvnUwmo61MQ8MRSVnKP/KQnBozo8+hZS3NvjE1v9HOEhAELRyaV1K0S9ypK6OvGZv
	 mQvtI+/C2eH+U+XUIHzbJNEk9bmgEccr7KfXE1K//g8HfR55jLZ+GwiqyFYLcFyML0tgX
	 RMGFu5ks3VUUML4L/JghCrYeHALtW1igwOj7OSeLjwge5N96XtLRm+1JOWu9r/HETCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672194;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HsXzRWYodix47CuBgzuQWHBhWBfw0W2pF7XPE87u9aU=;
	b=XWHjPLK9B+7uqk1bC4ZpFOtRgyQj9ikSmUBn4kazDzgchTvtF5LmFcvOxfegQX2Ax1Pd
	 iWekarKSTS3anicWiGXSUPO+YjxzlvyYmU7uwnHwg8vARQVGAqMF8P/geK5TBUi4hAcx3
	 GzKzUabZLNHNKNLka4I632k4ftPlOJ1I6MsS69ShXxyKw2G4Kuj7+i3h3XaG/lN3LThGb
	 4aUcBSD50nlFx7Jrcbm6AX+z+ymkvoSaz/jlSLHcLVtT4OKdfP95PUel5Bm2cm9hMV/m0
	 LpK4pI8Il+uiZKeEl8UBQk+kSpbB+eueBVheR0wDUMHDmKwbV4nK36GfrV+Hq+zCz3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shazbot.org;
	spf=pass smtp.mailfrom=shazbot.org;
	dkim=pass header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=r54zHwoT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="OlI3/vYF";
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72E606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB72E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=r54zHwoT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OlI3/vYF
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0EE337A05AF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:49:53 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 00:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795672191;
	 x=1795758591; bh=HsXzRWYodix47CuBgzuQWHBhWBfw0W2pF7XPE87u9aU=; b=
	r54zHwoTzg/asIflSTScbITYpa/tkCshWNPlyxjKBtpVhufapl46CERxi5tvGXkC
	pcPT66oHfKGV/gCKRjrPsnurTkKo26sV2bwHLNzTy7zIbbS+nVccriiYcbYbg933
	wurbKKco/4m4f4kmWGgMtKl3VfZ7OJ6pNoLpIW3LW7PK2TPOhwjO14FB3VYspCnV
	5rdpTt06TgIHFDhSQA0/cDPRky510XJ2cNQTXIBFa8ZJBgjA1OF5VOhCfZe4o2PI
	YD3u+gq/Hv4a9TMVjhCjsZlbujjfWlDV0ttbFgjItIFe0PVduFI045AnY4gucE8Q
	/OzvcW4EbMGG2uwhq75n3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795672191; x=
	1795758591; bh=HsXzRWYodix47CuBgzuQWHBhWBfw0W2pF7XPE87u9aU=; b=O
	lI3/vYF9s3j11tjCbA3GHCEJPyzhXiGteJXFS9I2wYaWkhaMCAC/7VTMvC/oXODk
	XE5umypL0QvMjYMQ2cNKo9i80mggTU9TFrGmNTDCK+IMwLyNiEoN3erMKkZa61+e
	83zhVWuvtAmc2BXYt9QKTrP5Ghp2j03TJ1Sq7vKDSFN8VUcRWySfR+AqFxYMuTSy
	sZhhOaoCX4h6RFBPzOEa0OuHjK+vwmcetj4v1EwU5L6hPAFNKR8bJ+iRtc+QSMjt
	ka68A9iglMOg0L+nh08gZLGqMUq6GK0VAVBkq2EVmRy8oFOHGi3fMJQ7skWVPT5N
	yAttC+7uLhalBAnV3675g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shazbot.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795672191; d=shazbot.org;
	mf=PGFsZXhAc2hhemJvdC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Empmbj98Q1CXsLtsdVp0Xb9geAGkKTKDfbG1YZNe8sTxLoh
	7IefGFwo+HRusJhGhA0dn98RjbfYqZpsGdGlh7aBGpNEggrZ3KYIkkBt1R7wlJJC
	AGwZt6kzY+BAdal42xAP6Msgs5Dh3Q1b3wWVWtyTCDeOCx8K18GCM1eqMG1EHQuM
	x9nnuHm5tSWi+qwqLT5VYtNJqxEFSxPlklhZJfYCecIKJhS8USi9Fc1SEsbatdI2
	Uo3tymocMTwcw0/eD1L9H2hHWbGcI58TruXMaHjuByfkWm86RA9ulC6k0icjYcXc
	WRODw84jlxK9tLPo4MYH5fUoUg0QnaPdZi651UQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:HYAdqQbSGMS1Y6aKCRY/uyfewmH01kaq1m9cJbFoOTM=:P0Vf7p2TwKsPkouEEc4pJ3WO/PAVF8RkJCvLDoNi4PM=;
X-ME-Sender: <xms:f8gHa-TCW1mr0ae5q0ANYUxMQOewyjX6d0Eyz5cMbnFnFlHD6JKf_Q>
    <xme:f8gHa4uI5-wCefqmhHHUUqdKEx86ay_zbwfwsgURwZomGqcg0KsGYnyTsp2qA8swo
    HSfizEV6OtoA9jX458GQ9KH6aOKH3YgHZE3GhJf1YJ6uKIR-3JfN2I>
X-ME-Received: <xmr:f8gHawE15s6R-m7RQDiVo_5ykciiW76xnT0tgDW__Wnvbf10h42QzVF3JzLLvA>
X-ME-Proxy-Cause: dmFkZTEfPYW8nCNKUJkQRuBwJ2X4KoFrj5UQx4lP2ypIt/l/R2MJdtcdAqHE6kK5de9MbG
    auv0SaVR0YGjqZeZ8qyQWlxvgraAQ9LFH4H0ia6E71bmsV6lxl0j+Bk+2SL6DMI24bXkrY
    Qh5c93TbHfc4/Gm/upAmwwA0bF2mzarkgeO1F622axU+yofvRLQ8MHKYWU54ASVYcw7OVy
    IB5TR5krngyDr9INYBrf27ex3gnsd1JcRbm4GCLp1VE28MZQwCMmaLiymuNfY2tg7K/m3p
    PMr9f+kDZ7nF27Nwmuux/i4gVX/Gh7yTv0YeC5zQxjuEHG6c+yVhuYsR66nHLBr7xbDBSo
    Md1axuygDZUIF4EWPV6oHXxWw8opv0zJSTHg64TMG+i0/F/kMcXuk7L0dAy/+oi5JTLyYl
    +gEOqtS5j0Al/v9a1UXQQw3ejsLyIG1WQNolqluqqc7+WYS20BJq9Vk3PRmbH+nlN9tRRA
    tbPWfEtbEb0pLNQar6jBYgxH6SUZlFVyM/JIbLW0G9eeGtvPQKz7SSd0yBTY9vO0Yo8w6I
    dAdWZLKuUYKwKzNlM4o1wqSPkkawV2t6o92fOsZ4Fc5QiARi8mpveNM4iwUjpogSf3vUPz
    x44+NXr7lR2d8dnimlfXpM5W9xNJb6SifbDeSjEG7v5w6lfG29qoA0gPkkQQ
X-ME-Proxy: <xmx:f8gHa5wtMbhBQoHFT99Km7Wv_0Hyw4D9_8joOCekKkdr-mRjvrF3dQ>
    <xmx:f8gHa62PwbjngfiApHLF4R5dD0-nkI8GlgoiVl9Bdq8dWdq2jeSPig>
    <xmx:f8gHa5qBx4K__540s5Bh6sTk_RROuRaw7kaLrMmQ_cDsl2K4v_HIRQ>
    <xmx:f8gHa3XDAGfar_AdGp5v_e3qRmgKRKAixfML9X8cS73BFhBULqk-Aw>
    <xmx:f8gHazuOD12DGpxH9b5w-2ncMaJaBVNA35QVrVw9m8P9oSpa2I7RcPIb>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 00:49:50 -0500 (EST)
Date: Wed, 25 Nov 2026 22:49:07 -0700
From: Alex Williamson <alex@shazbot.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: yishaih@nvidia.com, jgg@ziepe.ca, skolothumtho@nvidia.com,
 kevin.tian@intel.com, leon@kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH] vfio/mlx5: Fix an unwind issue in mlx5vf_add_pages()
Message-ID: <20261125224907.13d1fb8d@shazbot.org>
In-Reply-To: <20261116030131.15346-1-dennylin0707@gmail.com>
References: <20261116030131.15346-1-dennylin0707@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 03:01:30 +0000
Hungyu Lin <dennylin0707@gmail.com> wrote:

> mlx5vf_add_pages() gets a pointer to the page list of its caller. If
> alloc_pages_bulk() fails after some of the pages were allocated, the
> unwind flow frees them with
> 
> 	__free_page(*page_list[i]);
> 
> The index is applied to page_list before it is dereferenced, so only
> the first page is freed. For the other pages the code reads the memory
> that follows the page list pointer of the caller and dereferences it.
> In both callers this is a dma_iova_state that is still zeroed, which
> ends in a NULL pointer dereference, and the pages are leaked.
> 
> The pages are allocated with GFP_KERNEL_ACCOUNT, so the allocation can
> fail, for example when the memory cgroup of the task is out of memory.
> 
> Dereference page_list before indexing it.
> 
> Fixes: 089803c40193 ("vfio/mlx5: Enable the DMA link API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/vfio/pci/mlx5/cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/mlx5/cmd.c b/drivers/vfio/pci/mlx5/cmd.c
> index 04180035a7fe..8e8514f2660f 100644
> --- a/drivers/vfio/pci/mlx5/cmd.c
> +++ b/drivers/vfio/pci/mlx5/cmd.c
> @@ -518,7 +518,7 @@ static int mlx5vf_add_pages(struct page ***page_list, unsigned int npages)
>  
>  err:
>  	for (i = 0; i < done; i++)
> -		__free_page(*page_list[i]);
> +		__free_page((*page_list)[i]);
>  
>  	kvfree(*page_list);
>  	*page_list = NULL;

Applied to vfio next branch for v7.5.  Thanks,

Alex
