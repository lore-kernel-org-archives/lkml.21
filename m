Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718072;
	b=dgkJy1nO5JfXBrXPp8V09Gc4jxnCA6DGaAYNxCEFFA8aBkFW0/ArmP4CsZfbMmoT/SGF
	 Uhytg6uVJZcD2Bp6t8TMzimACvyx2SnoAS8mgoEZSvMdUPODlq9TeiZzw8riiSLUHFFSD
	 btIFZyu9yWHJDLYqRrG8UmldrdLXoEvAHSBac9KoEumcAIjecwird5SmnXeQVtC5PRvGx
	 a5zWvANW0xOLhE0bAhrcJd1mIGeAHqU0i6t4ovBvPMTHOa9hlXUFzGBVw8BYPsxVEbELT
	 2rc0Tqf+1Y6/pmVV0LgGMUjSBBSIvX3WxzptM6z8LT6oPP38Vd1DNzgKaUM22+4YggA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718072;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WpWOMOBXLpseWsTI54gapbQDoJPIf/gIWtR8WvSGak8=;
	b=dkYysrVAItROMAZOzt/ZQj0uZCtIe0Ufv9nF/MaCfyAhDCva+eNKBw/LrBD9HVTdWxPE
	 T01uymuHC52b14FfRvftSEDTA0MS/fFDcd6+3i2YKA8YoxAub2PlELom2SNmnGHUVaMCg
	 UmEIYnAb8Ml3Z/iG1pWudbCvAgGhFj4t4YBe0Uh8raQMtEbFdFaGCwE418+/bSz6545jG
	 84aboUmcleExizze9T2AC2N5Mpwzeh8bPHHHIppyNThmv9wg21AwZmTG1R8n+hcuyB3ko
	 2aRiKOhniXhWdH4EYZsidW9wfKOObvAyKcaZZXemiBjh3DVHcHRB3W/p5k+X7K1q4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3btqzB8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3btqzB8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F121F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718071;
	bh=WpWOMOBXLpseWsTI54gapbQDoJPIf/gIWtR8WvSGak8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3btqzB8gAbzCnDC2ConCPT/CRsFYpzQRQ+gN0WdiN89OEt4F3k9/Wmh64/58OdJn
	 /rLh/vhLaPLmPAC0bTVO7pqCfZquct4g48VXiVkDztK4URVyLfhcsRmof9xaE6J2ki
	 Y/mkqRTRzrOIODjFbo3tUjYbSxEtgRB5xbWzcmk1x2UsHXFJsPITOfQf0zX0U5xASd
	 lD//ZD9dKRxupdOudwLQVeAhPlu7XSCi5w7AGOhMYX2mXuqu8SCnVh7M2j51z2EkOE
	 +ONXAMrilD51v/GAHPOzdxBkM5T0dWvBlP9x/IvVwtOxFHyFrQvYKfpfO8HwCYM6YM
	 xl5YSZVR1fyew==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4322d310e7so247440466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:34:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEb5YK1p7CivmaplBxBmig0sPmDF8y8BiPWypqgnyylHzPtJ7KYCSM/cUEdt9r3n5XBHxcIgcowGYZ51yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ann2jljxC1BRSmh4WW/u1FpfvFKku7aAJI7j8nsdrpNBNqFog
	+Ey/dyQcgVHEgn/0tFKP+z6z+QG7ip9uxE+oYlJZusP1EUltsg0IJ4JY5QhDAq4NmIL45oOp8av
	6EHZhrksZCHL+24aln5EFhLaaHnjNFN7/BkyDhnjoRw==
X-Received: by 2002:a17:906:369b:b0:c46:ba33:1f0a with SMTP id
 a640c23a62f3a-c513ab2d54amr1405520866b.31.1795718070544; Thu, 26 Nov 2026
 10:34:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795439990.git.lianux.mm@gmail.com> <e920cffdb3a65905dbcf51fa3520785a8c49fcb4.1795439990.git.lianux.mm@gmail.com>
In-Reply-To: <e920cffdb3a65905dbcf51fa3520785a8c49fcb4.1795439990.git.lianux.mm@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Thu, 26 Nov 2026 10:34:19 -0800
X-Gmail-Original-Message-ID: <CACePvbVr7A91ya6P9Sbx9s+V6cVqba-avHCBnJDViKW2f805zg@mail.gmail.com>
X-Gm-Features: Aa3M54qnFahPYvSkr8RQaB-gaD5UQ6JhIZIe7bMtBUKRRmfXwB7jDLedU6V2ZBI
Message-ID: <CACePvbVr7A91ya6P9Sbx9s+V6cVqba-avHCBnJDViKW2f805zg@mail.gmail.com>
Subject: Re: [PATCH v5 09/19] mm/swap: avoid direct reclaim when populating
 swap cluster metadata
To: Lian Wang <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Kairui Song <kasong@tencent.com>, Jihan LIN <linjh22s@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:18=E2=80=AFAM Lian Wang <lianux.mm@gmail.com> wro=
te:
>
> Swap cluster population is entered from swap allocation and may itself
> need memory for slot metadata. Its fallback drops the device and cluster
> locks before allocating with GFP_KERNEL, which can reenter swap
> allocation through direct reclaim.
>
> Make this allocation boundary explicitly non-reclaiming so callers can
> retain outer synchronization without a recursive swap allocation.
> Clear __GFP_DIRECT_RECLAIM from the fallback request while retaining
> __GFP_HIGH and __GFP_NOMEMALLOC. The retry can still wake kswapd, but
> fails without direct reclaim when memory is unavailable.
>
> This can make metadata allocation fail earlier under memory pressure.
> Keep the existing isolated-cluster rollback and restrict this request
> without adding a task-wide PF_MEMALLOC scope.

Acked-by: Chris Li <chrisl@kernel.org>

>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  mm/swapfile.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index cd2cb360f274..70913402a265 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -586,13 +586,14 @@ static void swap_cluster_assert_empty(struct swap_c=
luster_info *ci,
>  }
>
>  /*
> - * Allocate swap table for one cluster. Attempt an atomic allocation fir=
st,
> - * then fallback to sleeping allocation.
> + * Allocate swap table for one cluster. Attempt allocation under the loc=
ks
> + * first, then retry with the locks dropped without entering direct recl=
aim.
>   */
>  static struct swap_cluster_info *
>  swap_cluster_populate(struct swap_info_struct *si,
>                          struct swap_cluster_info *ci)
>  {
> +       gfp_t gfp;
Nitpick:
gfp is assigned and used only once here. You might just as well make it a c=
onst:
const gfp_t gfp =3D    gfp =3D (GFP_KERNEL | __GFP_HIGH | __GFP_NOMEMALLOC)=
 &
               ~__GFP_DIRECT_RECLAIM;

Chris

>         int ret;
>
>         /*
> @@ -610,9 +611,11 @@ swap_cluster_populate(struct swap_info_struct *si,
>                 return ci;
>
>         /*
> -        * Try a sleep allocation. Each isolated free cluster may cause
> -        * a sleep allocation, but there is a limited number of them, so
> -        * the potential recursive allocation is limited.
> +        * Drop the device and cluster locks before retrying. Metadata al=
location
> +        * must not recurse into swap allocation through direct reclaim: =
callers
> +        * can retain outer synchronization across cluster population. Re=
strict
> +        * this request instead of granting the task PF_MEMALLOC, which c=
ould
> +        * give allocator hooks and failure cleanup reserve access.
>          */
>         spin_unlock(&ci->lock);
>         if (si->flags & SWP_SOLIDSTATE)
> @@ -620,8 +623,9 @@ swap_cluster_populate(struct swap_info_struct *si,
>         else
>                 spin_unlock(&si->global_cluster->lock);
>
> -       ret =3D swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEM=
ALLOC |
> -                                            GFP_KERNEL, false);
> +       gfp =3D (GFP_KERNEL | __GFP_HIGH | __GFP_NOMEMALLOC) &
> +               ~__GFP_DIRECT_RECLAIM;
> +       ret =3D swap_cluster_alloc_table(si, ci, gfp, false);
>
>         /*
>          * Back to atomic context. We might have migrated to a new CPU wi=
th a
> @@ -3160,9 +3164,8 @@ static int swap_device_disable(struct address_space=
 *mapping,
>                 return err;
>
>         /*
> -        * The swap allocator doesn't take swapon_rwsem. Looping through =
every
> -        * cluster lock after clearing SWP_WRITEOK ensures that allocator=
s see
> -        * the updated flag and that no allocation remains in flight.
> +        * Drain cluster-lock users after clearing SWP_WRITEOK, so swapof=
f
> +        * does not race with operations that started before the transiti=
on.
>          */
>         for (offset =3D 0; offset < end; offset +=3D SWAPFILE_CLUSTER) {
>                 ci =3D swap_cluster_lock(si, offset);
