Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014412;
	b=iPk2Wc+gaNeKfskR1be4A5vI5gsBHSoot3uoebrapSQ6qKVpEIHRJddh20in+XAA17yr
	 PSKG43Hn9p1JuZYAtcHUHoUFRtUdhMATJT4Zv8SCQOXxEAfJbCOIae8RI6cda2ZE9lwa0
	 YUKUbYNHpyvkWFzWSGgBl4yAc6n8uHAkIRxUMt5jmDhl9dx1dla9O5gxcdO1f9fbj+oJX
	 5oyljBuaE85+jwQKr779eU4yNjZWXoY9QDgsNGCSa2in/PE6V1jKTePN+sYQSHtHRzJCq
	 OBJP/7Rt4AEWtQgUkSdfKhWYVwIb6YHhMH7eSmxJIchkWsK5JM2ruXiuRbnAXX8Mj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014412;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ICrunj3Ngc2NClItFMUlkn+/M4je8+5gRXnfuJMD5Hw=;
	b=Do/auAysdVGs2JW/gds029PftGyfuTCo6TLbQoqtnK9Ohex65vS59O72OyZ+QPol4BV6
	 AkExqRLWBri56mmbwWik0HrNVj7oVGKXYRD0Mt8qvNBxpDHe53N70JydfJwRQu1obVPOF
	 BfiTEaKkTwBiqIJLozxpPjg90Iq3cdL8mnfKfrW0LuEBVGL40+4sV5XlwN5j1xe8spgDZ
	 1XJ9LibB9WTsMN+u03zAGrZ3mcu8iLJ2xetDwJPb4vW3wPhCsRSoxPa2hF95TWl+sZFC8
	 T8oBOroj8UXuh95YnmuME5z9rqx5ZFSVCyoc0d9u3/4Hv6rOqLnXcfrR9ZovIuYxtMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H56/iq94";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H56/iq94
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9551F000C4;
	Wed, 18 Nov 2026 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014412;
	bh=ICrunj3Ngc2NClItFMUlkn+/M4je8+5gRXnfuJMD5Hw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H56/iq94EwN5PNZbdnTaCXk3B5rwPOty6YgQj0FciySMfq8YkxJhwSLziGyg6NkpK
	 qGelqxCSG08605O4QiwgXJ3Y+lwH/aN+cXPK9UHLyNz9dXv0hJREkGnIuC+wvweUTg
	 qLtuNZhAuyO1np5G9wY+VOc2o3eQqmBCFEIGTqw1pRUTFUkHtwZj4ODh9MfB1wTTds
	 1YELUOBvvmGQ9+ZntGyAKt+sKx60MI/RMgG7NCmUVspkAuXgnk5FW3fVsbBEocAzwS
	 sKBU9p0LbH9sXaDQy4zwU/cEcmVut/DNbtd31NdUfTvAfUX0C6FCunAUt5kgqnqyPd
	 amephCbCc8xQg==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
 "Jose A . Perez de Azpillaga" <azpijr@gmail.com>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261002160535.661399-1-ekffu200098@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
Subject: Re: [PATCH v2 0/3] mm/memory: remove unused
 vmf_insert_mixed_mkwrite()
Message-Id: <179501440852.7660.18348444744304711431.b4-ty@b4>
Date: Wed, 18 Nov 2026 16:06:48 +0100
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

On Sat, 03 Oct 2026 01:05:31 +0900, Sang-Heon Jeon wrote:
> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
> vmf_insert_mixed_mkwrite() has no callers. This series removes it and
> the mkwrite handling that only it used.
> 
> Patch 1 removes the function.
> 
> Patch 2 removes the mkwrite argument, which is then always false. It
> also removes the unreachable code in insert_pfn().
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/3] mm/memory: remove unused vmf_insert_mixed_mkwrite()
      https://git.kernel.org/mm/core/c/fedea7ae
[2/3] mm/memory: remove the mkwrite argument from __vm_insert_mixed()
      https://git.kernel.org/mm/core/c/a3405fa5
[3/3] mm/memory: merge __vm_insert_mixed() into vmf_insert_mixed()
      https://git.kernel.org/mm/core/c/ac2fd084

-- 
Cheers,

David

