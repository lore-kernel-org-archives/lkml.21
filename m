Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980333;
	b=n4MQSXn7SRuOi/WBp1vRNVBjMJmUmNkbOPbq2SPs2pW0Alhpo/db5Tt1yYg8jTorTT4b
	 OP4Z8j3X6va+KhPZ6Ex5dybJbR/ASin8Y+x8LCI/J4vTnRsCJqE6JKFaDAFMwFsmoqRkC
	 v+M/PuZrcbNdBvpyt9SP1cnCfMpdJTQ74kbtkJ1a2Tt6obWBYOtBlD3VES4mTVZ4wvfAY
	 6MktxqgR772Y2kB9i0XI9Z/E5c4bN87NaCo6sIPCI8NHMghqKVEjR0u6TkSuf1ygnP5ji
	 BOc8y86FE7g8fVEhwk3a6Hmy2PKNfRdIQkFIM768Io0st6C0W3UXLrhsdDZ8TPluF6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980333;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uPAqbowMtLzbIekB9EQTVpQCqoE4uZmeuAc0TOycEFk=;
	b=Y1drsIWd/UJ76PqIPouTN6p3vNbEVw04xkZY3EAxVfzM6qJYu0WY4o3f4Lm/OyNNRsy9
	 ZGMdgOsBfrLyAi7xdQbaT7G0OhfkRFjskk0FeHKL2vyYWbhaqi2awc6HjVSs+3Ah3xqvv
	 OgHA5dFgGXQrORg9xxpz8uNvdyyilY3LAD/QJaVfKLUgptXoiHoNlJUErnUUMDoLk1FVV
	 vucP0omtz6HIyXx+oGfetBkMofd7cL2BuOwWFlENli5Cj567TcjqMoBJoW0RpRZB5H1Qu
	 KWi625buv+cjIYJjjmpX2fnQfI96X97Egk6A33aVBg+7uS7VQT6rYCYQiTjtfdCeHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AZpGlpev;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F823606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F823606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AZpGlpev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2FR8HM/p++ob46YeHJNL26wRuxeb82p19yKGmVM2grk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794980330; v=1; x=1795585130;
 b=AZpGlpevNzmKYFzyNrix7BV0m72pm7SAjYAoEEcUOGwPCwLzuNQLxjdPm5QF/VrNx1i+awcS
 8YDgkK/VPB4bRgMNfjE9HImHhyQizmcuTQQOJvlskVkVTdclFqYbF36Xs/00h/yQvwDObCPoOQm
 s7r2v/b/BameUUb3MzjmXQJU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67d94c72d45337b4;
	Wed, 18 Nov 2026 05:38:50 +0000
X-Mizu-Trace-ID: 67d94c72d45337b4
X-Migadu-Flow: FLOW_OUT
Message-ID: <6e73ae4b-5400-4f6d-bf5b-2892827ea144@linux.dev>
Date: Wed, 18 Nov 2026 13:38:41 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH 0/2] mm: memcg: fix memory.high allocator throttling
To: Chris Down <chris@chrisdown.name>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu
 <zhuhui@kylinos.cn>, Song Hu <husong@kylinos.cn>
References: <cover.1794902513.git.zhuhui@kylinos.cn>
 <avzSkT9-jsCrMoeX@chrisdown.name>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <avzSkT9-jsCrMoeX@chrisdown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


2026/11/18 06:17, Chris Down:
> Hi Hui,
>
> Thanks for fixing these, I've verified that these fix the issues
> reported.
>
> That said, Zhang Jiao sent a fix for the same two problems a few weeks
> ago, and Johannes thought the overage cap there was a bit of a magic
> value, which we have plenty of in mm already, and I agree we shouldn't
> add more [1].
>
> Could you please coordinate so we don't have two patchsets doing the
> same thing?
>
> Chris
>
> [1] https://lore.kernel.org/all/auNrakxaET8qkuAn@cmpxchg.org/

Hi Chris, Joshua, Zhang Jiao,

Chris: thanks for the pointer, and apologies for the duplicate. I missed
Zhang Jiao's patch [1], and Song Hu's earlier report of the overflow, which
already proposed check_mul_overflow() [2]. I've added Zhang Jiao to the
thread so we can settle the coordination here rather than off-list.

You and Johannes are right about the cap. I've dropped
MEMCG_MAX_DELAY_OVERAGE and reworked 2/2 into the shape Johannes suggested,
with calculate_high_delay() and the caller's penalty_jiffies both in u64 so
the value is narrowed only after the caller's clamp. That also removes the
in-function min() from 1/2, which was undoing ff144e69f733 ("mm/memcg: move
penalty delay clamping out of calculate_high_delay()"). The series shrinks
from 19 insertions to 9.

Joshua: the Fixes tag is the right one, though I can see why the diff
suggested otherwise. The division comes from 0e4b01df8659; my patch only
touched that line to add the clamp. The bug is the reordering in
e26733e0d0ec, which replaced

     penalty_jiffies = ((u64)overage * overage * HZ)
         >> (MEMCG_DELAY_PRECISION_SHIFT + MEMCG_DELAY_SCALING_SHIFT);

with

     penalty_jiffies = max_overage * max_overage * HZ;
     penalty_jiffies >>= MEMCG_DELAY_PRECISION_SHIFT;
     penalty_jiffies >>= MEMCG_DELAY_SCALING_SHIFT;

Before that, the shift ran on the u64 temporary and the narrowing into
unsigned long happened afterwards. After it, the value is narrowed
first, so shifting it right by 34 always yields zero. The division plays
no part, and in v2 the diff no longer goes near it. Your other point is
settled by the same rework: with the clamp gone, the comment goes too.

How I'd like to proceed:

  - Zhang Jiao: would it be OK if I send the combined series? The overflow
    fix stays under your name and keeps your changelog, in the shape
    Johannes suggested, and I'd carry the 32-bit truncation alongside it in
    the same series. If you would rather send it yourself, or split it
    differently, say so and I'll follow.

  - Song Hu and I have been in touch off-list, and they are working in this
    area as well, so the patches under my name will carry them as
    Co-developed-by.

  - v2 will include what was missing before: a Fixes tag for each of the two
    regressions (e26733e0d0ec, v5.6, for the 32-bit truncation;
    0e4b01df8659, v5.4, for the overflow), Cc: stable, a changelog that says
    plainly that throttling was completely inert on 32-bit, and the wrap
    threshold corrected to about 130x at HZ=1000 -- the 4096x figure misses
    the HZ factor.

Two separate patches rather than one, because they are different
regressions with different lifetimes, which matters for the stable
backports.

One number that may be worth putting in the changelog: the smallest
exact-zero case is memory.high at one page with usage at 2049 pages, where
max_overage is exactly 2^31 and the product wraps to zero.

Thanks,
Hui

[1] 
https://lore.kernel.org/all/20261029073857.974-1-zhangjiao2@cmss.chinamobile.com/
[2] https://lore.kernel.org/all/20260818012115.65838-1-husong@kylinos.cn/

