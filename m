Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426967;
	b=nzvCq0xDQbQZFjFWsfn/Inl2wcx02oBSq6hH9d9/ewKw8gtHF9jb9dlNuzJwG8okOr38
	 ZjnDpESP8IGzvYl/rPRk9fHUv2kcanmLxIyRCyMuve4i8mlDjjAe+4EKwD/r3u772c6RC
	 Bf18lfQmEOq5WPOXPXWFwyq3gxeD4LviXBsky/k6jD89G7Hx+cBp6HG7cIiy8qjd2rM0v
	 pbRTcnrXXXnU95DaLKJ3uNWBYjX+hH+myVneMUe396lC1eg+b4DnRP1V4ivLoRpZeuyDz
	 wNJsNNcQ9zlMLZR7RclMemS+Gwhr/nI0ZjTcEfJbh1Gwteyk+c6sKr7u51rLJIeRSxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426967;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ou9HbEx7ssMVBMaWAZro4CSQQpcKzmh3Oi4G3bVclIU=;
	b=CCjJYtmUj34DPzDjQ0qG+L1XLM5BmfI7oxy84wLbzrQU9V/I0qZldMmLPIsnGCJebgaM
	 wdWQWXEBgl6Dk6vpjesQKdgCTRNcJIwpztd1YoUFJleG1D16mXRsiyfanqYp0504+U2tB
	 i9BNwkwo326HSvrkJEexpWsHKzmI7jiUI7fT/8iANZ1nZykkEcCgfNm48U3HsmDQwJ4sT
	 3IbDZE7TaPbp1h/SJ0qdYCYUfChk3Cdmwzeq9P7PN2Pm3HGnf30OB3MOV8XOSPmwLYXpv
	 uFVxrChV+8Jro+bpc9Aj/Wdl8lTg2BxdqoclNP56m7IN888RVyXAWs0dv+d9Zrcb2QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWRODS8D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB134606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWRODS8D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF71F000CA;
	Mon, 23 Nov 2026 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426967;
	bh=ou9HbEx7ssMVBMaWAZro4CSQQpcKzmh3Oi4G3bVclIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWRODS8DLeadYEUXqdhuAOcb/384tRTJG4ZbW51LNJ3reUaZCz46vEGx6mPoB3eEr
	 tGcw3pzDrf/vZ8JlXoP+lq8eh5rMF+5Y1nz7meZCVVBckNCr3C42T/B/QD+KLdyASJ
	 DMJZDKkgucekWw6EvsyEG6tIxK5zkscmCxjYCRU6BATu5Xk1CxrGZe4+1LElfeMRGx
	 /wTvsef5APv/J47LDC8hRkujWw3UVBcCnF40yWBHuT0HPkIiPB94S8837sTBC4Dizp
	 XTXgzJlFbbu+QrtDKzwFvI8gvSKKTjRJ7mzEKnNmsb9zFlrpkdMF8Toe/fRGnQWb6y
	 YBUAf0K4Gi9MA==
Date: Mon, 23 Nov 2026 10:42:38 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>, Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/11] mm/mm_init: move pageblock migratetype init to
 memmap helpers
Message-ID: <awQKjoEei56eyCcw@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-12-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-12-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:56PM +0800, Muchun Song wrote:
> ZONE_DEVICE memmap initialization already initializes pageblock
> migratetype after all struct pages have been initialized, while hugetlb
> bootmem folios have their own duplicate bootmem-specific initialization.
> 
> Move the MIGRATE_MOVABLE pageblock initialization into the frozen memmap
> initialization helpers instead, so the ZONE_DEVICE and hugetlb bootmem
> paths can share the same initialization.
> 
> The old hugetlb_bootmem_init_migratetype() skipped CMA folios via
> folio_test_hugetlb_cma(), but the shared helper always initializes
> pageblocks as MIGRATE_MOVABLE. This is safe because cma_activate_area()
> later overrides the migratetype for CMA pageblocks.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>



-- 
Oscar Salvador
SUSE Labs
