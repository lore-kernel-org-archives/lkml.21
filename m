Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093489;
	b=YsxxtanvSbVJXhyRiKcjGNxiFd3/YLy5CVhvv0YH+bFy3Hk/4uNjfJn8yVESlz5ShbAg
	 kAQVUETJ8kPixMr886cI/35W6mMM9V2slbtCqUIcD08ab6aAP/Q5UEQNR9gAa7KDFS6MF
	 Yb2jHALhzNfrjR1YuPu7h5mGb6BSbl9PHI58OTeD7kCZyjlilTtfehwzkF5MSicur2k6g
	 0u/OwyR+2RWt3VEPARaea7nCCxRlyj8NRNlacZ9D9Aq+CMqxI9Jz24Q0R6k37Hu2oAzA2
	 DvT7zYugUi8q0wTKTX1voeKw7h6HlgUPEXcmSnQEdV+UiDjHeBo880vGhjYW3nKPlIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093489;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4c8ungyxd7RexQhrWA/AoLG0CKBNNbv9BDRY26QePAo=;
	b=3eDI4Nn4rv38mfR9Klyq2w8v5/ryf5YmiLbAXWGJHkN0cCIW9ErEJDgoxlVQ95ttD52F
	 GKJx6iFo43AesuuaC9AnxzkWf3YpPC9ICp2PMZFa389Cf/RQLBGI5beaYk2pVOb5GuOlG
	 f7wq0rg35TY6+0/k0QfhOYbHw6GyFDYYuZyTkxECO3CJA/Ul3yEkjhBJyMXrRMllSlE+p
	 in53DCr4lJxLN4Nlf7zP6959ZJPyIz8ueZPi438PkPHWrgQ4atzYJzTB8gD1rRRO9LY8F
	 5iqZS6Pw8lFLjG2xwNVoQmHUCP+ysrTwF2JH0yaJg/D+qBnFWS/dJ5T0yKJWaiDxkqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGgKZMQu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56E606B180
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGgKZMQu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11DD1F000C4;
	Thu, 19 Nov 2026 13:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093488;
	bh=4c8ungyxd7RexQhrWA/AoLG0CKBNNbv9BDRY26QePAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGgKZMQuxgk09BHdmqO2j2nlgUEpHHOj1xGRM1Xotj3U8BRm4bf16g1xavHCr+G3l
	 u+mD0GxxJPxcvAmfmim3h8jcNhLxT4WkjUh9kxYYKnVhB1A1s+Li4DaabxcdWAnNbW
	 7sEihZNT/OITB118S5flqdaQbyoS1Tjoa01oF9SwpgWPcGfINtIilkA0UPNacAQVTt
	 XNxljucTL1IVkUcgSd8dy9pe5CNHC+8KFMo7DGb92Cg9ujqa2Xktu5tYPzDcqnBKgl
	 ObdtLxc6VwFuHon8akz9sj0juhx3vaer+5hNKe2nJNIOYZnws1kKyAT1khMqc3LIp/
	 vgPfH7UqzHDKA==
Date: Thu, 19 Nov 2026 14:04:44 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH] mm/mm_init: don't subtract managed CMA pages twice
Message-ID: <av7z7Im4bGE93zQ7@localhost.localdomain>
References: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
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
In-Reply-To: <20261119-cma_managed-v1-1-385751505e24@kernel.org>

On Thu, Nov 19, 2026 at 12:19:06PM +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> With hugetlb_cma_only, the "reserved" value in the "Memory:" boot message
> can be wrong (small or underflowed).
> 
> When mem_init_print_info() calculates the reserved memory, it assumes that
> no CMA pages are managed yet. However, some CMA pages from hugetlb might
> already be managed at that point, so we end up subtracting them twice.
> 
> Fix it by only subtracting CMA pages that are not managed yet.
> 
> This has very low urgency, as it only affects a boot message.
> 
> Fixes: b1b7c045e808 ("mm/hugetlb: initialize gigantic bootmem hugepage struct pages earlier")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: improve description and comment ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
