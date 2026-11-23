Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426742;
	b=a5p3J+IrZYLEAznQFkN+Q30Vh2n+u0JPGFjPwScAw9aCDAzmvY7Wqik6ivyZXtezMT+G
	 rXO1hedPggugQJDJzVJ/0ADdisrRPHILqV+K6i97g5eaPiv7F0eLQbTbBQDhRRcR5XLIR
	 lz1cUNOm98rO/Jo3IZZw2Wz07oX9d8KzeUSySge2qOx7w6JukCrszQ5F8RFpsuCBLiRbq
	 5wkQfGV7FULZ/saYtePOoGnB2rmQbfEY3PvwcdeS/t3+4x/b43gOV1G5pZaJ8hRMirAFq
	 JwHGcbn2WYQVl79n86hd+Rz/XJcx7Xnb8tEjFuXSVMM2KeuxueXRBpZJqUHN26y4Txw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426742;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p4kT2PbsLUH/8zbjyftxImFQBIAZp/1opbC0UWneA9s=;
	b=0mlQLTzWoakoW4ksx/AlanN+iH7rgn4yezT3v7yyvUSRiGwyVI8vfT7zfg7ULdR8kyKF
	 3sjj+7X+bQHFlATJJPBowItJz8QqeyaX0wFv4Xo+dkVKPHyFmbq9kxThtSUbFLThUZJgZ
	 5tflyW3oFfz48uE2SFBi1W/h5Q7qxvoEugwC1ofuqQixPFG2U1k0Cp0ocrBJdtUzH0vzM
	 /MB6cSJZgaM4xPi/k7WAZDU7Qed7cLZ0/4oNpCoGJdzrfH7K43SHfx/D0MpbRyYF3lOWU
	 P1U5kAfiU7NxQtsdsaH1q0JS8Mr/36gMfkMVC0XjXVXPaZD/G9VjdalQnc2hqgKjdOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNCYHgmi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72947606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNCYHgmi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B1D1F000CA;
	Mon, 23 Nov 2026 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426742;
	bh=p4kT2PbsLUH/8zbjyftxImFQBIAZp/1opbC0UWneA9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNCYHgmi2kkGeS5qIT8UVErS88deSRWmUfkZjVx62d4DujkBhSOnGFA0Bf2o+kqCP
	 zmmidedoTTT49FdIx9vU4aB57Q//oPyEw/C05MzvWAV4wUR0S4U3E3qB/ChA7uluhX
	 7c5H6YlPpME7xCcI9moRx6EVxufyQ75niXtuMTyDBGWuDulvi2U2TnfWd3yr5Oq+HS
	 Sst4CRzXikx4aS1/SAQclKiLBxvkeF6aRjSW3Qkm7K5Tqu7X9U5CHn3/qkfH2rXpQy
	 KOPMEkf4eJLcrZx4l1RyYCk0uMhahOS3Q/xFeyR3bNUNov8dS5Hen/CTAFZuYooVRF
	 ZNsn7+QSvZZww==
Date: Mon, 23 Nov 2026 10:38:54 +0100
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
Subject: Re: [PATCH v3 09/11] mm/cma: centralize CMA pageblock initialization
Message-ID: <awQJroxCj52AqPDH@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-10-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-10-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:54PM +0800, Muchun Song wrote:
> Early CMA reservations currently require callers to maintain CMA state.
> This exposes internal bookkeeping requirements and splits responsibility
> for the same area between CMA and its users.
> 
> Make CMA fully responsible for the state of early reservations. Pages
> already handed to a caller remain owned by that caller if activation
> fails, so keep their managed-page accounting intact regardless of whether
> CMA retains the rest of the area.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
