Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363094;
	b=H/qts5GsmAB7WQ0o1skohoRrKvLFXwDphzJyxZCtz+46Qaj8DTZv/znuDffXvANEleRk
	 d1gH9nJJ/WSSQ51ok9SLfhFfhEhWXfFtAfRuRjcIDCrusuZGMyPaARRBH+i1yYjaEkXFX
	 vnipZwKd7LPWBAt0Q7Uki8YgKXLhG0eQw1qA5kKB0xd7SFv60/SSHbH/xwPu8siJ9oSJj
	 5PT7RXME3cPkLCSlQMguNjelUdHb3uUh37oMq0UHwpGNOw6Y9E6EL4AGL9HBHR6Ux0bPC
	 hlZdc0V6KPkWlE/9Pq1sflTim+5r1oZsx3qY2iALkKt6Z72vU1OiHHMChn02qwqrZLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363094;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sm03WQikhvK+Zqgly8SDqrTCCiqA0P1yxoVTgDGTg7M=;
	b=xoEzNmpIM9pLclo09jqKMPI+W+kX32DMaIzt2hvL9nKOpci2jr/qbnCBKW2JVGuHchjo
	 aNt5hLA/Bjj365fn9vHoEAGjYK4nCkvUY+hq++zyA5D00IT7ZvmVghnKpP1A4tAjruAWZ
	 SJugaspVEWkVK3dz8SIH1zDlQKSP/ATThbIdvhTRIW2abbqInjJZgkjQhcaUdLKnQZ4BZ
	 B1AdSIHUN6qSnr+P2Z6aMe3m7Hrqama9IE4Vd/YaPtan7jryRRNhVE5tW0Tigktm0GjZY
	 xZ5J6FoKF5+jrp8xfSdvWpvxsf1rX9VQ2RyvmFZ8h2+ncH0grHwT6cfbM7RL/N5qXuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qr1B7euW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43D606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qr1B7euW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5174A1F000CA;
	Sun, 22 Nov 2026 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363093;
	bh=sm03WQikhvK+Zqgly8SDqrTCCiqA0P1yxoVTgDGTg7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Qr1B7euWqPUFHMbNA2RGINnDHZZs9atNDV/hwqTAqCRzIxZhrZAVcvoyfq0+WYRto
	 u7ShkdF93gyBHEz/fhmLDPqpH+qnygEAkCyMlwph/q7uokg2BRlQM8vdKQWbbk6iuh
	 cYO+V8Eb4GdBfigef3AfKhlB41gR+PupLZsBC/dZkWAE7ZSwixTb3RpsmaRW/hhniB
	 P/9Zsyb4bgMhp9jbfKAT8r68zNBSG0uJCiNdcs7A/16K09hksVNCRh8xTBQ+/YebBI
	 Q5S4uejNa7nVIAxRoq0RngeS88z6/mJTcT1xfzj68oA/M80zK5prdB4iNyMUnquP40
	 z0RriQ60M+5qg==
Message-ID: <687b4ef4-651d-4c13-8fb7-e2c600941e91@kernel.org>
Date: Sun, 22 Nov 2026 16:58:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/hugetlb: a min_size-only hugetlbfs subpool is kfree()d before
 its last pinned page is released, so free_huge_folio() takes a spinlock on
 freed memory (UAF)
To: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <566ddeb4.2ad04.1a202302fe1.Coremail.xuhx@hust.edu.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <566ddeb4.2ad04.1a202302fe1.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/22/26 08:37, 徐晗翔 wrote:
> A hugetlbfs mount that sets only min_size= (no size=) leaves
> hugepage_subpool::used_hpages unmaintained and clamps ::rsv_hpages to
> min_hpages, so subpool_is_free() can report "free" while folios that
> still carry the subpool pointer are in flight.  The destroy decision is
> taken under spool->lock but the field reads, hugetlb_acct_memory() and
> kfree() happen after the unlock, and only superblock handles are counted
> (spool->count), not folios.  A page that a user pinned with vmsplice()
> outlives evict_inodes() and put_super(); when the pin is finally released,
> free_huge_folio() calls hugepage_subpool_put_pages() on the freed object:
> it spin_lock_irqsave()s the freed slab and dereferences spool->hstate /
> spool->min_hpages.  KASAN reports slab-use-after-free at the lock
> acquisition; on a kernel without KASAN/quarantine the same path reaches a
> second kfree(spool) and hugetlb_acct_memory(h, -min_hpages), i.e. a
> double free plus an unsigned underflow of hstate.resv_huge_pages.  The
> whole PoC-A sequence is single-threaded and deterministic - no race
> window needs to be widened - and three variants reproduce on 7.3.
> 
> The detailed description:

Thanks for the report!

I have an AI generated report+fix for this problem pending for rework already.
... but I'm focusing on non-hugetlb first, I will get back to hugetlb soon (or
delegate :) ).

-- 
Cheers,

David
