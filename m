Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198462;
	b=RZgUfGj3ylXryaRBF4uo3eOVvlGdPCp7E95Tt6Nv97gl/yIN6g85ZdCKXOIwdwCX7AEE
	 t2OD1RgPbTgnoEKkmp6fsYOaVowr0Fz/X1tLtS5ipmhBWY8UcFs+t3/jcbdqVoFcCVnpn
	 SQYissdot9hS/Hyn01Q6rURNvTGhn6z4v7r6kVzdX3rtfGRISTfFhxmaPk740I0Zvbmds
	 SaSRB3Xvw9BKAivXo+XDhltFAf/Iwtn/iLuLiPv4dS91S0hd0EfS6aMPaXc45vNJFdWwH
	 wPJVj0sLwiqyqR1jT1EhFzVTEarMb+BBy2YgH1eierHCXkKg5zhCCIoF2IxtDHxQ/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BjI4u2LzbK6WJBwWilztv44HxHxh38PntSdSS7hzSPU=;
	b=MZ1Bps/+LntJmeHkpdx55v6nppOe9bUpzvy3FzfRSDKxZBZ4zD+oRbkWZxkSvdoYo81Q
	 y3VjaS803fN8HEIAyGDblKP3wCPh6cJgatndReSvwJI7ODKuZJRcfvbmpQGRLCF+DejEH
	 fMRZpy+U0awWPFv68iuBPSUZbRYEdbdZzYyY0maaj/AKFfQWpBUqD0qyX30AlBZ71KQh7
	 4K88pJMFBni3Lj4bc2xeCDxZiN+jP8tY2jFu4EC6QJt65EEXFzGJKhEOD6swBVrzO/aSc
	 tHeAKs9CTmgt5s64Noj+SbsgbWmem/I1dXU2Do4A7shT52TNs/d4BRJUeYyTX2JCFMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=fO2xwbrl;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=eGxZp0pd;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4679606B99D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4679606B99D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=fO2xwbrl;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=eGxZp0pd
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHYPWX3178802
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=BjI4
	u2LzbK6WJBwWilztv44HxHxh38PntSdSS7hzSPU=; b=fO2xwbrlFRvE9+ICMyHI
	V5PKEO4GMJbRXaAcirLWAK1E+FqnNsXusq4xCI4IKLY+JUYwcHqJBLIw2+wwZHL4
	wqgLdACedaFf5q74XY5m0+6ZCBqkz6/YYPnePC/iCxq6Cw/m1oZP6IsX7DxQa6eE
	AMZEUMTpwS2Jut82vopziRiPDaiJCsRtSd0Vr/Y8Sw8rRb9c4khANuP8O0PoYx1S
	QeAyt7EH3qRhFz8LCjE1m7VCtcXeBdHbVcxD9O6nSnQWE3bv6lesKLJI7wSRByZa
	LREJKUk3Bhtb/LitQJWljs8ruCfEWtw+wHg+sP9s7PPijC/c2iDN/H9vR6oj+wHR
	Kw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j2s2y9cuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:14:13 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-921052e3e92so24728976d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795198453; x=1795803253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjI4u2LzbK6WJBwWilztv44HxHxh38PntSdSS7hzSPU=;
        b=eGxZp0pdBhjfncRQy5Dr+4CZsFWDK1/qiQzY95nqCxJKbEmK/sXfiwyi270n/CSq29
         oojojRxcbZ74wscoiBYn8reVWd2B/yb81dKOnpkYQF9jIQEnDZJPIDKXC/MDc63ovyav
         +C75osxBvjidXhO3msvkF6StDstoqlYBf1j0ClXKpWWumRh6HF66iYoeh4ngfTB/f3vH
         ASZsEBZEsg/HzG+DMU+37hj7SSe+zgfZO2p7WyIkM84wfOwxumCBY11seWwVz97Bbgm5
         dXFK5F0LVQfwI0dOVGVFde5A+7c3FkclsfOypUwka0dS3ZUvEC6w5QqVVV1hUJgO+/ms
         cSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198453; x=1795803253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjI4u2LzbK6WJBwWilztv44HxHxh38PntSdSS7hzSPU=;
        b=HbEtruEkqhErrheaJTt26LvCev2EnpAu0rHa3/eLzvlj0UbU7MoFT8ovXninCYLSkb
         pLOtT0FyeO1CXUOB6Py0M4XNEY3ANOTRUu2pqkGDvbBc8/9gSHXVmp7nzo+z+1AD26pT
         l0RPGZZoFhuSOYRUjVQ4X2iuxP2I4uKdp5qRQxsnNr3f0uy9c+2QhKMyMeAKBE0pzziS
         3f9NjbihD0Yg75n4uZSQi1g6yAydpTmPpgh/+DCnXyRmeea8GoocIchKujWWx4HU2Pb4
         cOdGLP0wjYWrbnAZ1KosTdwFIgERdTylr3162kZ/0356LuoZga1QfRwcFnHiFEV+iaeN
         3wCQ==
X-Forwarded-Encrypted: i=1; AL+hErFHxZhwKqzrwVVJpg6BMZBF/m4rsLXiNwQKzGA70aDAKGv85r/pUWyG5lWUT0AbLg287vreUIKFkNnDn1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wR4Rb5B52e/s5q9mxh6l/QfhaarKXXYKokW/j4S4fKwRixvGo
	nSLCy6bfDeXN/eEmi/suvmXu4Ay0bwBDh6c2OcwqkgZCU7J/KzK/z9nYKYtgiPH5ytfb6xsWQhi
	gwdPPmFD7eAmHZ+R9HwLBh/73JZTt3q2KIf9g3uFP1pyTIMCNlYTYgEv6aqK8Cw==
X-Gm-Gg: AZFdTZcD2FmaoSdmm0/RHGLVvnom0p+0sYB9qBPZMMyoKHBjsw5x1INaeLUw9evLlOc
	XMtx+cEvMqkbzP7eF+0AZic4oZP2ZP4BO1dJ9+1vC9AUbNNtcrcK107Yci6u0xAMRQgQ1smGeC/
	Y/6x6SdcBX1x9fAtUSqIV3kIzodOW5LUjyqSVgCaaUqID+oFUoZ1QTrBNpUxGjy0R/sBUPMB5/E
	5IRfrPV00PPmtt9lg5tU502St1bpEri3SMUx5p+xTGimB/AcV4axk2pKXDgJnwB7fVShCHMXukp
	5jIjooOgUtR5VPPkglzZEW14fNn4he4COhddo3p36xbKHybgSZXKLVuJhLQoaCACXp+Jg+0Vez4
	c5+AyqVHnsCDMnljrjGafXPUiTtyeQCgGmKoMRYzhBCVpXSE3rOCNMzbK3GM/zJ11Gkd1vBYeBw
	UEjyPkp5KnGNmvG2pkFVvkOoxk
X-Received: by 2002:a05:6214:20a7:b0:920:e412:e3df with SMTP id 6a1803df08f44-92134a6caaamr65344476d6.18.1795198452893;
        Fri, 20 Nov 2026 10:14:12 -0800 (PST)
X-Received: by 2002:a05:6214:20a7:b0:920:e412:e3df with SMTP id 6a1803df08f44-92134a6caaamr65343996d6.18.1795198452362;
        Fri, 20 Nov 2026 10:14:12 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-178-217.net.columbia.edu. [128.59.178.217])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213514d20esm29910446d6.23.2026.11.20.10.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:14:11 -0800 (PST)
Message-ID: <e3b26fcd-8309-448c-bd34-dbced0b50a9c@columbia.edu>
Date: Fri, 20 Nov 2026 13:14:11 -0500
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
Subject: Re: [PATCH 1/3] gfs2: stop using pages for log buffers
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
 <20261117-gfs2-log-folio-v1-1-35db3db42e35@columbia.edu>
 <CAHc6FU7adAS0f2BjU6iU3AUD6hAFF=2zOeCMkVvV88p4O-a6=w@mail.gmail.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <CAHc6FU7adAS0f2BjU6iU3AUD6hAFF=2zOeCMkVvV88p4O-a6=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B+osQ+tM c=1 sm=1 tr=0 ts=6b008df5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=lnglQuR7XRqnmjDHco/WZg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=n50glJ6IDL3DvrYGJlgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Gp5Y4Jy13x-jhf3RS4Kf6C_uj58ztfnQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3MiBTYWx0ZWRfX6JDGySlfPNld
 huQI23QqxPwnShqA7iEzt6hYpegMw67mpNmeotQZ4bR6Nlsat0tDqX+d8mAHLa181Knper/qXtW
 Z0P/T3EJuoY6CbPlhYqG1M+xoILyG56YdkOFv0DdVs4CP1oJNfYm
X-Proofpoint-ORIG-GUID: Gp5Y4Jy13x-jhf3RS4Kf6C_uj58ztfnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3MiBTYWx0ZWRfXyyLqQQlzUJ7J
 e49yM+5mD7YOQpidyL1q6WMK2v6Lctdo9YDJF8PiGoI09Q00tMTzDB2tcjdB5OejMKSAU0yAQCQ
 iAkiLFrXAzz1P9Wp7suu1m7LicoZgE6ijlEmCEvtNxwlvSTLGhVQFB2VfAGg75P+daBbOw0JU0n
 /My52cfwC2gYR7w6rxbpaEr6Oc33sqc/Wpigfxo9ZbQvC7hGYxXHBS8imsvnolPRGBdgMRx5sf9
 1/qIvYtWh+s1EZdlALeLanms4D+C8D9AOpI512686Gv/N7me12xCnusy/hrKlDwNo3tnQ1xiC0B
 houPhRpmwAxslf2N9OVzdH+QtJr4JBiQ9d50uZDOBhu5InIGhvWO9Wvlv7Tc46tKRiV3gmK/Ywu
 k5N7czVDc/yw24MyihXuMStYvRIeN4u34CTMXRtS5zJewpDKzhKxCKFNfQNnYuRGlGJpOMmSUZ2
 uqWGy/U6C+LWRLQG/Qw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11972
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 impostorscore=10
 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=10 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200072

On 11/19/26 7:08 PM, Andreas Gruenbacher wrote:
> On Tue, Nov 17, 2026 at 8:46 AM Tal Zussman <tz2294@columbia.edu> wrote:
>>
>> The log headers, descriptors, revoke blocks, and escaped block copies
>> come from a mempool of pages and share a bio with the buffer heads being
>> journaled. The completion handler tells the two apart by checking each
>> segment for buffers, which treats a pool page as a folio. That won't
>> work once memdescs give these pages a type of their own.
>>
>> Allocate them from a kmalloc mempool instead and add them to the bio
>> with bio_add_virt_nofail(). Give the pool blocks their own completion
>> handler, and start a new bio whenever the handler changes so that a bio
>> only holds one kind of segment. gfs2_log_write() now takes a folio, so
>> the log write path no longer uses struct page.
>>
>> Each descriptor and each escaped block copy is now a bio of its own.
>> They are contiguous and merge under an I/O scheduler, but the flush
>> path doesn't plug, so without a scheduler they reach the device as
>> separate writes.
>>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---

...

>> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
>> index a607e98eb45f..0da4cfbe54ea 100644
>> --- a/fs/gfs2/main.c
>> +++ b/fs/gfs2/main.c
>> @@ -166,8 +166,8 @@ static int __init init_gfs2_fs(void)
>>         if (!gfs2_freeze_wq)
>>                 goto fail_wq3;
>>
>> -       gfs2_page_pool = mempool_create_page_pool(64, 0);
>> -       if (!gfs2_page_pool)
>> +       gfs2_log_buf_pool = mempool_create_kmalloc_pool(64, PAGE_SIZE);
> 
> We actually need s_blocksize size rather than PAGE_SIZE buffers here.
> How about a per-sbd mempool instead of a global one?
> 

Let me give that a shot for v2.

Thanks,
Tal

>> +       if (!gfs2_log_buf_pool)
>>                 goto fail_mempool;
>>
>>         gfs2_register_debugfs();
>> @@ -187,7 +187,7 @@ static int __init init_gfs2_fs(void)
>>  fail_fs2:
>>         unregister_filesystem(&gfs2_fs_type);
>>  fail_fs1:
>> -       mempool_destroy(gfs2_page_pool);
>> +       mempool_destroy(gfs2_log_buf_pool);
>>  fail_mempool:
>>         destroy_workqueue(gfs2_freeze_wq);
>>  fail_wq3:
>> @@ -240,7 +240,7 @@ static void __exit exit_gfs2_fs(void)
>>
>>         rcu_barrier();
>>
>> -       mempool_destroy(gfs2_page_pool);
>> +       mempool_destroy(gfs2_log_buf_pool);
>>         kmem_cache_destroy(gfs2_trans_cachep);
>>         kmem_cache_destroy(gfs2_qadata_cachep);
>>         kmem_cache_destroy(gfs2_quotad_cachep);
>> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
>> index 529c3ec37a18..1fd5f817312b 100644
>> --- a/fs/gfs2/util.c
>> +++ b/fs/gfs2/util.c
>> @@ -34,7 +34,7 @@ struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
>>  struct kmem_cache *gfs2_quotad_cachep __read_mostly;
>>  struct kmem_cache *gfs2_qadata_cachep __read_mostly;
>>  struct kmem_cache *gfs2_trans_cachep __read_mostly;
>> -mempool_t *gfs2_page_pool __read_mostly;
>> +mempool_t *gfs2_log_buf_pool __read_mostly;
>>
>>  void gfs2_assert_i(struct gfs2_sbd *sdp)
>>  {
>> diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
>> index ffcc47d6b0b4..399c20004283 100644
>> --- a/fs/gfs2/util.h
>> +++ b/fs/gfs2/util.h
>> @@ -165,7 +165,7 @@ extern struct kmem_cache *gfs2_rgrpd_cachep;
>>  extern struct kmem_cache *gfs2_quotad_cachep;
>>  extern struct kmem_cache *gfs2_qadata_cachep;
>>  extern struct kmem_cache *gfs2_trans_cachep;
>> -extern mempool_t *gfs2_page_pool;
>> +extern mempool_t *gfs2_log_buf_pool;
>>  extern struct workqueue_struct *gfs2_control_wq;
>>
>>  static inline unsigned int gfs2_tune_get_i(struct gfs2_tune *gt,
>>
>> --
>> 2.39.5
>>
> 
> Thanks,
> Andreas
> 

