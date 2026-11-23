Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459225;
	b=KgGHcWJJDlutanKnA8yFGiw7Yf21NhmGtukVHn/1D8lp/Vqo7HbXDAuHFf/GWkwZMb9F
	 +bYscWK7MQ+LDSooXafU8A1enyaTwaGbtoN2ZBma90GlicLdN4rnSc+WTZWHsB3lB93t0
	 6+QSBUkPSVZjpuDEUYfSZGvd5QjBQlBpdc4Fpr3StFyU5gCJk9MCR13Xdm1weNhXglryk
	 b3i+hkiHHI+UJ/oQKYx2fxHu72twLK7MSLH1+SMU8z2lqNU/2LAnUfke1OJ0/y4O58bZN
	 Yml9O9og5d8ZAQFsADRC7yrQpdHZY1W38C5rQgQrpfVB0K9oxHnspKlK3TD462VbrLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459225;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zbWiMuLWEtC6VF7ymn7U7/1PFk3dFO6xySrPg9JcUPk=;
	b=xZdRs1XeQQamys4S8W0cW9MZTXOp5vcEGLrTrERxws4ai+IrtIBKkhjIYKxDjGKCw+Da
	 +QUltfIvTd9Kkjtc68Cbehyi7dhqLQBAzOsnDaOCxHHEhGwqBJhQVEZTim5zP3LiHvAq1
	 wz2+OYiQkS7pxCIFDn/t8mZ4sbPXkLzQzgw8x3I/Wvz9Q3OrKiewlzNG+zhJMcmwY9PQa
	 lhlrnfMQ85G8iH+InK7D5Lsg3qRmrEE1KjYO9r90WA+dC810jWmp4zGgJrKByJoQfxJ3C
	 IX4+NWJ36eW9u5M1jwCDhArjMBxBygpl4EARiGMbrEOgqvBg8m4UWwSohF5xL7m3rNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvXhpuIu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265BB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvXhpuIu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192BC1F000C0;
	Mon, 23 Nov 2026 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459224;
	bh=zbWiMuLWEtC6VF7ymn7U7/1PFk3dFO6xySrPg9JcUPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TvXhpuIu7BmJs0KnVfb0hIS5nE4sSxgXUTwRIhck7dpblkXbMRn1qe0Ud8K9Nh6rH
	 Bjc7dJoT87mNgjLSEZKPow8dj/FxeQAhU6ArJxzeWiLPhh+3I83QhViQB8GeDuepxn
	 EKgpuiMZ/F13mnvOUJHJjB45LS+No/7cbyBnVVRQ2Qg7Rh+EEETR9bXb3yvNxB66eS
	 hZBH9y3wrf5OXFfMmgjawpkf8IDMvQXQo/F71/P19KbgN20gE4bJguQTSk0+m5XVHx
	 rsCm5UvxIR3MBwmSQZGl69GI/F+hmZL2bEIvhf9com2ZLq7nlhzx0CtSntiKAiUnLD
	 iMF3d5z8iqwdg==
Date: Mon, 23 Nov 2026 18:40:22 +0000
From: Harry Yoo <harry@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 2/2] mm/vmscan: consolidate promo vs. high watermark
 checks
Message-ID: <awSHRi4nS1evi27Z@thinkstation>
References: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
 <20261123181829.4065581-3-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261123181829.4065581-3-joshua.hahnjy@gmail.com>

On Mon, Nov 23, 2026 at 10:18:28AM -0800, Joshua Hahn wrote:
> There are three sites which all check the watermark that kswapd reclaims
> zones up to, which is the promo watermark when NUMA balancing memory
> tiering is enabled, and the high watermark otherwise.
> 
> Consolidate the pattern into an inline helper and move the dependency
> on the sysctl.h header into page_alloc.h.
> 
> No functional changes intended.
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Gregory Price <gourry@gourry.net>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Tested-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
