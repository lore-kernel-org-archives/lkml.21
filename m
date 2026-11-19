Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046965;
	b=T5b+SlhKMAzxt1HrWBeqzyVuncOmYbaHYhxvt32/AU/1VbwnR8X3NlkkeAmDIdGBn9tm
	 jZKMJO503+vKczK0qdSp5HkhnZMS07AMqKTT2eVsdEXYSUvK4Z2lyKY4h2jPMdexC2/IF
	 PylOzWPHH/jORe90CHGCgzdoZ9LN0KM21ZM34+pVSZceogvAWYGlue0yOqEaRAz//30/1
	 hcGsNtApo8m+7/kVpxMGnJhvCftIS9VQYfcuC38ep8AUb5Z0fDHjSCG1C1FLatzrhxqbX
	 kDxQYjJfYFaTzeW5rPYL/xbQNawWwpUYVIJOZxeZTKHzd/HtTtBDxHGv1vVkRNEkZ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VqcrwoCztAKpY/Tq1T0uZhbHihAEPIjWKmk0N4arOGA=;
	b=ybDNYP04KWIHAcOzIs+ZkFzgLWFfZ0nJMCcQb4DCq6thn41HB9VZlgx0P7EHEwmDp58M
	 uus1ucSfAu4hJ+i/iGcMMbxHO1MT4TgHqhipX8f5FrAZDkOjX0rD2B6LQSNqwJYQZxq3k
	 EBC2Kq3wOdZ3ucyN+IwPof+hbLomI57EzTOems0eQ/gj7iqiNlT8bxhHiLlHvgHafii1/
	 VTMEhALZvA4YQkZos3fFiTyooZmowqrpnpY1rRiXnRK8AEnQvZ0bzpTiH1gRQkKAljY9O
	 jn7wwA8IbOH48MJ0dYiPLdCFKuMHvJY/xDYiqaSg/WsytbMluHL8JCjlKK9RHJ2PC+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=eX1Yz2qu;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B583606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B583606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=eX1Yz2qu
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so11679367b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1795046963; x=1795651763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqcrwoCztAKpY/Tq1T0uZhbHihAEPIjWKmk0N4arOGA=;
        b=eX1Yz2quNliQ9kJGqzWY4M2+BbJJhvB5AlbNRuzhWx1cfsr4l8ERV2dTky2i86zlO8
         Vcj3LRN2JKWvjl2MON9EYzNxkCDoSghxWA5QzS8EOS829DFUFKLCMCpzsv6cdlH4S6ro
         yXKKxEKXb0NfhYaezx63+N/tqQhO93ZFydTLOgksWlNuFUk2uXAvR7R+1fx8QKzFFuTa
         kPI+zcz4ipoCWonZsSpYmaD2Np4eWZwzu0POnEbAyw6f3MrJOhVFR7wvVxnJVv6vibyY
         Ja3VMVaO3EOw4Z1UrijNqGIWMk1pcpigm3TCYty9mW86DEsk0hMG4g34IddRPuuiSIE1
         R3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046963; x=1795651763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqcrwoCztAKpY/Tq1T0uZhbHihAEPIjWKmk0N4arOGA=;
        b=zCiT3RVcYjAWGt5PD/gFIl+vWWGzk3pjpxNwiJ92Xbc/nnLrvDvseuKqBATeC8zu0L
         qvqW+bHbnyTRP+BQygO184X8Z/UnqKZvdf0epGK9eYdnDIKRlQ7fV+2QLuF/qfWX4ARq
         ow9KqT3eeRV7IVxybDDM1eu9E/biiObdq4GSnEyUnBd4H1UiQ3faNvlnspVoKAIGWCxw
         weBWeoa6w3H0ZcIpYsYgbbWHX8RwL6uO9HGXlfe6NUI0Ot0ZWHnS3HEqdS0i0wqMVgis
         +fZcdnstAXwD4sqo8aJjzkJLfQ7jC+el1NsrcblDQA1QsGULi7nwlgh72YlpSzVaxd9a
         cROg==
X-Forwarded-Encrypted: i=1; AL+hErEu8ZcvTsmWfsuSXJT19Mn4rANU7BK3rKKJ2gKdNeF84vZ9zsmF8Q8VGEHMzqu+Aq3dGX0w1HujqRcBpSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z89fugvWNt6vkGSTTZEddtiFWB/oGUB/dJfdMkNjIF3AgGFbqcH
	zkm/0WIK5bqYFZ6XreEzvA07sSjHjdlH6npFF0BoFCEn0AWB/sUPK4RMUOr3YYOghGQ=
X-Gm-Gg: AZFdTZesje0CB2oCNUXZ+gfXxCJmi2MSwGR0s7Mlc+nq+XP/VfRWfDQ+TQrFb7m5p88
	zMAWcWFSguc9aSN838Dzhi1hN/+j76D5JJnEHJjKP0RRbtS8tjnLxoGR9u5htEzezwqaY/WdXVA
	cDdCTn/WFRL65FF41HrdP/Gxe7ML99S51r1UUx+q1WUtjHBZ1FNYRfxN40G5B+Rek+9tr2ELccF
	qN4D+pBNixsExVlmnvN/Q2RGCKDmdJgTP4wVgY6YfyXl0Mg3TPxkC2YA82K8yTj4btFWPP7qZSr
	rHnsWgI6V5MZn3HMTmOYHYaoMwh/uiCh7ZpxEW6DE8krKsoie2zbBer+VU1jdbiUhAkBimBoXz9
	Lf23QNhlsCzvyJN7Ak6xcXkhM9fDHk8+7i2X7iuq3AjmCSUej2mSHVhVitTD44gnZc41C58nxVg
	Cq1RVwcYanKPyFALVOXh8imhIZv0boj0Cbu0ZhqBVmc1BuBVh+8nWrLa5MZMZ3mSwxKQz5t4Ayy
	9u3AGrWpN6fHyTgkCyS+r8NWvYlJy6g4442ghJcMkV+dlxtFk8zFRHcRlkr1rrc6UlIjZ6xrig4
	gYVlLMLNgt3+KkNcUSmdiEyn1YK/4MQbScmllc/T8uaHcy45Lw==
X-Received: by 2002:a05:690c:6d83:b0:8b0:df71:44cf with SMTP id 00721157ae682-8b4fed0a8f5mr20096457b3.15.1795046962815;
        Wed, 18 Nov 2026 16:09:22 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03091esm26030767b3.12.2026.11.18.16.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:21 -0800 (PST)
Date: Wed, 18 Nov 2026 19:09:20 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	Dave Chinner <david@fromorbit.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jaewon Kim <jaewon31.kim@samsung.com>,
	Jaeseon Sim <jason.sim@samsung.com>,
	Youngchan Kim <ycshark.kim@samsung.com>,
	Dmitry Skiba <dskiba@google.com>
Subject: Re: [PATCH] mm: workingset: compare shadow nodes node-wide without
 kmem accounting
Message-ID: <av4-MCNVImLfcmMO@cmpxchg.org>
References: <20261106235904.1092712-1-tjmercier@google.com>
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
In-Reply-To: <20261106235904.1092712-1-tjmercier@google.com>

On Fri, Nov 06, 2026 at 03:59:04PM -0800, T.J. Mercier wrote:
> count_shadow_nodes() limits the number of xarray nodes holding shadow
> entries to 1/8th of the pages that could be using them. For a memcg, it
> counts the LRU and slab pages local to that memcg.
> 
> With kmem accounting disabled (cgroup.memory=nokmem), shadow nodes are
> not charged to any memcg and __list_lru_init() makes the shadow_nodes
> list_lru non-memcg-aware, so all shadow nodes of a NUMA node are on a
> single list. shrinker_alloc() falls back to a non-memcg-aware shadow
> node shrinker, which shrink_slab() only invokes for the root memcg.
> count_shadow_nodes() therefore compares every shadow node on the NUMA
> node against the pages local to the root memcg.
> 
> When most tasks run in child memcgs, the root memcg only holds a small
> fraction of all pages, so the shadow node limit derived from the root
> memcg page count is far below the number of shadow nodes on the NUMA
> node. Since the shrinker has seeks == 0, every root shrink_slab() call
> trims about half of the "excess" shadow nodes. Most refault information
> is thrown away, so refaults of recently evicted file folios are not
> detected. Refaulted folios lose PG_workingset and the workingset_refault
> and workingset_restore stats drop.
> 
> In testing on devices with kmem accounting disabled, moving tasks from
> the root memcg into per-application memcgs dropped workingset_nodes from
> ~37,000 to ~900 and raised workingset_nodereclaim 4.6x while
> pgsteal_file rose by ~12%.
> 
> When kmem accounting is disabled, compare the shadow nodes against the
> whole NUMA node, as is done without memcg. Behavior with kmem
> accounting enabled is unchanged.
> 
> Cc: Jaewon Kim <jaewon31.kim@samsung.com>
> Tested-by: Jaeseon Sim <jason.sim@samsung.com> # Galaxy A18 LTE
> Tested-by: Youngchan Kim <ycshark.kim@samsung.com> # Galaxy S27
> Tested-by: Dmitry Skiba <dskiba@google.com> # Pixel 10
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

Looks good to me. Yeah I don't think nokmem is used by too many
different environments!
