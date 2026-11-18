Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024140;
	b=pW15hjhkdY1l7MXjj8AfJt+qy7rbBideJDDgcdVP1OihFobSVO2ssE8LugRccO2MLnD2
	 bO+5mJvDxsRbxbv0L3gqFO5EoBbknxDsYrifPV13zCDGdpamBYJODOBRoLOszEFdnV2j4
	 3UcFquGnLH/YOpA24PLyaWaVHxclZxwqXJiguTEY3qh8g6+t316PrbztJY98CXx6XGB74
	 ifrXLGI8mvsqtIJFR4BJrayzoLUNWdZgvqT3pqdrWlBlOmCVVk3RUwh8SLDhT0+gI6Rl0
	 kQBy6PEyW8Lcet4wXxJuvEm6wxGh9CLV7LzbuzO5A55pioCIE7TN0kCVRqCfYNVIRPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OL0L40zm4SMuhzGqBwPguFh5DWeS1olwjZ4nxjwgMB4=;
	b=ZdeBdqZUx2GYrSdpk24WLaip39E1siT053PP5LjKhwMW/cPL6DpZqyAzmd5rRge2AF1O
	 xNdMka0SLicE7XRMNzvn4gmRD17n9pHvpW82WHiICFB+yMAM56PgxhNmTwptaxo9taAce
	 ZVo7NpF/diSdkhu5hclsNdDmmkHuDF0F5fJib5R3tZ2kbTtP6DCPplEMk0TdU4l6Uq52t
	 isHxMy3BzHJi5CrFZEwWgk0HmGbrAiI4mHXNI4jYZa87IipKuLDazEbK98OQQHCLNyjo8
	 Zcc8xq+KwNDlTt88MPnZnQXb+1305Iv6yRGL3zKMl91a1/Bcv40s5yDasMoMPz8OeHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5Uw7UOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8179606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5Uw7UOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EB21F000C5;
	Wed, 18 Nov 2026 17:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024140;
	bh=OL0L40zm4SMuhzGqBwPguFh5DWeS1olwjZ4nxjwgMB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c5Uw7UOqDiJrKgghaqHu/ylzVTKxzy7JFrgooUKRv6bQbm3bpKqfd/qZ0ieT+/HXr
	 PT/3VNrIj4AsN7TrYWzrP1Q4+0quEbN2MJpT012BjPSoTOrWlwmffpyXIqkSNyORR9
	 7cnEKEu8aKxKEXXN7uM5RtavC8MfSd+N4ZoiT17PEUX0Ly0QiGLL8wK5WNXoScJ4U9
	 bGgqiuV4Wpv8ALSv840EEhUY6OK+fvQs7wwYvtWqAt2aWISNQCcElkm5fImDFiZ6kG
	 A2oz3nS21uKXnoYjNPCd9PqEW4sr0mXUNqvYM5uRhi6kgflRpg8T4VmHd+s5F2+gRr
	 aB2KF3mHEJRUw==
Date: Wed, 18 Nov 2026 17:49:00 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v4 02/10] kasan, kunit: pin test slabs by an extra
 allocation
Message-ID: <av3kECMDujfI8DnR@thinkpad>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
 <20261116-slub_tiny_rework-v4-2-227a4b3636a5@kernel.org>
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
In-Reply-To: <20261116-slub_tiny_rework-v4-2-227a4b3636a5@kernel.org>

On Mon, Nov 16, 2026 at 07:47:10AM +0100, Vlastimil Babka (SUSE) wrote:
> The tests kmem_cache_double_free() and kmem_cache_rcu_reuse() create a
> scenario where a slab becomes empty, but rely on the implementation not
> immediately freeing it.
> 
> This subtly relies on non-zero s->min_partial. It currently compile-time
> defaults to a non-zero value, but in theory a sysfs write racing with
> the kunit test could change it. More importantly, the upcoming
> CONFIG_SLUB_TINY changes will make it possible to run the kunit tests
> with s->min_partial being a compile-time zero, which means the tests can
> cause a NULL pointer dereference, or fail, respectively, as flagged by
> sashiko [1].
> 
> To prevent this in a robust way, add an extra object allocation to the
> tests, that will prevent the slab being freed. Use migrate_disable() to
> prevent migration to a different NUMA node, which would place the
> allocation to a different slab. kmem_cache_rcu_reuse() already uses
> that.
> 
> [1] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=8
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Acked-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
