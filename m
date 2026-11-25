Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609657;
	b=u7nO5LSHiCrjoUKcZYkRK87Tmyx6gmsHdVIREG8mD8vv9OdOrBh3mmq09jEL9VWfvoms
	 5tPU2c1272x5ru7uEb2OGmiNv6Ql9eK4jDi56PizbzwlDXpxfMZDU0+eMxb8xjXlI+llu
	 cae1SuGURzZqdmeriA+2NPO1+eMcYF2NYuv/jw2Yg8FI6Cb0MFlcC7qsOWwIgP1JNe3B2
	 VhJTd0oeVuvmeW5wwWii4hKcf6Td4L1zIUCGER1wjkjYImean/iStyb8y4oLiLBiNsvi1
	 oSHgIyM6ZfzncwA9bvUM5Yjj5l4xq/+/zVxp85ju/RF1fVvkJ33GZcI75DfYR/yhFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609657;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OTCd5NkrqHvXsUhIx0bTbw94JLFTal3qGzbAQE4IqP0=;
	b=SqUJW9YJcZ4qME2HKTZ5uUGuF/hW1VjKQWfIjtm0tbFF/Jxe+9sIsPr8boXBUnThXb0g
	 dpyT/q953XBw2MpoLLEasGib2lCGCBNyPSmlPZms3r7DAew5ZNTugJJXk4EhxLCePC5rY
	 Yrvx/iTAWdg+4qA/LbnIBy3S7qWdXvVa1h45oqqzwGYMgjcA7LbF7f5XWv/ExqX/415GJ
	 DaNuglsrhv8FT+POxT9oEa/leUjVld6aZ0r+8jXp9mt1sBtvxJ1lIkyXoHAmaYdfid8X/
	 FkfIYHw5dQUxFLiFgG5180QozZ9Zt2ueOtR7AxoV9E2YtfQrjKMuJ0QNOVsrDqvXrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U7ugaIV+;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA51C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U7ugaIV+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P0nTBQTPzorVy5GRLFfEaZDrD2qvxynS7PM+7Y2LdM0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795609653; v=1; x=1796214453;
 b=U7ugaIV+IhgfMXlU7luNKqTxtQ4mtXeK0w87YNBWYWhuVUk7sZ5JL21K0eE+hBfG7/VcejQL
 3xQianR3ki2vYytB59kzmUn24vdQ1MC/lwU5C1G5K/Li2HvANg+E1IxrJNqlYV/IfGFA617lz+6
 wSCsyg9WImC5KvQVGx8xbEQM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92f14202dec0adab;
	Wed, 25 Nov 2026 12:27:33 +0000
X-Mizu-Trace-ID: 92f14202dec0adab
X-Migadu-Flow: FLOW_OUT
Message-ID: <4dd527b4-d384-4c74-adc0-82035f6a37dd@linux.dev>
Date: Wed, 25 Nov 2026 20:27:18 +0800
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
Subject: Re: [PATCH v9 10/16] mm/mglru: Run aging when pages are rare outside
 the youngest gen
To: Andrew Morton <akpm@linux-foundation.org>,
 "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: ryncsn@gmail.com, axelrasmussen@google.com,
 baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org,
 hui.zhu@linux.dev, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org,
 shakeel.butt@linux.dev, sidchintamaneni@gmail.com, surenb@google.com,
 wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com,
 zhangbo56@xiaomi.com, zhuhui@kylinos.cn
References: <CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com>
 <20261116042556.42111-1-baohua@kernel.org>
 <20261115205046.8473acf5a93d69d460598559@linux-foundation.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261115205046.8473acf5a93d69d460598559@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/16/2026 12:50 PM, Andrew Morton wrote:
> On Mon, 16 Nov 2026 12:25:56 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:
> 
>> On Sun, Nov 15, 2026 at 11:55 PM Kairui Song <ryncsn@gmail.com> wrote:
>> [...]
>>>
>>> A little nit: with the rounding above, I think we don't need youngest
>>> / old as an array, just an accumulative value seems enough now? But
>>> feel free to ignore this so we can avoid more update noise in this
>>> series.
>>
>> Makes sense to me!
>>
>> I guess Andrew could help squash the cleanup below into the patch?
> 
> yep.
> 
>> As suggested by Kairui[1], we don't need youngest and old as
>> array. just an accumulative value should be enough.
>>
>> No functional change.
> 
> It got a bit messy because the later "mm/mglru: restrict eviction
> accounting to eligible zones" alters this code also, but I think I
> figured it out.  And I might have accidentally fixed an 80-col thing
> while in there ;)
> 
> Here's the end-of-series result - please check.  It compiles!
> 
> 
> static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
> 		int swappiness)
> {
> 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> 	unsigned long youngest = 0, old = 0;
> 	DEFINE_MAX_SEQ(lruvec);
> 	DEFINE_MIN_SEQ(lruvec);
> 	int type;
> 
> 	if (sc->priority > AGING_PRIORITY)
> 		return false;
> 
> 	/*
> 	 * Round up or down corner swappiness, to balance the heavy biased
> 	 * type better
> 	 */
> 	if (swappiness == MIN_SWAPPINESS + 1)
> 		swappiness = MIN_SWAPPINESS;
> 	else if (swappiness == MAX_SWAPPINESS)
> 		swappiness = MAX_SWAPPINESS + 1;
> 
> 	for_each_evictable_type(type, swappiness) {
> 		unsigned long seq;
> 
> 		youngest += lruvec_gen_size(lrugen, type, max_seq,
> 					    sc->reclaim_idx + 1);
> 		for (seq = min_seq[type]; seq < max_seq; seq++)
> 			old += lruvec_gen_size(lrugen, type, seq,
> 					       sc->reclaim_idx + 1);
> 	}
> 
> 	/* the vast majority of pages sit in the youngest gen */
> 	return youngest > old * MAX_NR_GENS;
> }

With that,

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

