Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704806;
	b=icqmtxEdgygH/lVl/sBFYn8ThWBhRxQyT4VMNdUtOBmXSzkOsSUVFvFJMMS+bQR7LfdG
	 9Si5bYdImfHuUun7l1uu2himcTYvqxTRr7QPKzX+nUS3ixIwFEBKCXR0wIYUwfNqs5kmB
	 pGkrM6jSxpyZCPJJx+YSMl+14jQOVR3Lcp9XExNPJJkT/9kFwIGcSwqyk/niPJ79KoKe6
	 3hJi39btO2RTfdQD+QJwcky2dmcEecG0ZEp4gU6s36xkiBSnOSNyYXdloLlCCOKJELuHt
	 fzka/aYCgcmfXnuzmhkCdl4F4GBCsi/8SXkJ8rajDasReZqtZBqtsfEySkDsm5jGbCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704806;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yzyV0xjGyvvJ5LCXTUDu5o5yCWbzYIetg+blgKsF51k=;
	b=mtf3dYTIi4eWwOttFE+v/6ppbLAm6kx8py1KXAQrt2njq9MCXkV89CAnNGlAWsFChWG4
	 6dHUS6I2cbbyOut3xQOEGDOZiq7NiFjY8Zp+Kct5OKvPNEykQtUonTYAiepIXe75/rTqI
	 ozUWOM/rMxOd3cyNqh+xYtN1KMO77+Ky7ffhoML2WZVoYf/XhZ9lA8bIAohEwit43kRpj
	 SkaPNFud+h4bkweN6fAB2M0qZaKOHxy13UfqvdlsUKDCXcEsKhp73AhwQVtqIW04k6LKC
	 74u7wnI9vg7lCZUZ/Jo3u5jxPeQFWBO//kiFVltFVCM0UxuCvz6a6ypeFPYpxRqnKiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8yjAvyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B1606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8yjAvyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777E61F000C4;
	Thu, 26 Nov 2026 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704806;
	bh=yzyV0xjGyvvJ5LCXTUDu5o5yCWbzYIetg+blgKsF51k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8yjAvyJ81cYXKQH+R4/qspw0DgExByVl00F6SoJd+otkZI/E3CZ4V390Yc4CLBp8
	 3GT72LYL9Id2gjZtfsdbWCQFuAdE3631OT8joZqMWyuBt4y3ume4z/fmjO1Mp8aGDK
	 kJ2f7fDYwGa0sFGeE0/vVMz9KC+fMJmYbxiv+4Vk2XTc9sdr9g3tXcEsEVzPU6nXzK
	 he5z5i4buVl9Dfbe8eQACENCw/z1MWnO3N/LuuV4HVThSv1UQ2ZkYBUeE/05zS8xSR
	 OCP5jcaYpyE1zMcfF7GwbkqMKXNWFbowUIXeJt6MoJmhiR9/UZn0C/F4ImgECdYKTz
	 R1hdRnL7nDRyQ==
Date: Thu, 26 Nov 2026 14:53:23 +0000
From: Harry Yoo <harry@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mm/slab: document that local node allocations can
 use sheaves
Message-ID: <awhHvp7HD2BuaTPM@thinkstation>
References: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
 <20261125-sheaf-doc-update-v1-3-4a579abaf0b8@kernel.org>
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
In-Reply-To: <20261125-sheaf-doc-update-v1-3-4a579abaf0b8@kernel.org>

On Wed, Nov 25, 2026 at 08:35:14PM +0100, Andreas Hindborg wrote:
> The documentation of the sheaf_capacity member of struct kmem_cache_args
> states that allocations via kmem_cache_alloc_node() with a node specified
> other than NUMA_NO_NODE bypass the sheaves.
> 
> This has not been the case since commit 4ec1a08d2031 ("slab: allow NUMA
> restricted allocations to use percpu sheaves"). alloc_from_pcs() only
> bypasses the sheaves when the requested node is not the local node. A
> request for the local node is served from the sheaves if the object found
> there is from that node.
> 
> Update the documentation to match.
> 
> Fixes: 4ec1a08d2031 ("slab: allow NUMA restricted allocations to use percpu sheaves")
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
