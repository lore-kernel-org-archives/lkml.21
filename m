Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004118;
	b=XH58ZFFdbMZT3XjyYEo8960R3NY+UoGpstD+3dtcs5WC4E/Qh0zlPXeWbYUvNHSH5k53
	 xoDPktdY7faGqGiJz571V1YLjEL+AKZtXLVbnpcXs6rNmAASxyeyron4R3QseUIoRck8q
	 WKtP34GoYgYbXBt20V6DK2S2ajhV1GEUZv8y5PXFWnAb+FzBo8sds1o66TElszrLmWnw/
	 8my4M2Ubt9JKrozlKg4e76YPJzl1rmmpCarhDJ9/DyUojy0SQ3zl2X9LPOiF9k6MoOV5X
	 7Sut28f0XT8IrNHdA+ykVZK03rCjdxIDWYHCeR5vD+3nzebnM7ImbM20BOflwRFsXkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004118;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MZT8OsyWtlECLblK22MqWE/7zRD3o2ixQEVKNmjYjq0=;
	b=onHw+luInX7kx/PHcZpTAjvK+u2fVSAeTvTEj2ediPS2aDmlQc1H0/zkoMfS92S7A8zZ
	 lTevabSWJMH3IFr8bXWTDuxFiJcHCW8PZ/H+z3v/7fMVTwP2UwfpRVzNIrzMYp43csBTF
	 0dwBRrVrHNIfdhvletdmknNLNFRO0awNaQOi7gmhMK+fhZzHMUWcNvluhwFkien8yBSTL
	 dA82t5xdAPoKqq3bL1SLsYZDKxuXRVGfgWg8rjPbbe1/IaTTASUepCkHaduBJDZlt+GO6
	 wm4bzj12tL1y3iZNyCueglgoyZaLsGkYtP71hB9ThrTMtLsZimhSXYWXz98pCYvX8Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+sSyWJd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2F606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+sSyWJd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713881F000C4;
	Wed, 18 Nov 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004117;
	bh=MZT8OsyWtlECLblK22MqWE/7zRD3o2ixQEVKNmjYjq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X+sSyWJdLT9spChVvpuBa/0po6wyQQR26ogbloXmNyDH3KPO6MeTYi/gK0EqUgTJU
	 b5/l+qAPxlaQOwo8H68jwEK85JLP67GJkNUUi0Im/2AQKPfSrIs5MxBUXvN4pwZywT
	 384dXtqN+qjKbtzC5mMhSgr1rXhElmUjvj2iLzkvRjjQBiRd79U0IoqDPGQ4g7TzcR
	 USNe0XIGCgk6jravjfM6vxf0F+h1HmG/BEOVJOXU6BN8iB3MbauPgG3mRRtO4mg+81
	 hjp3PWIGIUyue99a8Kll9MqXxzZyeSZhXRTmLRQUzn06AK1rFwc3mYAr83iLmd5nen
	 oNYa7bC7nqamw==
Date: Wed, 18 Nov 2026 12:15:11 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Zi Yan <ziy@nvidia.com>, Luiz Capitulino <luizcap@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
Message-ID: <av2WmHeZlw0b6lOs@gremlin>
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
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
In-Reply-To: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>

On Tue, Nov 17, 2026 at 04:26:18PM +0000, Shivank Garg wrote:
> It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
> for page extensions") but has never had a caller.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

(with MAINTAINERS change included) LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> I found this with the kunused scripts [1], which I wrote with LLM's
> help. The v1 cover letter [2] has more details on the scripts and
> how LLM was used.
>
> Changes in v2:
> - Split out of v1 [1], as David suggested, and based on
>   page_alloc/for-next. No changes to the patch itself.
>
> [1] https://github.com/AMDESE/linux-mm/tree/shivank/kunused
> [2] https://lore.kernel.org/r/20261026-unused-sym-v1-0-82ca2dceabe1@amd.com
> ---
>  include/linux/page_ext.h | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index 79c53ec45dfa..52a8b70c525a 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -167,17 +167,6 @@ static inline struct page_ext *page_ext_iter_next(struct page_ext_iter *iter,
>  	return iter->page_ext;
>  }
>
> -/**
> - * page_ext_iter_get() - Get current page extension
> - * @iter: page extension iterator.
> - *
> - * Return: NULL if no page_ext exists for this iterator.
> - */
> -static inline struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter)
> -{
> -	return iter->page_ext;
> -}
> -
>  /**
>   * for_each_page_ext(): iterate through page_ext objects.
>   * @__page: the page we're interested in
>
> ---
> base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
> change-id: 20261109-unused-sym-page-ext-3fb8316ac777
>
> Best regards,
> --
> Shivank Garg <shivankg@amd.com>
>

--
Cheers, Lorenzo
