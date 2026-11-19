Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088013;
	b=Dsbskk+lRluC0f7eyhkEXoL2bP7s9ZtgGTL2/fIiPcLvOxq8CLx0Pd0ebJyZuRC5IVfe
	 cDlQqc5uhXJ8QS8uwuLs1NgbCXblysKj6QK6g9eRn3BUvPow8HWYjIGugDu2jBsUMapAA
	 8t7fABQhx7Dw5XLFkWyyCPlQvpJxONQnsi0+dU1Ia9AjIYwEDDA/n9ri4re8Hr7VQfqQs
	 tBP+bBTr9FadZBE2kJFZ5IXT70Cw224KvkqRqX2HUmK9RoTfwjq1odyz+rPx5CI5+ja6p
	 cOyTXKT+kxeVW529MpYPjOCb/CWJN8s08ZTFGdHIGkh34Ps473hUxHeFaoSWydV8N+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088013;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=KX30YIKysEjviC7uy6yBrw8ek3mIvfrRCKEIHjpXldM=;
	b=WV6V+CUYuvuBsiXRAEYvYF6FYSetHKXBwjpNVme/00knZWa3P/4+AaXrl+/9nYrgZqjs
	 5svBFJuWfEy4COkFFyTSHtRQZBA9ArpW5UzolRhbABqByEYE+CTgGzPkcBzIhWIySxo6j
	 APOGQqKyRH9sA1iuoZ1ig9D+fIOB4nZQB7UfndASTLlAMu5YHeQtkPv3yj4hj/KX7r8eE
	 Utwbh+QUTWwmS/1xvk62ohhyUU2f7sU5gyS+ciMoQDF7loRuKvycgFgqpQnbuyCHPFauS
	 PaysGyb+3LST9Q8Jv28sEdCGnuH/iUKzbKUqfdXL1RqpNr+MY22uJYNdiuHoXxQ68PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ESeamVz8;
	arc=none smtp.remote-ip=95.215.58.214
Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A80606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A80606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ESeamVz8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KX30YIKysEjviC7uy6yBrw8ek3mIvfrRCKEIHjpXldM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795088009; v=1; x=1795692809;
 b=ESeamVz8o8JMhOQKuR9+pstKHBaOO66+irTjF5emMOmb5pLh1EI0d7hkcqXn0y1WcphXdlwS
 EWMox7W8TJomFdA4529f6F79N9qHFOp0AofPRVmWbVmctvbTgebo1CuZeJh7d4IRCV+0/zFaXlL
 iB85fKD+GOnNrjsGq60aaVQI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ff153b33dccacf45;
	Thu, 19 Nov 2026 11:33:29 +0000
X-Mizu-Trace-ID: ff153b33dccacf45
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
Subject: Re: [PATCH] mm/mm_init: don't subtract managed CMA pages twice
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
Date: Thu, 19 Nov 2026 19:33:08 +0800
Cc: Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Chris Mason <mason@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <11624A25-E7B2-467F-A617-21EE56DFA722@linux.dev>
References: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 19, 2026, at 19:19, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> From: Chris Mason <mason@kernel.org>
>=20
> With hugetlb_cma_only, the "reserved" value in the "Memory:" boot =
message
> can be wrong (small or underflowed).
>=20
> When mem_init_print_info() calculates the reserved memory, it assumes =
that
> no CMA pages are managed yet. However, some CMA pages from hugetlb =
might
> already be managed at that point, so we end up subtracting them twice.
>=20
> Fix it by only subtracting CMA pages that are not managed yet.
>=20
> This has very low urgency, as it only affects a boot message.
>=20
> Fixes: b1b7c045e808 ("mm/hugetlb: initialize gigantic bootmem hugepage =
struct pages earlier")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: improve description and comment ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.

