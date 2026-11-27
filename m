Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750250;
	b=cIwudSXxXhJvIWPqABPnAus8rHdCGx6lQ47U1hTsdtQtD4jXTUECkhqgE6mB4QX9vshr
	 UL4N91mh3oOW5f8wpEf77qoDDndQ4D16BqWSu2uo9a0t1Cwxzlpk+sngjYHd335akgHNJ
	 VWPvv/HFTXqtYx2s+Mlzk0snMWHFLibjc5rYvMzMleJc22gT4Vclkzjq8aLjLIu29DiA5
	 PqO8RJXsKacfhSZA6S2iZR+6URCv5E2Rz+h47Z4MVf4usVSHPFQUUGbzN1VmBwNz/sfbD
	 BP5CeBqsb3TpmlGjsv+o+wu4bZQWtusBh/EHq00sOiBKcFuxhxSZYLXefEOx6X+pa9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2WntL9HcIOIR5AycSmIyUOX5AWULz5zCJD14PkRWd7w=;
	b=2EGskHMo3bOvLwC9/phvmSpHF9kkRdXF4ZOcfLRPNwz1nZ2gRsUES34h1PPd34j4aaJ7
	 aUAJIuEDJJBo0F4KVzHdsC0giSDsbVnX9Xax9f8vXk+C12xDCo4RCMUK1AjvTGYeGXyVb
	 Rm7yr7Bidz9rcnTAQJJERn6pu21VmxkSNiUEaN2N+Vh0dx2SQ9MmJUAdHFRFPdBc6YQlR
	 jQ+zywKDJW56j9fHBgULGHIlGXE8yGzxmrR/j/4d2WiLgVgIDNnf3chqO5pRzFXGVrn58
	 YscvsuWiKATVRnMIjD2ANhuLGohPrt02O+Ht/QsnZzkhS1XI05SspPrB5Tu54R8FUUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BmcsxExr;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76198606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76198606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BmcsxExr
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505994e5f5so114026066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795750248; x=1796355048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WntL9HcIOIR5AycSmIyUOX5AWULz5zCJD14PkRWd7w=;
        b=BmcsxExrS5CD6cWD9IAiR1eRyO3Av4Lud5Uuk5MMyD3HH1BwT+B+wjCdTgmtz6CtIZ
         td8sI2h65Nb6DYDPo/hhQ+E8Q/YCKOcHn1xZI24NrkOS/L7PjLWObws260A8VvnJ8CWI
         hI3B3b9sQjc75dFqy2kVQJGb83o4zj/hdSEkUNFzV7riqBSdPvHMIi9wj8Vf2N35LgIV
         qO95rDkOHA3xqe8Ugios0cCM8y+KKEk2H+Cp19sRHRieJfiIsAE0GRGrnKIEek2H3Qfk
         8i1d1zyJXDEMOYw0F6MfPCp+2fXvjqg5z5j05EXnnX8+ywWzx8QZ8NfPETSVG+xmrXf5
         6pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750248; x=1796355048;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WntL9HcIOIR5AycSmIyUOX5AWULz5zCJD14PkRWd7w=;
        b=Bx5cqUgtjdD4ICcJ3gerZ4KZ5vHZ8M66AMs3/13V2K/UQky1eOZHFMXMLCxx2PnXii
         gtm74FEZ82aK4ukH1sGZTAUIpWVh1hGOhrDwtS26clpAhp3GxqB/KDr+GDlPhkYw0cHj
         hvlOIhTHbUNbntKRCJFc8VKmv0R2McioA0S7Z4q7v2P2kJpoeWEqJCfKe/fnunR5PqyV
         qDiQipfO3yTucnWrKaGeGnU5XqeUGTnLZgeg9USnqhbBhzog2xoekE/prlc4qbaor0E9
         81/oNTebZnXdkvmFHcqPCw9FJLiCzbVaWYXPYP8NJJ8/oNx5FYoHflUJSNcREfYxVXoh
         Nv0A==
X-Forwarded-Encrypted: i=1; AL+hErHNagm5hVdxiGO+WbU4wN/vXKW3upnAKz8O6hBfnp4w1tKbBakTS2YbotXmd0MBs0tdmtsGaZm/qMS7FB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w4IUq32MKloe8O4NfnRqyxZpMjvIDIMrJBZeu87nF52RS6lR3
	K6HF1MuA1U5EsrCfLAwVBMgGBZLJ3YVd7NwOg8pFH5NvWjhVau7Xara1UIhYaGCBKiObjQLn1Xr
	N6Ps4mhw=
X-Gm-Gg: AZFdTZdkRWsPrIpcFWpDx1L2DyEzIv7El8mPh2SCZUxMmNWArVAuyiBLxT21Ljja9r6
	ANSz9YM1OwbIua0OsBGM6oCOCJxA7nIfH5enlp9da8KDpjwujnvc+YhBiGip9iaqKhrjQ1NtaBH
	Cbfl9KC/1m07ehoTAgv9VrMZr4RnkCqPEQW2nTjV4XiGapY3VTM/jx/GhMusutyHNIRhEY1WosK
	rJMyb6KU4pG0IS7fXN4speoD0xg633cv8HRJOP+SNBvkdP++LHj2sJg5O8HnfJkP19asfRZIMk5
	3PhMF5/T0W5LR9m4N08SH7j/KNAVg06ck5szO2rm4gbIrwFAx5YQd6k7rLfE33Lv8WMnB9LIh1M
	5XmCqmE5fuYnVG3SVk8Sc30M64coYPjtW6MlJDUGnWHfAFZtl31g7gB1TljI9WG2XdvSf2m6Rfy
	AbX/U+dOUhHkQ6H1gOT968YKVXU+hXjDYN463kgyoALuwbjI3qva9+ewCZxJVotZgFiA0PIp+mG
	WCcPxIC96QGG3dFfvmhR5R/UeOW2SlLJZs2uAcuFc6I8K3uljLxzRe4QbP17yjr2kzPu15xVWBP
	XBnYXstiEdFGu3N5cOoqUnrjec6kNjfS36M=
X-Received: by 2002:a05:6402:a545:10b0:6b4:2960:d381 with SMTP id 4fb4d7f45d1cf-6ba37c76e50mr15405397a12.1.1795750247803;
        Thu, 26 Nov 2026 19:30:47 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm38346233a91.16.2026.11.26.19.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:30:46 -0800 (PST)
Message-ID: <97e7fc50-80ff-4c73-a3a2-7e09c9d8849c@suse.com>
Date: Fri, 27 Nov 2026 11:30:42 +0800
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
Subject: Re: [RFC PATCH v12 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: Joseph Qi <joseph.qi@linux.alibaba.com>, sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
References: <20261125154626.22335-1-heming.zhao@suse.com>
 <20261125154626.22335-4-heming.zhao@suse.com>
 <sashiko-outbox-233793@kernel.org>
 <a9224bf6-9d1b-4fdd-9980-a70c39b11b57@suse.com>
 <843bc832-5731-4f06-835c-9594c53a4cd1@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <843bc832-5731-4f06-835c-9594c53a4cd1@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/26 10:11, Joseph Qi wrote:
> 
> 
> On 11/26/26 11:07 PM, Heming Zhao wrote:
>> On 11/26/26 01:05, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 11 potential
>>> issues to consider:
>>> - [High] ocfs2: missing fsync tid and i_blocks update in
>>>     ocfs2_dio_end_io_write()
>>> - [High] ocfs2: buffered and mmap writes do not wait in
>>>     ocfs2_unwritten_check()
>>> - [High] ocfs2: ocfs2_dio_cleanup_range() fails on zeroed folios past
>>>     i_size
>>> - [High] ocfs2: missing IOMAP_F_DIRTY in ocfs2_iomap_begin() for
>>>     uncommitted metadata
>>> - [High] ocfs2: orphan entry and block leak on failed or short DIO write
>>> - [Medium] ocfs2: overestimated metadata reservation in
>>>     ocfs2_write_begin_nolock() for DIO
>>> - [Medium] ocfs2: per-cluster multi-MB allocation thrashing on ENOSPC in
>>>     ocfs2_dio_wr_map_blocks()
>>> - [Medium] ocfs2: per-cluster w_desc kvcalloc, ip_lock scans, and
>>>     duplicate lookups in DIO
>>> - [Medium] ocfs2: preallocated extents truncated in
>>>     ocfs2_dio_clear_orphan_locked()
>>> - [Medium] ocfs2: stale inode state after lock drop in
>>>     ocfs2_dio_upgrade_rw_lock()
>>> - [Medium] ocfs2: ocfs2_should_use_dio() forces buffered I/O for
>>>     sub-page DIO overwrites
>>> -- 
>>>
>>
>> It feels like the more code I modified, the more issues I introduced.
>> Furthermore, Sashko has started reporting performance issues.
>>   
> 
> I'll take a look this weekend.
> And then we discuss and come to an agreement which could be left in this
> series.
> 
> Thanks,
> Joseph
>   
> 

I will send v12.1 for fixing following issues:

- [High] ocfs2: missing fsync tid and i_blocks update in
   ocfs2_dio_end_io_write()

- [High] ocfs2: ocfs2_dio_cleanup_range() fails on zeroed folios past
   i_size

- [High] ocfs2: missing IOMAP_F_DIRTY in ocfs2_iomap_begin() for
   uncommitted metadata

- [Medium] ocfs2: overestimated metadata reservation in
   ocfs2_write_begin_nolock() for DIO

- [Medium] ocfs2: per-cluster multi-MB allocation thrashing on ENOSPC in
   ocfs2_dio_wr_map_blocks()

- [Medium] ocfs2: stale inode state after lock drop in
   ocfs2_dio_upgrade_rw_lock()

After v12.1, I will stop fixing bugs/issues until we discuss what to do next.

Thanks,
Heming
