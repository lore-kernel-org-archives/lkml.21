Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107162;
	b=obnoV0xqfYaKDhmXo9GzWtxvS+QeGTgsnY6kUjKOJJc/pfQWILusipfmisflRKZADK7a
	 iLsbkV9IpEF/G/q0Me+RRoXQr0vytTaKU2yI0abrKO7/osOMGEiLSFl/WdLJiLdDS6nmj
	 f+/NPRS5OEhppl1vTWwbUVcFciM3WyL8emtgY/f3thC2ILmLgM+oLVP1cg8Lk77K4rmkS
	 w7d8mBh149T0jdR/gvK7m1zGN5XTEXJqy1DnrFhu+4WSztZyLA5F1QieCFzxPnqURzwtO
	 ObKBTztyAeTolWrkvo+KYbT/XuOO64e6UJvb9myUdrd04wvt0k6RGOH0n6QtmTHUCxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107162;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=s3w04R4saccKvHqVDzP79MlBSnptPE+6gCEofnqpqcM=;
	b=V3WCU5h9r1NyFGRMKyljJa1qM2glJzpIPcIK1vIrOb00gNndBVSc08pLIiL0Xb3N8I3T
	 2nohcb0joMKY5D97BLGyGYFt4wa1PpVIc3/nfL8UXsFYFwMRsKeAgML7c1FhdS6bFIkUx
	 fv2mmMI25tM/6HyreJkPZc9R3TWMLp0aT3kLAKJEwHdEKqxzizrGHsdBg0zuFve4C6MSt
	 1AoaAR0hLURNCXu3CrlqlJGxTkUHALKoN0OOPucF8LiJLIad7CN+s/Mwco/TMqsTbLsoE
	 hv47rVrYmsB8UdCdSZ2Vyvd0Ng3Oj5pKhXcYcMMOLWwpWe7HUsZ8X0nUiKfswbapALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BgL4lqgC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61560A2600
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BgL4lqgC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799A61F000C4;
	Thu, 19 Nov 2026 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107162;
	bh=s3w04R4saccKvHqVDzP79MlBSnptPE+6gCEofnqpqcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BgL4lqgCmpEwHhO46cmCdMt5j0e2MbNjXwsxKgYE2gRHbMdWgc58L+NVYcd0gRTVw
	 7hFf1eY36fhjlNGmYg8sP5xsvCebhFp4TjHRJtWbKPl4+Epu4ezmC13YJjX+HycYfJ
	 1Sw8qpv216JdJuPMaTwoEYgadBXlmLp8cfD1Q22Pf5PHDnhVFofPW9gjVb0Qwyf0Pr
	 ep9dVbdRjipvHwu00iCTtyW7DuBYklmjTYmfz1wpznlqgE8e0CG/oU+fhCw8jPavDN
	 9+py0xjcKHm6EtkAt8jvNBqwCMuEijviLSokAbcUk9/MMXHr9UkPhepgOsSDYikr5R
	 4aRKz+m9K2iJQ==
Message-ID: <487805d3-ef84-46d4-930b-c346fbb1fcd4@kernel.org>
Date: Thu, 19 Nov 2026 17:52:36 +0100
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
Subject: Re: [PATCH v2 0/3] mm/memory: remove unused
 vmf_insert_mixed_mkwrite()
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 "Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <179501440852.7660.18348444744304711431.b4-ty@b4>
 <4e8e1f1a-f68e-4fe6-87b1-6198603eee87@amd.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <4e8e1f1a-f68e-4fe6-87b1-6198603eee87@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/19/26 13:36, Gupta, Pankaj wrote:
> 
> On 11/18/2026 4:06 PM, David Hildenbrand wrote:
>> On Sat, 03 Oct 2026 01:05:31 +0900, Sang-Heon Jeon wrote:
>>> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
>>> vmf_insert_mixed_mkwrite() has no callers. This series removes it and
>>> the mkwrite handling that only it used.
>>>
>>> Patch 1 removes the function.
>>>
>>> Patch 2 removes the mkwrite argument, which is then always false. It
>>> also removes the unreachable code in insert_pfn().
>>>
>>> [...]
>> Applied, thanks!
>>
>> tree: mm/core.git
>> branch: core-7.5.misc
>>
>> Applied patches will appear soon in mm-next, followed by linux-next.
>>
>> Please report any outstanding bugs that were missed during review, so we
>> can either drop the patch series or decide how to fix it up.
>>
>> It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
>> though the patches have already been applied. If possible, patch trailers
>> will be updated.
>>
>> Note that commit hashes shown below are subject to change due to rebase,
>> trailer updates or similar. Further, this is not a guarantee that the
>> patches will go upstream. If in doubt, please check the listed branch.
>>
>> [1/3] mm/memory: remove unused vmf_insert_mixed_mkwrite()
>>        https://git.kernel.org/mm/core/c/fedea7ae
>> [2/3] mm/memory: remove the mkwrite argument from __vm_insert_mixed()
>>        https://git.kernel.org/mm/core/c/a3405fa5
>> [3/3] mm/memory: merge __vm_insert_mixed() into vmf_insert_mixed()
>>        https://git.kernel.org/mm/core/c/ac2fd084
> 
> The patches are already applied.  But in case it still helps:
> 
> For the series:
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

Added, thanks!

-- 
Cheers,

David
