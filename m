Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362352;
	b=vA6ThOpG0c9meuxpodPAPcE0H3I9nCTh1IqT2IllZ7OrGRl97T7UjkRMn9SG9Vnlnlm1
	 oziYU2Nmd/Zxf0DprGyXgwEXj/DCh5jGicr5bqxTDhOhFEUyFy25Aa+FYjM1Z8mLOZaaQ
	 7GlffZIRRdywVJ9DTXV4wBZwanVPAKf8bU0mk1VMNjU85ocIDGqSSC/Zh0gZuYU9lmC19
	 T+/wCY0AsDiy2Bsmp3+1gGIiwWMHhQeRTe8gntxSMJQYiEvaaHCPPRF190LZc5btGuasZ
	 U02fIKWeyOv8s/uspk49Nw2jf9CcQc4IgMQnn0km6nY9AGCK1hiruiF/nX3qLwUY3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362352;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=yJT3t15TfBOfdlgX57Ds7OT7KQ9/RVLv23DmEdPrLw8=;
	b=vr/2k8VucwMFdSjDvTv61Q0Mcmr7eY8pkWiqbxD/5CHv2JL6fonwEhXgpk0FBktXLXsq
	 50lmC2g0BF+o+c/t8TltFS6a3l2VrLfA0audDVbL4e0uV7inAS0CPxcJS0fninr2JJwpa
	 OiIsGH4sOIl8ITk2IqQetH8mwwVXLl2v8sAGKYAIAvww7GlEllFStRDdnUG5S8V7aglnI
	 8QEqQ2FG2cN5ScrmYU4nVlQtDyxj8QAi1rTH93hjtU8P32xAHIkscYjIIXue+Ekrzjurk
	 OQt6mk8YcpZ7h3AnRTand6m5u2AKLrBKQZrh9cS7mxUo5M+mYmFhQYT9KKt87C4jaIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mU/JCKCi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD7606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mU/JCKCi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774791F000CA;
	Sun, 22 Nov 2026 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362351;
	bh=yJT3t15TfBOfdlgX57Ds7OT7KQ9/RVLv23DmEdPrLw8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mU/JCKCiraVFqxFNBtrBnxFrd/w7axyI4sM+9xcEdMziMvt+KqOv/GC0fRQruihzt
	 hIf2t0BNl95Vihdqd9y1BXVlPFuX9mCb6Gqe+z+MWGyJ7GSYiMkLIMi4gXYu/owDKK
	 BY2fdvmTkn5ShpuGlbR3r6Mc2n7NTGAq5GHJRUlPCMVM0WyxAWEJkUHPT3Hb+XPqVt
	 TyDoYt7NaBj/ok2zg1L3eSzmQmjDZVr1lIVNmov2FAo5eVA1/C4ncf/g8KBuguO9I/
	 zRQj0BoZ80+ncShc+uVIF882w+ytLKjKZj4UIa8gU8hxZC0SnFwaSAsjXLesuzMIrE
	 OBeFgUC60T1LA==
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
Subject: Re: [PATCH v3 10/11] mm/cma: localize init_cma_pageblock() to
 cma.c
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Mike Rapoport <rppt@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>, 
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120100856.16929-11-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-11-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230138.3933282.13713673852338005134.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:55 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Move init_cma_pageblock() from mm_init.c into cma.c so it lives
> alongside the CMA code that uses it.
> 
> No functional change intended.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

