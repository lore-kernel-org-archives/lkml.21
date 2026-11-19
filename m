Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096014;
	b=jHDS43LPF/ghT47dizrlU2RwonxWo3YkfghIHlJjknvtYDMBTUel9FI226ZC9qMhzA0Z
	 Tw+F0o9EyT/2hiSU9xr7nTm6h7jjxQGu9fQgYFIS0V9gR8X11AR6sZnxTg82wVa1tvzOl
	 E3/FzGk1uX6C/UpKRc9b0t2UgqAOG2Wb2a4WBgd5WIS2HwmRX2l7AKr2BRSxsqTtriURa
	 RTFkRwh9q/6QnP0zO5mKQZQUpeGEduNeq8T4OwKphkcIsJp1isRzBuFcdRCd6gCaT45OK
	 z60sTMpk+eB9ELAtQY/+nrdgbDS2/Ta53vvMNRi2IWDE4ncG7jmLoh/bSGAy/EI+siA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096014;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p2A5NZTqls9QFw63SbXMQUkuhwEvR7r1jIlMHqoli2s=;
	b=e3jUZJlve6JKlyZRnkpwfxBIw9UFRfzp21ckdGp496p08WzrsN+C3kVLkxrc1c6vru0C
	 KSq6onp7ptzoTjcsni85/qK1oqU0BZ5qeWAaRxr61ZhCFtikJSrrLfl2Q1Sd74qw9ZwH1
	 K8DHgu/u6TL1aDcZc0zMy0bm7YlOIfbmVoKPafXKEeEYD1cnUSk6QH66kpCzDBkwGwOEH
	 VnneVlGXE/5PqxgkxMEbvJm72tY+qBEZaj6FHwjuXS+Lpxi/7jUwDQK51PpLEZq/SCIUE
	 9frHjLKOTETPKFvB69zdva52FcJFGG65IfsLo0igcY4hErNZzCFKqjiDcau9y3s1obw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YhIDgp/g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9692606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhIDgp/g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313681F000C4;
	Thu, 19 Nov 2026 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096014;
	bh=p2A5NZTqls9QFw63SbXMQUkuhwEvR7r1jIlMHqoli2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YhIDgp/gwt5U8Q6JNCbruZo5se2dpM1Q8YIhAT57WtkPXD4xwr/p+LwXY7wlicBvS
	 o6yd4ag1x9MEtMKQ75XVgiI7Tk32WHCyfXRomq9cG7Rzs+s6tF37ypHgjIqaSXQYAB
	 Kd8/Mnx5S2SQx+65k5CxWUUFlat1w5dL4wc03TCpgrygAKr9BSjKc6T1fCPGWG0mlT
	 8X9JAhUfqcIBvEn98AXqn35feK1kOaEJjhdZGbnJSPNxz0QVWnF1Ts2Tp+0gX6zb/M
	 5sHqYMwcT3KyQQ7/qyT72TpdSK2LRE9zZBusN/26f5RSKXQC0PNzodiTjrlyH2j1Yw
	 y+PW2/jGyyY0w==
Date: Thu, 19 Nov 2026 13:46:48 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 1/3] mm/memory: remove unused
 vmf_insert_mixed_mkwrite()
Message-ID: <av79tKo4-uM5oZbh@gremlin>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-2-ekffu200098@gmail.com>
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
In-Reply-To: <20261002160535.661399-2-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:32AM +0900, Sang-Heon Jeon wrote:
> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
> vmf_insert_mixed_mkwrite() has no callers.
>
> So remove the function and its declaration.
>
> The comment above the function describes the -EBUSY handling in
> __vm_insert_mixed(). Move it above that check.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/mm.h |  2 --
>  mm/memory.c        | 16 +++++-----------
>  2 files changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c038d06825c3..2ac734efd4ec 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5008,8 +5008,6 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>  			unsigned long pfn, pgprot_t pgprot);
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>  			unsigned long pfn);
> -vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn);
>  int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long len);
>
>  static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,
> diff --git a/mm/memory.c b/mm/memory.c
> index 330cde31bf8b..4b2e4be28031 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3052,6 +3052,11 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>
>  	if (err == -ENOMEM)
>  		return VM_FAULT_OOM;
> +	/*
> +	 *  If the insertion of PTE failed because someone else already added a
> +	 *  different entry in the mean time, we treat that as success as we assume
> +	 *  the same entry was actually inserted.
> +	 */
>  	if (err < 0 && err != -EBUSY)
>  		return VM_FAULT_SIGBUS;
>
> @@ -3085,17 +3090,6 @@ vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>  }
>  EXPORT_SYMBOL(vmf_insert_mixed);
>
> -/*
> - *  If the insertion of PTE failed because someone else already added a
> - *  different entry in the mean time, we treat that as success as we assume
> - *  the same entry was actually inserted.
> - */
> -vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn)
> -{
> -	return __vm_insert_mixed(vma, addr, pfn, true);
> -}
> -
>  /*
>   * maps a range of physical memory into the requested pages. the old
>   * mappings are removed. any references to nonexistent pages results
> --
> 2.43.0
>

--
Cheers, Lorenzo
