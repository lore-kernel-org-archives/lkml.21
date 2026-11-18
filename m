Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985222;
	b=UXjGMU+qVjIkRodfeW/nkd8vgRZc4AlvENf5fdRkBVZNXaXARgyNqvNiXtUHdgjnKzC2
	 OO1tkjEyUj8UecMHxZM+vTAePr75bNCmEIytIGtievWm4ae5xi9MxBWte7IsHqNqiJuMT
	 eJCYu9r5TWtyaNzQpQz88tEbV6CmQ0rOD+i/X4x/q0nvCdOmdw4WizT+nkqPjgyzxR5sL
	 wWFMCM1wkuU5lAChb05vA74SehzqUn4JlkS6tk9LZe3JeY8fiIIKxMCcMDTwztLCr/VP6
	 CBYBYNPjRHYlQNXEXImrmPx9a4TLp3CNUn4mf2T6wKKbrteUKogmjp7MZpsrlvwc2sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
	b=iq6H5tgEcxMnJB8qUgTUdV53qRYZGkrgkVzjtkEt+MHDo1to3Peyx9JyM1hxxzWeh/qG
	 ud1a/V7oL9Rn3cRP8/kbxcc5zzDKhg9LZObWfLVApi5CUXd8f2wQ2KC6yJuJgvxnkdced
	 ZrpFLyL7nWM/tAUx4HEbRyp0FwLqYsAZNiJ6ahRFq41JzkNrkZHF+choSrV0ji2OUljyX
	 VRsty0BKVxsOl8SEhEc9W3FjrBnn+2PbFBZP4t1PrBIuOkbZeOhGzdKM4C6Rsk1Mc6Usg
	 ivaFO1tHqmG/TxtZaOS0oJonMs211Jqdv0FvZQjLiD081wZKg4asoVahDNo8VfnZNzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OVWGRyeF;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE15606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE15606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OVWGRyeF
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb684859cbso442914a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794985213; x=1795590013; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
        b=OVWGRyeFxxDRpNW7KWJCLbWei4gHffCAidQTaSERnk/N7Ey4ap+vKQB0LEUiBIxmKh
         xPGbw0lCTucgL3/rxvZ5Dy8y1+Y8avdQ+WZ+P8Gr9gr57tOAcMRfjNf5HxHhcIaHxBM4
         NGlrnqsJ1vP8UMeneSTEuJpOlXHqAZrkOG3Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985213; x=1795590013;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
        b=V3+ceR0fRfs1EFNH7jxHRJTuXJX/GmCDv2SRQgm6imMXEjndhjaNfOewQocuUF2+RT
         hEcqi0XpS8clyrUvEowxajIs1R07yxmvdIDzE27p8hYyU5itoNH+4XUP9lA61LBM70ht
         Dbev9g+e5F57/u9doAgt/4e0DgElVNAG+ZmZiLKCYXP++8uyo4FFHwV0yFErfhWZUfht
         bgV3NxmMakNM6Tg5gqovYZdMmmmr0Pj4itczD6T73nIY6yVu7layQI2h2lJ84fP6jjin
         RKurSIJ/aUTDZqoXnopyppsHof2CSVQYoKUYuHHFvIlammwvk+WCpgwnTfhwgOe8QNOr
         awVA==
X-Forwarded-Encrypted: i=1; AL+hErE/GaE/MSIcpJZPD6Kn5xEh+Qhjrkc8SRcvHwEUFVYugAf870PE2YSbaxQnszTm69D5EE0Ibdo/H4DBqqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xbQUWM2rUA40+UfWLCBfRPaldNbQC0Knq/yShRELQfRF5Y33W
	wuyItyU8EQCym/JsuQ/s8npUpwa/w24LIsqOYs9VvSxZao21JM+A6wWoig34FYmpWZY=
X-Gm-Gg: AYBFou2PBx0llDMhJugsRwGZSCS5lBkbP0yuhMCoY1/igBOYHFEuIo8ZT0WVMxwWbVX
	IgOkV/ciPDKgc35fcDIAOBQUbdL5ZmQBOiSPqxV4I+JwJPxRX8srQKl550kyela4fFF68kTrFBC
	8fxcyXIYZCOQvo+C+F8IAsIjGiSHLEoQsDDYQjIHFtwq7McdqUNRwfwSI01Msv2DQgqVh03TC9p
	6cvOQ6NUUwI0WKjnl2EjrT1iiPTHjs7ojIy69pmz7H8nJFZPZlKRTaxQZO1g5Lz1TJda/dJgK80
	5rwjJLNc9zLLZm1aJ9EZn8iiB0n8L7seHCJxmNGP/hVII+t1jvFR88NqW0JWpR3fI8zubKdVjm6
	saR5lLGO+9JEp4M3kj8jdTC6bzqvyRzLK+4/5/5gOPaP5JhPVr/MomAyOoVy608qpCi/Dwjm+m4
	L4746g+hbVSuIX6GBesN5FiUyNn5RwqxA2DQgEKqB0H19sbY+OF8Ga/KhWCLaT4PcEaFcsKDZoY
	vKjVIPW3Mz1mNGhRzZ+1d8H2zFJGBvDRWM2nNbK6gwAFRfKaN76oitN5yvlSQU5tx6tZnzbRPiq
	0FJNTg5EDMjnE77NdGF2df0vu41tC+S7eVkXH9AjjN3EgzlCjoWXwYb7HXkue84K0rrsJrvcg9y
	KOaIQ7XSjcTPDu5jISLa5wOI402bhvo1Ld8qaf5aXKQGHuH2NuV2f1KcrTEFgkg31Tc0Jeur9gt
	Td1pwhCWcEpLThktpbiDJCuUsEeEwM/L6IE6h9LKPr8ylFFBhH6ucXpY7qP+HmMYi0
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr2082401637.15.1794985213105;
        Tue, 17 Nov 2026 23:00:13 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4bc20asm635004a12.27.2026.11.17.23.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:11 -0800 (PST)
Date: Tue, 17 Nov 2026 23:00:06 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
	SPARSEMEM
In-Reply-To: <3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-6-songmuchun@bytedance.com>
	<avzsFxVqO27Vf4Db@chrisdown.name>
	<3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <av1M9itGiTF1Akqi@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Muchun Song writes:
>Mike's suggestion considerably simplifies the code, and early page_ext is
>only needed by optional debugging and instrumentation users. I would prefer
>to keep this approach.

You're probably right. But can I cheekily suggest something in the middle
perhaps? :-)

Given the zones are already set up before page_ext_alloc() runs, perhaps
you can pass the start of the node's ZONE_MOVABLE as max_addr to
memblock_alloc_try_nid() when the node has one. The general idea is:

     struct zone *movable = &NODE_DATA(nid)->node_zones[ZONE_MOVABLE];
     phys_addr_t max_addr = MEMBLOCK_ALLOC_ACCESSIBLE;

     if (!zone_is_empty(movable))
             max_addr = PFN_PHYS(movable->zone_start_pfn);
     addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
                                   max_addr, nid);
     if (!addr && max_addr != MEMBLOCK_ALLOC_ACCESSIBLE)
             addr = memblock_alloc_try_nid(size, PAGE_SIZE,
                                           __pa(MAX_DMA_ADDRESS),
                                           MEMBLOCK_ALLOC_ACCESSIBLE, nid);

I briefly tried that and it seems to work quite nicely.

But I don't object to it even without that, so feel free to add either way:

Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
