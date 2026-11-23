Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426866;
	b=R6g0pd3R/Nr5rTDlJ7RyKSDkRZ8D0QY2LzEszSlBIgfLyBjaOU2NgP3vm5mx1mwgn8Zr
	 WMC1G9j7jGuyRUv+qx6+cemHKeGA84nFX3oif7zuMQzRwQ9zlXwimhLRBNB6wgR02EdRQ
	 7V2CxQ59jATtuqvz7qiP/XWs7kW14/32neqp7dDc9cQ2vmROWTVjo3vRR1gTjSpc8FL8y
	 KLTJhH+3Y7pwd5m4AxsGoAZhoyqvgQNqglfnrESxxvAdqmQqqJRF593dc3+Tdy5JaYOk1
	 Ue+B6wrWDC9wiAl1tCJdz3Ketbrqu7V680CjKmPfYkott3iYrqPzah+gPYwxvWpA9UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426866;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zDbsCd40aR7Nelqiz/HDZ/5GIrPYzGKWnCVoVVylrKQ=;
	b=hvuiX1q8CV/B8ccKK+hs/lg/0lC5C3xuePHTQ1KynhMYh9lvAzgLOjscCJTpHsB2mGah
	 0F9W6QL6RRmw3oaZoXsSdSQNf3+mdoAkgCJF+HSOUNRvaKJI+FXbDuEoZomIK0BHdiyv3
	 AIu3uy9R967DrecL6T4NKRH0v2bqHW1QGOha8nnqolvM+e0GYEGKnOnAyqrE7y9eIZA30
	 JdVTZ4xVHSxe8ihMifSnmZsJm0K+TPgAi/Z38wGk88Z17d5ueboeevuxng9NTEDvbIL9f
	 8IV2HeU9k9vZfTrvbYqRpl3Jh9yoUZGVYlfY1tctmRLywChZCwdN0CPJUAjgvsF8bGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ii5KGgU9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA831606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ii5KGgU9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A971F000C4;
	Mon, 23 Nov 2026 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426866;
	bh=zDbsCd40aR7Nelqiz/HDZ/5GIrPYzGKWnCVoVVylrKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ii5KGgU91+AwbrxiYqP9KH9Qd4WEHVCyZvPdZcqMGofPlPGy8+vUsx8utI1Qc+as7
	 2VH7UaMcpWjCvQQknd1XiMpG4PdTc2TvX/8pstKHeb9RzXXJDJzhKs/t9BifU4S/ws
	 C4mcsSDGgS8dXgHf4XW6DtisLdPPBhjdEsJr5JnFwMlauuOhTQioA6fwiSJYLUPOWh
	 /yUsoW2h2Ey9gPXxGg8MD6GeDuR79Qc/GUdsUF0MzrZjNYfptWG0dbxk9t6N+4APgM
	 c3jWodz4up8EhQQu1p3+wJk1CwO0TWnBfg++BYfabEfRjqijD3PrJVWxMjmv8ro6hu
	 twnyGDZej7qUQ==
Date: Mon, 23 Nov 2026 10:40:58 +0100
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
Subject: Re: [PATCH v3 10/11] mm/cma: localize init_cma_pageblock() to cma.c
Message-ID: <awQKKhcwHGM-oiFW@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-11-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-11-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:55PM +0800, Muchun Song wrote:
> Move init_cma_pageblock() from mm_init.c into cma.c so it lives
> alongside the CMA code that uses it.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
