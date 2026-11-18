Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015260;
	b=gNzuWs9eiul4++C0TtVbWAwOCyOWFEEXVqhG7zk0/1zaxz34qQa94orbuVkBIBnbwlzN
	 6z5ZuVJViKHvG6QwEOlAPUz3IvJV9qP0tyWv5EhaZgospeI/0NaylaeeSoVSwD1fTk4qe
	 lMOHQjxn1gzm9hb2uPBQ3R/mdYMSpUW5CCSnIaqUztz1HmvuEeI3gBlXw68T2lJMtxo3k
	 uBH39EpcbuH3cGH9TXXJ8g8uiAarOm1eyAbccgnFqK7FNgXDzRz5r8S20dB+uv4euO3ei
	 6wRwYfFLJuB/MjjWV1zSN4eWodCyh4JAsAqrHeTx1vKuL2wOmn4jSTSbMEnYMx0Hsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
	b=e5uD8kg9RvmNI6C8Q+efO5Qm9McjQ3EtIYO3DEYfWj0BWnmRS2HS7U+duLoIkrKJwxCb
	 M+WC82kKGY5G6VO79arIyony6g2IbJ83rSFchRB5AQl6fTPflOWMvZ9CpC8H2LotWNjXq
	 cN8suDTgZrDosuTyZ0y+FlOiU67MFCET/AHkIaTanWGF9MEFnWOzs4m4EjyU1d/Sigw1B
	 n2kFvN8qJaKwXcceX8VmOf17o7WCu45rqrZGv2LI6rLuzJHVvChRXW1UVk3NdI5QhNZFZ
	 XubeddoqFtsuksPcbjIsFZjk18jZ66MqU/Oqf+M+gs33PflcNZpZvJM+5zgNLnpcQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RcYjlh9r;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB2A60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB2A60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RcYjlh9r
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d2d380f6aso11815821cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015259; x=1795620059; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
        b=RcYjlh9r4IRGrafd+j2HLcUekeO369jG4cJ8dDVzoBY8gvpxzJeyqK3ozNZlwuaNe+
         dX9eTN+iN1SLvDXv6ZqfqHOE77V1vdoVQpS9x5MRrqE0S7mvRfL6sw/ErTChduS84etH
         nS7jQ1GGdAXlIAaPdld5HxgPrnOoIx1uTeL6PFILkkDVhQvjQ1L/cdSpt//oQ3Sg56BU
         7DACo0lblGCgiebYjG3dsltULlbJRKP6YYtH3AIXL4Ytr8g/kCuFnCukKTYSpuqs6WLs
         H7LrxeAzRj7uQcJe5AdxVin1iIq0eKGTVLMXmX4R0D0sv+hVEZxbt0IeTxFEciavpACF
         rBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015259; x=1795620059;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
        b=Wz6mKJEZoL8I0+j0vhafaUJzztocy6qni79cb0yz08H3DEheJFojtJwMFmCBb91Jnk
         3wgj2vlBbXf045d5D4RbvO29eWoN3P92cXhnr6R4eAJKbVrN6m6IywVQeZoNhUQCNmp7
         zCUm+vSHXh+Qj3/7SMsvaDDqlTNk0T6kzpaS809T9R/DqWatWFTVM59ncOgmJhyZLK7Y
         lWZRXvSNZgsO8j0Wvfj2BSgJRbS0+Fm00wFwEgg6bmXxJhAKZclY5L1bKiMIfYK16vZv
         E4XjcJ7J2i9pFkv8lKQO/xGZXKsQPhqcZrPW8Js2gA+CjqOec4KoXtpAEKwMKGd2semi
         zJAw==
X-Forwarded-Encrypted: i=1; AL+hErGl6ght9i6GAAKeM+7LsJUO2PkzMyxjpMX1ml8URFjYPNvPwqYJWwRnRRBhU0c4TBo6KLibhM+HDzvZNiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rCVHz4xr8WLWshegDYJXYKr6tk2/wurPYktrqNt1mHT3LfzkS
	x8iNeHH50yshOV3iGpJQJr0kmr6+7gHUDFt7Jh9t7asUIWaCJREzILdM+6emNR1Iw3U=
X-Gm-Gg: AYBFou3o9W+jksrRupog2/HDYL9eCAqz6/OudPmMCy0PGJH+YImbl5HndtguXbbwLpy
	L3v1pT2P5dFse84tsXFi1hMxTSwwCCOju9a9jtEGQMbkaJB5daqyYkYwZOaEHmTWLdqwyFuMTej
	QfPfdg8lCR0gzRXZiwFHK5tZZfmcogDjSiWIboaua9olHk0qJel87PHVUN46YXioqleR6n7zMp2
	wQ7EI8UBDTfQIsuZJtOYRPjB1vO/0t2dYk08GvwWYlxAbBj2tkiFlOrhuPapLcxLVKLoGiwvOkx
	1I0URf959WNGB/MKL5zRu/Aw4td+M2lqzz3cOblHBeG1ZzHyPkKBFdtnodIlRCGkoW7a8Yx5rt3
	kycjWTWkNdJjADEEg9EuieFwchQXs/8UX/eL+txn0K0N9sDhX5aK9PGRJRGrkFfDxfBW6hxD2Bs
	pkCVF7Z04Npfmk38YO1+B3AqGUxE9TvobjyT+yeLpCSkLO9cJCTP5WBg4isGqwvC7jqllEOM3xp
	0aIpz0ki6k8Hc7GjNLV2hA4fUGqDrMWrHfdMSIDVbBJC7HPHxp1x4TU9DUXrlV7J08bcS/iiTK+
	s66XEGlmVvHuMnp6Wt5PxjtqDCr6Y+JtSXO/BPVCh8GCshx5D0fcV3hwVeKK3MTP9AVzNlhLIAv
	MlkegsQs=
X-Received: by 2002:a05:622a:a0a:b0:55c:66f0:5bf0 with SMTP id d75a77b69052e-55d5a656766mr42047121cf.39.1795015258621;
        Wed, 18 Nov 2026 07:20:58 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921167f4725sm19632976d6.44.2026.11.18.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:20:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/22] mm: publish and clear node memory states via
 helpers
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1ZBTpLpJC6DJqA@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-3-gourry@gourry.net> <av1ZBTpLpJC6DJqA@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:20:56 -0500
Message-Id: <179501525661.1206716.17622543796948053737.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:53 +0800, Richard Cheng wrote:
> >  	/*
> > -	 * Check whether we are adding normal memory to the node for the first
> > -	 * time.
> > +	 * Publish this node's memory states, including any newly-normal zone.
> > +	 * Hotplug never adds highmem.
> >  	 */
> > -	if (!node_state(nid, N_NORMAL_MEMORY) && zone_idx(zone) <= ZONE_NORMAL)
> > -		node_set_state(nid, N_NORMAL_MEMORY);
> > +	node_set_memory_state(nid, false, zone_idx(zone) <= ZONE_NORMAL);
> > 
> 
> Um, so I am not sure how much cache pressure this will add, I assume it's small ?
> 
> Just want to point out that the old code only wrote these bits for a node's first
> memory. THis now does up to 3 set_bit() calls on node_states[] for every onlined block.
> The result is the same, but node_states[] is __read_mostly. A test-before-set in the helper
> would keep the old behavior, or if you would like to keep it, please address in commit message.
>

Hotplug isn't on a particular hot path, but I can test N_MEMORY before
setting any new state and just early-out.  That would keep the behavior.

-- 
~Gregory

