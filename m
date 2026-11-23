Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425452;
	b=FgLvriJBXEZt0px3erl+iNEUDAFXjZOz9tvd1clzp8Bph84ByUOYX2WHANyGzj7zUJbt
	 UPbxw1Sl4Uuk7fNp04TPyTuFqBYuWcnyAbOEopefFKBmjZp/q4z66HQGQplR+MGA1tTbl
	 l5b0V9ww0sx4Bpyrg/rNDJp4OwrDQTuI/wPHL1IQXPZzzewTNs3h1EM59/iINPRpTITOm
	 MfRP3bhRDfdm1E/XGM5g7RO6RPN43RaD5tzsNQ2SOs0gwVBmOtq1zXQJGonYfYcMdGyTy
	 DQlUjA6N3I6R5uwy85MeNESf8HNH9u7tSp9/jElyPtvj3yb8kf7H6aQ2nHQqMlk5/dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425452;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pAeqH2lbSZ4Ao4jPN8l2z+KhJzrF0U/3yuXon/LVDYA=;
	b=ekPVhQ7IPG/fFLn787DSmhWbmSCs27dHfsw7xXPDJY8ZD3T8aWo1Xp1u5w0g2MQoxAQl
	 yVkwQ2s4+QXUQB/1TLGDp/dV3GY3AnSZZnEUnIF238fQut0zffbBtaHNQX5KhJzLKKlXm
	 KwVsjxBBpVaiaei59A5HH608slKxz8imK30ds/+QyfV5jl/B1R+zvpvyHBzKa2UR8+XLd
	 s8JBRUMbDNMhlLmbzqjnIkCJUUV223G/mmd+EbseRfO/6Got2Ptck/y3pd3RwzM0vxcHU
	 l4r00Q90Nt+QrfXrXdNzEttL4bXqsNlwMJ1kdX91gitNsaLfyfuWzd4Mq6LRrJwrZ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSsAkja9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8F606A696
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSsAkja9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC21F000CF;
	Mon, 23 Nov 2026 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425452;
	bh=pAeqH2lbSZ4Ao4jPN8l2z+KhJzrF0U/3yuXon/LVDYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BSsAkja97HyWf7GGseray2KaN536PM/WTiRetMCPtOR0y/38zEIi+oQ+85HbfxqeN
	 +AUUiMd5Mx+aucnHHVTBsqKuJShD+o0Tvv79KhwxRYASxacA4zhoUPfrAfdQk2BFrT
	 K8IWOa584LLX3/C6rNmDZFv7tUKHgKLFlH1NjMvFS8BzZGFwvIPdqc58TbR9H4lSjk
	 5/x1d4lyRfdF0ZWoFwwXk4l3KNGycZEL1zMr3LvjYiFRTujlDOxWr6zjWbtKtU0p9g
	 w0QauuNJvtK9xMHNyrTygWlzlr+20N6uOD1GTYF7lqQEMhiEUepZUCA9qmKCb7aqlD
	 3zaDvivrn97vw==
Date: Mon, 23 Nov 2026 10:17:24 +0100
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
Subject: Re: [PATCH v3 01/11] mm/mm_init: verify zones for
 template-initialized pages
Message-ID: <awQEpDupp7uEiRTu@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-2-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-2-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:46PM +0800, Muchun Song wrote:
> Template-based ZONE_DEVICE initialization bypasses
> __init_single_page(), which means copied struct pages do not run the
> vmemmap zone consistency check.
> 
> Verify each destination after copying the template so the fast path gets
> the same validation as regular page initialization.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
