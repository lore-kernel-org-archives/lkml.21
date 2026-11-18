Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040100;
	b=2AiCgSnUBzmJCVubDeqqRom+kZGlQZmzT+tpxET8GqCzOnOKe/C1tKk70qqEqG8L9EvG
	 Y7nFjEl+qWuz+ISfva/dmGHSsBYbeDpNQnWqQIuWo7RHT/zHNvxHfsxy8nUO68nUqKLWj
	 wnpvxbUHXp/If6Tx5IH2+xa4M/pPryEhpzJ1yra3j3XiRXeLzlsr3+Zur0ZpexmXgXA0j
	 Tb3AK8mvrg+y1GIMSH6Ej4Tk2O80CHbvunZHpupvvB6GMV6hgynQ1UBXdKtG5JGY3LkD8
	 QQfS22Kull6HmkfxPNT92f99FcS7P0e6Y7YAKDeWcN3cHZ3UO1+Gcb74dVfljMv9vIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vrqYcsAaNhX6ls8KpPsAOf8ZByUQtmFTbu0qydlAKkA=;
	b=iPl3HAlHHwutEz2rqQHt/qDMbh+CakL9+2seWssGHEYwfq8xlmYoJjRdz3fS8evdqrEN
	 Ydbftk3XLNubZXGD4Sm10ElzkwQwUXg93PnRCx6IgIXXrk0CFtO9f107RTtp4iBI8H7WM
	 cSzRuXjaTgA94XtH/T+8IWn0N5kQx5U4W7shRcelZG6eKC4l3xwpEmpTfR4f3XRz7YrnD
	 dnOL93+FgWlg+YQ33Fdl6Kd6E7qegHvjIAYDthCybYpLhpcYf2dzo5I+x+V0HU7hUskcV
	 M3QTacRcwe5RMA9XFjvEBF6XLXHNGz84MdlfLRx4oftB1kM52C+tDB7JRJT6RgBE25Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2d+b0Ac;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01052606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01052606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2d+b0Ac
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so2253415e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795040098; x=1795644898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrqYcsAaNhX6ls8KpPsAOf8ZByUQtmFTbu0qydlAKkA=;
        b=n2d+b0AcV59hMshWgyNYusyFtSxcVq66K/dhkU2k/iMPSn+6Q02ZNYmtd44HvJQ36B
         YtzMxiBDBLo/W2nujpVRVAn5qHAq76hEHSi6PSGrlv6yIO26NPQgIAwG4VtcA4hXqgKP
         jk6/U5rjZg/LWwHMG0GW1RvGIUL7f1c34TfRYw3dl9XTRZq54jisbDrd7CmK3GiBSvDI
         3sKeDN45Ng2G+3cxN7DNvXw5voAhBmArETJrxqGr62Z/3NXjHC5RKDmToOLrtbhkwR2v
         Fnxvf9VKLSMRNQGjbiL8XZvCuqN/LjLGL2vYG4ixq9TPhOaB7Y1manJtUB8I6PdWmJL/
         NTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040098; x=1795644898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrqYcsAaNhX6ls8KpPsAOf8ZByUQtmFTbu0qydlAKkA=;
        b=xiluWKeJrZ7jl5wCciteOgBL5EO8L+ShQFzJFNEBI6wUaufGW662krBkz87/7709a+
         GDoe712q3zzNnXniRYVN8rrna29zyB6VlUvYmT/wQWmimcD7vF3ROfHySwaBBMh3Jb+f
         2ZKWlSKpwX6orDrQ0//5ED556NLfKTbLl0CBxPsXqEX7jUjoXY9v+UP5hLq7Aub7R9aW
         T4E6Nh4EBXq2CcyCzBC8FO0vardGWs2KKfmQVzOI02PYqEx8+4rBvpYDhycjFiCivvFl
         A6m/L3uZ5prAK3nGeODZHZlot/aASrS1bu32rf+7NS6GTmqcYWuPn2yljRzGtxjrcGzq
         gIXA==
X-Forwarded-Encrypted: i=1; AL+hErE0JNr0/zNMh/mBBuLy9BBIr5u3LKlR75y1FkGiOBit8rNuEoYxBFsIw44YWVUmH5bdgISPnQtdWMtyHVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1Xh+DQ5z0gdsocSD3n0OWaYRYH5gfCDHZNk1Y3A7m0nEYQ4iR
	iXRSqsS4YUzvgascSp04aMK+YtfWrqcf6YTiqdTyCi1C5aXIrOQC1vfQ
X-Gm-Gg: AYBFou3lblFGNZYKaLCbNNVUZJFeTbVQOYB4VaUKkw+QdS6h5nZO3TXDBAnc3O/YvMJ
	Db8Vw9lRPcbyYa5AvXDLgfLFidfgsHUHpQb6xGGEGA78l4TGEX8uuqtlOepzcuogRtpvkK7gzVf
	LZQbcg5RhJT3DSesyPyeyx0vK8775BPyzWgKgwDBKHvgpw6lejHqyB+9b5sVOo2uyf7aNr3Svv5
	w/uTiG7HOXtnEcFPHmle3pYbYQtdiK74ISZ+R7oeaUqwoQ7xOX2pM/TPSzCj9/m1mESpRwjRSUV
	fveHIVYrQ6a9wsGl2eTKk0Ag2OWd1qkbBQ++RBP/klePsX6ePidyn7mtu45eSdufEIR2XfSTd2X
	wIGpsO9LFMp7fsfIvY3CP+dy1tAPIDV3ngcjxJ5gJ15WwBElfSXMAi2W+bceVIycpoKjBIilSGK
	mOMKyBraunj4OLEXIeICkfhNtJzB4gQa2eheVUycGlaDWbhcCZbHjkHb9soVeaZh5Qt0kO19Cuj
	lMLvY2XvQd2ECOS/StEfaPnSoJ9ZUnPXWeuHYZrZYlmkni3oKa4h0WqDnFmPa0SqsFwoHUzTh/p
	HcJTpsZ6Iq4SxOX0AGSJ6RNs
X-Received: by 2002:a05:600c:3495:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8325d81emr16614185e9.10.1795040098228;
        Wed, 18 Nov 2026 14:14:58 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5b87sm65370135e9.2.2026.11.18.14.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:14:57 -0800 (PST)
Message-ID: <efc129de-f238-4253-aef2-f102d9704025@gmail.com>
Date: Wed, 18 Nov 2026 23:14:55 +0100
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
Subject: Re: [PATCH] mm/userfaultfd: reject DAX mappings
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Peter Xu <peterx@redhat.com>, Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Chris Mason <mason@kernel.org>, Jingyi Sun <1045704958@qq.com>
References: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 11:03 AM, David Hildenbrand (Arm) wrote:
> UFFD_FEATURE_WP_ASYNC made DAX mappings eligible for userfaultfd
> write-protection, but the DAX fault paths have never fully supported it.
> 
> DAX faults use vmf_insert_mixed() and vmf_insert_mixed_mkwrite(), which
> treats any non-empty PTE, including uffd-wp markers, as an existing mapping.
> A read fault on an uffd-wp marker therefore returns VM_FAULT_NOPAGE without
> replacing the marker, causing the fault to repeat indefinitely.
> 
> PAGEMAP_SCAN can also write-protect a DAX PMD, but the huge DAX write-fault
> path can make it writable without clearing its uffd-wp bit, breaking async
> write tracking.
> 
> Device DAX mappings requiring huge-page alignment and cannot serve PTE
> faults after UFFDIO_WRITEPROTECT has split their huge mappings.
> 
> So let's just disallow DAX mappings in vma_can_userfault() entirely,
> making UFFDIO_REGISTER fail with EINVAL.
> 
> Fixes: d61ea1cb0095 ("userfaultfd: UFFD_FEATURE_WP_ASYNC")
> Reported-by: Chris Mason <mason@kernel.org>
> Reported-by: Jingyi Sun <1045704958@qq.com>
> Closes: https://lore.kernel.org/all/tencent_1874C71D4177A1624528043E008DB1A5EF05@qq.com
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
