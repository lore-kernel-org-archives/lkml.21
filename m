Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691849;
	b=bB7Y2Dsd+xaeBpeADTJc/Q8nV5D7TL1dnZMH+H4ZFrWaVMXwRkvEAdBo2IcPSPgtcsyS
	 G+Q9kpHiI3FxP36b0dF3OI1uc/4jO2xZbEdJxCkGFsoOtrtBC19rJ1K5V1Kh+GqTVTWJ/
	 oOFkoUbuEr9hB4PG+h8EDvpk/Fs+YvErtdFqkqiv2DilC5p+zxYcfWEYcNe56iV6WHoe1
	 aReDqQ8Zc15Z+J10/XrEwTh41yN8XXn+36XPxgwJTjoMWxH+y3EOGLcA93+KaRG1Gx0+H
	 uiYwtQcDCwsTa9A6FeM16aiMkKztYvWIfsrA3Q0W0ShqCGzdMMa23FIoWpltytgncBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691849;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8anWI4wnghqDwMT8IkGpbFVOQpbY6mA/D0RVRsfG7w8=;
	b=W8ERTH4ExFEZxsxs8kEwtQfymhe18DbmeiBMxE1NwLAg8zAOG1KNai8t+YhJWTg7kkEu
	 YBuPHrL0YG+e6IzUOWplU/q1JO+lUdpJ74LI+rRkJAINtBrAzXa0qnPOp3vXIvJcm6mff
	 /Gm8yr8dhdt7iO+mF5MGBj+vrSiQkWsGYY/s8uUb0owpC6SKnOcHjeGeClsl7BCxIYhDF
	 98IfC2nt8XYq5Zpvh29WIPRrjQitYSenyzhICqAkXRMJAxhBtluiQNfWG+mqbli4FW00E
	 BIwA09w8GUCAwz9JPmuTvAW0d+cixSPzYEUCYWwog+4InzA7sr2nqvMJK0oUsmlU93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=et37q7q4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=et37q7q4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5901F01568;
	Thu, 26 Nov 2026 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691848;
	bh=8anWI4wnghqDwMT8IkGpbFVOQpbY6mA/D0RVRsfG7w8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=et37q7q4eqHRyyOeiojSHRmMB0v7Cm5o63xhU9cRdI0CehXFULk9kBGbiudTHTVr/
	 o9Kg/vmbbCShoj3ZrKfkdz7XeqUP91dWb2DaKuJvJyXkuHx6PpzX8sEIjPcJTAg5JC
	 2ppBzlDgGdkvE0rcMUUQ8tccZ+SypPeCnDj38kL9NTMXVKAWj7/2/FijXE0xhMmkn/
	 TZ46HKa0gexKebuz8NPxghK1wtRqUTIGrY6dfburH7t4T77fVCr66J7mZVmxU68oqw
	 /uYkDtNR99xnqcqQN7qc3ObNwhrmn+CV3DQuLdLfEZIAlobrGpBOqC0oWKIYsJiJ0J
	 7NPmzMzUGzdbg==
Message-ID: <3ee0f274-0089-4450-9888-7be659af9d63@kernel.org>
Date: Thu, 26 Nov 2026 12:17:23 +0100
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
To: Zhengchuan Liang <zcliangcn@gmail.com>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Davidlohr Bueso
 <davidlohr@hp.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <9a97a64f7e7aabc668499c426a2417a77d13a2f4.1795587203.git.zcliangcn@gmail.com>
 <4ffa6613-119b-4eae-abbf-26134bd60177@kernel.org>
 <CAOny8psx408zqVv1xt7DHN8yYkQksjKZFDQCJ+AGFB-CDN9SmA@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAOny8psx408zqVv1xt7DHN8yYkQksjKZFDQCJ+AGFB-CDN9SmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 19:59, Zhengchuan Liang wrote:
>> I'm not sure we care about this problem. I'll let other speak up.
>>
>> Attacking hugetlb users is stupid. This doesn't matter in practice.
> 
> Thanks. To clarify the threat model, this is an exact kernel heap
> address leak. 

Ah, sorry. I was jumping to conclusions that this is about harming other hugetlb
users.

> The attack does not target another HugeTLB user or their
> mapping. An unprivileged process creates and operates only on its own
> no-reserve HugeTLB memfd, even with an empty huge-page pool, and recovers
> the exact address of its embedded address_space. 

Interesting.

> Since that object has a
> fixed offset within struct hugetlbfs_inode_info, this also gives the
> exact address of the hugetlbfs_inode_cache allocation.
> 
> KernelSnitch (NDSS 2025) demonstrated why the address of an
> attacker-created object can be useful. It recovered an mm_struct address,
> freed all objects in the corresponding slab, reclaimed the slab pages
> with msg_msg objects, and thereby learned the addresses of those
> replacement objects. Here an attacker can similarly allocate and release
> hugetlbfs_inode_cache objects by creating and closing HugeTLB memfds. I
> have not demonstrated full-slab reclamation or cross-cache reuse for this
> case.

Right. Do we have any gut feeling how exploitable this is?

> 
> https://www.ndss-symposium.org/ndss-paper/kernelsnitch-side-channel-attacks-on-kernel-data-structures/
> 
>> Can't we still end up with the same problem, just slightly different,
>> afterwards?
> 
> Yes, the timing channel may allow the per-inode seed to be recovered as
> well. That does not recreate the address disclosure: the seed is neither
> derived from a kernel address nor used anywhere else, so recovering it
> reveals only this inode's bucket distribution.
> 
> A simpler fix would be to replace the mapping pointer in the existing key
> with mapping->host->i_ino. The inode number is stable for the inode's
> lifetime and is already exposed through fstat(). This would preserve
> separate per-inode distributions without adding a new field.
> 
> I understand if this particular address disclosure is not considered
> worth fixing.

Oh I just have 0 experience with these types of (let's call it) address leaks. I
know that we, in general, try to not expose PFNs/pointers to user space because
of rowhammer.

So this probably should be fixed.

Using a random number looks good to me.

Just not sure about the severity.

-- 
Cheers,

David
