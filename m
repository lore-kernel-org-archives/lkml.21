Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361981;
	b=EfE9kAsADGNyUNmeJS1k+mlEQ5VnTD0tuQYF54tC+ESHc5yvr9GPNfQ3q2K8LJ1MxhRG
	 T93WvSETdj1GE0T9a8i+3qDoIajR7sJh+afsx2NNehYtokeUDergjqeWOh7AOt6gATfyu
	 JOCjlskq0PYm+gO/+ODrk2kEknNBSEZsQntSykixEnEEf2r8r0XTu6LzgjyV/K1UHvolP
	 /t6G36PIKdu4uxwG8o0v37lBAHx7Vdt54tFbIFOmJRKEqYonv9tdVgXjsuTrfaEwSNMXU
	 b9YsVZB+rkKEFBVE7gYq3/i0t67NenyuMTmzqM2XLNqc2/ALSKCDRDIMHfyLDRJGytw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CF1vPMfVpzbutUW1ILt/0v1q/2bQg+t3fMWuVpjH1nY=;
	b=q8KyPZfMbV6fVgpZqkBaBLSbMl/YkU5yEnTSXIluGrBUSTxIyNJWzNX8RwVe9Q8uaRZB
	 6vlcJbkyxIlglBYahMCXNEeN0Q4AQk5phqeYUE4nuqQBmry2hjOJ5Lb5n/w49a6VhZ9pl
	 Y1r6BhyjH9lftuUrMp5ysLrhtkER6gxaDAgMTR41a8BDuSbsnJYL9+3X98JxCXCYTCL+K
	 rBukpS+KWWspIFU9VI2xTDcceJxg9cDVf3U4OOD7oqak9u7fePoLiA5Vm1ZF5eH+aCGAf
	 vXh6/AR6hxDu5w1QLI3mgMyiz/fLv1dPaknznD0OZJqVQvseHZCAhna14MrNjVhVH3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YiDitQAW;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379F606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D379F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YiDitQAW
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so3121050a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795361979; x=1795966779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CF1vPMfVpzbutUW1ILt/0v1q/2bQg+t3fMWuVpjH1nY=;
        b=YiDitQAWHBvCCMvhDhHc8CWnFMk3zdLEqqb/0SGmlkWp+HwJKKCtFyFpPG2PBX9OHt
         iju/yjp2ECyAxfnFVWO7KwtD6p/HhCO0N5lnLlh7blzBPzLbEgeeYagkPm8EtsBKE38v
         4vLSvz7l73dK9QobWiau40a/IlcRSmA3Kq9kwyR1x6OX50/MIhQKtY6Cs7vPcCJLgDm6
         26HiXmnIGUTJmzXB5o/g7PoMNV2Zszv/kmQsiGMBeJ0nkYHRrAJpk9YM3oIyS4Cvx0wF
         afASsMUKUITGGG0yiEVQXZHHtfA5M6m5hOQr+UEkYJHwOOdrk34a/cQTKrMslqW3pmSp
         Vh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361979; x=1795966779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CF1vPMfVpzbutUW1ILt/0v1q/2bQg+t3fMWuVpjH1nY=;
        b=tMxaEkLIxFnbHAhZsRQ3YzPKFdqgD3qfbRVnLTytI4ul5VYhaes2IdkXpJJ0iJuQUX
         UcVh56NnHsKulRJIYcaFfuiBtfx2PbER10Az9h8RagoJHjUntOgInnWZIDNuAPirS8ZC
         pRwE2oGiYgLhRTq7pUGr2gf4Jw3rLXXBrzB5VOEscLYFoKSYUk1cIy7O6jt5DXreCuxM
         vQoK2PI+uZwyTFBgXwLPuBTUVt5/kSCtNX6KfrMyl/fmDz3s0vSxEAgkL9E7Yh0TDBcx
         aqKRW1LzGey4vdVDOkV6Z47hiB7fWux04VFng7q3DvckLTUycYuci93Fm2LrANQ/cELV
         MBtQ==
X-Forwarded-Encrypted: i=1; AL+hErEDL3gTdMngUEUwSdCpppQtw3jieaty+jFvawcdFiP5InrxvjW2bPU8KSdkO4m/pXrLwvGypNEaWJ0ItlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kamv1i3YIq2fZDbE4IHoWYY9UupOr1T20U9CpMAnZ1Q1k/0DH
	2v9X1zJMGozs+i1/hlIKhTAwoKzkeWC8FwtKpmnf6dVhcOiBri4R2pKa
X-Gm-Gg: AZFdTZeV+Qa+8+vYRws72j6gBL5O2kza2xKWAbS+49OOLgux+F1IUiYh/JXLXC+v5NU
	GZzwgGdK2I5pmSHS1t8Z0aN/6bD3ZhwNASRypP16p1RqQHGHwXKIf6/Psl5kjrPZNNg1Ufu4aSd
	3DVgLbkW4IhItNTX5ZmKX01HCR6EIJlUllA+Eop9aO/CcLhE7Xj9VFFAtUumhra5bQtgUSazNhR
	OJlvh7hNccqSbNKzug/MGiADes1nA/w82S0Uiy7UXRIm6Qajn4fh28WtQIIdYT7053RfEetm1VW
	6yKOLnBtExA5Rmmp35UgXFYEsDAhEyAUtIagfTxyFdriKCH/oV7ynegNrPhIHzgygSED12tvbbN
	/76q+9VT20wPj/VaqhrnuuqyUFYRQZH7JAz+r/IrFdKBELMo4LzUpiMfgK8iYKZUKkZa22uhqBe
	REkNFLOXOlQ7nMLQ4AbAS3YTQdhd9Ov6RIvJCrzKKbGrHbI+vMnjdMT7pukS34/THEa8A+2XNpv
	nb5zgERPIem0Wv8rwDt6Pr97M21SsoIJi0TnUXei6nRlCApVSdwo2xqv7XngxdnBXJGsg==
X-Received: by 2002:a05:6402:1f07:b0:6b4:87b8:1348 with SMTP id 4fb4d7f45d1cf-6ba37e83f34mr6102402a12.27.1795361979136;
        Sun, 22 Nov 2026 07:39:39 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm4097712a12.18.2026.11.22.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:39:38 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 22 Nov 2026 16:39:36 +0100
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 1/2] mm/vmalloc: drop VM_DMA_COHERENT from
 remap_vmalloc_range_partial
Message-ID: <awMMuDowZKcMYc-8@milan>
References: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
 <20261029-vmalloc_remap-v2-1-c4705cbf26c2@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029-vmalloc_remap-v2-1-c4705cbf26c2@linux.dev>

On Thu, Oct 29, 2026 at 05:19:07PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> No caller maps a VM_DMA_COHERENT area through this path: such areas
> come from dma_alloc_coherent() internals and are freed via vunmap(),
> never through remap_vmalloc_range[_partial](); all 13 callers pass
> vmalloc_user()/vmalloc()-backed addresses.
> 
> The flag was added in commit fe9041c245196 ("vmalloc: lift the arm
> flag for coherent mappings to common code") as a mechanical
> translation of ARM's VM_ARM_DMA_CONSISTENT.
> 
> Drop it so DMA-coherent areas can never enter the path.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index db669103dc66..a888eca016a8 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4894,7 +4894,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
>  	if (!area)
>  		return -EINVAL;
>  
> -	if (!(area->flags & (VM_USERMAP | VM_DMA_COHERENT)))
> +	if (!(area->flags & VM_USERMAP))
>  		return -EINVAL;
>  
>  	if (check_add_overflow(size, off, &end_index) ||
> 
> -- 
> 2.43.0
>
I think we should really clarify why а remap_vmalloc_range_partial() should
no longer accept VM_DMA_COHERENT mappings, because this change explicitly
disallows a previously supported behavior.

Could you please clarify why we should disallow this now?

Thank you!

--
Uladzislau Rezki
