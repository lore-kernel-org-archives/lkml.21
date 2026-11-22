Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354028;
	b=I2/58PlZbxbKDa7BpVqXagvsYss+Zi62B10oYINsjAUp/BazAL46KD2Z81C9TrFL+rWE
	 uL5Y7Q0INxn1zO7GVlAFN/PsOqovNmXbFcuHPZQePGnG60XJpvy9WT6JS44yrGoy/AYJ7
	 btjtQ7SLFW0XN+7e/tCU5RlWY/q8XcEiYb91IR4hZZSy/HZS/c+eG6s1Xl0HqqWPuC1Fl
	 AblNQddQnTf6/oYxGbjP+P0kOOCGHbB7BOy8fvnMdxhd05MYuI2Bw3Dd7pYPJnDu3B8GU
	 RlCqoc+5OOaKTTAE4RW/mV6tG2EfR9J54HPX9Ztnoe/bYC4QUyvApVPUIOh2Puhxj+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4Vjxsk05GCtbwT9AzJDYSYJvCFKsZl/7LIPSbKWoOhY=;
	b=ce2p1FXfGY1HziHHhhD5iIRcvICYNF7ndSRGGdsp/KbHl/SgkCaF5qruk/r0rrQtpT41
	 72EXrrZawsYeST8/Q46PVQurRag3kqYHd5qnVtb22O4GMSntVLN2jRlHjEMfkNQZRoysP
	 MG/tXvfHP8WanA7aIX9JpFncgHW3rK4lt6mFedHIbvaf9yNZs7H/j9CaErc4hHioTkSO7
	 sPH3qp3SVqRq2SECTpZ4PnddXCkks26BYR9/E/iDcKJyqLdaS9UPV6QsS6powHZTO23fg
	 Cd3TXYYJZxyXhdkgqA2CI/VPpQMjrt/H/KrDeJpIaBBJAGDV1hybUhyYNP5Wp87AP+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWBK8Lve;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E37606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E37606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWBK8Lve
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so28937915e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795354026; x=1795958826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Vjxsk05GCtbwT9AzJDYSYJvCFKsZl/7LIPSbKWoOhY=;
        b=SWBK8LveNa9UkbHBm4O5xKybHXeO4OqyHTTMAlJxuExokHq7c2NB5Ajz4Iqzpd1L5J
         hLV3dZfQXmev1POxyzjJeAxg2JDrlRfM0673B38pz4ZeyUeloOBj9M6pBPga8Q3RyX8z
         ja+5ABvYY75kr5SW9LW/K4Bwfa4UfF93cRd10XMQCsGMvi4Q3K9HpncodYWVPVrDsu9Z
         S6xlWxljQo2nIr7XUOzbNOZNHoL2sV5UwyjisXNT0OGVAf0dAx5AfZtbPy67uYivwHK8
         WjM/G8MsWpqEARPDCqNVC7W9G0fMFyVN9TG//ZUl1FwmS16u+oIFBC7SXeXtsxTQgyP2
         +05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354026; x=1795958826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vjxsk05GCtbwT9AzJDYSYJvCFKsZl/7LIPSbKWoOhY=;
        b=rme1lWLSQ1JXIpcJ3FshupTHdArGAbKiaR3ewHyn8jisrqPmBO65f0h0hpkkch54IW
         EvuE7kCgo16EyIV4ag4ejfO81tlKOoa63wnsJa+kzALrxfpWmB/eSAzV4+SmJMBGuAJX
         2EEEkZw0nmHWx1UzWtLQ76YzsWDSNdlC1MsvjD42di439vNR8tv0uf+IeLkNzkxDpBa/
         rIdv8geyJ3K6QBFOZGhRQkl+j3N3qZ1f6bKuKIzoi8OnYOTew6esknpv03EpuXe94UUY
         1yus5ivYejaB8SFNe1uFXtmlmsdqSRVSZqM72hmpI0boLTjECdq88KDMTiL7ipvWX4e6
         AH9A==
X-Forwarded-Encrypted: i=1; AL+hErEHglKpAXn2yhFb+t+SkiWStGnfdNQIkAjQ8dTBtXYnXoZtt5Gh5QYZD0GV61bYp5VK0riuej1Gu/4cGzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Guk/4/tjK56GZWVTgceNmhdl/LtgrFFqq2E07Rnohn2pQsnjm
	rHLg3F7SiPc/3wNsWJR6TPzLcUQJ4keHfLESYZ6m/cvqI+LbcXsIoWb9
X-Gm-Gg: AZFdTZeinGjn1xNJZCFVvXwARfieYhCucQBFVG1gi7e/eqlInSdh1pBXEMAWgLKhVAD
	DIvzeH5Aa2zEdnD3kJjXVridzHezzBXCCSv2ehtbj0XISa7tfxC/Af8/A+3xroFipCwn+Vkegtp
	PWULFhcyYxXYr5ZzG+k+/5faP1JdJ7D3MV5UpEpSTWVLXS1ueLJ9YCVfSTt749WGQgG2cuQUldp
	p/2X8STVj9Nstzbw/HeOJClg7awPh+9gl2a+vfgFdXt2oBqR249Muh3Rp56WYx8ANWE0fH2fAtR
	Dj+u8NWCW+Dv6nfaCOnx5DST6SZURP/oulL7oMV4dYgiBqPr3gOzlorcx4LJpLnZmaz9ZfvN07f
	ZHZTpjJ99f2yVPshLpiJL5nKNu82DuyKxNq9L2IB5blfHwfFKszOQFutouWWBE5/Dd8BN2PK6YQ
	Xh6jMnWa39Ovxh4Jm87w6tcmc+lU0ICvqm69W7VDOlFIUV0Pal3OMuslS3xKMuIyRDmbPU8NzmN
	T7Kq5vnCaZqg5z4BbKZftyBu8GygoRpFdXeaitm+B5Z7kkIWY7oNdAxfgDtZM8+tSwHv5JhZ4hl
	MBx0XZYMr0WlvEoMRtMQ9q8p8g==
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr194508305e9.19.1795354026164;
        Sun, 22 Nov 2026 05:27:06 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm113782625e9.2.2026.11.22.05.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 05:27:05 -0800 (PST)
Message-ID: <08fabb3b-d717-4b52-8c9d-d4c996e97bc5@gmail.com>
Date: Sun, 22 Nov 2026 14:27:04 +0100
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
Subject: Re: [PATCH v2] mm: hugetlb: allocate larger early CMA pages first
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org, fvdl@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org
References: <20261122065527.33123-1-qi.zheng@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261122065527.33123-1-qi.zheng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 7:55 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> With hugetlb_cma_only=1, early HugeTLB CMA allocations follow hstate
> registration order, which can depend on the order of hugepagesz= and
> default_hugepagesz= parameters. cma_reserve_early() advances early_pfn by
> the requested size without aligning the start of each allocation.
> 
> On arm64 with 4 KiB base pages, 32 MiB and 1 GiB pages share a CMA pool
> aligned to 1 GiB. In a 2 GiB CMA range starting at 4 GiB, allocating a
> 32 MiB page followed by a 1 GiB page places the latter at 4 GiB + 32 MiB,
> violating its required 1 GiB physical alignment.
> 
> Simply rounding early_pfn up before the 1 GiB allocation would leave a
> 992 MiB gap and advance the cursor to 6 GiB. cma_activate_area() marks the
> entire prefix below early_pfn as allocated and only frees pageblocks after
> it. The gap would remain reserved with its bitmap bits set, and releasing
> the two HugeTLB folios would not reclaim it, permanently losing 992 MiB
> of usable CMA capacity. An alignment-only fix would therefore also need
> to track and reclaim such gaps.
> 
> The same alignment issue can affect non-LPAR PowerPC64 hash MMU systems
> supporting 16 MiB and 16 GiB pages, with 64 KiB base pages and
> CONFIG_ARCH_FORCE_MAX_ORDER=7. The 16 MiB size then has order 8 and is
> also gigantic, sharing the 16 GiB-aligned CMA pool.
> 
> Allocate early CMA hstates in descending order. Each range starts aligned
> to the largest supported size, so this preserves alignment for subsequent
> smaller allocations without creating gaps.
> 
> Fixes: d2d786714080 ("mm/hugetlb: enable bootmem allocation from CMA areas")
> Cc: stable@vger.kernel.org
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
