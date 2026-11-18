Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010134;
	b=qbH4b9ZP+MGBuimkfVeOLbD/d/oW3EN+GBgULYZiRBQuFxRFjb9tFtseROYnsq1Is7dM
	 Mi7e/U9iMT8vwJRBhIoDUvK+mmi0xQr/9J2ciAuGkqA4fjCYeRZSh7JuqTfX/bOII+e8V
	 wFZTdq16LuBmcP/KQ0SPWr+2+Ms1ITRJ4Jti1IGPA7AIUoLI2Vi33uPH9sic8EbnAN9Iu
	 zTTPNJ/0UGdZXnLoKb7ymgR0CU310uGg06g1q9woBrvKT0eULacS6IlOMKSfk1zBas3L+
	 LXTB7lXb2OXH2bqXv48I9cnKk8fnHkCh7LFzPMh7S5UvmJvblLJhmT0ZkQlnJy1Yw8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:From:Autocrypt:Subject:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fzZ8p4GcrJgIWf6F5LBlcZh4WchWnffp6/lWOYHVfoE=;
	b=LJCjAjlSNPQO4zj4KX2p4VpAStqhaiMUacNQMpnG9MoPfrTV5FhvPSM3ksleTDzHWyv5
	 E5kjaXHqvi/pq8/+JafUhewzQ4E61Q5oZ3a3NjP9CrYfiw/jcgsZdUMRBYYz9AvJgM68V
	 vbLcmex5P+hhqotVE6mYan58bydbLWv2NOk1NzGo1c8EUG2P5FA7mCM0H5BuZOJDAacum
	 0npMvSVPsXvyMluOGM3opaATbTcDvdWJOc+bddlmjQ25+e7mmx0vX2MGveLJR5SoWiylO
	 g5gcYlw9oUmUiQqXbF5zLat7luata/LyNO3TTMD1UGuL9a6WsUhjzN79Mm1jK+RHF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepfinresearch.com;
	spf=pass smtp.mailfrom=deepfinresearch.com;
	dkim=pass header.d=deepfinresearch.com header.i=@deepfinresearch.com header.a=rsa-sha256 header.s=google header.b=XvvYdpnz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6085E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepfinresearch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepfinresearch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepfinresearch.com header.i=@deepfinresearch.com header.a=rsa-sha256 header.s=google header.b=XvvYdpnz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9292545e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deepfinresearch.com; s=google; t=1795010133; x=1795614933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:subject
         :autocrypt:from:content-language:references:cc:to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fzZ8p4GcrJgIWf6F5LBlcZh4WchWnffp6/lWOYHVfoE=;
        b=XvvYdpnzeqkgtFJOpqJ19gHT43CkiH5Iifke2y7RTt8o8Ys5azjcfUCO68P8NeGI5y
         HMHGfDnfIcedPT+IQwBqar3LBr79k1iiQnDLFdWCeRCLjh2XZfUTThAjKyepV1eAtn9s
         8MN2oZ61G9WluL42OXw7suy/B089UVEgw1eA8BNYpZoyWdMnUc5G7ocn0TR/brbUG1lT
         tmo22kxNEVWo3vxVM4YGd391KIDUhffvcaoqlVDlG/MTXYHACbWOVBnIEEE1oaba58Ns
         +cvY27mGfy0Idvc41NTfd+lqpbHFrK5z+CRpdnqAow+xc5X14+/FL83sYeqXO64KROyZ
         s84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010133; x=1795614933;
        h=content-transfer-encoding:content-type:in-reply-to:subject
         :autocrypt:from:content-language:references:cc:to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fzZ8p4GcrJgIWf6F5LBlcZh4WchWnffp6/lWOYHVfoE=;
        b=XZOjANerVQBCButQQJ6H9mI9I3LvwgaziEHHnDdCwWjuLmXxMd88wavKcYwU+JmVWL
         xlQfCltxWW75nUp3DYcMBbKT0ntHoWvsLTpSUkWyINFLCup/64ixdSQaOyYgJL9CPikn
         LyYQTVbleBvCJstMGsHy4ajoQ3mhzdqzhOTThH/k1EumZAYRke8VyA3GOf9yDcUWP0zq
         /seXouxGdc2KnBD8N3RnS4r/lhMiwNvJCCNoa9xp2yalkE8mbUZQHHK6EJtwDNrAQ05D
         n1WDL78dB+j4VsoNnyO0rNE7FIsQA+3B3hHPkdU8xUUXtPQNhM4QEEC0w75wYeZVRdgo
         0nRA==
X-Forwarded-Encrypted: i=1; AL+hErH6+IelgJ94JWlP96qLyEMsbnzjLHPcdwjoVSHzG1nQ48Fq/v4NenEUpox2wEnotu2rANX8j+2sH/DDZ+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ung9ev8amlkySKbvOvXC8o2Pum//tERVYePCijRey75g9bFRM
	oB0cQ1CKYEL+otRCHExXuqewUKdBtYiJmHyMZhYG+Ikht0tbumjDEl/6lEPpLklUefY=
X-Gm-Gg: AYBFou3cYBpQuLjdU1Ud0Tqh73x8APr1t0JJOf0PdsEDzoRxmULVjyAmuftK6aUjdGR
	bR+miTEE35CNU7mtRNZYNnxGqNb/7lArvonTZOOF9Bsmp3OldVExNpjbdScSIMkHQbvprzTLOj2
	kPzWYVjlyr6zC2xR8Ut/yaDgbhXnqIKNVMF2sVNrgsXw1CBdDx0HuaotUfTTMPPTGt40Cyyv1Mz
	SDp2QPRhdNXj6g3gIpfZs3gGbXmemIGyVKO4Fr6kmp53f4bPED4RRJTc0BNdaBV+/738hzRCU1q
	MGyLYeICVPI3W7FgqI17zy3f6SpEF4DIPdRvJfgAt1YFzeqyHzlogOLZcrSNIk0ofFrjqkus/7b
	MMeiT2uUeDbIT9QR6KkdKQoxyE3bc5a0GiMq77zFUkalNA7TsW1W0hmNkyyqCKDaNOSnEMMIgIq
	Q0VzaDhBpCMGrv4l/fxLPmQqIKxpxfe7M9RTYbe7PeQl1eu/CPskcl0gQ1vDMg/TaAnt3kJM8Jl
	9kokFlBAqpLMh3HMBUwAVDWX3DSF45YjLEqnsCwU64ahii63O9uFrg1G3H+MV12+lgMTbMroBmd
	kAv92lrO66o0/Sdo071a363EgETv/yuXlNV+qZm90/9LB64KZ/d5aEtQk7qd842oHGxbTqNX648
	rKLbcIxk+oZ17yZ79H/gjeNdS19sBjkmX
X-Received: by 2002:a05:600c:800f:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb7da4ec63mr52026205e9.31.1795010132684;
        Wed, 18 Nov 2026 05:55:32 -0800 (PST)
Received: from [172.16.14.5] ([67.207.71.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm99049865e9.13.2026.11.18.05.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:55:32 -0800 (PST)
Message-ID: <2c791bd1-7f9c-43e1-8a76-f3bbeefee897@deepfinresearch.com>
Date: Wed, 18 Nov 2026 13:55:29 +0000
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
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
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
 <20261118-file_folio_flush-v1-1-e9e739ed14e0@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cenk_Y=C4=B1lmaz?= <cenk@deepfinresearch.com>
Autocrypt: addr=cenk@deepfinresearch.com; keydata=
 xjMEar0rFhYJKwYBBAHaRw8BAQdAHz6z6MLA+mS1Fuz7sv4rdnByHh/NoO3hkH4hixSiOw/N
 JkNlbmsgWWlsbWF6IDxjZW5rQGRlZXBmaW5yZXNlYXJjaC5jb20+wrUEExYKAF0WIQTrPCT0
 JMi19/R1ti4EM3Wz2u4IvwUCar0rFhsUgAAAAAAEAA5tYW51MiwyLjUrMS4xMiwwLDMCGwMF
 CQPCZwAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQBDN1s9ruCL8FNgEAi48UZATA
 4fLQCEod98yy5j3o8AJ1FqI2atRtFZRuxP8BALjrpBK/eH606w5s82THH9hCWXmu9vhlMmUQ
 NiVUjIYKzjgEar0rFhIKKwYBBAGXVQEFAQEHQNXlOF5B8tyFRxW+4M9Ws0CGNVN//I4GaOEu
 Vqvl09ATAwEIB8KUBBgWCgA8FiEE6zwk9CTItff0dbYuBDN1s9ruCL8FAmq9KxYbFIAAAAAA
 BAAObWFudTIsMi41KzEuMTIsMCwzAhsMAAoJEAQzdbPa7gi/XN0A/3HYaeGJBCsWXe7xkZZl
 wDADkFGIqk6oSu7rvvRh2QPUAP9aEEF089q6fPA+dQdnEr12WX0Wh9+CItd9Yiz2WjmsCw==
Subject: Re: [PATCH 1/4] mm: flush stale TLB entries before installing a
 CoW'ed folio
In-Reply-To: <20261118-file_folio_flush-v1-1-e9e739ed14e0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested-by: Cenk Yılmaz <cenk@deepfinresearch.com>
