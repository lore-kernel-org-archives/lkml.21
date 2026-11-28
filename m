Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870829;
	b=ynt1pm6S2YBD66LbmHIphQDj0yTbAAfRSujUK3w78zZhdhOdWooZUXelLdWXCdKNqGnm
	 Xxt52537z730hUxy5GTXUq9UMU5S58BcMYfnbIoKNXEyNVpgMFXWf9swS6k5wPLhvHmyY
	 N9j/M2C/Ent8jTx1dHO8M3Jvu0VvVClWFMRGpW5LiD5QWgQJ6TMJdeAw47iBkFP08qbNd
	 wUi6AWyL2zgTnfJhoQ0dQJMo1l7zg/Aw7puPg9ciAzW+3K+fmmzr4uWTjzXJGKkdzh/s6
	 CptIzZJJZzyDkIjKr1sV4JW29AkfCIx/AiC4XFZShwphoyjZI+mrkOcV5n0D6KZ6R7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=d6BkAp7ECdk7km8IXzswx291+eDVbqVT1bK4nfJre9c=;
	b=xdSedimFROP7YX5iJjDlzzapk41nq8ehpUNGovkCl30ePrvc9mvqAm/MP7OJc8D/o+ez
	 VSxMr0iCnL3b7vvQ0FylJWnyxbF3tSmcwzlErvm7OiAY4u+JKHmiwUWXgS59GtUQJOzhM
	 QVCaL2rODyIi9fXK+Ffk88tRDzt5jAiMtZVGo427pxi7BV3AWIa2vNjGfmh5LuApoI0Q8
	 TXdkXJXoU0vO1PxTnVfuZBeciMi0NzlkMKWSpJ+DFscc9tCkre+++Kkw+YfdreZYNc0Cm
	 HsEQ4zHa4ewT6S2PvwCIwnQOEvsol/K0mVcKAn7VIOiDDoeAYW/zxgDd5Kv9/u7d1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CiK14xPr;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094A606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2094A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CiK14xPr
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50681426b9so851804866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795870826; x=1796475626; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6BkAp7ECdk7km8IXzswx291+eDVbqVT1bK4nfJre9c=;
        b=CiK14xPrrxHAZcwKgPYEry9+8DB6qjeyuPWTq4AOlSVBmohXvdN4g7RiDUUIXGWP4p
         1JLJPdNM1KahxhvxRDlR5yzyG/cKY2PmiAyPQCGDNSfCO7Aq4vuHTneXz+O+lHn2O1sc
         aacTiStOd/Tjxgy8E+neiHJjfDoIAj87Iceg2tSkzteWsgc5HryrdqU3QtswvgtHyCaT
         iVfB1J6NV4MkUAgzkS6Ka9jB6ZMKFSaHki8xW4WHrEch7/skS6RFRYGpUCUi4zDaXQMd
         sjxqXzPk+sSwfqw4lkErvjgRg+nPbfR+hNo8mMTFKsvYFrxuuaCh1TbpC2c8vla+9MRq
         0u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870826; x=1796475626;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6BkAp7ECdk7km8IXzswx291+eDVbqVT1bK4nfJre9c=;
        b=CF8WlPGeEgl+IGnEyvYZnmOEtK1fSR+QitszU2ftNdq0EZMaU7av8MKEaLjSkG35AA
         K63vtdEPmZKhn2+MGEIMSSBtHyDipiFlsmHNKhUTF9nerBCYH8sRxmJsA8Lw38obdBjO
         UoBMH03DQCzgis6p71BdwFRfjM8nkdOyu2ikDdxcxwolUWVkpydEYoAx8VWObp2hNbDZ
         JYQH3o/OUIDW0A5rKwd1rv62mWb9jmo7I9p/FZMNA/ruSPdZURj5uNW26a9gUCF09wy/
         v6ctT+cf6Q6i+Yrp7y0sls87+t7u3KxdCEbPbJEKJ3X6vTfnji+bI7GVIWJvqmDCyVxV
         LSWA==
X-Forwarded-Encrypted: i=1; AL+hErHWXkhWrBKzIiyo+1veRgq9HP79N14uIaVK2ge+SYsMtS2Wpx3NhZyHps3lDKurMrIyaUuiFTJxKb3GXcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FlZOzjneC++Zzc1N2bAgT+hp6Q3UK50x+Rs5h9R31OgBmLdDT
	7IkCzjUv/nkRJLPNHpEtgA/QYPO0Y82Buh5IdnAm3NRdzfzr0cSVufI/0mp8nLu5WEOAVDgVVaX
	fusAiwsR1yUn/J3oPgw==
X-Received: from ejtf9.prod.google.com ([2002:a17:906:4949:b0:c31:8840:5c0c])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:3d21:b0:c51:24a4:1dfb with SMTP id a640c23a62f3a-c513ac7edecmr1624478866b.40.1795870826056;
 Sat, 28 Nov 2026 05:00:26 -0800 (PST)
Date: Sat, 28 Nov 2026 13:00:25 +0000
In-Reply-To: <avnuP7SWE2BdBFBL@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-3-tarunsahu@google.com>
 <avnuP7SWE2BdBFBL@kernel.org>
Message-ID: <9huzpkvpglg6.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 02/19] kho: block: Record the entry size in the block header
From: tarunsahu@google.com
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, robin.murphy@arm.com, maz@kernel.org, 
	will@kernel.org, David Matlack <dmatlack@google.com>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, jgg@nvidia.com, loganodell@google.com, arnd@arndb.de, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org, 
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> writes:

> On Tue, Nov 10, 2026 at 05:01:45AM +0000, Tarun Sahu wrote:
>> Subsystems using the KHO Serialization Blocks framework currently do
>> not record the serialized entry size in the block header. The entry size
>> is only known to individual callers, which must track and store it in an
>> owning serialized data structure. If a newer source kernel adds fields
>> to an entry, the changed entry size breaks the stride when an older
>> target kernel iterates over blocks.
>> 
>> Add an entry_size field to struct kho_block_header_ser. On the outgoing
>> side, record bs->entry_size into every block header during allocation.
>> During restoration, derive the entry stride directly from the block
>> header instead of relying on caller-supplied dimensions. The
>> kho_block_set_init() interface remains unchanged. A zero entry size,
>> or one that differs between blocks of a set, is rejected during
>> restoration.
>> 
>> This change modifies the serialized layout of struct kho_block_header_ser
>
> Imperative voice please.


Okay, Will take care of that everywhere. Thanks
>
>> and shifts the offset of serialized entries within preserved blocks.
>> Bump KHO_FDT_COMPATIBLE from kho-v4 to kho-v5 so that pre-v5 and post-v5
>> kernels cleanly reject mismatched handover state during boot. Also
>> update the stale compatible string example in the documentation.
>> 
>> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>>  include/linux/kho/abi/block.h          | 10 ++++----
>>  include/linux/kho/abi/kexec_handover.h |  6 ++---
>>  kernel/liveupdate/kho_block.c          | 32 +++++++++++++++++++++++---
>>  3 files changed, 38 insertions(+), 10 deletions(-)
>> 
>> @@ -264,8 +274,21 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
>>  	}
>>  
>>  	while (next_pa) {
>> +		u64 capacity;
>> +
>>  		ser = phys_to_virt(next_pa);
>> -		if (!ser->count || ser->count > bs->count_per_block) {
>> +		if (!ser->entry_size || (entry_size && ser->entry_size != entry_size)) {
>> +			pr_warn("Block contains invalid entry size: %llu\n",
>> +				ser->entry_size);
>> +			err = -EINVAL;
>> +			goto err_destroy;
>> +		}
>> +		entry_size = ser->entry_size;
>> +		bs->entry_size = entry_size;
>> +		capacity = (KHO_BLOCK_SIZE - sizeof(*ser)) / bs->entry_size;
>> +		bs->count_per_block = capacity;
>
> Nit: can't we just initialize bs->count_per_block directly and drop
> 'capacity' and the change of the following line?
>
> We are not very strict with 80-chars limit in kho/luo anyway.
>
Sounds good. I will update it.

~Tarun
>> +
>> +		if (!ser->count || ser->count > capacity) {
>>  			pr_warn("Block contains invalid entry count: %llu\n",
>>  				ser->count);
>>  			err = -EINVAL;
>
> -- 
> Sincerely yours,
> Mike.
