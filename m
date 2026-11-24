Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541094;
	b=dOWVctyMtlbPApyuC3cwRNgy98avPD/thCXVrueLoWhBxQgkUGWfHCT2m2OML/x9cZYl
	 pQLNtApqMvzB4KUTGBH3QgFsnQWJtSPGu/7Cf31wPCIJ9JWz/i/TUSCnddVoBFJcQReXY
	 2iqOVQWubtMEomugxtVs1kUv/4Iw2NTpiCgZasITn8TvNmzsNUfhAu3V5i9RmmD3jYVzM
	 quJx3z1OADrbSsEL/0vmhf39A7Hwo26BinrYKTP/EVLTGRJ6xez3dHfp40p/gAxBcBzZ2
	 FTXhcuEp9gUpn5F/DcM2shgTzN/Mqdl4P+oBx0HBWmVqL1wrc50MWjZ+9b2KmWF3wiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ozTidCXqTzSwi9dcCKWD5fJGGI9rCJsLQ/Ov08gLSsk=;
	b=UMuhwdE7B8WiLoF87ROjlc8eoJlr9k/ljVEx5KeMN/hcw8Wi5RFlxKeoagySSfFfM56Q
	 iUvWtRLl6NnVTGZKFehEbBxhGuy+HnXA1H2cVkQ037Vab5j0gCx/h309rTwdU3sTuHg2p
	 E5NutpTGn791sDqnSVdOdzDayF9iYxnsaOxj20JBy5FTOukZceESUAage8C3+KuZZR3v6
	 OpMmvVoXL5aH95RAkNPQVIfiJwVc18zYIEHG/L5VkRXfSWIeSsAbeBf7KzxdYGrGxsjlP
	 ZXEdMwctFLhG1FgLhEr0gTmRntC24lNGJh54ArcRzh9GHZ1PK8U2D6qJBwbWuo3T6yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEsvIshR;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02260606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02260606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEsvIshR
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04ad2c46dso28517905ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541093; x=1796145893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozTidCXqTzSwi9dcCKWD5fJGGI9rCJsLQ/Ov08gLSsk=;
        b=UEsvIshRIY9txsH2W7YuViBjWyb6RCmLJ1dlolrxjjdbyMWW9RSfAuE9mVkyY4ufZF
         8FqH0V9X71v8mD8MmM0dodRkQVkzFJayU5PbfS5SUlKcQbQNIhmha312AWigEQacHXvz
         tlnJ+cXXRtr3CeJHvWoUEP1wLuvCJhLY3xGgX5UGoXy34aaRiRbh2mM2C6hREOrMuzd+
         0HL60opQThWLEOzStOspPHJ508wq8IPVtyTge/TpJczhosNhj0+uO5zfRoaDcTTXL78F
         qGmrthQRxbkjyyqlkMbgk/kUdP/CkQc8Fsl1Uby5M2xrJzqUzzuCunvvAzUvLaQSbJbY
         SVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541093; x=1796145893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozTidCXqTzSwi9dcCKWD5fJGGI9rCJsLQ/Ov08gLSsk=;
        b=Lcgydska1GOFPKIGlObADbBgsmrB0f/mU89bcmLTWHm69NuvO/3Dl4prTyKwFZnOoZ
         QGJqPfVOh1i1x2pcx4rEtNEscDWhbqTZvJ42tOuoTcCBKCYSyIjQ064R97237wX+eDD+
         j2kOFINFOe71X1ox8KLv6nOBN/VJIxm2IevDjiT803E3YR1OK/oNuwUsEwiRj9j9QDqh
         sa5qdybAcgZh1UuqrsSTmdFcoDX9XTacRwORbqyUN4m0AZUEePTctEfOW01Shvir4NxK
         K0PL8iPq2tnWe9pkFWeltjGJddFJV7I6/RifRfBF9yPswZZ9ZWSFOw4tNDcEft16yPF7
         7J1A==
X-Forwarded-Encrypted: i=1; AL+hErHcKScT5QPFhhoyib49z3df9pTvJgRpsWvVByIKHcSrNl5v4Cki6Nu+vUlFIHkD1zQyWw/AO4YNLf4Fp6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QVS8Obb4/pE0HHegIeca+EKVnnjm/LLd0Ce7egPXZf1gmmJcb
	c1IF3iDEW44wTYv3wsa8kHnUpvWiL2+d1/i+csziWKkDzTTvfIQtKW3b
X-Gm-Gg: AZFdTZcZKLl7wt715Yn7+x4Q8eIs3ke8/EU3pSGDkBL3q62C9WUecKJoFMHqWpKhalY
	7KYCOb2/MLETb24rJXmr4koIdiJmDAM/VvFIXgxNberJkb+BJ9B8Hs+W3C9p7jE/L0xizJIy2IF
	/aDCgptuszbiOqOM+ZmYaWtzcP7X3+fK/e8LB7rQg/tUxiJKklINo8lPPKVsoHGWtVmLQg46KJe
	5bSwOmIv851jpsDPO4oL7ipgRlE0UfUkPcmvFcWtNxWUUM7Sbkv0Bgjk8vOTFy5sVQYPiYAm8/j
	NgMvFFyaYd3qD55IYJctTqx3bdfdfGKt8CMNHSK8P6u4GaM7PZbRNoAWVjP372GNS6dUYQrUmAv
	PO/ba+zJ7un5t3v3UKGCrDcKym9dmJkuCGkicMbKd5kCMacccW3wD5jfkrjaBQidnUviY7FqSqg
	y37Rhar+8Jmyrvlrr07hB+Hrm6ebT6q9/2tDIiAcKzWXQKeLjZzN6IKOgk7ZYdn8JZwGFo35gpO
	e9xMJuMWQaxU6Joz+1Jr5ybqOOHQmm3dmPi/JfVFeb01538F2/sts+Wwt+QgDPHCa/IBcLjJL2D
	nu7NhJVvDtTi8ZSIdqx0raeynICk4GsZCIcT7vvKU/PoZKEgqByA8hsuEeNRCVdLc2B5m0w=
X-Received: by 2002:a17:902:f647:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2f03f17d196mr143597245ad.10.1795541093208;
        Tue, 24 Nov 2026 09:24:53 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm72406805ad.43.2026.11.24.09.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:24:52 -0800 (PST)
Date: Wed, 25 Nov 2026 01:24:38 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 15/18] mm/huge_memory: mark folio as accessed more
 accurately on split
Message-ID: <awXABa3dYhEN0YEt@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-15-8ffea39934a6@tencent.com>
 <DN2V8E26C4EL.2TU52TEVLUFA@nvidia.com>
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
In-Reply-To: <DN2V8E26C4EL.2TU52TEVLUFA@nvidia.com>

On Mon, Nov 23, 2026 at 03:17:05PM +0800, Zi Yan wrote:
> On Mon Nov 23, 2026 at 1:53 PM EST, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > The behavior of updating the folio's access info isn't consistent for
> > huge mapping splitting or ordinary unmapping. The page table's young
> > flag has to be translated into folio's access info.
> >
> > Right now it only checks and sets the folio's referenced flag, which isn't
> > enough since folio flag updates on access have their own rules. Ordinary
> > unmapping (zapping) calls folio_mark_accessed(), and it also checks
> > if the VMA has recency to avoid false updates.
> 
> Can you elaborate on why vma_has_recency() should be used? "false updates"
> might be too vague.

Thanks for the careful review!

Right, maybe I shouldn't say these are "false updates" indeed. But it
makes sense to do so, will reword that paragraph.

The young PTE becomes folio hotness via the LRU refs to help improve
LRU accuracy: telling the LRU that the folio is accessed, so it should
be protected as it is more likely to be reused soon.

But vma_has_recency() is the app's hint that these accesses are not a
recency signal: MADV_RANDOM expects "page references in random order",
POSIX_FADV_NOREUSE sets FMODE_NOREUSE, and MADV_SEQUENTIAL expects
pages which "may be freed soon after they are accessed", which is the
opposite of what the refs mean. In all these cases, marking the folio
referenced from a PTE access hurts instead of helping.

zap_pte_range() and folio_referenced_one() already ignore the accessed
bit for such VMAs. The split path is the last place translating a young
PTE into folio hotness without it. So while converting to the more
useful folio_mark_accessed(), also add the missing recency check to
avoid wrong promotion.
