Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362331;
	b=BY5IeuKiNnUjAc4b4p3AO4BOvECK1pGREv+KCOQu0IuOHHXN3DcnQmfbAzved+U1YaTm
	 gfwQtkYTSv6QzvEEM8ulFttJVkEt6QkF15OSFjUAEKj02J7JEde3HNEl4B7iK8rngNBiH
	 d3pLHApRprtPlLhkDUoODi7WMhlaXdWrzdQ856yfyTh9TdHkOoTu5kpC//J5cIftJepii
	 2wSYIqponMa5KMIneaccpZMV+Q1JbrS3zrEl28PSQhI6bxz7k+ewaAeTCsT9B7jxbucm3
	 rMJMC/YC51hv3jEzTzRBKymqP9aGR2G4TgyMFlTXbGSeeOVhn6FrphSVRKXdYl2mPwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362331;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=RCGP8JTWzk0/2UfRI3RCZoOyl9BDZqYZnwzF6Lb014U=;
	b=aPoIxpZ4PwF6gGLeCP+KPLy3DolR1HjS3KlNJi286SqEuwgmc2NSSs1Bbx4E/N8uXmhv
	 cUzvTNBODnB3yQkn2ICl3kovmZU0JrNiXAqQurqWu5hUWdL9vyRPERNncqKb3x+KASsO2
	 mmxq1kK+FxZdfYElwnKPcEF1cDFI1Qa5zZbbC/3d7WE3/Ckv5hzPT5ThhoMhymMqKoLNx
	 ZBIGUW0i5oX8qK5zvykvp8Q/o8Fr8gnn6JCY7zBdyL7130GM2qzdTAzmHX3zCHC/S0fjc
	 iSKOLe7+WWNWGuFkThFlJ6Smy1CVLl25UCWuZh8+lo02l+BhAH6c0BxkGKsJxG2Vg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpmKIC0E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C4D606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpmKIC0E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8788E1F000EE;
	Sun, 22 Nov 2026 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362330;
	bh=RCGP8JTWzk0/2UfRI3RCZoOyl9BDZqYZnwzF6Lb014U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RpmKIC0EaValzjjEO3VeeYj1Xa6emxKYiq8pGa1cpyvcCbwLb5XvgCX5fyp/Sejqx
	 CSMfQrAilu620202iNsT3Hw8ORq0X2jzFY4pYnMqYfhit/sz1mYsX+Df5EzayngTwT
	 H3UDvkL4OnIwFGwP1Id71EY6GNV7F7q3BwqhFU+VvCAWzqeiKmUa776PfmOmqQHETy
	 dPXrSfH4WoLj/Qnk7rapof4sdD9xw6LCWPeA2bmGrT+p1VsbsVxbcl8Gu36V2aU5Kp
	 sK3t5jFhfkoWQtNWtwoUbtuODLioLnlzdUJliFU/lt09rMjNEpAYUZjnq5LalNoq/O
	 eUYwxcPdX8bdA==
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
Subject: Re: [PATCH v3 06/11] mm/hugetlb: initialize all struct pages for
 bootmem hugepages
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
In-Reply-To: <20261120100856.16929-7-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-7-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230137.3933282.2792134004607727535.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:51 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Boot-time gigantic hugepages currently leave the head struct page to
> the generic memmap initialization path while the HugeTLB code
> initializes the remaining struct pages itself.
> 
> Mark the full hugepage noinit and initialize the head struct page in
> hugetlb_folio_init_vmemmap() as well, so the whole compound-page setup
> is handled in one place.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

