Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495983;
	b=Ukwza/K4YCKs/JCT5VvEYrgY7/B588PDws8YirdAscXmC+609nPptJHItEoLDC5dl7ge
	 7M7c0SPHlUFUaHobZ05Tzwn7MpuvMS+KtjzmYBocBKRvLYLgIVs+J0KeSAqgiEGOhirwr
	 4VSzlB1Cqmje+b0Ad6bvKUIIauGlAJSs49jLifrz5ZOzSsWuty4GUW+rfstcy0TH9SG3w
	 f2Sdc93AT/RnqZ+HboiXtnbKM1DqlxDoN0uH6b2xl1GzEEm/+nLq3s5X5c24YbQnI5O8p
	 ilAffBu+DViXIUAnXYYIeoEJu1M6hXHvR7396XXl8PBGFeZ9Ud5G5lLo5EV2hSZZxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=OiIzwEHdzzAJR7e70QGL0R+/3Yj1cTamKyRrwNi0fyg=;
	b=hfezUnet6LBcrfVJ+U3mfCrYX2WT6IEBPSH+OwiAra07hSvU7xLHLXukPxqskRSdXEBK
	 haJlDC85j+GpSKoaxNx4w8rQVar0Itfuwqc296sth8Ivg5Y+tUNnLEH4zlYcrntkjmnFY
	 2RfWJJ+u+x5pqUdTjrt7RzhpxGae3s9eZu/QvlT8gflkFGBYRs5ipgpX7Gz1SR8hkVz2P
	 Qj0wPpkTZ7erFxpokR6IQ8k+ZkMnWLI0tSWRYuB6Kuf8suEpUuubXkxsb3DKV/rT+8qYv
	 dWMibSUqrEQiXgidXJglilzp20sabryoiHFvXSG76BzmjqokHl0z0gbJYlUnBYDk3ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r1e5CRtK;
	arc=none smtp.remote-ip=95.215.58.73
Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r1e5CRtK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s/slY6o6wSEczfY7MjDTmcG9POL3RXKg4WQAsPd+j7A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795495980; v=1; x=1796100780;
 b=r1e5CRtKl/EPAtOKOj3DJ1DMGKukAqhyex1TbxxaiNzdZxxU3HVDvqqoFiclT7D+iEUsqXnj
 EDXH52TtiB9Ee+HL55KmQfuKvW4DRTnbU723G8Gedi++KFVbh1k1XlOcecSs/LLUm+OwiAKqArt
 ny/YDiRvcp1MtYCCbkCYJK60=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca530465533cab93;
	Tue, 24 Nov 2026 04:53:00 +0000
X-Mizu-Trace-ID: ca530465533cab93
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] memcg: free the private ID of a memcg that never comes
 online
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <awUTKy9tx8nWJgXf@linux.dev>
Date: Tue, 24 Nov 2026 12:52:41 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Koutny <mkoutny@suse.com>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Meta kernel team <kernel-team@meta.com>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <2FE2D209-FB57-4191-A324-F179B2394DB1@linux.dev>
References: <20261124000439.967403-1-shakeel.butt@linux.dev>
 <F39B4A81-BB17-4C5D-851E-2740EBBBBA8B@linux.dev> <awUTKy9tx8nWJgXf@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 24, 2026, at 12:33, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> On Tue, Nov 24, 2026 at 10:50:00AM +0800, Muchun Song wrote:
>> 
>> 
>>> On Nov 24, 2026, at 08:04, Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>> 
> [...]
>> 
>> The leak analysis and the fix look correct to me. However, using
>> CSS_RELEASED here makes the private ID cleanup depend on a generic CSS
>> teardown state, and adds an accessor solely for this failure path.
>> 
>> The private ID is not needed until mem_cgroup_css_online(), so could we
>> instead reserve it at the beginning of that callback? Failures in
>> css_create() before ->css_online() would then never own a private ID,
>> while failures after the reservation would continue to use the existing
>> mem_cgroup_private_id_remove() cleanup.
>> 
>> This would also make the private ID lifecycle more explicit: reserve and
>> publish it during online, then drop the initial reference during offline.
>> It would avoid both the new css_is_released() helper and special handling
>> in mem_cgroup_css_free().
> 
> Thanks Muchun. Nothing needs the private ID before ->css_online(), so
> reserving it there would work. But it moves the out-of-IDs failure from
> ->css_alloc() to ->css_online(). By then css_create() has linked the
> css into the parent's children list and css_idr, so mem_cgroup_iter()
> can css_tryget() it and cache it in iter->position. A css that fails
> online is freed without ->css_released(), so
> invalidate_reclaim_iterators() never runs, and the free does not wait
> for those references. Today memcg's ->css_online() fails only when a
> small allocation fails. With the move, every mkdir on a system that is
> out of IDs would take that path. I would rather keep failing in
> ->css_alloc(), before anything is visible.
> 
> To drop the CSS_RELEASED dependency, I can test the ID's own state:
> !memcg->private_id_objcg means the ID was never published and the memcg
> still owns the reservation. Let me know if that works for you.

You're right. I missed that the css is visible to mem_cgroup_iter()
before ->css_online() completes. Using private_id_objcg to track whether
the reservation was published makes sense to me. Thanks Shakeel!

