Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960413;
	b=sPs0HZBT/i236HuRNv+KHtj0qC2s0PHA4mF3rJ++IkFvl3oTAmmWbpASBnIL+82je/JW
	 cypwHf+fpkPc+ouSowhGafRGnSF1chNK+P7dMzy903za2CTnIWs6wIzIHUUM5qCDG00/d
	 P3Y/pD2TLao/J6PObOI9mLTrevygmDihPR5pGNr8dAVKLWQfDBri5EJ2W6lUuf60QvNS8
	 qlSZNPLd+SJCa2V0GnTT+xoDuYj+CLxXtH4a7pyWyGPS1t1uhJBmnaa5Q2rB1kFEDWcEE
	 aa6sBeZxSRAZ/yEhsCOVA0Wj7cv1DpzSum8ii8lk6XNeQf8k2OkRUPgGZa+v6hbmkng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
	b=JanNP+vSEe/gzQe81VrOomPIfQU+5yxv+FO0IvBoJcBFySQRLTwHvfprfb73GMtuk34p
	 6GT/adl0Db7zn8DQhoTFXSkukSbtLMpEY4ciPR6aRQisi6EV1dGNfAtkXN+XFVYGIwneN
	 dJ1OMu6ZkHpvSbmzq5kkX4fWElIxQh8fmUdnIdrTV+yTJ5EBaSv5fC7dLBx8nk3iTqg7I
	 35Mz+nghZrOKMgDzojTpE4tCeJLVV8NjMqsZloCmRAAnV1uFZkv5tJb0RKUjCxrZIqFQ4
	 nyUxlnSElIORP9cLjqhPJh7eprn6Kgp8JbbeDltIHyWdSjyPGjZm+41chl+Z5oaEd/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iqPF85Lp;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B23B606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B23B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iqPF85Lp
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-381d542bc29so851507eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794960412; x=1795565212; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
        b=iqPF85Lpjor6frnj88wDyrBjbXbaBII5DodpVoIl7rwrg6Seti2haELhLqSfoXM1O6
         dyK0UqLUVY6TysXcPhQtWHuIb/SfNfu7MSpfADmZ0rDgFBr5Ln9RXTf6EXp3G5nqBYGI
         g0BJFhee7HlLnLDuEh4lFUG46SyHGwNiEZiJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960412; x=1795565212;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
        b=DaGVvTxzpKuAtBP4r9AZmtATMOV2Hv8UxT9QhHOnq7gus+DBQm5LrzdWtxbq4wrLfz
         oG53PwCCHoCCZUbcUFm3HoSC+zp2fy0yhCTGuea7oLUXdlixD7TJqVMOnjKePku7681e
         4DMaOmGC9LSFjiEeuCgT94xUuOg8Vz48yBL7OfrdBYhxCj2A+ahyUZtkO3nDyz9UzrVB
         SX09qfU6iIAT8WBPN1KI8TWQh1lJrwxBVftediB/QJWbJejOYxSfFy2LzX6RDDaieWK1
         +O1+hITzFYzy450G37oVJoyjHksRGxM6W73pugJHCIvrruPG0bomdO3BloglCDuxiuY9
         EMwA==
X-Forwarded-Encrypted: i=1; AL+hErEsF23U1r7lC2mym+Jm0Aq8xe/XymAkExhv58rFKz5OezxBFxgMOVMEp8PhG7lmbQHnBwCxo4Frnz9mh5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HNEiBDiAJeeiH88Y9NafG3HbLn+NjBBEU8JBMNsIFOfLfNlOU
	6Uxg+wPm2PAX/sUkYy3Vzu84exVfs4WsHvGPI0OISB+MhKxqFK6nKxNTpfIt/VIfb34=
X-Gm-Gg: AZFdTZdhGWEJya8V7/f03GCWn2i5Cld1ghbnbZ1jFSQ5r3pd1UD8B+4rcTgZsFNt51b
	Smyher7ZEKqJdqilZ/NLOvhXSGCDI3BqKKYCRessBdvJ5fmqxSpcl4lQAJ6grBVbPtvOzIwxYRx
	fgpyhlwf79boTEQ/yBkwPE3TvXY9ReQ7pC/Qv5OI8RXnDjBaI/1OHmkXxfqj7XDd4zKeRUdBsSd
	VXS9HwwB7DKD6K+zed6Wkqub72bcjBc2+YwdW3BE7d5ZvVE6F10OpLhtXPN0cdc9wWSjsWRFunq
	dZLhC5S14m7hvJ/ma2A52rHs0M25CtZRcOJMOFH3yEzVj+ied2/K1ZX3tQxHRypgPYOGzywvRzl
	enBRjx/+C6ZCJ9CERYd015qIRQmFlf+Ml07w53sYQchvtQux2JcQIUfUUl5XEquGG5JacA1Eag5
	YoRgji3m5W4PZ/MLlG1Cieein2wm3hxVFbg8QgNUWRnfqjYKTgx8yIBnJT7/1rPtUX408IevCYz
	qf7cMufyiL2lUFHBAWf/+AfcheiKKUB6LKe+d8574BFO5YmcYvmz3UPr/x5sEzaUiaqVhuJUSKf
	EWilH0BJvlvN8KK7uKVCXvj3m4/JjxO84Xii11PZ0Jc6B/b9b/03N4Qm0Re1VZeB+qApcVgDuCk
	uKciOxHDjDU4IjWxRpOp5atOY5ep2adAb1TiBt0yhcRTLQZO8q99wZE2o+j96lNzsNYYs4XUL4b
	hANvSdggPNYZ4Bl+cbKmXA+v4QahcuoTOUH+cck/j+cV/+bt3DE8A6odXR8/E8qRfbdvzHAotgb
	ThnliARiGJXKA==
X-Received: by 2002:a05:7300:d210:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3828083e094mr888033eec.18.1794960411569;
        Tue, 17 Nov 2026 16:06:51 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm1519563eec.4.2026.11.17.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:50 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
	SPARSEMEM
In-Reply-To: <20261117120627.50601-6-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-6-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avzsFxVqO27Vf4Db@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Muchun Song writes:
>+	if (!slab_is_available()) {
>+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);

Hmm, unless I'm mistaken, memblock allocates top-down, and with
movablecore= or kernelcore= the top of each node is ZONE_MOVABLE, so this
puts the page_ext tables there. It looks like that then offlining those
memory blocks would fail with EBUSY because of the reserved pages.

I can see why Mike suggested always using memblock here, but only KMSAN
needs the tables before the buddy allocator is up. So I think this needs
to either go back to using memblock only for clients that need it, as v1
did, or keep these allocations below ZONE_MOVABLE.

Thanks!

Chris
