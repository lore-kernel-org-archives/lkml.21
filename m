Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071327;
	b=zCtHa8OB+Cu+LIcyIiR8dd6kQXV+Vzcnpi8Eo7Wcsdk4K8ClOTTRJJykg8ZsJ0Ia73sx
	 6YwbyeoJ1Ks4XZqyfHqIhlBFbUt6ba4WnISRnX5ayePUSB9/pJM8rMTXvSeDCEExtoBon
	 JCrv7Ono6BxyPUVc/mBqqQ9tVfJDc8PK/KZEpdiZ2wEPcAHAnCb6R4NyAQ4o8VkcdJ78j
	 8I/qjD3Ph5Rzr5WtLddXPGkCpu9X6C/VtF2ZlDGltqhjbhvYOmRo9gUtXoLYq9ILPStzt
	 MKSg2WQm/LdyZ+O7rCTbCR9AH5wW3fuX+a4BDKwJHIvUZeycNZaufbRugWyt6wocxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071327;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zFxcU5zYSC3fy7jvAyHH9IJziWPqLOSZv6SHBUvMXok=;
	b=vOD+rU6HqfYzqlGDip09ON9NMX7bzM5ynrPnA7QJ159dQbSNBn8K81CF4eMwrvouj5Vt
	 dJs8U5ugFNtss1XuRHCuCfp8T30aY5dANHI1zg7s2lfdVZwaC1FqbUP4w6SluCMXk7Bkx
	 IdNdD4ZZvhCYFJnA8IaZi+vka9sYd/R4DtEBz+qGJxrOGxiYx+L1d5O7ViwIOs19OnVnu
	 ujbRn2/BDcxWviZ5KQi+RKPzCCZIeDvNPs5Kbsc0XqOjnb4HvREU6o8NeSe7zq0EpR2OW
	 48jZrGxpaRFS7rnMXzWbWW//PJN33O7z+yJ3zwD5glw4Q9giZCxaaozF8AN2y6ECNqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R56ZS/zX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC93606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R56ZS/zX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E181F000C4;
	Thu, 19 Nov 2026 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795071326;
	bh=zFxcU5zYSC3fy7jvAyHH9IJziWPqLOSZv6SHBUvMXok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R56ZS/zXPsRSJk1DKjEviB7Z2rxsc9BUUyYD32OLNBP4Eh6z+nw+hXJmTeiowgjd5
	 fo3+99UW61nPfaequD5XbIm7j2yveeTkjZGp84pP26xOLo4lHyel/EIOtEshGXeV1B
	 5hYDPUB0VPpI7N0HKMzPh/t2fhRq3B+2oPHbHtsov10Kz2rP7PfUvidEDVqp+yludA
	 JywgcS40+J2mP10HvWVE+nHTefKhu182C89FyCLssRGrpQoO8o+q8H83n439lZq+h1
	 zJWHZ/RMae+EtrPvh2nMlCfeofkm5+yVQnR94fK6JoPG93uLzNm8s/cSOAAQNRCGtr
	 J7w/98HsQlERg==
Date: Thu, 19 Nov 2026 08:55:18 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Pedro Falcato <pfalcato@suse.de>, Jann Horn <jannh@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: consolidate the memory mapping entries into
 a VMA entry
Message-ID: <av6dVr_VR5i07VL9@kernel.org>
References: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>
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
In-Reply-To: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>

On Wed, Nov 18, 2026 at 06:22:10PM +0000, Lorenzo Stoakes (ARM) wrote:
> Memory mapping entries were kept in three different sections in order that
> those maintaining/reviewing each distinct part would be made responsible
> for/cc'd on only those parts.
> 
> However this creates confusion as to what files belong to which component,
> so simplify things by consolidating them into one.
> 
> Expand Suren's maintainership to the entire component, as he is a trusted
> and valued member of the VMA kernel team and very much deserving of the
> position.
> 
> Additionally, drop Suren's core and misc reviewerships in order to focus
> upon VMA.
> 
> As David is receiving pull requests directly, make him a reviewer, purely
> as an administrative change.
> 
> Also specify the new tree location in preparation for the tree being
> established for next cycle, and remove the link to the not so regularly
> updated linux-mm website.
> 
> Given that, from next cycle, the tree will sit outside of Andrew's current
> process, remove his entry, also purely as an administrative change.
> 
> With that said, I'd like to take the opportunity to express gratitude for
> Andrew's huge contribution to mm, and for his being both generous and
> gracious throughout this period of change in the subsystem.
> 
> Co-developed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  MAINTAINERS | 51 +++++++++++++--------------------------------------
>  1 file changed, 13 insertions(+), 38 deletions(-)

-- 
Sincerely yours,
Mike.
