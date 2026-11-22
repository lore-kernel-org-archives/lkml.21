Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362315;
	b=KZsLzeXd7Cn/7jYG3tFg4LGCDZm727vNadXs6of+0a6p02w3QsLcfb7c/H00PFvacusz
	 6Yn83e6qdpBainj1ljIHPo8BO6x1pRE4Ac4UqyRsHRxG07s0dKqyQGnu8XSKu4tbl9G87
	 quQOQ06eb1042zKxyO2iFo8wMtXr36I8M/Nqm2TLsL9L7hbugdiY8shiVuzF6IqS39TvD
	 UZMnkOEWUgPbVmqL4KjajintkR5oNMnULkYLk0Adkdz14rfwkdlz2cwqulxHk7+GELvG8
	 F2awg3NZU1dYsO1zGp3rOIUPBj3zZYqlqoukCK2wJ+1QWyyluBH2yH6w0C12+AG7pYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362315;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=KFZH0AZyXfU9b1MVkZv6qUaABnlF4rXr9gf9ekczrx4=;
	b=OWrA0KQZ7nV39wu2TdVvVngHAb/jZxLR187RqSBuE/tHb9d4WsIb+00o8iumr1xIN9TH
	 119PuahABnOTa8IPzZo9tlYbtN9eTR5jpc2BORMiT7ztqRWSGrK+dBNpiH5/9b8A5youz
	 DWtbP5ijXsxxOQRWNwwukB0akkPynz5iJ1XLD2aoyCQpQ9GdKfwXDPopmYuKvR33gTJZh
	 8tY1BNgw33gzsjwnauu5s0bT78fkdkQssETETyt4OKKVaA8i7ZvLynv5gQhaCI3Q4Kmc6
	 NtkA59/QjoVcXWBbOz0wLT9abbsgz6/5VkRCH/buyOT8KIFfWCUJvaIAPU2pi6tjjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knANyb0T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83270606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knANyb0T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B401F000C4;
	Sun, 22 Nov 2026 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362315;
	bh=KFZH0AZyXfU9b1MVkZv6qUaABnlF4rXr9gf9ekczrx4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=knANyb0TG8HksC2vzIjoaZcR6GLrc4P/hYaBK6c00mYHbs1h8ZLgdtKvdlUWattto
	 AAp5APUZp0QJT4XobHoXoH0Or68apPKc2CwPG0/+kW6oiljIG4X4MYCi9kKup0PO2o
	 ifyNAnwMotnHyLsgYfHJQ3EJLEVAWbGdQ8oL7Tj8Y+sAo53Yv1bJ0EdJm1dioc3oNr
	 LIxWNoDiGDKNjTJ43tlqqrWl46/ZuoI+csB7sb5z/2hNEppMm1uVPRKJBMPxisAz5X
	 91RhKRjhVrsK7jZA/W2/76qLhuxK3ZvkUAClZp94kkSwrpGZLbqnUSK9VzvGpWPtCJ
	 UHhatCzKG67fQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 03/11] mm/mm_init: simplify zone device page
 initialization
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Mike Rapoport <rppt@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>, 
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120100856.16929-4-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-4-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230136.3933282.15537267556935821561.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:48 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> memmap_init_zone_device() currently seeds its reusable head and tail
> templates by fully initializing the first real struct page and copying
> it back into a stack object. This keeps the first page outside the
> common loops and leaves __init_zone_device_page() only for template
> construction.
> 
> Build both templates directly from the PFN-independent state. Add the
> head-specific pgmap and refcount state to the head template and the
> compound metadata to the tail template, then initialize every page
> through zone_device_page_init_from_template().
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

