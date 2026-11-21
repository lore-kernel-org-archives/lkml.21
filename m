Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266107;
	b=Xod0CCzjvv4XEvh4xxmZ5RPASirQa119SHZJLBF+Yo2YEYS0rnNIlVjaM75hON1DGExu
	 ZByYw4mYRmFQQlki9/z6G64TNVyQe+0Yy0TbAf4OW1OaNQAh6N7IaK44oHHasRceRACnr
	 BU4e/x5TLi9dhmKWt/XELbbCyr3XcFuan5lsQKSW9sDo3kfGGSGaKuzMOyngU5+EFsftb
	 hQWGNcPae4c6WCRFA5UsRkHc5pudFkg4rAi0BLq71to26lFPu+3xEGBqImMdsVQ/FToON
	 YXp0dMrAPO3zqWFrA70+AwJt56OkrVKF9+GsYYtJ+IQWHOL4L5DQ9bJNP1fKMM4dcCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266107;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FzaSLVmKPBX31jKxTVwHESe0dN4GEJWpEBij/w3vhM0=;
	b=QgyadY/nPj9S/9l54gefdbVVx8KI5IkALYvdmaf6ykUICtpjtg+MmwZicVzeUbBkX9oA
	 jkm810E++WbteTLNc2JFPAQdxfA1cH3fMk99doYN+Y9kTc2fEYbuTh/MTy/PkKKmovMME
	 x29JbvkGbNP9DvgAnsR5vfd2noEWKClSNYBDnL8sK6SiqZmFL3N54MJiw5JWy8xpm2ELU
	 UMvEsF5ibAHZffcDqn5mxysbr3lnDTziLsJiXBPxUE8g+/h1/dONHY268uIM3aef4P7TF
	 6wP2vvqWuksW0UzHJ+cOAZI1t45GKw5eRZc7qJ9p4fo92ZoUGu6Ug9Gy6xXu46yCPMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTTm8uV7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC47606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTTm8uV7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBD01F000C4;
	Sat, 21 Nov 2026 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266107;
	bh=FzaSLVmKPBX31jKxTVwHESe0dN4GEJWpEBij/w3vhM0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=JTTm8uV77whsPPyhAo95fT6LNhKi3Lml8Y8zUNkmQroCJKNkyQ7u1kuCP713GMosk
	 /6ubb7d6L3+8YkTDNpplB7bGleM/iXHAFFLxntgn9DzJEJxYAh05PhKuPc6LpfQ2YJ
	 yjghQGC1DcPCHOMsEQu2zAi94JheY6vGio8H1qdWgLPT6PhYkZ6nDc7kaBxBSaDE2E
	 iRFAJgmhSvVigPEwpP22TOBgD20XiSSWn0Rb7TRznTkbhT1p1bLmbYcch8lR5steua
	 nQ7dTUenG1j6WvAfM4UhtrklkjDOn5lbawivbi2QKOsfiY7c/5AJIxfnimFxh5JKFO
	 yuBoj6qUv9bYw==
Message-ID: <037fc749-cc74-48cd-ae64-6b01889fec77@kernel.org>
Date: Sat, 21 Nov 2026 14:01:42 +0100
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
Subject: Re: [PATCH v2 1/1] mm/shmem: don't use the memcg of an uncharged
 folio
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>, Chris Mason <mason@kernel.org>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com,
 akpm@linux-foundation.org, qi.zheng@linux.dev, qinyuntan@linux.alibaba.com,
 shakeel.butt@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261120195057.50031-1-mason@kernel.org>
 <20261120195057.50031-2-mason@kernel.org>
 <179526598180.412063.14973682472309530978.b4-reply@b4>
 <960b4568-9d20-4eb0-b0e4-67e60f8274d4@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <960b4568-9d20-4eb0-b0e4-67e60f8274d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 14:00, David Hildenbrand (Arm) wrote:
> On 11/21/26 13:59, Gregory Price (Meta) wrote:
>> On 2026-11-20 14:50 -0500, Chris Mason wrote:
>>> The shrinker for unused huge tmpfs folios can dereference a NULL memcg
>>> if it races with the migration of the folio at the end of a file.
>>>
>>> folio_memcg_list_lru_alloc() assumes that folio_memcg() is never NULL.
>>> But it is NULL until the folio is charged, and a migration target can be
>>> in the page cache before charging.
>>>
>>> shmem_unused_huge_shrink() looks the folio up without the folio lock,
>>> so we can race with migration:
>>>
>>>     __migrate_folio()               shmem_unused_huge_shrink()
>>>     =================               ==========================
>>>     __folio_migrate_mapping()
>>>       xas_store(newfolio)
>>>                                     filemap_get_entry()
>>>                                       returns newfolio
>>>                                     folio_trylock() fails
>>>                                     shmem_unused_huge_requeue()
>>>                                       folio_memcg_list_lru_alloc()
>>>                                         folio_memcg() is NULL
>>>                                         memcg->kmemcg_id
>>>     folio_migrate_flags()
>>>       mem_cgroup_migrate()
>>>         commit_charge(newfolio)
>>>
>>> Fix it by keeping the original objcg around while the inode is isolated.
>>>
>>> Fixes: 743e7d025d2f ("mm: shmem: make unused huge shrinker memcg aware")
>>> Suggested-by: Qi Zheng <qi.zheng@linux.dev>
>>> Signed-off-by: Chris Mason <mason@kernel.org>
>>
>> Reproduced and validated the fix. Changes look ok.
> 
> Thanks, I'll throw this into for-next-fixes right away and cc stable.

scrap the latter ... just a hotfix.

-- 
Cheers,

David
