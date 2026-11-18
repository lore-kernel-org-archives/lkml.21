Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015620;
	b=YZyi04Ii4gCmaw3pwDqFu/4/gwIohPDaWTR0i9O0PalQw6GvxaupoZXLho6S3+cdskUm
	 +bSz6QDvNSeYBZTs5ceIOfnWy2fPtJOtzdfpdFYL2jef16vuoeHnWqRqaFfnIkq/WOmCL
	 8sSao2oeycVfngZfWbT0jAhYKJM9UezAybnLImrCwOQcdE+OtLGM5WDDc1Ik4t3kANgtd
	 Q6p8A33wXyqZ89GkEyNXijl6E47o42lwKcWFOvJDwj8iEmVcnXBb/+o5AzyLaRzspZfwL
	 uHkUD5+FqXyBJopIc93iyPMhy7DlFgLvJAjEWTRJ7B16VnD4FvzCT6FBSp2me+TSuyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
	b=x4wx89VP0GpS9b10DlwvHUpUX+p6OLVsh97INj1gA9e7bpi6kTAkzDmiUYwLQAdPOd8w
	 wPiF/SjQWyMX72bTXfZIzHSkzneyEkx5NjVvKyfTLxn/vEjUI71J0/VLBoYKFKPFdSssV
	 YNRcdj5mHvgVpDWX9oe2ovgfB4zLYATrsCrgypGd3uNmcPX/euACaa72uKymonjM93bNo
	 v8mqbYd54a10cvgnXRrH4INZbvqMRygB+R9ULjIkvKYsAtO41H7im7Hdnf8C42Je6fiD/
	 42b44QuFMd9IY2HPYUjNfqBPYxbV3VCDubkG84/Oh03DENA1NQjsNDeQdLNze+I9b/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nkgzzLi3;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=eNGLzMnc;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F476606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F476606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nkgzzLi3;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=eNGLzMnc
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEg9eR1026505
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=y03Y
	2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=; b=nkgzzLi3h9HeG8fKyYEG
	uDh31vyXH1oYKrz4We4FN7MFzIgxKgw5bbl/1yYWvjel0KI9TY0DcA4tf8wyHfUO
	E9S3VBpfvNnGIkq1nWd7rxaJV0Lqs7OrEOCpyx0/oBVIQHwhYGWzDerPT+uUwcIw
	UNDOHrTbQpKsrdIawLbTecxwoOgThMzBSetvGLfhD1Fr+I+bJ8XjXzV/tn3a/mwj
	WnmC1oaXxkPmI1tAL5NMf/NM2XxF0DEM+oYOVbl6k3afNC9MEBBmKm7ao0MfRmEk
	9PYcQAKRmMuhT+Cw6VRw5kLAg34WlAdslNZkvKUYJ/1MhKqj8LIxnHzWfAB0TDWa
	AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu5ceqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:26:58 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so180964285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795015617; x=1795620417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
        b=eNGLzMncLaD/gULnBB44zNnS7Dv4FStMKpQi/7xu023CAaSTwBI7HWkCyE1E5YWhC+
         1kiFjXZKFj8+RgDAZ1hdk51QxLbNs0CSM8RpFrIqBwwxkAk7TRswMjEi+QwoiZlQzazO
         e4z1u5ofToDqWcNa3NsjffkxTXBgxKwMe1iOFbCGp47iXjVmxNabEo6YnrEjLS96p8WO
         3WvT2Y2QGwdYCKhXPFfoREfs5wZyUi9d5jfAUhZdX5N5/Umb6g65IMdcisZwmY/nudM4
         XMHhjw0eb2Bt7y6891a4kwtTFuJuWObV6UANmwVG+eqh6f0a/YRlJ0+S/NtJw1R8SOML
         Ur2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015617; x=1795620417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
        b=fvoNiFvpab2duDLVHN7yxmKWTN7Yql6Mrkt8DDjrOQQxqn7pr5009UgPFPZ+YzmFuG
         5M2esuF7JymPjmHPWkDjaomI0qTGnN8274S/H4VCX8Q75ump+6jsa8gs15zUbo0Yxcv9
         I8WgvEJqgbCA9FQrVZ0z2mQ6a2slQXkEcdldvm8u2GmNIeckch4FUCJxy1itZfdBY2H0
         SCFwTZGGAtGTNvRDolv2YGpKDdx5RfBlGpivIvnpCzyecaOXGegNMIumLwK/dNC3ID8u
         IJ7bCY6ixKYpuvQUh0ZYRnCMI7bhrAqBbD2Hi8uEsru3Th3/WEyzCAF0Y4kvyMHhspU8
         rUHA==
X-Forwarded-Encrypted: i=1; AL+hErFM3hMpsqHNI5J59XvrbwKaEdaF+h+dthzX+IJqBBnjwZpj4whJ2W0fZACNH1QmgHHgvybFF47MYm/MQJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ogMf11V7FyDV8HEd/dSl4L0dspWL51R0Rt6C3aRKO/C/vsDb
	/7jaF16ebRdBn2IaOqOj4tVOFEqJSmvtCpmlPCpORULz7R424nfS9mWJBxxjx98gmP/BKNoutQI
	FeESXg4FRPLAa086O/2aVw05xQramLo6kd/zVKuRMLDihy+JF8Mvg234uzgfN9g==
X-Gm-Gg: AYBFou2ZUIOXcGH0l9e8+bLQ3tI8gs7LdsTB7KLU6R75WyAQPdGtSzteNaqyJPN++qS
	ygNFLgDq5pv8WzzvsYaMJW/5oyaAfwFgmTgiK5fvU9epjGLSRpwPWYTYK/PX/dPXhbxxmGQwDYN
	0zOeSxwwUz4qq/b3ALnG5gu+oiJYQgD/d4mtry/5piJhVvXywutFluLrAT3zXQnnXWKZ0QxGXMW
	PRNJz7Sx+Q+PtvVZ7ZiX9Z/440M2UxO5etYC5mUfGp3Y4kSQdEJWdCUHH4RTjq5BQwA0XugB9WD
	WNyE7V+05b5XgONP79k7vxjBreJfq3Fm0rAK/w5aHI9Yhj9BSJckgbVgGFz9sHf7hhERQaBmgN+
	gERLJQSlbUPrTjohSTrevWg6DBP9MDPahMiKM4Er+0aIWuMyZVeKbSBBScEWMsFcaOOfkC1148o
	zqWMG82RmMqhsnylhZDmZATA==
X-Received: by 2002:a05:620a:8395:b0:947:b201:faf9 with SMTP id af79cd13be357-949995f04bamr536125985a.59.1795015617463;
        Wed, 18 Nov 2026 07:26:57 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:947:b201:faf9 with SMTP id af79cd13be357-949995f04bamr536117585a.59.1795015616695;
        Wed, 18 Nov 2026 07:26:56 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-14.net.columbia.edu. [128.59.176.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b72055bsm204599485a.12.2026.11.18.07.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:26:56 -0800 (PST)
Message-ID: <7d31ba34-8b5f-4eb2-9864-145ea80c3412@columbia.edu>
Date: Wed, 18 Nov 2026 10:26:54 -0500
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
Subject: Re: [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
        Breno Leitao <leitao@debian.org>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
 <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LxswM6ElcJjuVHGmkaPfAfjUkuE3JOh-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX+tozBzOhAT6f
 fqZpEj5gPdKZfzpvWimXOnBl2lEbyxhjEJGqVrny8DXtZN2MouavXo5kEhUG1VqWuyV2USMPYVN
 GFhiru7VpSjA2k3tz0Gam+s/Tg1yZKOOKRuuA/cIYQbBLGifjfas
X-Proofpoint-ORIG-GUID: LxswM6ElcJjuVHGmkaPfAfjUkuE3JOh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX0xY35x04Tli7
 2kkdRNfyMxzQrf9vLUUQc/G9UQGPqk7ZIV5k9CoQipx8UHVtoqZpbdD9XsOjNi7KoM7uosVxQ6U
 WLu/Rw+SUf6FgWjhWkXjLTraWx1lJ2ZmID0zzpmOTvdYj1UfWhowkIuuI8+tV9kL4iTXb/pqEO3
 6AiyJVbDX65cvMzdrhunFxCGslTNjFcRGBcCqcRomzJMZ4kQ48qqt14RBiGfWOJJENJ7JW1VAGm
 FKzpA51u7zk+phuEPj6cfpi89/vfdXZW30VmbAOJKyH4WFa4MD11vgaUWUfv+u5DYEVvlTwhV79
 vXa8vGdNty6sq9ag26ArojDJ8M3OvpoJpcRXx69/eDOWumeGjed9s7eWpgHAJFtyuQpnKaT4FMt
 XZPKmAgZdqABFG5TVu0ol3RshksaRDudUcZyTZCmF4dDNI1ZVpSXoF/adYWpXUDdlvjvdSUnhXl
 NxkmMla5n8G1T50Uldw==
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6afdc3c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2zM0HjzktFauw5hoOd8SpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=Z7cX3StJxvrjZLnT-lEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11970
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 impostorscore=10
 suspectscore=0 malwarescore=0 bulkscore=10 lowpriorityscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180061

On 11/18/26 4:41 AM, David Hildenbrand (Arm) wrote:
> On 11/18/26 05:28, Tal Zussman wrote:
...

>> Patch 6 has little user impact on its own. It is included because,
>> together with patch 7, it allows removing clear_uffd_wp_pmd().
>> 

...> 
> So, I would be picking up ...
> 
>> Tal Zussman (9):
>>       userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
>>       userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
>>       fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
>>       mm/migrate: warn on a writable migration entry with the uffd bit set
> 
> This
> 
>>       fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
>>       mm/huge_memory: build the moved huge zero PMD from the destination VMA
> 
> This
> 

So my one concern is that (as per above), the mremap patch removes 
clear_uffd_wp_pmd() after the huge_memory patch removes the other user.
Splitting them may break compilation. I would've left clear_uffd_wp_pmd()
alone but then it throws a nice ugly unused code warning :\

>>       mm/mremap: resolve uffd state when the context is dropped, not during the move
>>       mm/migrate_device: do not migrate a uffd-protected zero page
> 
> This
> 
>>       mm/userfaultfd: check the hugetlb alignment of every VMA in the pre-scan
> 
> 
> After waiting a bit longer for more review. Andrew can take the rest.
> 
> 
> -- 
> Cheers,
> 
> David
> 

