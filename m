Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793100;
	b=UILSo4mNaHoyydab0o/LnecxngCiAb8rumkIfJ2f/C3KE6sDp9u8AUkJGVym4Etj1qfU
	 ixFlt3oOtMCUewcZO6Fq0W+lFc1mp0nMxgFa7ex6JX/QvzwCyVTWdMmBnpTUfrCtNo8Fk
	 I//IvTR1hdplhfOu/7nrX25GgktJwsbZeZ4Icl2L1KBmQL+6XiUCU7HHQPYaK+l82xbjH
	 QYr1QHW76++sJxOROzjslf+DYnKpl+8dMnrfGLRzPRvzYcSjPDYWcbjIzsYh2c+LDHsTl
	 T8TPLONi7u0nfwIV5cu3X0/qAhlRwvtpY57qh3RRb7V+flsiRVtBVpe8iPGHoXSdjBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=vNV24U4AHAf2SEo4W0dYm+4A/c9AQ2fP/eFNSMSTDdc=;
	b=s3owrR+IxXRm92hSLhCeavPs//Pr8Yde2j8qbR8oKMINMczQUBHodwRQaueTIugHI/eR
	 QNvtKR5SwSBAG8lJvZHB15sp5uDczdwmcbLnL3U31U29cBjgGPdKdefQhGqHVvim7D/Rj
	 oe8NNAgRAJ1FenxGkI0g1l0i6QvcyY8fTipSMPUZoU9FyZZtQI3QnwFhK8Eabmxte4u2G
	 ewOx/F5Xsua1wnMUHsjRQBpLNtZk1PQm4xynaZC8FnY/ZsLNSV94m1lA0NzmJQSCNf1O1
	 Y7FhDGqK9ozafr2XQjFKr6YdBRARobCmN9MZBURBiSlksIxPRQXswjoT330vd3NQbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bOP1HYM;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A746C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bOP1HYM
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2f0c72f9a1fso23650315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795793099; x=1796397899; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vNV24U4AHAf2SEo4W0dYm+4A/c9AQ2fP/eFNSMSTDdc=;
        b=0bOP1HYM0cT0SdJKdsvNFrWeAZA8XsQLMGLmaAnUXG/M0mTumA3DegAP9vkPAFVxZZ
         mt0vjRvk0KeYC/rPluBdHu1a4o1ttCNzxglWZQZDrzvzIAozzpn/UKq69pgJ5bk0J9zm
         +pT7YlYOZSATTwpV1TqLTNdnVlyzbj+uL2RPJEgACHdPVR7GdTiG4t1eVxvQ4F3uFAjD
         ITgVUjE2pnyerb/icshBQugir44z9Np00hynPdQsdbPbF2GBhN4vR4TPh5sGls2ABXWa
         ki+WzrmWuekM2gUVhqRDTLWfhxdAEENNjmeiRPV2hU9gtUG2TYLuqwCFH77ppSt+gYIr
         eA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793099; x=1796397899;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNV24U4AHAf2SEo4W0dYm+4A/c9AQ2fP/eFNSMSTDdc=;
        b=QrfEKDsDzCCLXZB/ley03bs7zq+MUuyl5nZziOalKSWW8oriKYncUajvCu+5pD1C0G
         ebNnnM2PAafwkK5kG5+bCC6cOIYsqgTwvqertgyUW5nqfnK0fQ5eSN0NolIAYiG63l4/
         lnb0XF/cdtjkeABY8+TFF86vGWN83qzFaGUNTc7jui2ofOQsnn2mrRdwPi203A29MfNq
         MwbfcrIhquSw69nQPIt1ARNd96gMmt4xqO/NzRyrWJua7a0AvOotpJeIJ8JsTJXyd/sq
         bT34ihGdxKHDFvHK02N3Jmj0AeDaBqsX1IdEcu30tj1nO6hryTKxzxHi6KVwkBIx7aSG
         TIvw==
X-Forwarded-Encrypted: i=1; AL+hErFz5nwmDqi7xmBBYtNQys0syJxyZeASaUcxoxjNTyq+rMxJI+/NSE5AkoGC1TK9xNt4tgt6blW4qhsjjrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m/DCgVUWKlNnVLm8YUpkf0pDxz8Ds+qH+tgEOpkp0xJLBaRW+
	qarR/yd82C/4OtgpvEfbuYGnKJ5zh2s6L/9h/N6DJ7skdV4yTLkjm+N9
X-Gm-Gg: AZFdTZdukAoguXJlWNvvSCV6seteynNoM8JB4JOiKVjIOuSfQyZFhmY4HdsoSn7fP7G
	A/LYaCt9kUBCxigZdd76ikfLzkL9irHRjo5Pnj8t2cdBvwxTZ48D8HHWUvKXMqywRs81IXQXlgR
	2o/xM09K0w7lrRWjIADxfxmVxG+pvSdxukHA8RaTYyVVVtxhpYOcCsbM5GaY5gecniLzqrjH4Hh
	u6FgnBKCcf6NXTFW2dc3ZaYxFMSnYdX0SPgL4xmkm44lGdgfrH2f0fOwiuKRpD6Hyn2cEcur+Q4
	kq3Zhdp6Z8NML9OpQcrZCrjAuaG+mAsoNuotZjicYN2QjHqYyihel4qBb5FjVzZ4qFmZv4Nonfj
	yjGsGW/IsBJwEtJTTdRkJPuxZp9ZpAs2MOvbV+WFso5KK4zFbZ/L4vPg8qW9jxUFTDn95423dhL
	f6xjN3noaa8MImn3jCV7BkZejoCkg63xnk1isdG/T+qwov2nKSVolPrFP8ytYT9yJzEHPcOhrRY
	Cid5lxQdLpcwuZ9sGY8RI/oOaqAnJzgEZtS411wvPFgLv5PrkaFeCjuyUJjStq955CHsoq2Bpfh
	Bys2n/dfuwSotOvEGEift4KPUFDCSisAZBiXI7K0FEReVqimWPESEWzLHl6AX7OD7C54yjuUCwD
	gYgOBasfdpVKQxKZoJavEAA==
X-Received: by 2002:a17:903:4b28:b0:2f0:6b8c:deac with SMTP id d9443c01a7336-2f06b8ce10dmr199148285ad.4.1795793098534;
        Fri, 27 Nov 2026 07:24:58 -0800 (PST)
Received: from [192.168.50.20] ([66.90.98.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm123698465ad.22.2026.11.27.07.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:24:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] tools/mm: add a drgn script to show HugeTLB
 reservations
From: Aveline Noir <jm5905938@gmail.com>
Date: Sat, 28 Nov 2026 01:01:09 +1100
Message-Id: <179578806997.38.3754686117717776990.b4-reply@b4>
To: Muchun Song <muchun.song@linux.dev>
Cc: Ackerley Tng <ackerleytng@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zhao Li <enderaoelyther@gmail.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, 
 Oscar Salvador <osalvador@suse.de>, Omar Sandoval <osandov@osandov.com>, 
 Mike Rapoport <rppt@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 Jinmeng Zhou <zhoujinmeng@bytedance.com>
In-Reply-To: <FDAF27F6-A5D1-4911-BB86-6645272E2BD3@linux.dev>
References: <20261126-hugetlb-resv-drgn-v1-1-345a6ee7c08c@gmail.com>
 <FDAF27F6-A5D1-4911-BB86-6645272E2BD3@linux.dev>
X-Mailer: b4 0.16.0

Hi Muchun,

On Fri, 27 Nov 2026 19:30:04 +0800 Muchun Song wrote:

> The Dragon project itself probably belongs to this type of script? See
> here:
>
>     https://github.com/osandov/drgn/tree/main/scripts

Thanks for the suggestion! There was a similar discussion when
show_page_info.py was proposed for tools/mm/:

https://lore.kernel.org/r/aACaf4_molKromnT@telecaster

That's mainly why I sent it to the kernel tree instead. Having it close
to the code it inspects should make it easier to keep the checks in sync
as HugeTLB reservation accounting changes, so it felt like a better fit
here. What do you think?

Thanks,
Aveline Noir
