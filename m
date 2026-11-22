Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353297;
	b=S0oUbplCy6o7V2rEXvKu/Vcf6i9UkXzTchOyNgafCeupVAw9NQON72p9ekLz3KAXFqiE
	 yaa2BNneppxhF7MlIYAKNk0Mcm4dB6xdBJKYDizvRicHvW83Ds5KbzQEYUphkitit+Z0j
	 jeqmaxFgn1HSAStqM846W8EU8j/ttn7alGKLJCMV8Tl0HZmlnLFaDAz95NjDhRmsh3Fl/
	 0knTQNVUOlUHXsoO6o0ANLqEySd+YaaQ9lezJWFh1Of/9f6O+j/3wOfVx3peEVl89MfNk
	 fOFP2q5eYUgwkIVi861RFGSYASjCppZeNSetjnPTgxyH2ibb/MgD3qru/7WEr129njg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=8hD87ixJaXl21lUSGIciEwnoJt3nWlHx7X6q/vGOsOE=;
	b=cle1AkjORi7T0x/YiWRrIL92n0Yv3agRgGVedKl2O3rZwjULBHcqsQxwNC0wCX0kOZT+
	 uxt3tAPfYLUiE9/evzB+posGIr6k7aur+XCm0wTMuopTyc1IZKREqEYGmlf8WpUzAhxqj
	 /Cymg6uGB6O2SV6udeyGN0ehJskzETF2YR5VLAihwPOXghdDfCSTg0SFYt8PMvRuH4ecz
	 0yvqvnEvZQc0xWBmqbxJR4K7Y5BgyPNWNGcOcDV7/+3JSp5nR/aT7jKoQcQOX8WNZekeH
	 3vw482M0FLjzZNSVXcAprL222CRMCKNmQ64k8atMT35q0YysQ/Ph1IQIzES8E9Mf+cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dNi8/X4g";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306B9606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNi8/X4g
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso2283407c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353295; x=1795958095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8hD87ixJaXl21lUSGIciEwnoJt3nWlHx7X6q/vGOsOE=;
        b=dNi8/X4glj8za8CHUyUTtNzOlgHGHp6QMd10zTC/TQr7AJjZerl6rqDTwp102Lewup
         1ittEsw7RgVIgBsb6DZbCBvqPrbP5YJmX2/qbh82cibbbdWMRNzmYbGy4kpHz9mLdno9
         q8/1br+pv9KTFDXwytSa4WMYQNsbFDN1S6OQCFA2oUgrZS+XuGDF+2uv4kg1KaVLvojN
         8hvHwbnsgHffAHWp8ZPzoZqqIa6lDM0aKKvgLF9n7EIZwdtKzrLa9QEJc8P7eZqhakHV
         z1Aq/zCMe2Uz5NUyUYu79/IRakePzC5KTLXUBsl2yc3GG7faXgOKuYxOPWFab5XvOZMi
         Npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353295; x=1795958095;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hD87ixJaXl21lUSGIciEwnoJt3nWlHx7X6q/vGOsOE=;
        b=vVMIDkyi/Eqi7RgHxB/fS1oHFfyfS02YQiOR5PtWts+NuMEDjDrLIVse8O23ZQ7ej5
         8LvBQ0Ifmag4z19LYsHHTI5E5cNeLlAvq7/ZgJ140U8pZpcFS+hkTSJzrqhZEdyb446+
         +/Ig0as0GEBt0VW6hR1gBGXPti8kNne5NqWKBuBGIMJXQ8GSxxmSE//m+Dk8Ueesy4FM
         eTLqAevD7QXNr4Bj2TRYCJxxKl0ka3ld6hgNkHlAksurIQnEUyRoziqMZd6Z/7WIQMNr
         hiAiVwYIAC7thurHIRVVCYUI5Dr3aC0kEXZYLPYBXdJ5Hcgk6tLPnKOoC2K+xnetXT31
         GryA==
X-Forwarded-Encrypted: i=1; AL+hErGFPWavWrTNfh10GvKaKrlVJRFC4WX4BHukiORyrWIeWE7dUI024Fznmx8S0th8S86rHi6F3mWaKjcGabw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JbW+M1bOUbG1cLCJAJ0TVskMSazW2KQu/k721rQNR2JtPkTcn
	DtK9sQlyxRhdgQ1jMDc9mhErQPY+zn7QOl3foeaU7jCt6I4R5YgakoxY
X-Gm-Gg: AZFdTZdD2qicsFaRftrKa0cd0F6jVGK5Upc6T5TDSmyAiejNbkcEm8+VJ1TCCaeBGQP
	TF5D1PXFOjlcSAy/kckPTCabGMHtFUbekPdLyVXsLVOiyvR5ZR0jf0OBW4H/J31NTSsIDr8TLYD
	NVaDg2LPJOqxzhyflVjI3SGLu2j6SWSleg4o3bXa5XFa9ZpMQRB4QDaNZJjcf5oyqxdzZpTS6SU
	pPbleXhMXo+NG7d0/zRjyYx7qjVQsm+P8mmrWBC8uyVaeawg/vNegKYHmS6CFJnVLXzxPGN9oC2
	e/4dXdGV1KmYWLz+UTg3m/UnysXIWh9RoO2KufZ2Uyh4sA/AWQCwFd8WQfXTPZFm1VgLh9XWe4B
	Gfj26FHN6S1FC9PD/85cz8RnksWVq4X6MyO8ZclPtPtKOGIS9OlEPG76F86LNPSmVbgKpog+z0n
	Isd7WAkt1J2xtNgkGCPMWHvSbW1xqRHGePlp54pCZFQ5JkPvg4KL69ljuekCHUVLVockFVcYluf
	sZqIXsquPxhLdNR+gqMlvNsZyrxFuFk/7gYiVadftyChv96gqq+3mevrm0yLwj839qVDsyUoyNy
	DRSbYIAGjUvFb3M1XPIXlX1bYeqOFGswp6D2UZC0DpkuO3ZGk9b0WljLoRGyb5WnKv7e
X-Received: by 2002:a05:701b:2215:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b5568b3154mr8671867c88.23.1795353295194;
        Sun, 22 Nov 2026 05:14:55 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm20797941c88.8.2026.11.22.05.14.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 05:14:54 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/17] mm/mglru: make generation page counters atomic
Date: Sun, 22 Nov 2026 21:14:27 +0800
Message-ID: <20261122131433.72335-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 05:03:35 +0800 Kairui Song <kasong@tencent.com> wrote:
> From: Kairui Song <kasong@tencent.com>
>
> No feature change, convert them to atomic so we can update them without
> holding the LRU lock. A temporary underflow is fine: readers clamp a
> negative value to zero, and the counters only need to be eventually
> consistent.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

> ---
>  include/linux/mm_inline.h |  6 ++----
>  include/linux/mmzone.h    |  2 +-
>  mm/vmscan.c               | 26 +++++++++++++-------------
>  mm/vmscan.h               |  2 +-
>  4 files changed, 17 insertions(+), 19 deletions(-)
