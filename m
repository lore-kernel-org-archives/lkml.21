Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266120;
	b=UJCas+HiswLa4+Vyo+6M08Eh7knadGXZ+knELCOVkW6pnr0Pch9OIDStPGBOwAOuyi/x
	 bXALU3+82CuiOUkNEXSj0HjgfcaaM/gSrJfOR280DcxbHLeKZjAXj5h0kRo4zT0F2hwsB
	 wimTFBWgr+lsUJoYpnqNSeqj0zHJ/n7rZLLS1vSsegH4WNpz8SFLXWBUXv0tNwzcTkxH7
	 no7J9OHENYPp1wAupdmOKTDJeRz4UPV+44RftXvwL6rUVrt0LqTdOM0bYnm4RL7ZGYAlj
	 fLy9e3zteIvL38WxQoYKICrEega90epTmdpxTcaXpAUcKrs0xJm2vKn1JsCvpGe4qFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266120;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=gN74NZ4s008fGO70Y8YMhr74zbTWwZSYt3Tm98apf2Q=;
	b=rRviyTEg1wF5kkong5KXSTO0kQWQD+zxm3Az8c+NX77m/rxtvF+khDVahstoZ/8ojoj1
	 /dKjjtE13da+8njgbVETqxE1D47RtC13grnZfVU5qYyOtBzuQskAfhfYQa68WnSyxbJhS
	 6b0GsiKzBfnVwEsWdo97WSQN6tP9QPI+e/S0OSTW+pTTiaUL179fbLfnOmLUFsR8eJCRj
	 /klPidzD6wUPZ1jGBtkvTAfSiLw2NQE6CmNAiRuou8mDTFAgffbFXD3Xqmv3GqzNq0c4C
	 kc2EvD5ORoC4pHf8klTwkiqX6kPJaQpt/RcW5g0kar2NUHYBGkNCuyXNGnhtKjVkTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cm4zYYJk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D503606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cm4zYYJk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94961F000C6;
	Sat, 21 Nov 2026 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266119;
	bh=gN74NZ4s008fGO70Y8YMhr74zbTWwZSYt3Tm98apf2Q=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cm4zYYJkzEQNCsleAc4lr+XCjAKeMbJstFIDTJ65hV9aXuauSZu6TvxNCkzgsEuLk
	 FNbRbXCBkc1lTg5lcm0nW/9gyEzMKQPhrn9I1SIlVONLqZ20HG4qQFPjOTk0sQfqs2
	 B0Ds7eSnVtftKrFgRj1GLHZNgE7l9SxlmBKvkN8bcz7J8H95S3ouAl7lfgraZVOzNH
	 wmqEB8E5u3KYbp0kd51Qe5D6BepMYkq2mOXM2UQmCcTomNqKWTvlxybL+evoVLnfbz
	 vd7GXOkU1lPjSVNCsDodSX+W6A51LlAhWu2c8JbJgO5xLR/Jnrmo4aMQOkWbVuieoE
	 bwDS5+Hm7tSrw==
From: David Hildenbrand <david@kernel.org>
To: hughd@google.com, david@kernel.org, baolin.wang@linux.alibaba.com, 
 akpm@linux-foundation.org, qi.zheng@linux.dev, qinyuntan@linux.alibaba.com, 
 shakeel.butt@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Chris Mason <mason@kernel.org>
In-Reply-To: <20261120195057.50031-1-mason@kernel.org>
References: <20261120195057.50031-1-mason@kernel.org>
Subject: Re: [PATCH v2 0/1] mm/shmem: don't use the memcg of an uncharged
 folio
Message-Id: <179526611747.5902.12576936678713287811.b4-ty@b4>
Date: Sat, 21 Nov 2026 14:01:57 +0100
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

On Fri, 20 Nov 2026 14:50:57 -0500, Chris Mason wrote:
> This is relatively niche, but actually new with 7.4-rc1, and I would
> expect it to trigger under heavy load with huge=always on tmpfs. We'd
> need to run out of room in the tmpfs or reclaim memory while huge folios
> are migrated.
> 
> Qinyun Tan's pending series fixes the oops:
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: for-next-fixes

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/shmem: don't use the memcg of an uncharged folio
      https://git.kernel.org/mm/core/c/eb01811c

-- 
Cheers,

David

