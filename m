Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425699;
	b=5XOLaIyNtcaeQk3ShJGSCJs551nssfaC9uZN2NguGtwJNRTLZOLrsCiM5/o35fH3zn+4
	 o10O6SH2/TboVyx2v9dKXUWZMBrlI2HONRxfe1rhuM1pnKZWW8LdLNPwOR5ZZ/Zzxpekm
	 enGCocaWJhDz0AetY8cFAa3SrALXRQPm/kmy6lNXniVfu3O2sqi/MnVYVjuN1pMHKMh3B
	 V4t3NbZl46Yk94f91A8ochfFRSJcSHBfeFvanlg9mkmKYeuPQW//sjBIe1B3QswFaywBX
	 7s4l8iJ6ddMeQVRh/fkO8bst8M39CdR+jVtsZ+xDEujn7NqV8gsnNcDgv5aQ2y8nxAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425699;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MXSMwC3EA3gaqHKW4Fb2hsBvbWnm96vp3sI6EUJmVdg=;
	b=VEGZdlxRwKMn18lzJWzcbpdFeuMAacgdVD2k1amey/YXziorHObo2If0I5QkSJpuQOQ/
	 0M9lNf9xTT95OPP3OfEahjMuQA8kTx8CWg37A7891IQvyCREv+Vtf4l+mo/ZHXyJpG+DS
	 PdR9W3Zj/h5cUTkaE2lJtXhtFhnnzUPnnSSK2uPd2TjOLl/G95ANE7oZ8Js9u0Z0rPYdu
	 gyG+h8fPIKM9aZT9MHzyQ5svr0ldqa8+ooxo6K2SS4NzqLfqmy4iXcYGfzzdhYHq6blr9
	 CmZFSuHfYCRMa1Ijty33rXjx+sDyTSPXLg8V/qCuyePnfl3r81bQzs1/9LZPobuA1LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5aR9qt2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5aR9qt2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8773F1F000C6;
	Mon, 23 Nov 2026 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425699;
	bh=MXSMwC3EA3gaqHKW4Fb2hsBvbWnm96vp3sI6EUJmVdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h5aR9qt2lMqmI3Rizi1Q28Ii4IEpiI0lfJRb052ftraEp8M1i2TAW6k0mUro9BJco
	 ZFHoll41KKNBinMH6mi3R9eNbUvbkzbOF2BxfG9iBvSDFSiOJyPigFuUILINUr0jzt
	 gilZshzmq2dF25Du3wLejMylMI19FAQ8HC8CPYGEoORN10ZsWLpSjKyNDXG4CGePuV
	 ZXT752joMsC2sK9eZOPNDmUBSz4TId1KX92BSVeVqcWA+lyfLs+OGHdMPUqZkmb+eS
	 jXYgzJDaJqgIuC+D1jrezc4FDj+rxqsgHUEJvciU+mYgraPLmOnIvXfCNPI3Yzo+yO
	 VZp42ZsVXZwOw==
Date: Mon, 23 Nov 2026 10:21:31 +0100
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
Subject: Re: [PATCH v3 02/11] mm/mm_init: factor out common struct page
 initialization
Message-ID: <awQFm3tF7uxCR86o@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-3-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-3-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:47PM +0800, Muchun Song wrote:
> Several struct page fields have the same initial values for every page in
> a zone. __init_single_page() initializes this state as part of its
> per-page setup, while the shared vmemmap tail path open-codes only a
> subset.
> 
> Factor the PFN-independent state into memmap_init_page() and use it for
> both regular and shared tail struct pages. Keep section-, PFN- and
> instance-specific initialization in __init_single_page().
> 
> This also initializes the last cpupid and KASAN tag for shared tail
> struct pages consistently with regular struct pages. Since
> memmap_init_page() marks ZONE_DEVICE pages reserved, remove the redundant
> update from the memory hotplug path.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
