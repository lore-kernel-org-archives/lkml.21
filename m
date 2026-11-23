Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445310;
	b=w8+FjrJcCgvg7z13qrb6GcbwDNsyZ4E490UGHXraAcu+JSQDAH/reiNXnrE15pho558e
	 eMtBbKOWSt6oPSvxOO5i9dDs2yEgq4Fys1/7AjQFNEZgS8Y1pSplmhRZO+X7sWdk7NZET
	 Vo7pO01TVwIh8qiyCv8zKWncXoJlk33VSHhdrLmAku1BmI75/BP2iSHMrS6OnUenVwxt9
	 NF5GDDaHYmzoM/0/Ueb8TLviOmeEWlElyYxX2FQcQuyDJ5bZp3TUaVIKHHH1Lu0eMLQkX
	 jyPi3DPEA4BiSsrpjRShy0DRF5InsMQ2k4qHMqF0EuUYIVcARAGsBqvi3Mdcb71wzzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445310;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=COU3p8mhLvRYDZ7TXv24gbV9Mm0T8HfG6LrqY+C2miU=;
	b=UOk2C5PiU7zXzCJp7MLaFgEkwiZ3/zJBelrnbc8tPqpkMy+UuXXKcoIhEHdJT4aP0WyQ
	 IQdoO+1rkef983pLHLORUb5UGa3aD2zNqn+AVz/VkGi8PnfUVJSAAFVbxN5V1sBTDUP66
	 eGJppobKogx+g4WCWAGgX1/irn1JQrg0E6tYDBbcJ/M2+0gooYILRnwhT/enUI9nO0JU1
	 8vRx5Ukr2QSPkWhVNM9HQGN1CUNdSbIw5gwFzJ+A6yEYbFU5lx+s3uIhFL8xMCO1Z8A7Q
	 OD12aNKmL2MHBT4lZ+GQjTm94LW39+WpsZKewCdRF4ydvcb+xa5UH8ktbqA7Q5unDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jub8/30H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F63606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jub8/30H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940581F000D3;
	Mon, 23 Nov 2026 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445309;
	bh=COU3p8mhLvRYDZ7TXv24gbV9Mm0T8HfG6LrqY+C2miU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jub8/30H77a+LnJJFaB1btgtBWhm94GK8KHAGpB6a/HGXmRdAq7SAM6x/AM623wMl
	 Szhxiz/FEmlHWT5Q1O4lyUHYSaVNnO5amh/WWhXeKtL3aP7RBN2kH9vVCIg9Yps6u0
	 qLJ0TMbfvC1EP4nMOAX04Rt6rjlT9MtKx0rSGR0jisdy+v+qIpzpK1NE9Cbo+d3wIn
	 h8/3Of/u2wqIBbq0sDikY8sbsamD7Njthic/O+IVOSB3aot1VsERiXetp+oM0GqjuW
	 bjMf3H7Yw4vJO9WbN1yQBcwPHv852222CzAAWfE9cIg0q2om49UTOx64T03/tk6pCk
	 zhkUaySt0kJ5g==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: kernel-team@meta.com,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v4 00/10] replace CONFIG_SLUB_TINY with a slab_tiny boot parameter
Date: Mon, 23 Nov 2026 14:48:20 +0000
Message-ID: <179544526762.3606123.14263351659988256833.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 07:47:08 +0100, Vlastimil Babka (SUSE) wrote:
> CONFIG_SLUB_TINY was introduced to help tiny systems migrate away from
> the SLOB implementation so it could be removed. Its main purpose has
> been to disable all forms of percpu object caching (cpu slabs back then,
> now sheaves), and being a compile-time config option, some extra minor
> saving were achieved by code elimination or more agressive merging of
> caches with reclaimable and non-reclaimable objects (keeping those
> separate helps reduce high-order page fragmentation but not memory
> footprint).
> 
> [...]

Applied to mm/slab.git for-next, thanks!

[01/10] slab, kunit: pin test slabs by an extra allocation
        commit: 59cb3f752d7df4badc0ff6caf1b13ba293049b79
[02/10] kasan, kunit: pin test slabs by an extra allocation
        commit: b5f4208f057248d96adf876e50e03a7c92cb82ea
[03/10] mm, slab: refactor slab_min/max_order handling
        commit: bea9fb71610535595f7d39715ca47248c785110a
[04/10] mm, slab: introduce slab_debug=N
        commit: c6fe42e8966e517773fcb41efd02c7cb2eab9697
[05/10] mm, slab: rework KMALLOC_RECLAIM handling of SLUB_TINY
        commit: 5e3df3c9656df19053909c4aa70792007c5ddc59
[06/10] mm, slab: make SLUB_TINY handling dynamic for sizing decisions
        commit: 0582f36165726165012f66be8924e2123d679795
[07/10] mm, slab: convert CONFIG_SLUB_TINY checks to kmem_cache_debug()
        commit: 7d6e6d4e50b91ede6662ea177e25b38b3bfbffb9
[08/10] mm, slab: remove remaining compile-time checks for CONFIG_SLUB_TINY
        commit: 0ecb9fa1456b356e604848542787aeb6b87b6505
[09/10] mm, slab: add slab_tiny boot param
        commit: 9d83e029638706e283df6079ff4db017e8881769
[10/10] mm, slab: deprecate CONFIG_SLUB_TINY and reduce its Kconfig effects
        commit: 3464ad6cacfa65099378798cc0d95c9e5151e86d

-- 
Cheers,
Harry / Hyeonggon

