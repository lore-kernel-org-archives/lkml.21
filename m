Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607924;
	b=0QxuTpRODFudxahzbViSJ70Ro7AMmZv2hg/Ivh+CiBntUG3qhxdaLEUb9zqnZaQKpVKu
	 Rv12aAth4ARqFH8zb52+gApIV+7iXFyK0AZCjvDM3uZrCfEPplE0dL9g44/hI77lr5xE5
	 pIlyL7CJGG3Wuuk1SahXcD5x6ZV/cJObJPDtrdzbKW3+4Xe/daJ2M2FEqIf6l5vIhnnke
	 XllYkksmxhiuZJBRW+a+CNardmWEWZOdiwylx4iuA45TumHPLsO2LJBTy2KXobhEx3WZF
	 VjZSSzUcun/KDBD3V1vC5E0DhJ5dbiBMeLdP0K5ztAwkMaCANFgA7XiX08eR+KSKwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607924;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lNCRH7cZNuQ7wfq9CQGChM58dHTmDD/qVZ/gcuDQhzg=;
	b=CB5JRkra8LzeJZArx2vcQdZf39Vu0f2X8iDwoPn6FRZa+ZcyPtIM9B0eUsHFbdrMgZeq
	 n8Hl3RKa3gsn/FlsH8g7MCt+NgnAdkFaZE1vFjBgJuOHGm/dHiPr0GGPa/fx4Zgxi9+HN
	 lrXq840tzwAicBWGpSAt66m5El2d4fuOy/5szgeTi2O2oet4/R4sOL1ZgVDmW0HLjqzTp
	 lrVCYE6L2HGgZxTe1UyflsK+kH3giXo80ORqP+gyh5iTOntd1EbiTMtAZaFAfc0XZgR9h
	 mwmP/329QSJ6G+DOWcqJIK0pJy0z+7XFW3vHynMmB10gaDBUo8dKGybckaFQSl6CqQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BqwI/Uvh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DFF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqwI/Uvh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42B01F000C4;
	Wed, 25 Nov 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795607923;
	bh=lNCRH7cZNuQ7wfq9CQGChM58dHTmDD/qVZ/gcuDQhzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BqwI/Uvh1M7WGfv3uxJ5RiUJbBD+YJxiGEH51l57/J8cvR0nYFX9EuOxH01Db/gl3
	 azhDLeQNLq+gSCz9bBclgE/Stxwgc1OnGda8kGmqV5EMXVKkUmFfV2CvT+Rm62XK1D
	 XenG4wQO2RrCgW/wCbiDbBeO4Rc7Ip56EoT3c3O+llR7TUr6/zNgbWYvfeIzDxnx4p
	 +ubU4YtMsxmEZnWNmlaSQ/wG+hvcmY4BCfujSx+SR/f4sy4MzVXgjv7yDcjComKw4v
	 IQ/v+4QySHWIFRBr0ULn+3P4SkF0Kkj2loMeQgoVqubeybQ7GXz5stRzotyVe4uM66
	 RFWviZn0m/VFg==
Message-ID: <4ffa6613-119b-4eae-abbf-26134bd60177@kernel.org>
Date: Wed, 25 Nov 2026 12:58:38 +0100
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
Subject: Re: [PATCH] mm/hugetlb: stop hashing address_space pointers for fault
 mutexes
To: Zhengchuan Liang <zcliangcn@gmail.com>,
 Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Davidlohr Bueso
 <davidlohr@hp.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <9a97a64f7e7aabc668499c426a2417a77d13a2f4.1795587203.git.zcliangcn@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <9a97a64f7e7aabc668499c426a2417a77d13a2f4.1795587203.git.zcliangcn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 07:15, Zhengchuan Liang wrote:
> hugetlb_fault_mutex_hash() uses the address_space pointer and page index
> to select an entry in a global mutex table. An unprivileged user can
> create a no-reserve HugeTLB memfd with an empty huge page pool, build
> contention on one index, and time SIGBUS faults at chosen indices.
> Pointer-dependent mutex collisions expose equations that recover the
> exact address_space address.

I'm not sure we care about this problem. I'll let other speak up.

Attacking hugetlb users is stupid. This doesn't matter in practice.

[I had stupid AI fix that allocated fault mutexes for each inode that I
discarded immediately]

> 
> Give each hugetlbfs inode a dedicated random hash seed instead, and hash
> the page index with that value. Operations on the same mapping continue
> to select the same mutex, while separate mappings retain independent
> bucket distributions without encoding an address. The seed is not
> relied upon as a secret and is not reused by another hash table.

Can't we still end up with the same problem, just slightly different, afterwards?

-- 
Cheers,

David
