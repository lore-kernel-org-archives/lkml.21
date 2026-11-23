Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454143;
	b=xOPZ36dAbvp00RGHF+Rh5KO91odiGoO9GciHZqdmsol2uG1wpPR1u2fqHfXpB2gmTdBm
	 8ylUf9vHK08TJZ9Ib6m1EZnElrEdD8QNju4iyFqLUv6cI7tli86K+knvmPrwPkbLnSoCu
	 Q8WbwKeiJCp5O9/ZNiB3mpN2CZbXhuYF1SCZLyXfgmcEUrFWOEvNe1o9sG+2DjV/aPo9c
	 EGSc1IfConC7k6bNVsWS0G7FOIibqhonpOd2o6EniKIqM4YjB7g7AirxjXcvZIAcVMVWI
	 B0s3YeVmS2A1d/9tbucMy1cZq6ymCilnW5xoCRFxQqDUSWQ4EgRIcFNPQ1IhkPGVtag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454143;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PITGhazHaoDO3YT2izy4iM0YntQzWkgZ3YK2dN09pI8=;
	b=pRydMbLG5Hl1D4AX0+ADhg64p2aQ0m5MwHpx/Hmx3in2HXLs9vA7p6GBfo/mAaMvNWK+
	 nKRhBVrO5RO83nCO0FJe8xVxIxWKuPs0dElPakn4DjZj3slYr/uX6128mF5T9idfcTWpx
	 IPYJR1II6CcG9rGzQ64zjIFYi661knvad91OniL1sCs9NaMLT0hTuCnansTJ26CFxok5y
	 mTtg6AHzOzQitYVyhjl2BrmbsANO4EwSVm1v/pGdfoUIC8mNNG5DYxdq2tk85dTIQvMdU
	 rAgZjFDtrK5cPhq9fYjOzy6ZsyOHuXc942vkdzMtLRGucFnyJuzDnjKFtNRk+riNtjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D29C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=25dmbq7bpzavbgtopbw5vfp47y.protonmail2; t=1795454139;
	x=1795713339; bh=PITGhazHaoDO3YT2izy4iM0YntQzWkgZ3YK2dN09pI8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JlbDNWdmFWeHXQweISJrRAStoF26zZx24VC/WvCYGp6luquvjei8uvOkB/bxV43W/
	 WvX9uVHN3zo8CugONqtQts7C6ryarGVRaX6ksEArqGrZak/YmcYbh7/QHLCmchFWOG
	 yrKzw09rAdzWxbj9jyeUX8WeTSy0O+bGFzdap/2ATcbR7jxWpe5KVSdlmfgM5PNJk+
	 vJbmZ49x6I7d7Xp69W8FEO1ULZE3skfhtxwkQFRymElDul/ZxaoGTQ367ekaVji5/H
	 Ed/io1T9WzCmTf8akCaNPg0Il8RJYZQLStN8MuRfnCC1Ms5/zX3+27guGrK8SwGepa
	 Silp7YAtKFI9A==
Date: Mon, 23 Nov 2026 17:15:28 +0000
To: Mike Rapoport <rppt@kernel.org>
From: Norman Herms <dockseed@proton.me>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: mm/memtest: the reserved-region array is reallocated inside the range under test
Message-ID: <vMVJLf0yL6RHmJWxcxQ7lNvjqBtYE1RxWk6wBUnmhLH5gDbJc1d_b0q5AA6Nz6VJcnNkIw8gStVV925IyeYEvNYiiIChUiaYhMRao8V8zps=@proton.me>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: b6844be21a8c1d299c6de324ff64d0d3244400aa
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On a board whose DRAM fails one word in every 256 bytes, memtest()
reserves every failing word on its own, 512 reservations over 1.6 MiB.
Past the 128 static entries, memblock_double_array() allocates the new
reserved array from free memory inside the range memtest() is still
reading back, and the array's own entries then fail the compare:
another 42 KiB at the top of RAM (0x1bf3c2000-0x1bf3cc800 here, inside
the tested range 0x60100000-0x1bf3cd040) is reserved as bad, in runs
of 16 bytes every 24 bytes, the size of struct memblock_region.

With memtest=3D4 the next pattern is written over the live array, and
the board resets during that pattern; we have not separated that from
a 16 s boot watchdog.

Coalescing nearby bad words, or reserving only after a range's verify
pass, would avoid it. Seen on 6.18.54 (arm64, Allwinner A733, 6 GiB);
mm/memtest.c is unchanged in linux-next.

Measured on my board by AI agents, analysis with an AI assistant;
a report, not a Tested-by.

Norman

