Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795326945;
	b=DCFAtrXiVgz8Z9kN3Q8WWU2KW4dwKFLvc5j7MtmBsnMmENgM7M4RmE55DXtW8nRQDiCf
	 zqnYPKYjrX0aFgf8gfymZrqoGTMADjN+iH4xEU2tTG/vzRpnSNbK8Ln9lmoIQNIfoc5kA
	 ofDfoz0DcH3Nkw/Seg7y+VAUids4sWLPysPDAn4xthMQ96x0zdjUlMPXmOHhvmR9NLCjp
	 EhZ1Jpdwy/2k5rmx1nFCs/6amJgDcx6zVpGCTJMpxO3RsCy1veieFSQzCNoMVw8Om8Dzl
	 78QE69m937z06mQkRNChpxZxw4P8c6I+Jn7YaKHdYPizITwY30MTHQoRS7Jn/4eK4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795326945;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=e5Q0HhQjroZ+Rc/PnGI9kGFEaaiyFgbKCtvuSXxJJDA=;
	b=j9Tgm6A5723+ZySYPqZUhgSxV+68XGdmJQJmHPCYUJjs0W88wIteJkFocQhKrvw6ek3s
	 Cr+AzAJmqo85oJLfCMWXabj2wUnsg08t0sqKKsnQQlKIEuH1L5i/D2XZ8wor5OZBTPzjx
	 LGnVpXXAHR1ddUPdwBZvoxP7qOgpYcwyS9Mnjhw9oEQvLliCVRvbotibLWPD2wGsUguT1
	 KfWRNUVFMgJw1Wgec+RBfWP78uug6nrKQahzHQb6ivLGaGXXfiOYs1wOBzX4XasSWoQFL
	 /0fCGtYKnsxWcoq5hKUTpc7wMMBJ1V2fJKV05UmJzTFnbfe6PS8Vi1a6mgbPvbtRcLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="C/dh0Fxv";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=doNf56ld;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA79606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C/dh0Fxv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=doNf56ld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795326943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5Q0HhQjroZ+Rc/PnGI9kGFEaaiyFgbKCtvuSXxJJDA=;
	b=C/dh0FxvvhWNCVPzrwJnxjd7/RDWFiHWJBlBbUrSKkR6Uo6TPqOoy6DGN8NN7BOYn5rJ+0
	gmf0pZRDvIEfl3AO09+Immz8Z8moHWw/UtbcSeJMjexc41c3qAhFxELVVjcPUoj2M2BbPC
	L6RB8I0TR76ytgKTN5tx5LIlq8vYC/g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-GEqe2gKINgae6J8Am5oyVA-1; Sun, 22 Nov 2026 05:55:41 +0000
X-MC-Unique: GEqe2gKINgae6J8Am5oyVA-1
X-Mimecast-MFC-AGG-ID: GEqe2gKINgae6J8Am5oyVA_1795326940
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5c1ab3fe822so873824e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795326940; x=1795931740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5Q0HhQjroZ+Rc/PnGI9kGFEaaiyFgbKCtvuSXxJJDA=;
        b=doNf56ldy+ZfV1CkhN/YR9r1EY+cM9Er5Bwe8YEWUbEwba/jZzVIodYn3BBRYqIZP1
         duLK4odH4Q1lERQUyLEiEmbTA8SB1F5ii4ggS4PqGNzZ/kcMLDdik3Wwl0ebGFb9MgcE
         YGYhMeopNO1cdYB8PJgWu4n+ogMIwNKkzYBjdetV5uvVgjnXyWUsIHyrV9LaxsYMdEO8
         NuM+U9/fCmq4092FSBY0Z3NOQTlnSIdMDdu/sxVhcS0rQTl569faEcR6KLjbxhWeAlLK
         Y+lO+JOamd96dVQBTpAQxgudmzmtFGASRhBidxFqZF0LUDAhKV1Jxn1vT5TdWOWvieCy
         9MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795326940; x=1795931740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5Q0HhQjroZ+Rc/PnGI9kGFEaaiyFgbKCtvuSXxJJDA=;
        b=Stsy49I8Y/uWlZ+bXleF0qTFmYe6jOj+gf8eA0pvxyq37eKJMvHSu94lwJz2/Hd46f
         b3o+IvjfcNUEjAhjAGUJsOvYOvRCh0uMjclOPkB+2XS6ZFvT2LX2Ez1wGc6oKestIogQ
         IwZzuyL9KkTFlWl9D4imadlpZWC80A+yGDiINQsM1kO/0CzGtjOyIK+vkVhFv9oGddPN
         ODd17zHFipxr5C/iTSd9BvJ99N18DcngcFTI5pSncYGotfvP6ZekHeRWbNiF7CnA/rrQ
         YjYDPW8nd7O5m/59b+EfD37tm+5uQUVDpvw/X+GTx3SPdLO5dYB4GdIeiBou/LNvDW+X
         /m1A==
X-Forwarded-Encrypted: i=1; AL+hErFOjOoi6HT31dmw0/7rLv+CEGNlj55UvT55wGib1iYOkhAAQRkOXj7S0cbkY481aXNalWUTU5ABki6t7GU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dTAP6z2JYCRt0CUww9t1I9W+9gaVCD1nxu7ZbKC5SnOKmCjIa
	pBHeWyP8jgkBSCmLOczqFbKnNUwmuFi9hmCyPjldJ/c99pCedor8wKv68XF9UKaiJyI0ikOrQ8R
	kjO5C+xrDGuEnx1OORCvUnSyktPOb5YnSCxXJwLPbMQeHcHG2+/qjJ0HKUjHecu06
X-Gm-Gg: AZFdTZdrYx/pvU+tlwH/QeqXXCEUEXat28oaWst2dJopl+ap+efc1TG6F36rG6pb7eO
	Tjo2JJcxW6CAml2fl3kQ9p8t9YEPjxcQga5V61GCkWsaaSMa0iRErJWabTSyV6ORewss6Wsv0cn
	ic+oDrKysZMZaDhMqnBexcGKC9SoLqy2GYk4ysINwPjbvpzsAa1SIZwiGgqnjvpHaSNFzbfPLBZ
	D9Wf/WTjMPD+0u3/FOTQOENmB+cGvK6Owa1dxKU+RZlH9y4zF4nMN7uor/hlBwOBL6eYk+VIBFy
	tPe1Z+HOzLaj/wrxriG5RfM6gf+8yi4UX5uEpk4yNzneqaLy1R8Is+Ysbil0sES4W69Kv1xYqk2
	ZS+7v64fnyPT98uBoRse8XuAKz/5W4B99pei2H+BE95GZdmVAbfSCUobBgciDHbF0aqsq4PAxjp
	GfEv6Z
X-Received: by 2002:a05:6512:1192:b0:5c1:a96d:911e with SMTP id 2adb3069b0e04-5c1b79fccd9mr2415291e87.5.1795326939882;
        Sat, 21 Nov 2026 21:55:39 -0800 (PST)
X-Received: by 2002:a05:6512:1192:b0:5c1:a96d:911e with SMTP id 2adb3069b0e04-5c1b79fccd9mr2415274e87.5.1795326939399;
        Sat, 21 Nov 2026 21:55:39 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd03bcdcsm1951038e87.45.2026.11.21.21.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 21:55:38 -0800 (PST)
Message-ID: <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
Date: Sun, 22 Nov 2026 07:55:37 +0200
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
To: Andrew Morton <akpm@linux-foundation.org>,
 Aveline Noir <jm5905938@gmail.com>
Cc: jgg@nvidia.com, leonro@nvidia.com, airlied@gmail.com, apopple@nvidia.com,
 balbirs@nvidia.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Francois Dugast
 <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 leon@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 Patchwork <patchwork@emeril.freedesktop.org>, SeongJae Park <sj@kernel.org>,
 thomas.hellstrom@linux.intel.com, Vlastimil Babka <vbabka@suse.cz>,
 ziy@nvidia.com
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/22/26 02:00, Andrew Morton wrote:
> On Sat, 31 Oct 2026 15:07:58 +1100 Aveline Noir <jm5905938@gmail.com> wrote:
>
>> When a query starts inside a device-private PMD owned by
>> range->dev_private_owner, hmm_vma_handle_absent_pmd() still fills the PFN
>> array from the folio's first page. The returned PFNs therefore refer to
>> earlier pages rather than the requested subrange.
>>
>> Add the query's PMD-relative page offset to the initial PFN, as the
>> present PMD path already does.
>>
>> Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
>> Signed-off-by: Aveline Noir <jm5905938@gmail.com>
>>
>> ---
>> Found during a synthetic test_hmm check of device-private THP handling.
>> Tested PMD-aligned and non-aligned subranges, PMD boundaries, split
>> PTEs and fake-device data accesses with test_hmm in QEMU TCG; all
>> executed tests passed with the fix. No real GPU testing was performed.
> Thanks.  It appears that the changelog somewhat understates the
> seriousness of this so I came up with a more assertive one, below. 
> Please check that.
>
> I fed this through LLM-driven QEMU-based runtime testing and it looks
> like it pretty much replicated your testing:
>
> : I tested "mm/hmm: account for subpage offsets in device-private
> : PMDs" on matched x86-64 guest kernels. An unprivileged process
> : (UID 65534) migrated an anonymous 2 MiB THP to the test_hmm
> : device. A second open of the device read pages inside the PMD
> : while the first remained open. A snapshot confirmed a
> : device-private PMD, and temporary kernel log messages confirmed
> : that the reads reached hmm_vma_handle_absent_pmd().
> : 
> : Without the patch, requests for pages 1, 7, 255 and 511 returned
> : page 0. A request for pages 31-33 returned pages 0-2. With the
> : patch, all seven pages returned the requested contents. Page 0
> : read correctly on both kernels. Thus an unprivileged device user
> : can receive data from the wrong pages.
> :
> : The fake device needed an identical temporary backing-page
> : correction on both kernels to make this read path work. That
> : change was removed after testing. This exercises the HMM path
> : through test_hmm; I did not test GPU hardware.
>
> So it accidentally found a bug in lib/test_hmm.c on the way.  "The QEMU
> run exposed a real test_hmm bug: a second open of /dev/hmm_dmirror0 can
> put a device-private page into its page table, then dmirror_do_read()
> tries to copy from that non-CPU-accessible page and oopses".  I'll prep
> a fix for that separately.

I noticed that also and will make changes around it in my series.

>
>
>
> I'll queue the below in mm.git's mm-hotfixes queue and shall await
> maintainer input (please).
>
>
> From: Aveline Noir <jm5905938@gmail.com>
> Subject: mm/hmm: account for subpage offsets in device-private PMDs
> Date: Sat, 31 Oct 2026 15:07:58 +1100
>
> When a query starts inside a device-private PMD owned by
> range->dev_private_owner, hmm_vma_handle_absent_pmd() still fills the PFN
> array from the folio's first page.  The returned PFNs therefore refer to
> earlier pages rather than the requested subrange.
>
> Nouveau's GPU fault path can query one page of a device-private PMD at a
> time.  Xe's SVM fault, prefetch and userptr mapping paths can also query
> subranges of their own device-private PMDs.  An unprivileged process with
> access to the GPU render node can reach these paths on hardware supporting
> device-private THP migration.  Xe can read the wrong application data or
> silently overwrite earlier pages of the same process's device-private
> folio.
>
> Nouveau aligns a one-page GPU fault to the PMD head by subtracting the
> fault offset from the returned page.  The faulty HMM PFN already refers to
> the head, so this subtraction can select a page before the folio.  If the
> preceding page belongs to another allocation, GPU access can expose or
> overwrite unrelated userspace data; an invalid page can also fault the
> kernel during its address conversion.  This worst case follows from the
> source, but has not been demonstrated on a real GPU.
>
> Add the query's PMD-relative page offset to the initial PFN, as the
> present PMD path already does.
>
> The device-private PMD migration machinery first shipped in 6.19. 
> Backport this fix to the maintained 7.3.y stable series; the HMM path
> exists in 6.18.y but cannot be reached through an in-tree PMD-producing
> device-private migration path there.
>
> Link: https://patch.msgid.link/179342234355.4.16705453209886955762@gmail.com
> Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
> Signed-off-by: Aveline Noir <jm5905938@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Patchwork <patchwork@emeril.freedesktop.org>
> Cc: SJ Park <sj@kernel.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: <stable@vger.kernel.org>
>
>  mm/hmm.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- a/mm/hmm.c~mm-hmm-account-for-subpage-offsets-in-device-private-pmds
> +++ a/mm/hmm.c
> @@ -355,7 +355,8 @@ static int hmm_vma_handle_absent_pmd(str
>  	    range->dev_private_owner) {
>  		unsigned long cpu_flags = HMM_PFN_VALID |
>  			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
> -		unsigned long pfn = softleaf_to_pfn(entry);
> +		unsigned long pfn = softleaf_to_pfn(entry) +
> +			((start & ~PMD_MASK) >> PAGE_SHIFT);
>  		unsigned long i;
>  
>  		if (softleaf_is_device_private_write(entry))
> _

For this change:

Reviewed-by: Mika Penttilä <mpenttil@redhat.com>


