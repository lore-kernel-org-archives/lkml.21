Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982810;
	b=e/bkTTauIbjMM0TWtj3YB1LA7bAns0Jrg5U7/LYCnQytqrwIhajLqG88Oh2FB7SLxOSY
	 KU02T6S5dpUA1XZAzh4sSdwzhbxpTIMTwgz0h9pbE7nYeS0/lZa9+v/vnfBzjyosthW5X
	 hRKuohyTetTps+j1R5vvV9ntuoaeXlp/9k86P14wKm83cyLIJmbdhdPWIKvYbRpd1h0FW
	 RRm6bVxf/OBk1TV0uEoIKAyy0ax0A6cc+peBW1ldCoCB8NGANbqjgBDElhoTs5eSFvbEf
	 1pw72HHansqX8z5VcKHVlbsb/zmTs7tMx8HyEzZgYJ4kiGp3x2tGW2chMeY0X/dzJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982810;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aH8cEp7px8xcaLzznaOBQdWewlYuvVH2iWUw8OYAWwA=;
	b=aObZKjhp8d1Ghm3BSKFXiXeIoclazpxC52HQjGm/dVseBds/eygc0/OleVQtTq9C97tG
	 vPI5emd/xAJsDeOpVvz5Pb7i/7nhiyP8iIbrCGnluke+oOl/F5o+pBoRzaVTtGNkIsPDZ
	 K2sGOuwYIApoBocf1BhyLlwUejhD+bxzBRtIEw5vVNIHh+J7MIbuKxXnIlkkz8x+5cXjf
	 RrGFMY5lDGWb07eYaOuq3pwSujBfuHv05pvhI+ey8148+rFtS6sfSmRuHN6cCVkscF8Ey
	 i5bIcQuTW/sySkLM2CLA0W22RTy+DtA5p/gwDJMVTIpiaKIQ3ure7lk5/BbH4gjeDxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LhPLeRWo;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA3F606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA3F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LhPLeRWo
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794982799; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aH8cEp7px8xcaLzznaOBQdWewlYuvVH2iWUw8OYAWwA=;
	b=LhPLeRWozVnfZH0Ov+EZISOrVBfBzPhVpBS6mI/l/rdNx9IAJ9Ljh8TOSrAIB7IO/mAIOIGVbhAG7gdErkbkune8KQUTcsGHqDNc3aF82cPyQQsL+QQlUsg54iBpC7+8QtHYygWluAHBsgAu/LSnSihJ4s0+CoSPq7kT6UDBMKc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R231e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XF.fZ3i_1794982798;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XF.fZ3i_1794982798 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 14:19:58 +0800
Message-ID: <430c6b67-76a2-4f67-abb6-e28d07a84bd4@linux.alibaba.com>
Date: Wed, 18 Nov 2026 14:19:56 +0800
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
Subject: Re: [PATCH v2] mm: use memory barriers for non PMD-sized folios to
 sync
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
 <c254a38b-d5e5-40d0-8d70-c6baa850cf2a@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <c254a38b-d5e5-40d0-8d70-c6baa850cf2a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/26 5:19 AM, David Hildenbrand (Arm) wrote:
> On 11/17/26 08:00, Baolin Wang wrote:
>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
>> uses PMD lock via sync_with_folio_pmd_zap() to synchronize when a cleared
>> PMD is found while unmapping a folio.
>>
>> However, for non PMD-sized folios, the only PMD clear that can race with
>> this unmap is PTE table reclaim, which clears the PMD only after the rmaps
>> for the table have been removed. This is plain message passing, and taking
>> the PMD lock is more than needed, like I did in the previous patch[1].
>>
>> Without barriers, the walker can observe the cleared PMD but a stale
>> mapcount on weakly ordered architectures:
>>
>> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
>> ================================    ================================
>> folio_lock()
>>                                      lock(ptl)
>>                                      clear PTEs
>>                                      remove rmaps   /* W mapcount */
>> [mapcount load satisfied early,
>>   folio still mapped]
>>                                      pmd_clear()    /* W pmd */
>>                                      unlock(ptl)
>> pmdp_get_lockless() -> none         /* R pmd */
>> skip the PMD
>> folio_mapped() -> true              /* R mapcount, stale */
>> unmapping assumed to have failed
>>
>> Pairing an smp_wmb() before the PMD clear with an smp_rmb() after the
>> PMD read forbids this outcome:
>>
>> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
>> ================================    ================================
>>                                      remove rmaps   /* W mapcount */
>>                                      smp_wmb()
>>                                      pmd_clear()    /* W pmd */
>> pmdp_get_lockless() -> none         /* R pmd */
>> smp_rmb()
>> folio_mapped()                      /* R mapcount */
>>
>> If R pmd observes W pmd, R mapcount must observe W mapcount, so
>> folio_mapped() no longer reports the removed mappings.
>>
>> Pass a 'folio' parameter to sync_with_folio_pmd_zap(), allowing us to
>> skip those pfn walkers: pfn_mkclean_range and mapping_wrprotect_range,
>> which don't need synchronization.
>>
>> Similarly, skip sync for page_mapped_in_vma() since the subsequent
>> operations don't check the folio's mapcount.
> 
> Do we have any way to measure the benefit of this? I think we'll need that to
> convince reviewers (like Lorenzo :) )

As I replied to Lorenzo, I will try, though it is hard to measure the 
performance for this uncommon race case.
