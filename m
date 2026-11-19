Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089198;
	b=MNI8gejfPfsXgRUl6U4nVVr55Xbh7YiWe7CS0ZuFo5CDODH7Mxig/x7tvixVcuIYMZib
	 6gZL2bngbUO9QO5HT9M7HjJj9crrNsOXlkHRo2l97IBOvRV3Cs8wfLAjLbv84Fds8qBKD
	 S62dGoSJYfqZchYSBDmRLdDS1l3Glw1p4RekdoRYR088hYM0kZJfFFbG6irbVnQCfydMd
	 I+vW4s4xO7Cj9YuxQSF71pic+m5dSBsPpoPkZCCXDm4JLLh6o8yOoRTwALTQE3sqHcwrX
	 AjAm0lWR90Wg7m9NwjqAv1633VeDKi2wkfZBBzoR23cQVKKR5dFgy+5tSWS5MwntvyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zq2XnZcvuiLxYIMYDQf8X6o1F233lSiAvUCdfDIIF8s=;
	b=qjrMu0vyPlYQ/4kw35+FJtbXGS7j5tsFMjS3ynpmbNdGTQ7JhGbItc8VsAiuo+9Ik3vw
	 Znf6KK/6mttjFc9xpd2JjPG+WAxuoguCWyEr63bxf4Ol9eULAcRkfMk7zaoO0a6aCV3aK
	 nCSznUCj17U0NMvTdAh3oLoACgCWtuTf+HBEYGm++Pe0YwTGjVFbJpKveZ8fqdH7Z5+us
	 wfWj6u1Tf+aNspY+n67mc+dcc/xoqfFCwzmZRuQihvrhQrW9YZvI/SSfDmid2RW2to0zv
	 2Rd5tfxRGMjViBtMaEwsmRV7uQoXxjS+q1AQC1yTn9UwBnxjW6iIqhjPv4TMDOLv/qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSA5jslv;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E0606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D1E0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSA5jslv
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a9be758734so357866f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089197; x=1795693997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zq2XnZcvuiLxYIMYDQf8X6o1F233lSiAvUCdfDIIF8s=;
        b=wSA5jslvWgrihmzbBRX06iwHPEIw4o+GsPZ9R3rG8EraHp5WQpMTNFJcDeIg7nvgtx
         UyIcvgYn0dv14wFu3mqCrAIefh2WmWEnAo7Wfif1ca/vNtqaaeNTfth1G9LI6Ba44X4/
         UgVluZBrOciU6YyrSiKPNe72Y9JlFHlsdS8+xETHO8KDL+vy3P2GKnubpH7K1Mu39WUS
         RxPGIoqwhal5spOz1UJeUvLv5VkIXgR7J8A3KMldlMuARWZmJZ3HK7yh+xRhmTcTiWcW
         B6QSyKuut2DoW1HrUmE0MmByu1U+z5mL5q3BqfyeX2X4ddggbAZSSD8r+ia8M8q+VCoS
         GMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089197; x=1795693997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zq2XnZcvuiLxYIMYDQf8X6o1F233lSiAvUCdfDIIF8s=;
        b=jbG2t0Tnf72vWnnblDSk0acpvE7CFeT/vhCK5W7b0Kh49LkQ7jnHCJlNe3j+eP87XM
         bcYQWIDcpvXomhOOXaA9KSXF5SaCl+CaWXgWiOxPNef4Z2H4SGYj5Z5A2+DW7vPxiryW
         Vle5KzgW2PF9oh5FMUDtX7jSzC1LhAU/yU/SlRHHMIS4y6Nf4Wj6V0QcXQUQpZfrU+oW
         KAMdkc5QfX5GnoSl1oHCPCURfBJCBDeX0p7ACWiJJ3plVVAR73SZM5+BzaG7g06vksZ4
         6dVg5PKPxtPrbMvGVeu3LWDcQTaL50NIM/YT59zO/lJJfPmDMLRB+7mXmRKPCWZI26ZP
         fdTg==
X-Forwarded-Encrypted: i=1; AL+hErHuDvhiEhaDJYDmK6hk/QC6wDax2vr/CPlaUrMcDMMC2D9O/oDA5n1ZBYS00wEq1THAeC+NbE2LqujSIBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VFdR16V4DdthVPFLTgi0wKGhtaOFiZxyNumyFvK+fk7XG8RGx
	EvtL0U2kGnqEiW/XVFku66bHMXH/tCxBF5jXhqEaEVN9w9wVHbwVphLI
X-Gm-Gg: AYBFou3EOl1s8ZsBgj1102xUewded53XMr28j3skuX6MRflLNqgkCUmHPHTqmVgizbK
	xqYuWC+zwjbL75YngLCgwAUsHTz7RZYr5d17lFIgho8B91Dz8q9jdIcCOW+uxDgSRaINkViYiOU
	l+W7YtmhDD8+Ol1WY8rlDSORkeyq+0doVCmGK7TiZlJaEXk5i8Z99PVrpdym79usxbEjyK0/+w2
	9VcPt93xtPXK1MfyWVU0SwVFfBo3QErBF1NKsU0srnhAQFT+v9eE++esVfcYvxOx4B3KjhKvyw6
	S3RBA43yXPLFYqqJTA84I7oOHUl2e7sGCGuSJ17qMYVLEySgNALDizIV43W7FHdCZfmW0bI/8Xa
	VZJNytF5gFNON0SPUBCLvMFmAc0qxIyqPDtxx6VGcDl4fmrOwQrxR9jz0TjanyFjdQB4AMkRbU5
	Qj0mhcpsoqkUU6PmiookYuxhUydMVFhRukFNQr2VAHwB8FXuWByqMrpdmNv8u6PMr0q1k52AB5S
	4ovpLvXePv/fN1LS0GUMQk3q+zKGq7mJtLUpLUhsKzb0TPo005Gjjeb3/vlbsX0FHKkzq3/P2MT
	3VfHcvoVxc/KDL98Cl+hzzhR
X-Received: by 2002:a05:600c:4ecf:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb7da395c1mr109315655e9.26.1795089196516;
        Thu, 19 Nov 2026 03:53:16 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm10580575f8f.21.2026.11.19.03.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:53:16 -0800 (PST)
Message-ID: <32b06069-0cab-4e9d-8d6f-b0852711d336@gmail.com>
Date: Thu, 19 Nov 2026 12:53:14 +0100
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
Subject: Re: [PATCH] mm/page_owner: fix double decrement of stack count on
 unpoison
To: Nilay Vaish <nilayvaish@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Oscar Salvador <osalvador@suse.de>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261118212819.403059-1-nilayvaish@google.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261118212819.403059-1-nilayvaish@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 10:28 PM, Nilay Vaish wrote:
> page_owner counts, for each allocation stack, how many pages allocated
> from that stack are still in use. The count is incremented when a page
> is allocated and decremented in __reset_page_owner() when it is freed.
> 
> A page that is hwpoisoned while in use and later unpoisoned passes
> through free_pages_prepare() twice:
> 
>   1. On poisoning, the last reference is dropped. free_pages_prepare()
>      calls reset_page_owner() but, because the page is PageHWPoison(),
>      keeps it off the free lists.
> 
>   2. On unpoisoning, unpoison_memory() drops the poison reference and
>      free_pages_prepare() calls reset_page_owner() again, this time
>      really freeing the page.
> 
> __reset_page_owner() decrements the stack count both times, although
> the page was allocated only once. The first call clears
> PAGE_EXT_OWNER_ALLOCATED, but the second call never checks it.
> 
> If this drives the count to zero while the stack is still in use,
> stackdepot treats the record as freed and warns on every later
> allocation or free that uses the same stack:
> 
>   dec_stack_record_count: refcount went to 0 for 92274844 handle
>   WARNING: lib/stackdepot.c:517 at depot_fetch_stack+0x5c/0x70
>   Call Trace:
>    __set_page_owner+0x110/0x290
>    get_page_from_freelist+0x1225/0x1440
>    __alloc_frozen_pages_noprof+0x1fc/0x1b00
>    __folio_alloc_noprof+0x12/0xa0
>    alloc_migration_target+0x81/0x1e0
>    migrate_pages_batch+0x1f2/0x14c0
>    migrate_pages+0x9c3/0xca0
>    soft_offline_page+0x189/0x570
> 
> A single soft offline followed by an unpoison is enough to trigger it,
> because the migration-target stack that the offlined page is accounted
> to usually has very few pages.
> 
> Fix it by decrementing the stack count only if PAGE_EXT_OWNER_ALLOCATED
> was still set, i.e. only the first time the page is freed.
> 
> To reproduce, boot with page_owner=on and CONFIG_HWPOISON_INJECT, soft
> offline anonymous pages with madvise(MADV_SOFT_OFFLINE), and unpoison
> each old PFN through debugfs hwpoison/unpoison-pfn. Without this patch
> the first cycle prints the message above and 2200 cycles produce 6597
> warnings. With it, the same run is clean and all stack counts return
> to their initial values.
> 
> Fixes: 217b2119b9e2 ("mm,page_owner: implement the tracking of the stacks count")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nilay Vaish <nilayvaish@google.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
