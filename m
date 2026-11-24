Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542903;
	b=d4K2HHTVdl2v9HwLLSZLWSJmVgJBgQEuXk2gFVYk2q8VvnkxHDoCO3Bnsf1K/zI4somd
	 jUpIKxl2qkQzClZyCnOwWyFmwaoZFvsfwRAEe1wRZf9TcKCYpSVkMSZYhYT1NzAYclOkf
	 ps0CcKkmdzdMwgzkxgCSZDmcqnSMxrxCKlLsNycqrsBw/CAvs5QqibQULbJEUx59pofuD
	 Qx2CiR3RHeiCOTZ4ahNjuQwsVPG3UqAW7PicnRck45CTQydRIOIqEKFUnpc6uBwGrTH8I
	 5tHZDObJ2S8FpvBn9MW5Q6ruhJIciWu2wgqQEUSmoa2dIZnhTBJcbH2isSVMB/syGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542903;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=I2yxDbU7lOpiFweogZtcA4pKGDUYWG7cArF22khEzuE=;
	b=f/3KItOmbimsaMIH/y6xpuIpCcJ+UZ2UkJARDNpOgdZaUhIjPuPEc1KuHzo6uE3PG82O
	 xkob54GZgniiQHLcHfw9DnpUkI+sVtLHso9CHM1tLguRABd4E8Fltw1ugZIQqRJnboRhM
	 k9LJRRSu+QStVHhMJrwV6SIuDNd8Dn1oL2o3r/Fi4Zo7+mlueexbdB2m+ClZ4oa+d7Xc3
	 ltdfHlAhbCapd1HVgv2UeCRWW3Zty+5DIvzSWetTN+/hfC4jkBQJGgU/i6AYIVgc5N07m
	 8sXuUjGAYtxbRacISg94dla5R4jaOe0xmuz7Nw7fMXMQuGLKyxEJIKnCEc9/JuCMXHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K4qBbnj0;
	arc=none smtp.remote-ip=95.215.58.240
Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E960E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K4qBbnj0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WAB79C+6SpcJcXgk0rqpViA2L6QwhWPx0WDOvroYZdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795542900; v=1; x=1796147700;
 b=K4qBbnj0YFn062jLpuAS6VoHfSwuSIIpz8YBKCjTCKImMV5ZwpQWPt8XDwLSkO7QdQC1UmKl
 hjsrkT1kI5tfcAjvd7Pll7mnLKqpb409L9UiyNFUavsgm7dSknAZaEKtMzfUj47ztHwybjfETir
 cxpqdrHG6XgiDmH0HOjHfb8s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1aed601a24a53ad1;
	Tue, 24 Nov 2026 17:54:59 +0000
X-Mizu-Trace-ID: 1aed601a24a53ad1
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 09:54:58 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Koutny <mkoutny@suse.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] memcg: free the private ID of a memcg that never comes
 online
Message-ID: <awXO66mRuz_BRWs9@linux.dev>
References: <20261124000439.967403-1-shakeel.butt@linux.dev>
 <awVSrbJn00wmh1nn@tiehlicka>
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
In-Reply-To: <awVSrbJn00wmh1nn@tiehlicka>

On Tue, Nov 24, 2026 at 10:02:37AM +0100, Michal Hocko wrote:
> On Mon 23-11-26 16:04:39, Shakeel Butt wrote:
> > mem_cgroup_alloc() reserves the private ID of a memcg when its css is
> > allocated. The ID is erased when the last reference to it is put, and
> > that reference is first taken in mem_cgroup_css_online(). The failure
> > paths of mem_cgroup_alloc() and mem_cgroup_css_online() erase the ID
> > themselves.
> > 
> > But css_create() can also fail after css_alloc() and before
> > online_css(): in percpu_ref_init(), cgroup_idr_alloc() or
> > css_rstat_init(). The memcg is then freed through mem_cgroup_css_free()
> > without ever coming online, and nothing erases its ID. The reserved
> > entry stays in mem_cgroup_private_ids for good, and each such failure
> > takes one of the 65,535 IDs away. With failslab failing radix tree node
> > allocations during mkdir, 1,500 mkdirs leaked 6 IDs this way.
> 
> Considering these error paths they should be pretty impossible in
> practice (and without fault injection), right?
> 

Yes, this one is found by code inspection while I was debugging the memcg ID
leaks happening in the Meta fleet. One of the biggest source I found is the
orphaned swap cache of offlined memcg. I am still working on the fix for that.

> > Erase the ID in mem_cgroup_css_free() if the memcg never came online,
> > which is when (memcg->css.flags & CSS_RELEASED) will be false: it is
> > only set when an fully onlined memcg is released.
> > 
> > Fixes: 73f576c04b94 ("mm: memcontrol: fix cgroup creation failure after many small jobs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> 
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks.

