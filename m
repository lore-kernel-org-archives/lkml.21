Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586313;
	b=G5wwjPOC7esR/eSHhCPjaTi/wZi/oiMNQ4xc7bmfSp6aC9PUZRwUAdE3Ck/IBs2Ntuhu
	 EZ8zSdDoMkFtZkjoO+MI63I4M/oO0ppGUWKTuMKh4IZmKfZtREh7G8BZbY5DGpFlqZ7sy
	 AAbeq7jxNPHhQXNCqpWwMpUACPX/SlFmFRHqCqOJrii97gxv55JKu9rVyoA0/gwgsV5JD
	 ArzcnWtbisknI4AC0QkrLuRu5TCOFR5Q8hglg8PX0DV9pZMTw3Oe2mCqjZ8508rsF1Ej8
	 gPsYpnCwqt2MLx44AJDxTwqe3BQ7g6RYv2c8ARhJQMLksJC+TsDR/AjdBHVTttRZgxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xFMuh8nwFoEFZnPvdlHZ2jAd51FcFwkpbhkwnf+oNII=;
	b=sVlJszCNdiI/TcAetO6GXrT7ve52/drgFAhFIP/8nzB9GJnTr6kKru1OXD0+b/BuBcoY
	 NROYqNTnL+fpmIFmqtKnihG1iUPx0iGYC7dxPx1jUSFCV5mSE4zhSlpqwVc5qCw4stbqv
	 f10ot5+wjnaHyt6v3bi1z6olvuHoCKFQ5vfLESrGATlrCkBYSiLNA7hzDLEwKq3azCCPN
	 ym77RlKca3Fd8V4XyF4p0r3HiJcWeuFuxU78Z0WDv9alDL3A6GgaT+zhy04rr91eio1uw
	 NUolFxWllGyjFdRmV8mZZuQWTskGB1lHtOAMFLV3/iDyRsTRWmNF+NfnI4aJck2CzPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOd1aXUB;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C796606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C796606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOd1aXUB
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso2275550a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795586312; x=1796191112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFMuh8nwFoEFZnPvdlHZ2jAd51FcFwkpbhkwnf+oNII=;
        b=rOd1aXUBZU1T2we1TSD1gMFrYvw84I4NgnIVgnPjgI6ToFrPmCcGvY+wbLifcAt+L2
         C2bFeCLYJopHDrOZgWP6+fKsHCT08PKfroIX+E1sCjl2scMS10jbWqM4dOlIDfhZ+6DD
         uIgt7imTPy9cMT42Mr68S2in82+QG4XSAaes9wJx5GyqqAJROcKVBdokUy24gYo5Glgm
         JpqfBKAK2uwB//jl3IGJdQ79xsighQpfjsxVOqHxGPyd1J/ZFsRYTgX8p2CKuaM+kqCE
         qfluF6oW+jwLmuxnULOgetV1QlI2M+hK+9kfLbHckyJ8vqA9OoSNnJPN+9O/VgRE15bv
         Wc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586312; x=1796191112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFMuh8nwFoEFZnPvdlHZ2jAd51FcFwkpbhkwnf+oNII=;
        b=uWLcI0CE0s1pyNrm3Y22UGCuIlb/VmclKSoTXKjvH1BxojlJKYWS3vwDUR73vrZPXn
         2TXleDmgLPdNZjiejNkPR5f/6n0xKBiOlaSd6MSkdVSd+55PXITN3hPDeFlG0ClA7hAm
         C8bx3QsssEPmc+faSCUCnlhwZx8T7+8Y+xr6RaVmVuruw3wDCSanER6I1nQZTMJRamcR
         PMrzn8JSr4wYVaOqS5zNEEPVMSqi8SMen/n3hQ4McBQlPWaezYVfOrD97E3oOIwStpRI
         ye37htjBrbuglnmfuJc1WYQoYKPTdZUH9xRk23e7rtBADnXYZpujzMAN9qXhMuiMuD8g
         UXHA==
X-Forwarded-Encrypted: i=1; AL+hErHitqE8eu8MvfyFenZpFpgz4uFmXG6h6rf0Zv8pScIeS67VPI1SpK3auSurR12ATtYG6MJC1w+9hue9AAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tG61jJMLxOodHwlkZ4XkBQKP97aWv7Sq2qkViRVxQ32iIS4kx
	i1vuq/kNgeQOwDzZHt/AGoy3hgN8Ad1QegrqTdg40wRPQgZWh/jbfpjf
X-Gm-Gg: AZFdTZfiVY8VTx5nV77YOH1xwM8YpHH5A7a61jas9O5uFMymKRWZdKncAPRw+Qt+UgP
	WOOqB09/HJWIh5iHDEVq6vqzNsj3jlGdv5MnQdp096voWbVT5UdfgA/pvXNsSbXhXComaJ4J17O
	M//rGsVPOoyz8J5vAi1nzvrzxb+6/ZLqCw1wvPPVuvLEPh/44yknDmjFXxv3gUG+UOQ+6o0GQsM
	w7wQGPek+8HXO7Dkz/H0N3nBqHEpBDJm9hc6c5daoF8aNFinkp04zAnaIe2yGpbRaHAMuim2jqo
	1SJqj7D86KmkUP49/jWgPBpyThv6234UahY6ar9JG1gwTFS/5C4cBDISoLXbup74f7acz36kxTP
	AKCV+2bxNTRn3Tjj03+cLwYAxstCNMLei2HgZ9+bcXQ30hWRWQkQuNxxLXwFvWCLlsN8MIfuood
	K3Rc02et0vyOYbdnlD68h9ABZQbgF20JAU2Oe6v3/1QbPzTonc9AXyaMqfd9ImBmWg3e93z+2K1
	FJC7FI4gWBAs+YdjQbv8fJutXpzEFos/bfo1aV8l23SEJnFRh7rxsUWTxGHMqH1UfZK4Equx+H6
	awUjLT+ACcZuifDOEHrwjkhwE4gnJadnPo5f/cKT2sJL+bn5I5iU4YXZ69fTngdW5o23Ek5C9jM
	kXz0CrfQeyA5Y9wGnMH3aig==
X-Received: by 2002:a17:902:da8e:b0:2f0:3647:6224 with SMTP id d9443c01a7336-2f03f261825mr147681875ad.61.1795586312275;
        Tue, 24 Nov 2026 21:58:32 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.51.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm78212685ad.9.2026.11.24.21.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:58:31 -0800 (PST)
Date: Wed, 25 Nov 2026 11:28:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 4/4] powerpc/kvm-hv-pmu: Free hostwide stats buffers if
 perf_pmu_register() fails
Message-ID: <awZ4ZhK1GFHKi9Tr@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <cover.1795441238.git.ritesh.list@gmail.com>
 <a9e4029d0e11b3c944f4b4cb781fc5ff1696709b.1795441238.git.ritesh.list@gmail.com>
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
In-Reply-To: <a9e4029d0e11b3c944f4b4cb781fc5ff1696709b.1795441238.git.ritesh.list@gmail.com>

On Mon, Nov 23, 2026 at 07:21:53PM +0530, Ritesh Harjani (IBM) wrote:
> kvmppc_register_pmu() calls kvmppc_init_hostwide(), which allocates
> gsm_l0_stats and gsb_l0_stats. It then registers the pmu. If
> perf_pmu_register() fails we return without freeing them.
> 
> Call kvmppc_cleanup_hostwide() on that error path.
> 
> Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/perf/kvm-hv-pmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
> index a58634f656e9..ec05b4855736 100644
> --- a/arch/powerpc/perf/kvm-hv-pmu.c
> +++ b/arch/powerpc/perf/kvm-hv-pmu.c
> @@ -402,8 +402,10 @@ static int __init kvmppc_register_pmu(void)
> 
>  		/* Register the pmu */
>  		rc = perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name, -1);
> -		if (rc)
> +		if (rc) {
> +			kvmppc_cleanup_hostwide();
Just a question.
Inside this function, should we also take lock just to set the pointers
NULL rather than putting the whole logic(free also) inside the lock like
we did in previous patch?

Apart from this, all looks good.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>  			goto out;
> +		}
> 
>  		pr_info("Registered kvm-hv pmu");
>  	}
> --
> 2.39.5
> 

