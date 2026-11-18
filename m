Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971595;
	b=2i3NaLH9TMaDaDsxEUQ7FGNNG0MINVtGGyM9cBc8fjjIC8kJ5d7u/kJXc4DV0yAEK08L
	 gatMU7AFbWO53hsYMSEmX5Y856tTHusonnXwfEerpjo6oPf0iwmnWVJRxvAecFl6BTIRs
	 5p0fg80QgW7LJNSTgRvhGZY3kcRvIBFedN945e4X9ofgSGDiowEy1r3ZrZkSpc185k91v
	 E92+Q19seKPaZHaKLY4BKKorVR+4kEJ24UHv6vk/lyWTv+0GFPv9X7hKlwM4VMmXH6FPG
	 U56iB5SfQaSv5YsdRE30gHdMvNuQ/zHfAsvi0pJY5sEnm6+Xf7h/S6/E9IhLv9WpLug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971595;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=3Nxi0/sOY8+VKqMZ2GbfZhgX5prfn39dCsvQzRiF+fg=;
	b=ZRDJcwvcMT+R/9j7U/hUMpequ1+rUhcJyqPagGMmGMuwCZiuZCEox05atPQkA+eolkWh
	 2et3iOySdO02BpP5EnnjqSwKffgl0xCTPIyJ0aZf4g6xv2LpvpmjyCVXA5MDvStqmzv1h
	 dVsZ2gyNKSVmwZUUr7p8lKw2hhiUxzbXKU3tdLUQOtItE5l9q64B+SBnotYL1NncVcVFx
	 jm8YSCWV2qimPX+aThbpxnQ1isjN3z06YDkVcwYe1BD5qnaqpybfOWiVSTcpLAH7ZB0qk
	 7bLsMc2clyoE0ZnQYno3qu/Lr+x7Qp/O9LJbTvqqU9uXHjYe7ANuXMScbJoUBRn1Oew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oRxZdjUI;
	arc=none smtp.remote-ip=95.215.58.177
Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75312606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75312606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oRxZdjUI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3Nxi0/sOY8+VKqMZ2GbfZhgX5prfn39dCsvQzRiF+fg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794971592; v=1; x=1795576392;
 b=oRxZdjUIVTFtNpuCG4tHhyT9WhEi06Z6YYJFMbB3a2pWb6wQj8oJ0BZz2H3OTnlIPwVy88J0
 DtOfhdLKwUjq1hRnRRPR29e4uNGeeAfy37B+hFrmO0+JaxMzLo9XCV2o6xiizEFF9MQnWQprhgK
 rTzswE73DOWS/gKR/pO/gd6c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8fe63967abd7ab38;
	Wed, 18 Nov 2026 03:13:12 +0000
X-Mizu-Trace-ID: 8fe63967abd7ab38
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 0/7] KMSAN: Move per-page metadata out of struct page
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <avzsE5wGnXji5u6-@chrisdown.name>
Date: Wed, 18 Nov 2026 11:12:46 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Sashiko <sashiko-bot@kernel.org>,
 kasan-dev@googlegroups.com,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF4B7F9B-3B1E-4165-BAE4-2E05E86FB034@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <avzsE5wGnXji5u6-@chrisdown.name>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 18, 2026, at 08:06, Chris Down <chris@chrisdown.name> wrote:
>=20
> Hi Muchun,
>=20
> Thanks! The changes look great, thanks for working on this.
>=20
> I think patch 5 still has some issues and have replied there, but for =
patches
> 1-4, 6, and 7, feel free to add:
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Really thanks for your review and test.

Thanks,
Muchun

>=20
> Thanks!
>=20
> Chris

