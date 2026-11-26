Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711167;
	b=3inZvHkYkzWFu7ItRM+mcOFSHcu36BBqndORoKXIgsoKHtOqpC5oVqY5xV+TpOtSN3pJ
	 BpFYCf8X5SaX+hg35RfdHnpZ8WZZYpyktCGm4BrXw0Pkh9NbNNk0pi7dne+Vqf5ToFozo
	 CwMJeITyYWpN2U9gNcX0S7mM8xguYLuRIbv+R0yEQ+pEz/pU6w/iRQSAYiMCUqUmHjvJd
	 wTeC1becdm+464BfCUl3HZ6mp4hdPm+qhBEcVAARcQwpInBQlHcDlw3Re5lLC5O0AShBC
	 9vNJCT+hC1G86kyoBRiMFoNcl885AvFhLXInKxOsD7hNjIZfvsFVTlfCHoZTHZkWZhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711167;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kbBcWz7M/dp9EJCVbYhqj8zDvU5uF/XvLDIGwwLKiXg=;
	b=ko7KraOEJkW7XGPQBLLP1MWUZKxG2vjiwnDDWW7iD2vGilW6S/G27kTfmJbmJodVA5J8
	 SOJvgik5o4yGCvloEVKDgsXYMlDxAPbnOnTJMtJerL0WZ7CUNkdg0CQYXBtHLvK4bcsx/
	 FpLEPWBT3eUcQKJgENb6y+vLY70gecQBvUC530dLE6QeGSsfBuA1GyUegECmpcgxvdJ0d
	 0NIXtbLiAFaEiF7p1FTBb81dbweNH36QFPVpUxsrJDLZMQvBaos/jxguUHxBWospl1E5+
	 pfQ4Ddc33P1GII5LRoB7GGuUcMfIL2Br0AUw4TXfTrPtRe0xB1QAY+S32fy6lq/uFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=CVg0nTtS;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AD7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04AD7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=CVg0nTtS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=kbBcWz7M/dp9EJCVbYhqj8zDvU5uF/XvLDIGwwLKiXg=; t=1795711165; x=2111071165; 
	b=CVg0nTtSjHAOO9eUxWoWx1Bwi++RVGGyzC+dQSzwTwSWkAcvDi7tNUGYMKoW1FfsYS8WQWRML9e
	719nheJ9vPL6vHY698ZsKRzT711eAaOozGySpfRMbWPLSsBGFwxucRRZAYnpJxtpS5IQuLM95FfQ/
	PuTOWCb5q2+aCFrYGHlJswfVo6I4uamjw6fGNvWCWMQdHBVtqSGG/3Rfs59YMdNsRWDOItOVvQIXh
	cJo7tNg7LSET5SMq6cXVT+JPjqVWq3jXFcmGmFTHFka1ZnmP5pIatJQZfIKL6/8vE1T0p2CB6GkVh
	P6MSABK7U2xrkIn7Re/0jnwekuSbU5ZfWDbw==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xWcV4-00000004Tzu-0q4A;
	Thu, 26 Nov 2026 17:39:10 +0100
Message-ID: <947b762d-1530-4302-a330-1c234538281a@igalia.com>
Date: Thu, 26 Nov 2026 16:39:09 +0000
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
Subject: Re: [PATCH] drm/sched: Extend locking in drm_sched_entity_select_rq()
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261117093708.647488-2-phasta@kernel.org>
 <5922ac007b35e54e8b0c60a04cc55fb7fc88d72e.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <5922ac007b35e54e8b0c60a04cc55fb7fc88d72e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26/11/2026 16:14, Philipp Stanner wrote:
> On Tue, 2026-11-17 at 10:37 +0100, Philipp Stanner wrote:
>> drm_sched_entity_select_rq() evaluates entity->sched_list locklessly,
>> which is elsewhere always lock-protected. Another lockless check regards
>> spsc_queue_count(). spsc_queue is evaluated under lock protection at
>> many places already and the plan is to replace it with fully locked
>> infrastructure anyways.
>>
>> Move the spin_lock() in drm_sched_entity_select_rq() upwards.
> 
> Tvrtko, Christian, objections with merging that for now?

I don't have any huge objections but it is a bit underwhelming aka we 
don't get anything much with it really.

I was hoping my series which ends with "drm/sched: Address the fence_seq 
fixme" would get some more attention because it basically ends with a 
similar but perhaps a better result, where the lock actually goes one 
level up to drm_sched_job_arm and atomic_t fence_seq gets removed. So we 
can say there are some tangible benefits in that case.

But it is not just that series and the sched_list confusion it fixes, 
but also since in this commit message you elude to spsc queue removal, 
that's another one which we have sitting in limbo.

I mean it's all well and good moving spsc_queue_count under a lock but, 
again, it doesn't gain us much. In the spsc removal sketch I have for 
example demonstrated how that we can easily remove that 
spsc_queue_count, plus some spsc_queue_peeks. In theory that could be 
done even without the full spsc queue removal.

Perhaps we could close on all those opens somehow?

Regards,

Tvrtko

