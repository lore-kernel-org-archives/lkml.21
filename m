Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041354;
	b=sWYEBNo0bbCx1UEf1w0pnz5Swwz7XPmhfWitnxNZuIq789RHavFV6nDjlfR0ELeOGEjP
	 x6ttcUkfOjuIKjjZ8ygQGDdCOGBhvaIBS0/thk2Km6fxfvfB2yJOtTayNgXk88HmwGCDx
	 X1ADFJKwtOO/T18deIFv1t2ZJ741ThYmkAbJ3POW12U/4gtqo0SESfqKo/gDQqw8OqY7J
	 bd4S5NbKu2xjgH9UVF++lppUNhp4n1WAYEpRhRywYsNhrT8oPbRx03yPlbAYkL6TMOOX4
	 DU4Ff685zdDnnNjCOAFYqXVNY6sykiONAnkTXE+vcJaoOVsozxoIUPv5RBNwZmzTX3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/1QlJHCek+NUM+XDDyqHX4umCUytIfs6olrzBCKAfC8=;
	b=2bkgDUcjOQdQd4adJWqZ+OmbQ0eomQj4s20ewi5EpccYi7sdXXLQ5NWXIaSQ1tRUb2Nq
	 /vCsJ+4UsBVAe+SxOkak3WgiOmwH9zBg15LbEKjMvlunZ3+LpvUcw8n301c/5JedIViWH
	 mIfNxnhz8vDwmVAx+Z79H6GpTvbA4KD7Jm3gBKNQ9W82pn45pmTCTkhcrCP4IoANsWGpE
	 MIJNz1X0go4Ext+rI4/32uykAwkAUhTbMPzO306J5Doo5d6FJ/SxwscT5uTisL5Av87NI
	 m8yZIs25aMbZjXWku23X1OPPR/zckUfTmBDq4ypkKjSL1qaXS2xBfrJ1G3MPp7115Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2k9Aopr;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC984606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC984606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2k9Aopr
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso1212375f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041352; x=1795646152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1QlJHCek+NUM+XDDyqHX4umCUytIfs6olrzBCKAfC8=;
        b=z2k9Aopriz/s/DdJBcHB96CxFi9cWMysyIavKi0+kegv2HKMstRYQHOC4Mqo4PI5Gn
         nx9x91MTbTNzLMdNMBz1NseyiIRkYsrxrzMxd3V4SEunBHQtBJ4G5YDTDpLtgZixhWkq
         /qqdYESS27oMnu+7KoFJmoqbfFphM2TMYu7OFKQrMvy03ZSKipNikKNgbb9+M7VVGfnq
         0uc2YV1r3hvRw7bKWswIqb/2A0JI9uxhQML48EA0ZY5plsnH2mZO5N52dJzG+K9LAYLL
         EGDe3kRWWQy5ukKqvoPA8gxeUKHc/GaIjXURRfPAXyn+6obt8fC5G7ETRYPzYFUGEFW3
         TxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041352; x=1795646152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1QlJHCek+NUM+XDDyqHX4umCUytIfs6olrzBCKAfC8=;
        b=yDvTe80MMN+eD0VLH2oC6cq4q00tbA77egBX4EsD12pfSgoH25jwBiyCfiMhSTWVcw
         bVDiCeZHeTp3km9bJSwIDM1JBUNcxAIy/KpzpxTCdoe/apVikgNuyXBRBGVx96UV34g4
         E4z6PzfyED5rzUBS8YUdczklm/Hpd9H+7AovFWyaTWVzkXUse4+ToN5UHZnHD2vldkP/
         Wp5lw8v9hNdnVau2Che/eUZ90qIm+31hCSUhPnp0GPqHwYMLmqNZANaIxsdCrw3Jb+v3
         J1GlM+GQjxll4b1T9nmLXcLRRf+vS3zT7qN2gMJfWFMdF+7xnSvVuLB5nl4eM0TJ+fqC
         xkpg==
X-Forwarded-Encrypted: i=1; AL+hErEKKqAl1+bcDJbOtF1RESWlArxqxmaCPM/c2Hsvn76nirHWjwP/tcE2Irc2ZoMG71Y/hTGL7dhFBKeGLos=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lT/wJM7WAhXA8WIpISOLYk85iJohXsJGnfdmRMUfLjK8s95ow
	CzH/6LH1NvTUA1IkgWkcoyr7i0oTTNz0LGIg9xs3MJ2/CZK3a68nPz8W
X-Gm-Gg: AYBFou06u79hbmYtsrr+jiHKOzqXel5mZgyo/8sbnMkzjD/kTT72UaQe+nGElIdjG2z
	0sEtHkBD65k8BzY5pwCkeM8T6XxaY5XsVfBNaApB1WKMl0VhrQfzDy6sGBmkEo2rBkqNvEl+az8
	05NzK0Q54eGsQ105JzmkgE4qpSxKmMR5aYYUvPrtxlfqZMF7r5pdvGkIqbR1UnzbKtLupYCyYNh
	3ZPgeBw5nBLtWfFMKK83o+SUiFCaj0WlYbsafh3b0yJfWrCF59+dTS5GK5ArRkczAI4H3JYuYlF
	Gx3FHUAKazNZKNpotGbqU1NECPYFHzNYgmYlQv/ihzlFxkLbWex3YtGKLFP461DTimKE7WZqhcv
	kPUe3+Yse9iyOBBZ0/j44lhy2xEmb72E6ijn4Owke2Xjgz/CeQVdXeGKNUBVqpJFgdWJzJz6Zc+
	UGBtiHKoP3EuTwfJAu/xsRhS2THmgG51DI/SWki4s58j+cP+C79Nx1ycGXqMp/ve06Ai3qVY+cf
	8vwoS+l5BskRlTvoMOjWO0IPuq4bEtxa+cMK+owmlMNWAwJts08oBjU+CncBeUpUHaNvjilN71P
	CPE5cfZuG9E7B28iNjHo9n12
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr90494465e9.1.1795041352279;
        Wed, 18 Nov 2026 14:35:52 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb844ee2absm4881495e9.13.2026.11.18.14.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:35:51 -0800 (PST)
Message-ID: <ad22c01a-dfd0-46ac-bd51-ac5d331c9a89@gmail.com>
Date: Wed, 18 Nov 2026 23:35:49 +0100
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
Subject: Re: [PATCH 2/4] mm/vmscan: flush deferred writable TLB entries before
 unlocking the folio
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 =?UTF-8?Q?Cenk_Y=C4=B1lmaz?= <cenk@deepfinresearch.com>,
 Zhang Peng <zippermonkey@icloud.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Mel Gorman <mgorman@suse.de>,
 Sasha Levin <sasha.levin@oracle.com>, Rik van Riel <riel@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Xu <peterx@redhat.com>,
 Hugh Dickins <hughd@google.com>, Axel Rasmussen <axelrasmussen@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261118-file_folio_flush-v1-0-e9e739ed14e0@kernel.org>
 <20261118-file_folio_flush-v1-2-e9e739ed14e0@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261118-file_folio_flush-v1-2-e9e739ed14e0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 10:20 AM, David Hildenbrand (Arm) wrote:
> try_to_unmap() with TTU_BATCH_FLUSH transfers the PTE dirty bit to the
> folio and defers the TLB flush.
> 
> Reclaim must flush the TLB before unlocking the folio, otherwise stale
> writable TLB entries might be left behind temporarily: writeback started
> by other mechanisms (e.g., fsync) will not find any mappings in
> folio_mkclean(), so it will neither write-protect nor flush anything.
> 
> A write through a stale TLB entry after the folio was cleaned gets lost
> once the folio is reclaimed.
> 
> However, reclaim currently does not flush the TLB if the now-dirty folio
> does not get written back (e.g., gets activated or kept instead). Fix it
> by flushing right after try_to_unmap() if the folio is dirty, which makes
> the existing flush before pageout() unnecessary.
> 
> For dirty page-cache folios that reclaim activates, we will now flush the
> TLB immediately after unmapping them instead of batching the flush, which
> is the right thing to do. Performance-wise, it shouldn't really matter
> much, because folios with dirty PTEs are usually young and reclaim won't
> even try to unmap them.
> 
> Fixes: d950c9477d51 ("mm: defer flush of writable TLB entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
