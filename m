Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440052;
	b=0wDnaQYsVxTcZX8Aux8VIwAANMg/p+M+7Z4gQFlQuyPUaTRI7akpBsQPlliE0BC8UqNn
	 W5v6WDBU0VMMISH5kVGHFSCNs2ROSt7wUfeKJuXVteLhk3xV+Sf4T5ZIRuautCtIotapP
	 YCiW0S0ZNb3HjRAhNgW6L0kFbF2F/QfUbfHBoxj40jCHc3cWEIcYnXBASR+wO/1t7Eemn
	 IJeReFa3JjsM3VXtsHmuuBUnNT7gnL41Q6G3COLXswmTX51pHPm0gL/00uVYnO5apkadr
	 pmi4QZK+DxkWNuZkb8x9WrVC4ajcHpnEvnPDg275CRU8GQDw/AIbnoZjs9sRU7h+wdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nQkJhOs7vzIhcJTG24G8BH/pwTyzsvnAwV9M0zA6cJk=;
	b=4d8gUhtlEmOxw7vKV1wOK+Na5FsCZ/FGp/m1u4w9tkSW4LtyrDSZ7fxA2O9Smk0fCiNm
	 WfEpy2aK6293eiDsrnopV7it78VTX6DdqQZ2fAsSDVNzEnqd/hl5DF5t3pBVb9JBIlUO5
	 QwUtAGe6H5J4Pihq9glJiKpzlZH0GBlaSCIbUCygQuK4pfEknCwlbNghBMtTWq2YxqiqN
	 b96EagphLlZpkz8eIYT6X2VjZpHR7bZN985B90yN6BlMEcfXDnCUhpb9EDwLM1lIoudIZ
	 7INqosKyJ87Nt5vXEDKcBotH0nshEwjx4Mh2UqTIcfnFLEiXtEAiu50rixR9R4DQymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dirbU1uV;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8AD606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8AD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dirbU1uV
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5126505cb3so415886966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440050; x=1796044850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQkJhOs7vzIhcJTG24G8BH/pwTyzsvnAwV9M0zA6cJk=;
        b=dirbU1uVg5XYaOLNs53rZEhqmiBZ/CARf2od0etpll4SmO5f7QaZ0/3zG0qKgtTjnG
         R6348TQ9464RhMhWmuw0QyPZooAwoBfor/MDsoFFQkPYtqp+g3fQVbSnScKFGSsT5ZWg
         rik85kKKtu/yQdPGauleEjV2J50e9ubejPI5wtkcEPJpyi1K5UjJMPP4r7MzbF512huD
         wKDL8/EZrESb1ECauFwmkW1ia5m8KZEu7vMWRbZZXOlBBbJN2zV5RrnqF2pll6nV/NxZ
         zvjAGjz5Z/9qtriSKjDuOjzHmx8/tWB7GxwiZx4f65IGcP5p3dkyU5YA4TAAtlnYwskA
         n+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440050; x=1796044850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQkJhOs7vzIhcJTG24G8BH/pwTyzsvnAwV9M0zA6cJk=;
        b=U/M+skqoLGnJoWF87/Lfc5iEyBpvEgb7JI2Okmcw6d4BvGWVPvpOMIcPt9bRrEi1do
         gRF57B3B3dDjzKQDKDodh8/buBp0OfB+oHDTJ0GfOyBdHW22rUTTTNxVWv1TmIqGp9xp
         1u8k69oGYoUKTOeoOJYOyod6SMdbB92zEVsyaUYpoHb4dmL33aH3vbtkvhR1lRXy3mzK
         kl8Oiv5hjgJWxlBZAswpBb23r0RWDhUAYkC41nQcNhrB/fPkBxBaSQUIrXmjEr+E7Kom
         Z6oadOOopDQU3ikyA0ODQYhcK35plOuemp9C4ZF0TnLKnSR7Wqst3uCcCL47p3H6y6SB
         NvRA==
X-Forwarded-Encrypted: i=1; AL+hErGJFBPw9kNHb3dBCxiTs2ZVvAtaE+05swRo9DLp9aipA305MbAl++iRZQBsz9MiuKM+sHlEMz8m2FTjW1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PVMg7yrZyOIiI/CWdwQMkXjcO2rlvotaHr/1vWRcaVf6lbeex
	Iabz1MCyBnkz90+zrxIe4XwRjZnhZwp5I27wSYsxzw2ujvg4AnXyIbuI
X-Gm-Gg: AZFdTZdCLRSUtsnL7aUXZSQYeVLf+8KxwAlHaGxWOcRDvOFndV8ppygmct13CeOxddy
	6kZYsJzBqk+lTKoMuSzrP9SKgeLr8hN56zfPVVqkg1DuEEeNilzRSd32028X2//tsXKg/7kfQV7
	frdfF3DdqpeXKor5aeztiexHAZxuw6zTohrm3Rr1sFiOpahwfg0aeLJMCKSg0gBj6+4mTTD6vg7
	LtsnW5xQHr/iz+F5CnGP354R60rH9VhKfoVKoADMby3ZFgam3vSrG8vNVCCpKtdC28vTqmnX+Bp
	Fsgl41YiIf+aH1Qsv7Cre9dVUX2Ir0aGUQr10OQpo+krX6ycKkAONksVguI2WNdCai0P9FLVzYm
	GrNhuVADr4050E2w31WCSRZ3Rn1spxTGClmQeKAYLELUzEXVOXkAmMM4nhpngaGu8s0OkOFO4Gq
	HLpBXHNwITmkhQJFq6JJUm6mgL6mjXLVpdl6Lk0CLIbD192o7vnrHxI29nvfjEhoaCj95FwqDSB
	dkje5pEibG/wYRF+UeXe8ubGCOenu5M7Y5yl1qp/rggtRGqw7Vw4JAE47maQ4r6XAdWp2OVwbzA
	mgep1X5pFP/1AEutN09X1EEhsPtKjTyFBbMQehbSGluOE2n9Ale/dsTVilH24pA/9c7JfVsynMd
	m0VPcCJXQgg/UhdgZLNZ2UfZzHmZX8oZAXPVJYyl3WY1nIoUGw+s2ZDvQ2MY9bcY1E8MevPuijn
	hMn1ivCMjyNt2DfeGCv5Zs940PQg==
X-Received: by 2002:a17:906:7d42:b0:c4c:d6a3:f4bb with SMTP id a640c23a62f3a-c513a999e3dmr691793066b.10.1795440050008;
        Mon, 23 Nov 2026 05:20:50 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm411477066b.84.2026.11.23.05.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:20:48 -0800 (PST)
Message-ID: <2784354f-34f1-412b-aa95-70603f2f8cf8@gmail.com>
Date: Mon, 23 Nov 2026 13:20:25 +0000
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
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to truesize
 for managed frags
To: Louis Thiery <thiery.louis@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261119232935.1708458-1-thiery.louis@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261119232935.1708458-1-thiery.louis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 23:29, Louis Thiery wrote:
> Registered buffers backed by huge pages are coalesced into one bvec per
> folio, so bv_offset is relative to the folio, not to a 4K page.
> io_sg_from_iter() adds PAGE_ALIGN(bv_len + bv_offset) to the skb
> truesize, which charges the socket for the whole run-up inside the
> folio. A 64K send from 1.5MB into a 2MB THP folio adds about 1.6MB of
> truesize, and sk_wmem_queued fills long before any real memory is used.
> 
> The visible effect is a socket that looks full: with a 2MB send buffer
> only 4 of 128 queued 64K sends complete before the sender blocks,
> versus 30 of 128 with the same buffer registered as 4K pages, and most
> pipelined send_zc requests come back short.
> 
> Only the in-page part of the offset matters for how much memory a
> fragment ties up, so use offset_in_page(). This matches what
> zerocopy_fill_skb_from_iter() charges for the same data.

Looks good, thanks for the patch.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

> 
> Fixes: 57bebf807e2a ("io_uring/rsrc: optimise registered huge pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Thiery <thiery.louis@gmail.com>
> ---
>   io_uring/net.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/io_uring/net.c b/io_uring/net.c
> index 533afd335..8afad1b2d 100644
> --- a/io_uring/net.c
> +++ b/io_uring/net.c
> @@ -1501,7 +1501,12 @@ static int io_sg_from_iter(struct sk_buff *skb,
>   		struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);
>   
>   		copied += v.bv_len;
> -		truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);
> +		/*
> +		 * bv_offset is relative to the folio for coalesced huge page
> +		 * registrations, so only the in-page part of it matters for
> +		 * how much memory this fragment ties up.
> +		 */
> +		truesize += PAGE_ALIGN(v.bv_len + offset_in_page(v.bv_offset));
>   		__skb_fill_page_desc_noacc(shinfo, frag++, v.bv_page,
>   					   v.bv_offset, v.bv_len);
>   		bvec_iter_advance_single(from->bvec, &bi, v.bv_len);
> 
> base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d

-- 
Pavel Begunkov

