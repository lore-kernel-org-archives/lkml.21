Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507603;
	b=JMF6hOueJ7ko81K8XZVN+pmJQNe9/eTcesVc3DN9xwiQkv+/T6nYVlbn9CZVhtyeBzss
	 Hf+Vq1rTL4p4a5otyFgingl47Qa1yeVG0Ku/gOekdoXvHcF+TuoHdOAgFr7ppzIq94qiE
	 75ee9Mq0wqFX/cDRoC9kfRrbwGx1KjjwqJ6ncT1MbSYMVDb74U83qFScVQidAeTqmnLmV
	 /duWaP+DDMnLXqZTpMI8dGpPzqhgsJQYAIg2y2OEcWKkfmhO1bh0z+HQDIGL/YitV60Mm
	 evfq5ZdUG5wItFtVtaGOmvvBT/ARhSEx9FqCqGaMA7Djz/4DlhvEl0yJIslFD6orWKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507603;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=f2bCC99C+lk6cByNStvrWaJYTderaexjScUT1eLFyyY=;
	b=Mkn6E8ckqHrjsVxfJMH7wnv0davgQFydzlLU0+vpFhc/IX+lC3dE36MyRyW8+K6OiwIm
	 AdUUQBG1GLThHBgWT+QJdu0jNUabljrmT9jBrxgXXfq67jBvFVXufDdjVMSuuDCOs+c8V
	 6FCaNZ66x3qU63rO47HSwS2XnlSrkYqR1G1Xo0eB26cmnVbq8esGTzUuf1frg99f9ZI87
	 uYVlpRcU3m6DcpyY2NJ314HUox6LZlDeGu5muV9gcsmjvitEV8cNnLWTt1B/efORKSMPf
	 yFHfQNOX0IkrlG4dX7jU7TdO5NI+41BICebsqrinbtBJ2cTaFSpuNcMHetBhVcpd/3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2dtf538;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2dtf538
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBF61F000C4;
	Tue, 24 Nov 2026 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795507603;
	bh=f2bCC99C+lk6cByNStvrWaJYTderaexjScUT1eLFyyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j2dtf538ZvQbD48tnYzf92OiepBTDnl995jnLselJRCMx8WemJcdvFtomDfJ1z0yZ
	 towmIc+IctwpQclWmW2tFVyxCL0aow67UZrwIl1TL87HckdxbQGoQ0BhgPGctaiqyx
	 BXGEKByAHORiZO8Cy7zeSW/OmNr90AOirBojH6lwYHW9TRA8yHdGxg9Vbzo2zfxwsh
	 d6rHe4/7ya0WiiHhdWxOjVmFAkZMyelH5Qs/wz2uxob05X1UjoUr0WghHcbaDtg5k7
	 xnGR5WxHpiH5hcni6EuOoPGrC3IBmJwZvxe42RNTVmUaVSd+CfNIQ/XzHfCsbdUeyA
	 lUAb9FExiCO3A==
From: David Hildenbrand <david@kernel.org>
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Samridh <samridh@modal.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261123-samridh-shmem-send-v3-1-afc6a40bc187@modal.com>
References: <20261123-samridh-shmem-send-v3-1-afc6a40bc187@modal.com>
Subject: Re: [PATCH v3] mm/shmem: avoid zeroing new folios twice with
 init_on_alloc=1
Message-Id: <179550760133.6617.5807645850229041647.b4-ty@b4>
Date: Tue, 24 Nov 2026 09:06:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Mon, 23 Nov 2026 19:54:44 +0000, Samridh wrote:
> shmem_get_folio_gfp() clears a new folio before marking it uptodate.
> With init_on_alloc=1 the page allocator has already zeroed it, so the
> folio ends up being zeroed twice.
> 
> Skip the clear for a folio that was just allocated when
> user_alloc_needs_zeroing() says it is not needed, like anonymous memory
> does. Folios that are already in the page cache but not uptodate, such
> as those left by fallocate(), are still cleared, and so is every folio
> on CPUs with cache aliasing.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: shmem-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/shmem: avoid zeroing new folios twice with init_on_alloc=1
      https://git.kernel.org/mm/core/c/845e96bb

-- 
Cheers,

David

