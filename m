Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096725;
	b=IWqQNYMhxX9SlouNwwga3YHAF3mayJz+Vu7K84TpFnCkIcYIZS/sXgc1Vgd20EWupazF
	 Lror/A4oNVB4LNoxhKId2yUp+682jUbZJjNIzK4ARFnpop0USq17GYk/NmWgkyv1/tzU5
	 dNQ12m9WNapIhkLXCoHLUFAoml1onYtC/JhKK5yAsSXDIwHNleA1nxfFH+a+cdektGe9I
	 EIxsyy5+UzwQBtRrS7xCfjcSaMtHbpvy6kkAxFL8Ce29sHnZXmQMliexKZZgRezcz0sx+
	 3HutuMxHc7eynt/mIP2bnJr/APQDuBQ7TNAHSKEZr2n+zK3xlUZLHseR6h8G8W3Va+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096725;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a+/Z+GSBe9p3l8KRKC/J0V0j2Fl7Ju04Nx7gfj60XfY=;
	b=mYmoV0xAS2BTKB/xuSEXWXeI1alxfTDlUjkjoA23DmGdARSGqehOSojNL5ui6oOBQ3Bw
	 XEMRi3kbzVt/4SE0uxuXwLV3t2LVz/k4EzpQso+W+NvoP1ZevTeQOV+0MhYjAC6G9z8kj
	 LrQ4F7+qSmVFJoeiXhSM4ZqE1WgqsoYXhtgt6JGMHH+vjPS3H+ExD0d1iS7kSI0LE0SG7
	 B28OqmCz/4sMydxnncWu9eel+ZhbVg2nwymtThp4TT1vf3o2yVvRyPkMtY4W91a4EQTmx
	 XOz8c9ucfpFd8Dw2Yn5u0E26/iGcem5XoO5iF7V6fyiH4mZkydSp6VX3tYX9SVo7IHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DPw6DNCe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DPw6DNCe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C75A1F000C5;
	Thu, 19 Nov 2026 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096724;
	bh=a+/Z+GSBe9p3l8KRKC/J0V0j2Fl7Ju04Nx7gfj60XfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DPw6DNCeOAM67Y1tF7h73C3YY7Wt08ykNTXv4QXKypZDGuQOdy1Gmv8W5G259LJqy
	 EDpJ84PfzvGLpJ413E6rL/+nbMciOWyHLVlNel5NTjDIluakeXaUBDpgW/dxtbcxhY
	 JbsLwoRqiewj9xvkUhUD6RdBdWkM4ANGQ3MKwRfGEFps+932xv3Wpw3s5nyaIh1DLb
	 QxmmroiSyMERAQlLbvvv0jWR68ZMXsAmUs4Xn9T0dYxc6srTA9QTylAHcr8WUnRVeN
	 BEjwFE7gqHqoOsU2adoVAF7ddrquz3vDMJK4YIkvff3BrGnfHTwx7lLdyIMJQ60zDf
	 vNmt+JbdgTS7g==
Date: Thu, 19 Nov 2026 13:58:38 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 3/3] mm/memory: merge __vm_insert_mixed() into
 vmf_insert_mixed()
Message-ID: <av8AOI_d5vSB6YeG@gremlin>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-4-ekffu200098@gmail.com>
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
In-Reply-To: <20261002160535.661399-4-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:34AM +0900, Sang-Heon Jeon wrote:
> vmf_insert_mixed() just calls __vm_insert_mixed() with the same
> arguments.
>
> So merge __vm_insert_mixed() into vmf_insert_mixed().
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/memory.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 6c1d38eba7b2..bde650e207c9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2991,8 +2991,8 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn)
>  	return false;
>  }
>
> -static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn)
> +vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
> +		unsigned long pfn)
>  {
>  	pgprot_t pgprot = vma->vm_page_prot;
>  	int err;
> @@ -3041,6 +3041,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>
>  	return VM_FAULT_NOPAGE;
>  }
> +EXPORT_SYMBOL(vmf_insert_mixed);
>
>  vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
>  			bool write)
> @@ -3062,13 +3063,6 @@ vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
>  }
>  EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
>
> -vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
> -		unsigned long pfn)
> -{
> -	return __vm_insert_mixed(vma, addr, pfn);
> -}
> -EXPORT_SYMBOL(vmf_insert_mixed);
> -
>  /*
>   * maps a range of physical memory into the requested pages. the old
>   * mappings are removed. any references to nonexistent pages results
> --
> 2.43.0
>

--
Cheers, Lorenzo
