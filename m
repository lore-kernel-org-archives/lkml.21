Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106992;
	b=dY29ScGagzeWmgwiLmqholl2TegAsgF7RooKSMq9LbyanbOGi8/0JFVw8auEoFb/Jijs
	 XUjbmQdh5F2YGqpUfYbBA4HftG0la/EMFxOdDXDb9fK39rEqq0Q031fHyWDLczmcRPe+a
	 to6EZRPy153DYT3V3gFZ9dszFbBn9SZZqwQQCldPpGOPLKXqsb96uKiHhBSvXn8w0lFhs
	 0bpP1kFIeJ5ieUGsWwtv2dQaQ14H09OAw5jcSZdYoRFmkR+CezRKd/Tl8uZlhPKpyQoAL
	 vxthSXOqwOiTOVqpNKG4VdEYTQ24Ds0+oC05WFs6sad85pUu3kZefARoOA5gvaTW/ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106992;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=cgnUywPdHuklLyoXY2ufjz/z54I9DR8+HzA9HduEBDs=;
	b=E29CDvfweUH92PBuoSAb1AchZakE/LzfG9jmFwDJhYoCUz0IYkRFsZkFd9kDvXI6iQE5
	 82rzUkQ8CR1rF4VOy/DqP5ZJ8WfEt6lsm8bNc3XFvQgLipuJrVoHSjZ2Gotn9/7UzgwYZ
	 gJkV/O3qrYxVFLWmKntv//fuz+IxfruXn5lk9GQsWY66bINLeaq0RtERrCjGJbSMNqqym
	 00ZBzMVojaYQX7nD56sdsBluHHaggWdTlofMVry4olzBwCjlIYQOchpzD5f9/ikLvO5RX
	 fiMUkQqfp6O47aYNPWdsv69CrVImUQqg8lvtJqg0gWjL4ir1zSQArxwOaD62nU8XFcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9N1ef6P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5289460A260D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9N1ef6P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA641F000C7;
	Thu, 19 Nov 2026 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106991;
	bh=cgnUywPdHuklLyoXY2ufjz/z54I9DR8+HzA9HduEBDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g9N1ef6P2doS1PmgxYW7xGRRWTQXbFbNonLn68nycyaWZIBtK3gotAxU4mRwstTdL
	 im4muFFNLYMyrJd9KM42RplnWdlQpT5UEaVj+5bBLxeMtQ2DpkusiicPmTZb0eP6P8
	 fBL0P23yEa9RCntOvgiW7l05z7Kt8SO2ObOBDKMLIDIZqtXdb0KkP1oMF5QrGbIVVt
	 ampVZE3Bpsvddh/ZAa3nrLOV6EDdn28kFhb48C6zHH/YGHTI/Q3kFh9MLhNfIhesb+
	 FC/8c+2uzMNimXuvN1CxQeBp6FqL/ZDVwqkzvD71HPd+VBBqWhyWYtnA24+f4ND3nk
	 x9BdadIfCrsng==
From: David Hildenbrand <david@kernel.org>
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Hongfu Li <hongfu.li@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
In-Reply-To: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
References: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
Subject: Re: [PATCH v2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
Message-Id: <179510698892.3387.5467712392240271132.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:49:48 +0100
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

On Thu, 19 Nov 2026 17:49:45 +0800, Hongfu Li wrote:
> memfd_alloc_folio() derives its allocation mask from htlb_alloc_mask()
> and then clears __GFP_HIGHMEM and __GFP_MOVABLE. This mask handling was
> introduced by commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios()
> for pinning memfd folios"), when the fallback path in
> alloc_hugetlb_folio_nodemask() could still call
> alloc_migrate_hugetlb_folio() and reach the buddy allocator, so the mask
> decided the zone and migratetype of freshly allocated pages.
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

[1/1] mm/memfd: drop redundant hugetlb allocation mask narrowing
      https://git.kernel.org/mm/core/c/b2f133fb

-- 
Cheers,

David

