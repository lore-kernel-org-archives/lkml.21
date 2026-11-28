Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795839261;
	b=fP+cRfO4nrPPv8wmKZjHMrCLA+75LoXEdZYrOqpV4jJMdlpXMi6wFQuBw7QW2UCdI9pK
	 6v066KLuT9iMQ8dfoJZPOi3xJsy4NTkmRsAfpcjk0lWvZI9zWqGx3l3kzeVhQCEkdSAWf
	 +0pks2xELSe1oP/SOlIXb0K7Eyzx3tx/ESf7IF5QBwiK+Ihhl0XAfTdp1w2LXlYoFnrEu
	 eLhFBpd5P2awEc59p1IKY9Z6ueYi8MbT4GuD8lObkeuGJn4yisKQWKKN1agStW17eVut+
	 5cH7FQeP+InSwRK1Uxa1DdUHNX4qS7Ng7f3JnS9WWwznafN1n3iNQJws7RVOygPTUBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795839261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MS//VKnhVp50xvqDF1t18JZigW1wyOpsxLJLVKtzR6o=;
	b=l3s3BIomhu24xZguVOHzbKItHbrV4yf2v1KCKVwdJfyM11mVvg/7hnO5xLku3uzOcGlb
	 9N7F/cz3qqIfvjMQtJc5Ej2+iXx2+FXkd+DpizqjLODdbQKREA2ohd9hcv8DJ/GibwNYa
	 360KKf7u2/ozJTaaFDsLw+PaeudiSOMzkgU0uplDkFar2DZmNkOJAT60BlsUaPA6T48rz
	 hg5/R9pRnsAiKjyUGYHYHdTI0mDB+dWV6KR4QuFZDDwxQ86CpsKbqvug1zxNftuMzZASc
	 /JWu1pQa6wXOJT0lKV1WIqcraZ1AI05IZHFmijUdDSdDDbHDJqB4MZagpZzCbvvWsXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrP+FsLp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B4D606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrP+FsLp
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5725b4210ffso3391962b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795839260; cv=none;
        d=google.com; s=arc-20260327;
        b=mxb+0cys6c/dHaFbYNG8kCWrUO3Ibgql+AQbMlmbJMDIk8xUgf9OTqFVWOynIukQWj
         f0OWe1uUvaVTWFg6RNu23RP3gLfdl9RRB75aIYN6q06KZv+6J3LKcD5XN4K6omtzq8I+
         UCzcQPOfM40KuplpV2+fRdovhcG62bnFTGXDcSbuw8jCPgQFYKvG/WUDIAW+LoqOnjJY
         aChnAnrLo/PwQjWoPr0C0g2tkbzb6NfWBspXADZjfQJOOB1Z0L4pPO+Fjqh6AlrJ7mG7
         jEUlYndsGB+3bZX7Ec3U8SVDwiUsPk41pV6jZvcmQ49IpM/haBxMDNDhtevUf8Qv0pWY
         0q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=MS//VKnhVp50xvqDF1t18JZigW1wyOpsxLJLVKtzR6o=;
        fh=g5x+3gEm8j/Fiw6l574envl+hSbRb6k3btZAMvD8F4E=;
        b=XkQ9Zkq0f4UdJHjn0SwzaJ9+6ml0/05/fgHhwiNx2K0X+ApP0IOir/yB1Np6GmjmhK
         vnO3Ax4oMeLVSCtx4hg7WpaoSvyzQzhsT/h6YOxJph8nuuD9npSdpSi1gSwFAGzsO7ma
         hVy3cDxjj+VuJ4BAFxkT0fyT6ku8IOvgaQITqAn+e7+2sZon9FJ+ZD55bA7UzC5f8L5N
         8IkV31SbVn4/TOyrTmM7pQM6+07Axi1PD+UbKPTEkbwCy99+Koervh5+sp/8KQfhh0Np
         2q8vxwlAtrfvCPulyOihpGdyiO/6RKXnWOURfbjbwzSDKtbaXlSB+lAv4+O3KvAo7/99
         DNxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795839260; x=1796444060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MS//VKnhVp50xvqDF1t18JZigW1wyOpsxLJLVKtzR6o=;
        b=IrP+FsLps40tEaFcgM0TtM0CvjFAzb7zJJm6QqkhBRrmYhvt5Ga/oJ6LeGam6d386n
         Zd1hwMSm6zqDgGPX4eTo+/+abkjmHrWCANsh7rRI2q6qDmlW4Gwj1d0bBo3T8WfCxA5C
         KTkuMDMba/J6FX/WebXAfMUo03T1yWtFnpUQyzT4ffYePz2Yder0iGMKwJP03kmEwLyj
         mP5TW2ZpHspVPZLTxhP3eUwvQP4RteuxPtRB/AR1HUuxy0H4dx0RQVopFw1rZhRDhBAy
         eEB1ByjtPMQW2FrHAShLC+07ts5885LACx2s8oalHSMhvsWFZOFGxGYqgvwMGFXrwYuK
         upKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795839260; x=1796444060;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MS//VKnhVp50xvqDF1t18JZigW1wyOpsxLJLVKtzR6o=;
        b=Qxksp4JPVx+/9cJki9VQ+2eGM54stb18ot6k6//yBbU5hxcO4nZ8Zca3812zkd4faB
         dHs8KRqIpFXIQopDPV6jeu5MJ8yuW4bfNnuLIIFmTC/tfzZP9zp6gv9sEXpCcMIB+F8p
         rgDmXkAeLPfCDdohHqx1mr2fYDgvU7h8TrlTH83dGEeWaE/F1d+E7ijoV5MBpC3KMfdC
         ZdbwcU0x3PSrIlcI2JfKkj206n2YeVprn19gwVzpEevqs2eDpN72K/fGkDloWJYPMVKr
         pv87c9H3DXjj++33Bj8D4r5br/QzdksEc6JWWRE6blRwMhdE5t3ZBs2wEqMJFtTHLPJ+
         XRtA==
X-Forwarded-Encrypted: i=1; AL+hErEZ5zKhZhz97KncVVXQayRBjy6WUBgwiNU4EmVc0zq2k4znlH/Ck0fPMqPjV2j0c1Kwx8qSQTfIsoYpjuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z97JEcDKfMs0Xl+Bxt0yWyax0aAIGIOdxa8Ni7oADtEgViT8kaN
	IcyabnDf+bJKW3NvnyIfEhex5oc5dq4jpvp10va5a1o63cHfW41VEOdL1hiEAOnk6PVKMIngeTD
	7qViZYvbUWtEQunVE/d+5oUcIZL+pkTg=
X-Gm-Gg: AZFdTZdR0S0LG67oH9FHGEzYGqcvSC74wpXRe2XoKDid9uWn0kufVmIt5LbTovLD/MM
	ssRlXRfHXGMoom7KcvxVIJwCU+p5TTC7XMlf911abF1z5vhOSaqiPB11xHG69q3hb7kN2lYNQBr
	iM2lmQbEn6JQcBtmgfk1WuBrFeMG7npGjAQoa/+Cd2F1tC9x5ZuF5dpq2/x6BTKqJ4yt5FHYqM3
	xyiad/NocpSaiMl5YvIFc23Txy7/V9d9bcGL26q9gh0MqK7Tx3xCoXaQQxuhzBILZCvi7xHyZWC
	2fFFxlSJ7u43fOzrp65g826fzjMfuudLrZ12jzG+erckVQs61MS0WDVKJzNkobFDRLys0YZlmJi
	HGKc1nf0yeVKMx79wkLdl11MBAMgMqY73wRCv4koUxDJPtT8QOskfUJgbzRNei5rwBi4wb5LZ37
	D7cQQM0Snv+swiJI1Sl0T6wmE29uk=
X-Received: by 2002:a05:6808:1307:b0:4f4:f5b9:8c74 with SMTP id
 5614622812f47-57a035c6c3bmr32958979b6e.0.1795839260304; Fri, 27 Nov 2026
 20:14:20 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 20:14:19 -0800
In-Reply-To: <43b57ca6-cffe-4fc8-9622-c3e3645d2976@kernel.org>
References: <20261126-hugetlb-resv-drgn-v1-1-345a6ee7c08c@gmail.com>
 <FDAF27F6-A5D1-4911-BB86-6645272E2BD3@linux.dev> <179578806997.38.3754686117717776990.b4-reply@b4>
 <43b57ca6-cffe-4fc8-9622-c3e3645d2976@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
Date: Fri, 27 Nov 2026 20:14:19 -0800
X-Gm-Features: Aa3M54r-r32KsiX1w3Mdj070u3Cv8hWU9sq7tSG7Lbv9wlW3EVgewOgfc-zGfmA
Message-ID: <CANOyQmF=a=iPi65witUpcEtSMtVQ4g-0g5NeS2aa755c4gKC3A@mail.gmail.com>
Subject: Re: [PATCH] tools/mm: add a drgn script to show HugeTLB reservations
To: vbabka@kernel.org, muchun.song@linux.dev
Cc: ackerleytng@google.com, akpm@linux-foundation.org, david@kernel.org, 
	enderaoelyther@gmail.com, joshua.hahnjy@gmail.com, kmehltretter@gmail.com, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, osalvador@suse.de, osandov@osandov.com, rppt@kernel.org, 
	usama.arif@linux.dev, zhoujinmeng@bytedance.com, ye.liu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Vlastimil,

> and automatically detecting which scheme applies (not from version, but from
> what fields exist or not in the relevant structs, etc). Like e.g. the crash
> tool does.

LGTM! I'll work on that :)

> IMHO it's better if the support is part of drgn itself and can be adjusted
> with kernel changes while still supporting older kernels at the same time,
> [...]
> the user, who doesn't need to fish for the right kernel version's scripts.
> Which may anyway become out of sync because nobody notices, and are only
> fixed in a later version.

Regarding placement, this ties into the discussion you, Omar, and Ye had
back in July:

https://lore.kernel.org/all/20260715-b4-objext_split-v1-0-9a49c4ccf4c3@kernel.org/T/

For tools closely tied to subsystem internals and accounting logic, I
think there is still value in keeping them in-tree alongside the kernel
implementation, as it can make tracking relevant changes and maintaining
the tools easier.

It would be nice to reach some consensus on the criteria for making these
decisions. IMHO, the criteria Omar outlined previously seem quite
reasonable:

https://lore.kernel.org/r/aACaf4_molKromnT@telecaster

Adding Ye to Cc since he raised similar questions in July. I'd also be
interested in hearing Andrew's and Omar's thoughts.

Thanks,
Aveline Noir

On Fri, 27 Nov 2026 19:55:45 +0100, "Vlastimil Babka (SUSE)"
<vbabka@kernel.org> wrote:
> On 11/27/26 15:01, Aveline Noir wrote:
> > Hi Muchun,
> >
> > On Fri, 27 Nov 2026 19:30:04 +0800 Muchun Song wrote:
> >
> >> The Dragon project itself probably belongs to this type of script? See
> >> here:
> >>
> >> https://github.com/osandov/drgn/tree/main/scripts
> >
> > Thanks for the suggestion! There was a similar discussion when
> > show_page_info.py was proposed for tools/mm/:
> >
> > https://lore.kernel.org/r/aACaf4_molKromnT@telecaster
> >
> > That's mainly why I sent it to the kernel tree instead. Having it close
> > to the code it inspects should make it easier to keep the checks in sync
> > as HugeTLB reservation accounting changes, so it felt like a better fit
> > here. What do you think?
>
> IMHO it's better if the support is part of drgn itself and can be adjusted
> with kernel changes while still supporting older kernels at the same time,
> and automatically detecting which scheme applies (not from version, but from
> what fields exist or not in the relevant structs, etc). Like e.g. the crash
> tool does. Yeah the scripts are then more complex, but it's much easier for
> the user, who doesn't need to fish for the right kernel version's scripts.
> Which may anyway become out of sync because nobody notices, and are only
> fixed in a later version.
>
> > Thanks,
> > Aveline Noir
