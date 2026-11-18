Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031409;
	b=ikYFEbZ10kE5kn2xlX880oqTqloorkPq+yeFpuUs2R30VgbnK5J6EHQVQ1Vw4IX8h3H+
	 cFynLQMx5Ukvh5aAgpxRvaTHlVYYi1v9uWOVMj5mB3zdqXbMxTKYCPMr1RC5es+lA8dJ/
	 xCwmeLC93ZKOhH2rdw13TfyPj8L97/wby6ZSmERdig0gYlAjaKIyK2PQEj0UTcOWoB/OZ
	 1pNL6s6uoCiheBZlTP+RS5mhRJbSd9gFJvQF6wa+p31moUR9HvyT76SO9fKZhzXS/DtaK
	 klo/PdqHrMA3vCSg9gbpKtGp8b5jq3SgGXpDc5bhL8ZijgGjOUW1ptk9byTGQfiHeBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=E4a1CfB+dLHAk/zicRP0eJek0KQqRlij9qTOmYyyyD0=;
	b=PvuLlNFcsozG/7H1sKkzsDQr3AduExh38XdbsTwXPDI2A1Mk5+/W4M5SH2JIwiL7D+0s
	 QuOgaAAndL1pSq5Ky/CAxMtSIoQwnpZSA4vPyg1PVtbSCyhmNO2kM56uwAUq4yzHy7YgY
	 i/OIa7b8CmU169BZNsFBMXTdlkJBwH2otMAkYfQe46pm12xESK5V8tc7QC/Ljc3horBA3
	 caWJYcSZupEDytYtuyuIRTySUbZFLKanZw20CvoTR0It48cmxdML7Jwcv5tGXbNGgqD/1
	 mxp++YAg/ITURQvVaims4ZOXBegbCRbvFNP8Y/qhHxY0AOw6qbV4x+/iIqorr0z0hbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYFwSWju;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C36606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C36606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYFwSWju
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5118deebcfso153332766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031407; x=1795636207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E4a1CfB+dLHAk/zicRP0eJek0KQqRlij9qTOmYyyyD0=;
        b=GYFwSWjuh3K+nbaTuIkNFTsVTwFlqCSBqArb7Qm7R0fshhmO0RjUM3dKpZWX3tacJW
         Mw/lhE4Z3XTuQz9rG3SSSlnKEmLilijEfveHxdVhGTqoAcX9hepAZqvEYqnbUaoDlQbB
         ONfCBCq3N3s0E2Uk0RE9D7L8+SKS4dlCHd4yIE89WpKlimajdW4hwBI6s6K3UpVE3KRs
         VrFNGrRXoFEITeSdNeAXL8lqNvbYTa0dz+EWwI4bqSs/2FUFt80VyEgCiAmQNICfqdvO
         7ZAugzwUxHo2v7XqFS2VpVhTGZ2RKn0q5sCibNXoiMQPkv/xyQ4Fc0w/8isKsgoZ3AJM
         iIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031407; x=1795636207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4a1CfB+dLHAk/zicRP0eJek0KQqRlij9qTOmYyyyD0=;
        b=q5naFsI6ADYq7gkuLrxkMkT0gCca6/xIlYcLWXZ0c6MjAI41E7hOGp1LIsgozD5cgE
         zADEOs/t1Pce8KUivFKYX/orQXLEaVpV4D7z71PVwA0VHzitE0z/EGXlpNLapFksUBPa
         if4flj1C5gVaKj+Lu9KPkIrhKwv7VwxgQnWPzzQw7GrwpWqo2+F2/fFCcdoKyGzJKdy4
         SFosoXrewBh08feUV2TzeMcEs1F6RDK3rWu9s3Y5PEcbt+uXBFGzyPAYO3Xz9zwuDn01
         0Rn8onNwlKe/NN0VgUJnT2gEBav7yKgXj3dnbFoxJRVAsqa3/uI7NV35844LCCccwpAx
         Iu9Q==
X-Forwarded-Encrypted: i=1; AL+hErGP316WkEA+QZ4uEizi6Dij99aDcoGxXRbglSf29KfnFpAizNDoIRaOWB4QOOOsODs0nqGZAtUtIHro+HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xkDLeJuuP/RDm5CSs0qIS4iQ6fWwQ1Igz9ynwvD0QZGrpzD5y
	49cUWtYkEn1h+euxhKau2kvSuK46VGgcrzCmT+UxrVplGfGBxnOhDAGB
X-Gm-Gg: AYBFou1lTvz3MTT+09yUpmXYNeaPWxuSnUmu/+ZxDhZ4kXHnkki/YT53I8fvb6a6Uvr
	pgI2JjdxGwkIVsnzO1WY4YQH99UYRGQeYzwvR1EF45kCg49q7OEUXES6CyXYCuTIL744dKyNkH6
	Ee/Vsh+RYsN8bpYfaf8zp9JPQxv2a2nNxxFvhVwIRoq5fTmUn96iNT1Q/F+wdCYUV5D16MnDz/8
	k3zefMUp85huMa+UM4qaqhQ1tKBtpuANz5ZTpGh00ss/HJnV1fQFIgV+gtTSINl/sTmc2sAWCnc
	C7Tz6XRJ6JFhAsTG+7/dEw6ETpEB/TKQg1IgZCzrGNEGxV999yz8PkYnF4v3dTapzErglrVnhCR
	U3MOZXcQXPfQMriXHl1gCJ04GX9R7rcSVOoihbU2V7ygWE6jrv/mgKtG7OsAUJUY1+PeGqTAQ2f
	d68pe+8jaYJZDeGuJxHu+WZyqtPvfuBE8loumFQZ2FItSGI3MacrPamp3/PfaaOGDlOnzJDRi06
	BepfIL7dcsg1/pCAgDQgPvRGzskv6trNYO1jwdpUpkQFOfrxeY5wXuouTLpCvI7WbK8qg==
X-Received: by 2002:a17:907:9348:b0:c51:aa6:605a with SMTP id a640c23a62f3a-c510e1a6382mr365802366b.27.1795031407273;
        Wed, 18 Nov 2026 11:50:07 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512341a3bdsm33510666b.32.2026.11.18.11.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:50:06 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 18 Nov 2026 20:50:04 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 06/11] mm/vmalloc: undo what vmap_page_range() mapped
 on failure
Message-ID: <av4BbLb6SxEcRe-8@milan>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-7-hao.ge@linux.dev>
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
In-Reply-To: <20261116071325.263682-7-hao.ge@linux.dev>

On Mon, Nov 16, 2026 at 03:13:20PM +0800, Hao Ge wrote:
> ioremap and arch setup code map their ranges with vmap_page_range().
> When the walk fails half way, or the KMSAN metadata fails after the
> walk, the ptes installed so far stay behind. The caller frees the
> vm_area on the error path, so the next mapping that lands on the same
> range trips the BUG() in vmap_pte_range().
> 
> vmap_range_noflush() now takes a mapped_end argument that the walk
> levels advance as they install, and vmap_pte_range() BUG()s before
> it installs over a pte that is already set. The ptes below mapped_end
> are therefore all ours, while a pte above it can only have been put
> there by somebody else, for example when the caller's range overlaps
> an existing mapping. On a walk failure the undo is limited to
> [addr, mapped_end), going further would clear ptes that are not
> ours. If the walk completed and only the KMSAN metadata failed, the
> whole range was installed by this call and all of it is undone.
> 
> All callers are sleepable, the teardown passes can_resched = true.
> 
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index d99d7710e1ba..5c1eacc2a0ac 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -117,7 +117,8 @@ static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
>  
>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
> -			unsigned int max_page_shift, pgtbl_mod_mask *mask)
> +			unsigned int max_page_shift, pgtbl_mod_mask *mask,
> +			unsigned long *mapped_end)
>  {
>  	pte_t *pte;
>  	u64 pfn;
> @@ -143,6 +144,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  
>  		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
>  		nr_pages = PFN_DOWN(size);
> +		*mapped_end = addr + size;
>  	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
>  
vmap_pte_range() either s=install everything or nothing. At least if i
do not miss anything.

--
Uladzislau Rezki

--
Uladzislau Rezki
