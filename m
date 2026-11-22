Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795349082;
	b=4uAQ2VcJ3XNJPQx94uFK+EkAxt3/3B9RyNM2nn3nfDkP5ErwV0fEnsZhGebpGUXNpqg5
	 Et07iIEklygqqUDlk3LN1dyALlTBdKMUkyi9cDq8su7oW8PU5JyciFrAp1LapAvcSIxZu
	 CwpGvDg6gyhbrSzBjRIsB1siwi5O2myyz8aqBTiV1aIkFd+pH9/+u9hUAAd4NDRoxb1Jc
	 /YH7BixWpATgB3bEIoWUOjR320znr0dBRt49qRCQ1Z1djQH5kz1y7GRqlwx9UbL8dIgN/
	 hv3Ue7PP0xDm4Y83SsDhOoQ+IEwlhiXoY0Yxl3DXXH0cxlEmiCb4ZroehOMwqgiojAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795349082;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V+yb/y9hVY4gQHBtq0ety+i4x7YbvicEI/eHAt9Cm/M=;
	b=VydGIM1EUia95GHCE8NxGHw0UaTbWjel9PSzmFgmQ91Han1sssJHY+35mPkSzQUpQ5dd
	 7lH6/QwAud5rwR4gQr6Z5ZynqOe/4xJMybn1FkZKTedFtJbRsAoaShAbZyFPYJboob+G5
	 pRv3t2BYXikJe6uowO6h7m4cYtumocbFKP+WiHtBo/T4nkVuaDkF+aJKOX0bM6lo4sNZp
	 rp9QaCf/zAsHJcgmgMr2q5zc6JsKovR8TPMIB5DX68SJHtOGlmIljBaI91Y0qDwy9ON6w
	 3Wz9g1AU+Q80Kf67kWWfCzHEgEMJ3JZwjDXl+4kDkPKLkFkkuxGWC2/NDhQRtUVxwIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QtATdAra;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OtisCIjF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C601606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C601606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QtATdAra;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OtisCIjF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795349080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+yb/y9hVY4gQHBtq0ety+i4x7YbvicEI/eHAt9Cm/M=;
	b=QtATdAra9RhIwPgRhS7ygnxiUsv7aGRaEtVv/V9javQUjljEfvnitQt838MpxOLMnZQZRy
	5UgPfmIB9WMmlg1dSMEBQzTlRSh3lMBl8ka372+01J7jf3jP1w1YCTtvdvtXVR7x77X2AU
	MzJ4RIfh4ETtbo47V2tFa10PXO+Gosk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-t-CAaWYZOsOFhkvw4dlkCw-1; Sun, 22 Nov 2026 12:04:38 +0000
X-MC-Unique: t-CAaWYZOsOFhkvw4dlkCw-1
X-Mimecast-MFC-AGG-ID: t-CAaWYZOsOFhkvw4dlkCw_1795349077
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5c14cc3cf00so933127e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795349077; x=1795953877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+yb/y9hVY4gQHBtq0ety+i4x7YbvicEI/eHAt9Cm/M=;
        b=OtisCIjFnkmapXhgv/AMAE8iiLPUGerDvNC2GKYbHMY00DKB0gTBfRz+TSjApaphhA
         Rz0gXQZcNwq9TJwQT3P92cFsPTARBZV41xR/b04oHKFrZpJKxjCkWOUvBhmbaowkGfLo
         i+AL7oatqJTWDPh5G2NNEQd0TgZ6wgbYjIv9uWaiMOq5NuiFb9H9PH+zfz4YjC5rRSWn
         ny2Z5Qb+Zg1TAxJPFQtzBY6Gb3oi2bGB8Uj7NjS1hVsfJfZoSzHQXTZZf8C+itmGeNpg
         ebTWMzykp2cQKzg+gZZcP+LGEklVuB1IvhXUn0Q91JWZ2G68lZbSv3kAFIPMd1fOzKCv
         EK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795349077; x=1795953877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+yb/y9hVY4gQHBtq0ety+i4x7YbvicEI/eHAt9Cm/M=;
        b=Z8weHCx/ueutSV+TKgahxdXeNw0n8tsJt/KQK/xIiXQZQg1NbbTUlsFSEBDgRWk4Gc
         kXrCBCIAT471BvhFS17NcNT2fUERoio9PiRQsJ3K2Uela0gqk48aH1Dq62NBUBiGCKZL
         qlNUuYW2DNGJSxfp2eZU5m6l+UOUesFC5Ww0KOduMrUvhvPKPoesDVJXRF8pThGDVBoS
         HN3xPUOjoGjBEbzvUHg2HyBBj+wYU2XuEhSVeT6QmnfRvvb5z8cLObJMMeTg3BTbYWT9
         7mcq1OqNrfpo2vai0djRIWbH/5mhpNuwj4IHJLO5o6GS4JlSjSaFozmrsIUJDQ0fb3Xw
         2H8Q==
X-Forwarded-Encrypted: i=1; AL+hErFHKKFYxZ2kOc0qHIJXOw3SF3J7LjOvzk2rpavWy8ECBAR4ie7ugtihPAk19gkwUDNL//F0fgCHRBKAfNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J+pnA/HTGkAO+WRXpBP4JpptCFx+681CwsYjTbbAHKIhz8I/R
	4FIZIQKEQoOot6S8di2dLGleHEfM93J28vrRdcF76XwEyabF7Fccyeqom50YNj+S1wfrrpqVcSW
	vR+Chr39d0Oqhj8PnjHJ65giX0cD1w58+dACoOC5pqSDU009MpnF16IVA94ZjW99k
X-Gm-Gg: AZFdTZdfhiYsFyw4PZ4N8h3vm+FRU0JurXImwgrugBMUl80XmxT3at6ZWSAQiLh3dn3
	Rocb1+zTZ9n06GfQme8U5BGYuTlJnYbGrUokan1ZtdjPaLUepIOu2q7JXZBASr5qJuaZorKcNk9
	KWFL1182Z4jEtE2FimDNnMxHcy4/zCey8foF6OIoCWjMI70zOHrBRUh9Gj9Es2j2Wosf/4UHKNS
	YLOvXjogPnpoJ70lodDH9aczIwekLxPp9A7mCPPTkvPhiBtlEuc0nEGuNmLBgrqjEWzO2w/rzB9
	Gxmxsb2kHHnPI4nCDKPrN4B5ktcQwrzqpbTgGP7mqgaJ3gYHrlJAirBd0O9/Y2RTavUVTUzfe5d
	p0LqA7I7rHHdPvx/VWCRN8yA3OsKMIrVGotxaIO18NZpZvezCFFWyyFPZHwllIU0ZP0O26rk4rg
	yMpHBW
X-Received: by 2002:a05:6512:251f:b0:5bf:e540:85e6 with SMTP id 2adb3069b0e04-5c1bc80fc24mr2490873e87.24.1795349076686;
        Sun, 22 Nov 2026 04:04:36 -0800 (PST)
X-Received: by 2002:a05:6512:251f:b0:5bf:e540:85e6 with SMTP id 2adb3069b0e04-5c1bc80fc24mr2490845e87.24.1795349076163;
        Sun, 22 Nov 2026 04:04:36 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd017803sm2088742e87.38.2026.11.22.04.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 04:04:35 -0800 (PST)
Message-ID: <ab91c700-311c-4bd5-8d8e-d90d573f57c0@redhat.com>
Date: Sun, 22 Nov 2026 14:04:34 +0200
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
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private
 PMDs
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Aveline Noir <jm5905938@gmail.com>, jgg@nvidia.com, leonro@nvidia.com,
 airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 Patchwork <patchwork@emeril.freedesktop.org>, SeongJae Park <sj@kernel.org>,
 thomas.hellstrom@linux.intel.com, Vlastimil Babka <vbabka@suse.cz>,
 ziy@nvidia.com
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/22/26 11:52, Andrew Morton wrote:

> On Sun, 22 Nov 2026 07:55:37 +0200 Mika Penttilä <mpenttil@redhat.com> wrote:
>
>>> So it accidentally found a bug in lib/test_hmm.c on the way.  "The QEMU
>>> run exposed a real test_hmm bug: a second open of /dev/hmm_dmirror0 can
>>> put a device-private page into its page table, then dmirror_do_read()
>>> tries to copy from that non-CPU-accessible page and oopses".  I'll prep
>>> a fix for that separately.
>> I noticed that also and will make changes around it in my series.
> I came up with the below.  It all tested out OK.  wdyt?  I guess it
> should have cc:stable>
>
>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: lib/test_hmm: use backing pages for device-private mirror faults
> Date: Sat, 21 Nov 2026 17:06:45 -0800
>
> When one hmm_dmirror descriptor migrates memory to device-private and a
> second descriptor reads it, dmirror_do_fault() stores the device page in
> the second descriptor's page table.  dmirror_do_read() then passes that
> page to memcpy_from_page(), which can oops the kernel.  This was
> reproduced with an unprivileged process using the fake device in a QEMU
> guest.
>
> Store the corresponding RAM backing page instead.  For a large device
> folio, retain the subpage offset when selecting the backing page; using
> the backing folio's head for every entry would return the wrong data. 
> Extend the existing PMD migration selftest to read the last subpage
> through a second open before faulting the memory back to RAM.
>
> Fixes: b2ef9f5a5cb3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Shuah Khan <shuah@kernel.org>
> ---
> tl;dr: The unpatched kernel oopsed when an unprivileged process opened the
> fake HMM device twice, migrated an anonymous 2 MB PMD to device-private
> memory through one descriptor, then accessed its last page through the
> other.  The patched kernel returned the expected bytes on all three ioctl
> paths.
>
> A was reproduced and saved before B was built.  As uid 65534, a static
> userspace program verified that all 512 pages were device-private PMD
> entries.  A READ of the last page through the second descriptor produced a
> KASAN-enabled kernel Oops in dmirror_do_read().  Independent A boots also
> oopsed on WRITE and READ_UNLOCKED at the same last-page access.
>
> With only this patch added, READ and READ_UNLOCKED returned the expected
> 0x0a byte, and WRITE returned the expected 0xa5 byte after migration back
> to RAM.  The modified in-tree hmm_device_private.migrate_anon_huge_fault
> selftest also passed (1/1).
>
> This reproduces a userspace-triggered kernel Oops in the fake HMM device
> used by test_hmm; it does not establish reachability through physical GPU
> hardware.  QEMU guests used matching kernel configurations with
> CONFIG_TEST_HMM=y and KASAN.  The guest device permissions were set for
> uid 65534.
>
>  lib/test_hmm.c                         |    7 +++++++
>  tools/testing/selftests/mm/hmm-tests.c |   14 ++++++++++++++
>  2 files changed, 21 insertions(+)
>
> --- a/lib/test_hmm.c~lib-test_hmm-use-backing-pages-for-device-private-mirror-faults
> +++ a/lib/test_hmm.c
> @@ -292,6 +292,13 @@ static int dmirror_do_fault(struct dmirr
>  		page = hmm_pfn_to_page(*pfns);
>  		WARN_ON(!page);
>  
> +		if (is_device_private_page(page)) {
> +			struct folio *folio = page_folio(page);
> +			struct page *backing = BACKING_PAGE(&folio->page);
> +
> +			page = folio_page(page_folio(backing),
> +					  folio_page_idx(folio, page));
> +		}
>  		entry = page;
>  		if (*pfns & HMM_PFN_WRITE)

I have this same chunk. I think it's needed, all dmirror readers expect to
copy_to_user() from pt.


>  			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
> --- a/tools/testing/selftests/mm/hmm-tests.c~lib-test_hmm-use-backing-pages-for-device-private-mirror-faults
> +++ a/tools/testing/selftests/mm/hmm-tests.c
> @@ -2087,6 +2087,7 @@ TEST_F(hmm, migrate_anon_huge_fault)
>  	void *old_ptr;
>  	void *map;
>  	int pagemap_fd;
> +	int fd2 = -1;
>  	int *ptr;
>  	int ret;
>  
> @@ -2143,12 +2144,25 @@ TEST_F(hmm, migrate_anon_huge_fault)
>  		}
>  
>  		close(pagemap_fd);
> +
> +		/* A second open must read the last device-private subpage. */
> +		fd2 = hmm_open(variant->device_number);
> +		ASSERT_GE(fd2, 0);
> +		buffer->ptr = (char *)map + (npages - 1) * self->page_size;
> +		ret = hmm_dmirror_cmd(fd2, HMM_DMIRROR_READ, buffer, 1);
> +		buffer->ptr = map;
> +		ASSERT_EQ(ret, 0);
> +		ASSERT_EQ(buffer->cpages, 1);
> +		ASSERT_EQ(*(int *)buffer->mirror,
> +			  (npages - 1) * self->page_size / sizeof(int));
>  	}
>  
>  	/* Fault pages back to system memory and check them. */
>  	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>  		ASSERT_EQ(ptr[i], i);
>  
> +	if (fd2 >= 0)
> +		ASSERT_EQ(close(fd2), 0);
>  	buffer->ptr = old_ptr;
>  	hmm_buffer_free(buffer);
>  }
> _

Looks good to me also!

--Mika

