Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426608;
	b=nP2nRE9SvKCpVaobQ++8sQc/+BjUmTG2TrJwablYmi7Drfnlyvbdx0HjCyPzPcm7zI2u
	 lAyAe89br48o/4vuwILMsgTbCDVpKUxF4voG8RxHrbSnplRV/Cm+c+gNtbIbAjSBFLusm
	 bkX1Llz+IHm18Z9K+aX5gSwsRpvx1AtM/vpMBqge+vjW6o52Mv7Y6snDm1wthTKBVYgcq
	 UDiS5C5BMhTRJSsnnq7zNxq9LP7ckZsXFaF/w+5SJBRqI2wPglSNJZhJH5Zbpg+GnQ1Yk
	 DXRuYicAx1jVzZPmcczZ1hiNoG2g5mB+Nb7S9uKiXl4atJPBjI4w5jrVhxAi0/gySfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426608;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TqkCeNdmpN1ojvlqAXaiFOL23olxi6kTQ57V2PF+UJc=;
	b=TQ3I8JoKwC/MV9PDB40JI4uxK2uhlLrWL7/W3CO31dilOkUiB6QGelUB/Krt6HYbORjJ
	 ECYkB4HjKtIRpvEDqgM67lgBI7P5nsNx7eHpjIdjF4Msxh7RjoKJMAL1j7YPzkNWv+dEY
	 j1uItlqMGABKZjgAHFjkYLdfjU+sF0YxcA2utjL0HtO+QvAVsw9CyQnd8mtxSgr/gYcfw
	 45spqdz9S06jI34k8EVP1LBJK+9wFrrXmH/ufpvBuAGfgY+7uOZntmbzU+UiEj2ddhw0t
	 nJZl4duO/95WhNFcDQLPkMrYu5xW9sRgQDygV5jbAQCJhG03S6DVRrSaWnQS0sE7i/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRmX8ub2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DCF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRmX8ub2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFB31F000C4;
	Mon, 23 Nov 2026 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426607;
	bh=TqkCeNdmpN1ojvlqAXaiFOL23olxi6kTQ57V2PF+UJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRmX8ub2Pj+TiuqJP4/xsZzUkuw2TrzDCQZjQamdF2NNnCHo9SxWIsliqjcbUhDmV
	 fEeI60qy+Uca+1Ot2mgmeilwWyoIkyxuay06uxV9YP7nx5WnR1RYOpJ6RLBshAAPZ3
	 qfSESm+OZGpD7/sEkp6okDkN76MvkHJEGSS79QyiU2OKu4HIT5r+2oQXOPbLT6Mhmi
	 ubLmI3gPuioj8DmH7r5GsPs63dY+zTGgEE/t2jEVoNX31tLW8vUovvIZiZZEuITbwB
	 A9VMfT4t4a2uzuKUnlto7LFp7QNq2UdDrrUm3RniP2ZNAr62gN9Tl8+Istx4YgW10f
	 pe/O4Dpzt5WWw==
Date: Mon, 23 Nov 2026 10:36:39 +0100
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
Subject: Re: [PATCH v3 08/11] mm/mm_init: make __init_single_page() static
Message-ID: <awQJJ9-V15lLTtEp@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-9-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-9-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:53PM +0800, Muchun Song wrote:
> __init_single_page() is only used within mm/mm_init.c, so make it
> static.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
