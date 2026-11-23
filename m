Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459651;
	b=3ZNqnHthVtyc+ohNBUSq6vTfA+qFDRo0ahX5cdmzQVTJhiADVkRVhhCUrz0xvYEcjOVP
	 x84L6TVVJWYw7aUb/uvbo6s/OTO1EdJOlWXOGFuEXcEudlH1USUIF0HrtjtJ1s22sJjWF
	 jDLR6Iya3IDoG/MAFqKxNhhETma50WOupTiurkurupbKubO6r/fmI0CJagUSVk8KtKHGp
	 HxAhO1rgt8Evqh1NRM4cc14I/4D5dKZQhPPq1urSSusrjk2shf8qYVIpPMhlO8vyTZdkv
	 f7HcG1qqIctM/8TryvHiJOJZHNKS9GwfVSl7U4rgKOeIGdwdXUKLFV9MH+ct1YHp7pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459651;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aSALYuTxlI9FeESjO7ECbl+uracOgIb0rur/G8EWRyQ=;
	b=0Wti3bktzWHO6Nb8R6CJeaXX+t+6Mo5eoXG4hT4Qyz/4iuZvbTLpPef9FEgV0jwSo9wc
	 8EB2nUYgr2CXGXg7OngPvOHoQbAny3D43oHGMJ6qzmSVFkNrTPCOLm7uaFDlKWKeSQMYg
	 0NAecp0XGvd+sImUCgBIs1k2PDcU60gsRELa6TzYdnpg3ZSJiWEudAERink+Gj5AtjV4L
	 fV5n0El6nNKNVaHYFHs4obESUT5be2iGMzhdD6jQo7Gmu9JjzcT9mgnPzjMYsNDqqLJVO
	 t7sHb2MC15I+M9OAv0dthBN2HjWtygpQ3zX6vU4xW6jJQmegee5aTOSzVCqQBx6YOzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgxVl97e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D90606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgxVl97e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6071F000C0;
	Mon, 23 Nov 2026 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459650;
	bh=aSALYuTxlI9FeESjO7ECbl+uracOgIb0rur/G8EWRyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgxVl97eZ3AUEyjHNcn367UVnLOH6rapiXfmJG3lNlByBsLNBaLobvSUJO7giH+83
	 pyFW3GW0CGzHTcHvCeNtwBB89xNEgueKTAvNLXCQbZBPyx2e2GDqNtfQvP3P+EOWCR
	 g4SD3jz4+DV/Sx6IwFwrIcr1ifMqVMhbx4LHa5DIyGJhpmsLdObKaLQFGQV6dNRcvu
	 yby66ii73BD3ayfJtRDK/r/sDGvt+/irzHH9AEzO+tPX9ETAl7u9p0AKlNDNs5247H
	 MDWhBZunKRtmIB35P++dhs91qi4EYqfVjglAXIJhf7e8R48Se0Jl/hTdIWl8ssagdk
	 B7ov1lMR/pcqw==
Date: Mon, 23 Nov 2026 18:47:28 +0000
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
Subject: Re: [PATCH v4 1/2] mm/page_alloc: move the kswapd node skip check
 into a helper
Message-ID: <awSJ7G7nf3nmL4zx@thinkstation>
References: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
 <20261123181829.4065581-2-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261123181829.4065581-2-joshua.hahnjy@gmail.com>

On Mon, Nov 23, 2026 at 10:18:27AM -0800, Joshua Hahn wrote:
> get_page_from_freelist() checks many conditions for each zone, often
> with a big comment block explaining the conditions.
> 
> Move the kswapd check and its comment into should_skip_kswapd_zone() to
> make the zone iteration cleaner to read.
> 
> While moving this, also resolve a checkpatch warning which complains of
> a waitqueue_active() call with no corresponding comment explaining why
> the lockless use is OK in this case.
> 
> No functional change intended.
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
