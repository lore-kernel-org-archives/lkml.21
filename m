Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362310;
	b=naC0YzgQvuxYLp+NYYZjnWqAF0iWLvfyU6xwzL+Oqm+0L47btJ9UT7drHMdoESwjnwK3
	 2pbYKAOgJIP/CDt+OP7JbwPvS2Ndc7jLnhvNEkOV+P2U0CZNkkIeRdoYLRsbqrh/1x7HP
	 fzKJ9IXCyn8z+naZEHfY2sRm+ciSvDpzl0fWIqH43WCydqNA+CNLdUssVmmZnbno0+Tt/
	 1hpZE0IROKWYkvDvDM/xwsBFHrpQJ3oALV/q0Hw7mMGQdxYUjrni1hP/1nVSaNOjSRGWu
	 3ISRTbb84aWGZQLp6ul3XY7c9XIeDLv5zU4n8rUeWzkfNFDtCLaBrEkP5IoIPisjCDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362310;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=sW+eQaQnsCtB9xADUO1Vgac8/iI4NPH4lavfmN/uT2E=;
	b=LJ8OPpxUpvHN0XBLZlTMKK7wUILuFaWOuNG5sPnscEIivv+frGrPfASDSe0rMS0xLcng
	 x4HJuSQHmlIOcy0BAIBWEhdsxAsx2tm6kA0nfpRtXq6fc2cC7hb6Vd6Uf1d0n3BXTUWg+
	 AaSg1zck59Qjm7W5qNkLU9Gr1sYzVUwapHOF7c9l9wFuWNq6afF4sHJU+574/2P54hzgt
	 DM/DBVo2kkfxKgTK+pIqZjK+5H20/rT9m3SYi67Nk5OgEiK6hb0r82YY4RiWzMPuKSMas
	 wKeeDug6QJRDa9haJnReTO0gQrA5F9qfFYzL2i9Jo4SLw1l0CNvrQPoHoTe7FMP2B1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXM9DxsY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB1606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXM9DxsY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE641F000C4;
	Sun, 22 Nov 2026 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362309;
	bh=sW+eQaQnsCtB9xADUO1Vgac8/iI4NPH4lavfmN/uT2E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BXM9DxsYqZOV06/Ftqj0aRP8plbW++upiWm2hYl1HOaByDwAouH86A4pOlg53gMkq
	 NcTu3OhCWcdd3FqXb6V5uTR/wKypF2Z1nWMwAAF8Ycckw8nkuDlpuo2V0k5nky66R5
	 q03Mt+dT+NQ5pji6/7FVuWNs0xNMKfj/RL8VUaXgaK48lY0+zg6s1nH4e63cZx485N
	 qZWn4kChFoMF+0XSO3lcWMYomCa67lhWonuXmbdQ/VUNinktZmLn2i45+A6X8QVbRC
	 v2MQelj2Ft8eYNnFl5+GjD1214lxZbymvSoJ82KpEls2/cppP86pOz1fmTU4R295VD
	 CrS8qG0JTwtcA==
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
Subject: Re: [PATCH v3 02/11] mm/mm_init: factor out common struct page
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
In-Reply-To: <20261120100856.16929-3-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-3-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230136.3933282.8488621746442530780.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:47 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Several struct page fields have the same initial values for every page in
> a zone. __init_single_page() initializes this state as part of its
> per-page setup, while the shared vmemmap tail path open-codes only a
> subset.
> 
> Factor the PFN-independent state into memmap_init_page() and use it for
> both regular and shared tail struct pages. Keep section-, PFN- and
> instance-specific initialization in __init_single_page().
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

