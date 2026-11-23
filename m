Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426565;
	b=PJNrTdDm7vk67GeNoWW/BiBXUS1cU70mycFbypL8A9JV751VatvO+ZVHKkIo1WNeU09j
	 1r15peWpIKP+w2YA/jfpobWoajHnvcqkNEM76JIcjlHZqsydUBPWobmagojCAATmzfSuV
	 YZ1Raz5X0BUcW2Hi0YsQN+Ys5bCZim0zaRMGkmX8orp6jM8wYipHydb7L/j4QkbqhOnk5
	 Pfd1AENuJtuXTqxLGOreHAj93htAt6NDeg2rP4jh3UCmvgmpdykofeuW9krDCl/SClAS5
	 YFFltCm4KCiSAEwUc9Xyc7ZUFm6U9seO81z7XxacS/Wqsl8hX0rIhnR35u25fzcLANw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426565;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CAWGz23rGNqzENElV956FqBAhMjVbGE4KtljtHFRvoQ=;
	b=mroudAEeMYBT5kNyHDqyco4cTtuB8tnXDOnyMvI+HFD99LMgJpVjk2wgkJysb2K7X0dL
	 6lzCu/uX1k96pduxUKJC2wuMb5uK3dBaXCwuyGc+JwLxuB6u4z8VzA6cXPqp23DWePXph
	 yLlW/LAbJi6m603F30Tpk6SEsIlYLMAb8QjXvlvhvOgv72NOEwJXkKQdiaiZhT7jDTILN
	 yOgoHgoCNEcpIMBMFap6X8XELKmF3EVLU+csKVV5ldk1vlL3AKZk0zFrJWpG3OBkzgL/k
	 /JnVZ2zd6rkw6nFD2SdERuPU6B71pC9YnF4miFXkNCnkikgm9wpGsc1BrU01/PhuhyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezxpo+QM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A47606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezxpo+QM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD811F000ED;
	Mon, 23 Nov 2026 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426565;
	bh=CAWGz23rGNqzENElV956FqBAhMjVbGE4KtljtHFRvoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ezxpo+QMyN+xBujUlkhdsWcEqSm1s2NAzsNjFK1q3up6wZtw6TX6Aq1sPidHCXCWP
	 /CiZnkzGdXrJ/UWgvOijYla3FbKR2KiyQSdx6xtCae+eWETscq8usrmZOrp1/5uN16
	 k2eIN3x8Ro+kcI1CfJ6V6onRNGWhHNqKawig996jO4aOND8L0fF4ALW/oxU4BFIRc2
	 kp/Vu9A4IVOi1hiuF8z6GOCNpBm7GSXq8UV1g0nF6d9U3AO/XX2/YAkSpdsdRYpSdd
	 4bRNe0u4G5+GnPthjr3+PpIYMopyE70A/9Flt14KAPPOK6sV7VIxG3p+HoMtsa1+lL
	 mKReSpbpCm3Ng==
Date: Mon, 23 Nov 2026 10:35:56 +0100
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
Subject: Re: [PATCH v3 07/11] mm/hugetlb: use common compound page
 initialization helper
Message-ID: <awQI_KM4SaZoXEtl@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-8-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-8-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:52PM +0800, Muchun Song wrote:
> Boot-time gigantic hugetlb folios currently use a separate path to
> initialize their compound struct pages.
> 
> Use memmap_init_compound_page() for these folios so that HugeTLB and
> ZONE_DEVICE share the common compound page initialization path. This
> removes the HugeTLB-specific implementation and improves initialization
> performance.
> 
> ZONE_DEVICE initializes struct pages by walking one contiguous memory
> range. Boot-time HugeTLB instead initializes multiple disjoint ranges,
> one for each contiguous hugepage. Measurements showed that memcpy()
> performed better than memcpy_nontemporal() for the latter access pattern.
> Therefore, use memcpy() for normal memory while retaining
> memcpy_nontemporal() for ZONE_DEVICE.
> 
> The initialization time for 64 boot-time 1G hugepages with 4K base
> pages was measured as follows:
> 
>   arch    without this patch  with this patch  reduction
>   x86-64          195.60 ms          170.40 ms      12.88%
>   arm64           374.40 ms          237.60 ms      36.54%
> 
> Co-developed-by: Li Zhe <lizhe.67@bytedance.com>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
