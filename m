Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.154.239.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997630;
	b=Aj5qAkqIlBBx+cfyWoXlwb1gmb3lgGJkZxSH1ErFF30FUo4p6S6mrlxyEJwkdgcVcMU8
	 P6lf9GZeLTdSf/u6NEAancEzVT+RhspoTtL/iWdlX/0tcv4qBmcTfkm5U+RIh576843O8
	 G8x6F/nsjJdQr0jI+uKZ/aHpC8dn6Pp/k2XLyTUY7KThXnGjCxZ/Nf+9ShtFthGIG/ael
	 oY4ychF+9m4hZPLlBD7mkchHgtjIFJnupRRpAhWInyspqSHRD4NdEUikGCFi2A2Kb7TlP
	 AIJKZsRbZddjSQm9RIX2t1LaunJHD2JNj/rklzdbYwkeoXlM7M0oPmLYEqKwnAuAciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997630;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lgBgYjBwxx/0h1itT1vxtcD9+XMGMAnJpI+uws+wlmE=;
	b=s/fh2Vg+sZ5JSlN4No5qRgBrqWV9GtffVlhb5O38Aau7LcJFoOMbyI5X9ufYxmW0hjF5
	 dxJ6ONWDJXikJk4UMPZZNxQniU9x6P04GA2NVcU1B0gF4gSlVZqzLljs3EkB6KltqBY9D
	 eDW92DTlv7dPDkyrkZlRjjhyi+8QyAqFrcAV2I15KBGRLzP3NT11oyEHVwhpr7YQoYujF
	 U26urJ/gScoiGZVKxdW1MtdBm6ywbuwY23MBiE3CmqFmJhAo4bInJveLd3twyvk1DAEFd
	 4n6LVFqr5AR7yneFOufFxS2FDM9qORNjvTz2g5w0sKOvduQwJ2iTwZbUWfY/P//yzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex-team.ru;
	spf=pass smtp.mailfrom=yandex-team.ru;
	dkim=pass header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=CH0ELNzD;
	arc=none smtp.remote-ip=178.154.239.72
Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net [178.154.239.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA1606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FA1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=CH0ELNzD
Received: from mail-nwsmtp-smtp-corp-main-66 (unknown)
	by forwardcorp1a.mail.yandex.net (postfix) with ESMTPS id 01BB4C01B0;
	Wed, 18 Nov 2026 13:27:00 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d4b::1:2a]
	by mail-nwsmtp-smtp-corp-main-66 with ESMTPSA id vQXVM51WmuQ0-e6VOJhIF;
	Wed, 18 Nov 2026 13:26:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1794997619;
	bh=lgBgYjBwxx/0h1itT1vxtcD9+XMGMAnJpI+uws+wlmE=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=CH0ELNzDFEWRRsummb5x9cX8/IIhLQzKFNgUrby7/D8EmYSyal4QdK+xgpE5LwmFl
	 d0Bk6WhzDFrRRCp/MXhw3KeJX4DeLQ+XCwG4LBqO5Ot0Ygte360VyPZ3DPQggYC5DR
	 LK/Cfw4d/OxxMFyqsiaUmkbGGrilmrwMp9/Jtqn4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-66; dkim=pass header.i=@yandex-team.ru
Message-ID: <464d793e-19e5-42d2-b695-c8124fbb9b34@yandex-team.ru>
Date: Wed, 18 Nov 2026 13:26:57 +0300
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
Subject: Re: [PATCH] mm/page_alloc: don't undo another caller's pageblock
 isolation
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261118000014.1474617-1-d-tatianin@yandex-team.ru>
 <17456889-f94b-438f-85b3-45e9d51272ee@kernel.org>
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <17456889-f94b-438f-85b3-45e9d51272ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 12:50 PM, David Hildenbrand (Arm) wrote:

> On 11/18/26 01:00, Daniil Tatianin wrote:
>> start_isolate_page_range() fails with -EBUSY when a pageblock in the
>> range is already isolated, after it has undone the isolation it did
>> itself. Commit 2c7452a075d4 ("mm/page_isolation.c: make
>> start_isolate_page_range() fail if already isolated") made it work this
>> way, so that users of overlapping ranges, such as CMA, memory offlining
>> and gigantic hugetlb pages, can use pageblock isolation to stay out of
>> each other's way.
>>
>> Since commit b2c9e2fbba32 ("mm: make alloc_contig_range work at
>> pageblock granularity"), alloc_contig_frozen_range() handles this
>> failure by jumping to its common exit path, which calls
>> undo_isolate_page_range() on the whole range. What is still isolated
>> there at this point belongs to the other user, so this takes the
>> isolation away while that user is still working on the pageblock. The
>> page allocator can then hand out its free pages again.
>>
>> Return right away instead, like offline_pages() does when
>> start_isolate_page_range() fails.
>>
>> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
>> ---
>>   mm/page_alloc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 12fac9084c48..151a8d64783d 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -7335,8 +7335,9 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
>>   	 */
>>   
>>   	ret = start_isolate_page_range(start, end, mode);
>> +	/* After a failure, whatever is still isolated belongs to someone else */
>>   	if (ret)
>> -		goto done;
>> +		return ret;
>>   
>>   	drain_all_pages(cc.zone);
>>   
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7d9c29ed8feec8bfbe5e5f673ba2b5926da11375

Oops, my bad, should've checked. Thanks


