Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942818;
	b=5ApsuW7AIb/qcFhl3OfUazm6dHmpIIBlM7JH5ROwWS7JZmyFg2bDhJCn8TjV3JwqGdk3
	 Uyad2UIWT0cdwtGXsGU6hp1fj02Xb/lDMdqRB1B3Mgv0H4bKN72t2CXZL3UOonLDUn44z
	 0u+TqA0v8bvMIRjdQvnhvRaBbRK4EEO74t0N6OV5GexGMAxKnwB/ewyag4mA2+Uot4cVN
	 lheIF6a6an2OVyn0AntDWrKouUBmBcAsrlJ+RYOJO6U5oujkMv+RCg5uqLrCKBSO07Y1f
	 YktQ8yLOSntGno0KSVA1sdD4oNUcATanp6M4a4zm7RryJ1AsFF8ch9hxJ/+zQUT4nVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942818;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DWNOL9oXi4FJBrMo2p57OMhawm6GSyZyZ5LAMYiUucQ=;
	b=n1yRGjP3qrsgwif68GjVYnFPKKk3Uv736DFd1jnBVyGVqGzpAcMxInSGUqHTMn+ZSwHU
	 GR0ax5j+u5xsJZ3TpZHAtHrz2VR+wlGTxxxjtymThQBeEPCFib7jlj7HolB04loQPu9IX
	 jJd8jOFUE4U3aUKrLMhoRiLXUaTo/0pZlkNp9FDlpztQqAfxHM/zcPsLSbofzbmnYdH2E
	 qQvJWQFHkMOr07Cd5Zo/DiX4n/mhQoLWWWEy3nNQsNapYNZUkn24ZdFUailfKzY6a5lVT
	 o7InJz5372izbM1/HdSiKZef5TvEN+x2SJSll2WH1EPPibqNHFcGrqBsvcCv07eBf4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="WtlZQ+/O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=WtlZQ+/O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503391F000C7;
	Tue, 17 Nov 2026 19:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794942817;
	bh=DWNOL9oXi4FJBrMo2p57OMhawm6GSyZyZ5LAMYiUucQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WtlZQ+/OHjaHXLWloIGtS25tyanq+8IWJJe/8vkj9wMY/KQMGZfRw1c9kowZ2CTHf
	 lsEPr93LQloDvm4BMKAR+rjyb2EgO6oro0uuEJpiz6ObPWpl7+NDpHWdh8jMFx7CgL
	 E3AqCnhT3t0jkD02Hfb8B4kNtPtdpoHjAZ4Lc8Z8=
Date: Tue, 17 Nov 2026 11:13:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Shivank Garg <shivankg@amd.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Luiz
 Capitulino <luizcap@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
Message-Id: <20261117111336.ee49c0d4722a042c071c68b0@linux-foundation.org>
In-Reply-To: <e745f91b-3312-47b9-965c-510bf0a0b7f7@kernel.org>
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
	<e745f91b-3312-47b9-965c-510bf0a0b7f7@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 19:50:09 +0100 "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:

> On 11/17/26 17:26, Shivank Garg wrote:
> > It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
> > for page extensions") but has never had a caller.
> > 
> > Signed-off-by: Shivank Garg <shivankg@amd.com>
> 
> Added to page_alloc.git for-next, thanks!

Thanks.  Helps.

> Hm page_ext.h should be added to the PAGE ALLOCATOR section. Wonder if
> Andrew's patches adding various missing bits included that too.

Nope.  I'll add the below.

A few things under mm/ include page_ext.h so perhaps more mentions are
needed.

I'm presently carrying no patches which alter page_ext.h or page_ext.c



From: Andrew Morton <akpm@linux-foundation.org>
Subject: MAINTAINERS: add page_ext.h to MEMORY MANAGEMENT - PAGE ALLOCATOR
Date: Tue Nov 17 11:05:44 AM PST 2026

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

--- a/MAINTAINERS~a
+++ a/MAINTAINERS
@@ -17779,6 +17779,7 @@ F:	include/linux/compaction.h
 F:	include/linux/gfp.h
 F:	include/linux/page-isolation.h
 F:	include/linux/pageblock-flags.h
+F:	include/linux/page_ext.h
 F:	include/trace/events/compaction.h
 F:	include/trace/events/page_isolation.h
 F:	include/trace/events/page_ref.h
_

