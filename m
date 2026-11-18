Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017082;
	b=Uo7juze14bVVnuTyxRVHbCmlt/6ONTu2qz/z3ElX6D1t2YNIPU/Yhg4LV2K1CwI/NjkO
	 URoVxZVti738OakaYouiYIifw5s2o8RBDsmIUcSQ98Q8CJP+0k3cCK7e8WXRxI4xDUIx6
	 Cpuql7N2SDM5QL2mCz159EMy9rP7HKJ1sMyo0WsE+AhJgvxTpFhl3l1Yz4SIltnTrIddE
	 IwZwiDTQ8diXlfOPq6u8CtXaiFH6QEEYue4JgJR+NSqvGtjRXDkeRhDKlhhpehRDhL1+g
	 Et3mtsG8E287PztzCBYeuyiSjshJzC5akbVbUnLxAah/tycK4xEYFe2XSkHrVtY7JAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=rtu+dm+kZUdeiLu+ztbJ6g6Gzpa+7bPUZ/F65mvaYZ4=;
	b=RircFmtZAJh8XbOyc5uAX5jcV1K3uX/up57SiunxOc8gZatOpII344wLfS1sjo1Y9Sz3
	 nw08GMUCg0gOLN19Kw+Cbq+eONlrArBW2oeGcbgz05JUcgrwRJ5NuVvVYeXf4B/4tCQ40
	 NEhVGZ/gAnHv3bDmCM5BNvZNMCZIil+Ls7P12Pf11wlJWAY52IpQ1KwrAGd9/ljvL9cP0
	 dJs7VPmlFOHoTQYTaI0KjHFHChXp7nkIt4vvpV31XzFUBuF/9fGAuPsi7nLOiI7EEbyfo
	 +TN9L1bfWbBKtQgCVyESrlke2G+jzj3Z2TGGPhyiXTeMIa2K+RUnsDJDwBY20ouelpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CqFB5PkO;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7460A2607
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E7460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CqFB5PkO
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-949664ee41cso141243585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795017081; x=1795621881; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rtu+dm+kZUdeiLu+ztbJ6g6Gzpa+7bPUZ/F65mvaYZ4=;
        b=CqFB5PkOnM+jvAv7ro+HFL8RPRzHIJTyl492dti2dljQd3wyAFFyu9HAkhm+anbp8B
         uvCfhGnk7pw9Hf6Wxwj+qknoup+tslME/SAC9BSsgKXdywMvXRtsJxl5jXwIbkgrtw0H
         YsXSfwi9ZAXFWkd5QYdFiQUdjvwEGBhFNFkmhoPD0FUTS6O2P2cZNimb4nldmy0cUb1L
         YbzAnXtxIxAeadwaWNpbGyFPOrJLj5xyUbMxiZgzYgX8IDb94l+D7JpA9zYEjT7BrNqm
         pvy8ZFOnH0w+IS7vnDR9ueJvC97X/SQf0ycgblv03SriCllJZcoeAMyBnVHfCbECHmFj
         AxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017081; x=1795621881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtu+dm+kZUdeiLu+ztbJ6g6Gzpa+7bPUZ/F65mvaYZ4=;
        b=k3iotFLb3HBAMWTYeEvmNbxXVC4xN3mpwle1ukYE/DJKImtLb+dI5Jbu+hoF4Cnbpg
         wLdD/t1+za7d77MeM1GZ1V1ScGj6fLK6v4QdA9mqvPC9ecwqfR2AuwMBUIF8GhESaqOa
         krDKLlwOxb4bkTJzGwI6oTPQ0xniq6g0J0RbyhJdEPVYlvT9CfhKHC9z/970TCkO06Bw
         7NUR1K+hfekoUrjkZ5PPJBRxhDUPWRPVkjiew+EiKQ24rMZg//YnPM3T+AcCMSm4ePzj
         6nuxGqpyJjsObUdxnqBi3ozYbfh5yjY3kHJtBafsCQUZE+QU2lZpehM2NtOkRvV7OtH4
         csyQ==
X-Forwarded-Encrypted: i=1; AL+hErGX5i+fP6inBVQX4sH6MybvTwEDi1bN/CODom8hNZOQsBpieq/TcHRMJ9aE11TK03t5zF3tuIZ+4Flky0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HixTmlgCvL5TyhNY1COcmSfzNvFLZXlx2D0pVMYxEJNIWCqJ5
	othUNrS2mP7Uk4yPmiHoqhoSGAjK0b59qrYOVPsmQUdO9AgHkjVLqhTb25tDTz+8Qmg=
X-Gm-Gg: AYBFou2PFirq9od2/GLoG69JpHxJYPPadsel+WEh/HtAX5ZDIkgqPNUn0wMooICToUN
	O9Ee/Z34PBEjlGCaoD2J6dkgy089WtYSQg1F3YXZ1YR5f5tLV79gPdhquFS6gheY3qpC3fsU7zh
	9jIRbuOdxlrkMkIkvmp5tVqAfD1/SijB1g+YNZpVtaFSXU7rmWbV1rsgyfN3h2zSOWPXGR0BaU4
	a9GT4aN1sgJ885LY/Juy0r73Wo4zbKoKyiP0z4UAa5vbHKTae2Skump0u3HQgZ3cuhEoUvPkx7N
	VCNokdBbBomKrXIiYrUslSUfQx7gAaoZtJymA9Wh36ZCPurNS4JwtMqXq5MD93OCTfWpNWxM/Ol
	KjZiWW7TtdQtcEf9Vgs0CXSvguHFNHP66pu6ZMlR4Zwh3lLg0Wi3Hr97sRItQQdo3Cs/q7bMrXl
	sBk5TGZ8PiMCbXraiYf5b+Viwx//RgQwHOEqe01Y6jq9o2iaryS/MwWO6R7J3f02pXtF+6MBbBL
	kc85vYKoa6pdEZGlVlE+VS3Lx6SRYcd1i8I0OjdQEj7rmwxtUAHd5tXmxndRN+dB/09Mf21N+km
	afjJgmWMQTU3Ti3jCRq5FwjEEyt+DJ2ASn34pZ/zhQsL33B/JcASxPCHGDhBOmKXPT7TJFiU5jp
	mXfGU+Z4=
X-Received: by 2002:a05:620a:8086:b0:93f:2938:48ba with SMTP id af79cd13be357-949997ac21amr514417285a.55.1795017080864;
        Wed, 18 Nov 2026 07:51:20 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b454facsm210842185a.5.2026.11.18.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:51:20 -0800 (PST)
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
Subject: Re: [PATCH 03/22] mm: introduce the common-memory node state
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
In-Reply-To: <av2_8Z2sdM_9zUEL@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-4-gourry@gourry.net> <av2_8Z2sdM_9zUEL@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:51:19 -0500
Message-Id: <179501707902.1206716.2408532904937875068.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 23:24 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:40AM +0800, Gregory Price (Meta) wrote:
> > N_MEMORY is overloaded with two meanings:
> >   1) a node has memory.
> >   2) a node's memory is reachable via ordinary allocation or
> >      an arbitrary MM service may use that memory.
> > 
> > Allow N_MEMORY to mean #1, and introduce N_MEMORY_COMMON to mean #2.
> > 
> > N_MEMORY_COMMON nodes contain "common memory" capable of being managed
> > arbitrarily by the kernel MM based solely on zone membership. Following
> > commits convert relevant N_MEMORY users to N_MEMORY_COMMON.
> > 
> > Add folio_is_common_memory() and page_is_common_memory() for MM services
> > that walk folios. Following commits convert folio_is_zone_device() and
> > page_is_zone_device() callers accordingly.
> > 
> > Expose the state via `has_common_memory` so userspace can identify
> > the memory available to ordinary allocations and common MM services.
> > 
> > Add has_memory to the docs while we're here.
> > 
> > Every node with memory is common, so N_MEMORY_COMMON equals N_MEMORY
> > and there is no behavioral change.
> >
> 
> This sentense kind of blurred me, you state that N_MEMORY_COMMON is meant
> to isolate the concept of #2 from N_MEMORY, I expect something
> making clear distinction between common memory and private memory ?
> 

Sorry, basically as of this set:
  node_state[N_MEMORY] == node_state[N_MEMORY_COMMON]

Later, we'll introduce N_MEMORY_PRIVATE and the sets become disjoint.

I realize posting this series in isolation was a mistake now, and I am
going to post the entire v6 of private nodes with the reworks you
suggested instead.

-- 
~Gregory

