Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192025;
	b=v49YZD17qCG+S04s2DZmUbPHc12+CcbBmZ5bPqow5O07DHTEHyoIz7BnRbOS2e/6kSFZ
	 DtWlTC+6AxAoyCdiC8rrI4fbMsgpHliOtLjWE6VbC4QyJU4Aavx7WXdW4NG25bkDUtvkK
	 ism+MtYNE79u+4HlqLlIgcFEnjEu7RHPKc4h1ofDp+P2HW8ogDZfOAsuDUpb5KGe4MGZ3
	 8xAmscIEVMIHNbtsf4YEnCJ2Ykm/mq3ooXn/KxAb1ZnT596b02BRsYtqDsEf+p+DyR+6j
	 60MkRHGyimMwOTn+BJhzq0+g7brrcLX1LzZMZuYMO25XonhJ7OG3SS6Tv61MKBJiCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=wfxDs9gzdmZ4E8B3qKbvflj7O0o4ha7gvjg3+e0Jgx4=;
	b=zEno2rwNRooUGR0xNyVHAmUbSye6Zrf1GmHs83Y1/Wt8kALNUtKA3iK1qHmH6Y8AXy7p
	 y4YhCDmDtwhxfmcyc9+jVyjvwgGuBZPxTODcDUGZJqXdFaY+Pqe8kOyhXY0vzLXxTWXV4
	 T2+N+rL6haLJCkTOGDfEi6LWZOrBMuKR4jf0CwQW1EsPKDyJKoydsrQuUqOq3aS0w4IXf
	 Hb5B/XCXF8bMTODhH3kdBD7JPn+E1ZyiMdiXunkkyDHLteQlrJ1CCiHcZ0KX/LqQeGoYk
	 7JcrFWcBhQHa67ag342drS+xi5ZBK6zuDZiGRzdF7ZkQIKc1dxPWSZm4/ntNcPqaN5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ar7DY1RX;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F115606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F115606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ar7DY1RX
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55ade1de0b4so12688441cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795192024; x=1795796824; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wfxDs9gzdmZ4E8B3qKbvflj7O0o4ha7gvjg3+e0Jgx4=;
        b=Ar7DY1RXmHH/1xgEoRnjAOcg6rtc7lRoktMUD1dbkESfdfJaehBMOmQTRUE4rQn1+C
         KLFG26UYHdOdSK8N4kTJPRRUo/tQ1yrV1f83PJ6WPlr7Cg3LI9n4aT7nqHt0lIL/e9ol
         x2+iL5HvQKewSRLWUf15iO9WQ8jJ+uTG8GqXECG6LM0v/hoM6EERE9TesPyoDIgGhw9c
         v9YPCZJizqwL3bB0eb+jULQk/zJYN1G3jvBJG9F9dOzgPak8/t2bjTyEcG/76pqDgcOK
         0+fH8nKF/ldrhcox2ZQnEcY7K1HMQRXXdAxi5yP1ckHX4iB+x6/EFH7Q72ajEq13ehPc
         SZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192024; x=1795796824;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfxDs9gzdmZ4E8B3qKbvflj7O0o4ha7gvjg3+e0Jgx4=;
        b=KGwvc6e8dyJOGYMbXB7cP3Y28EUHgNgbVtxNV5BJWNctd0HGrOv4/fd4ZN8/M3ffI8
         jC5M6SwK7aIrIpx8QrTpP2Fq5vyyoH/TGPOcdiV5yWdu1Mqt2R3yEO3OEytMa8SAo3Wr
         WCaM2LtjLlMriN+UVVwFuRRITG6uCTwq5tQUOdU9lATOX+qVtfemZYI+/QiWBlkUutTx
         bf0yRlFYJsCoKQcnmcuuIqg6PQqGHqqIjvKnr8w88sdtV9kn5O2tAkrawMSpYOahMvQ9
         6yjvyLymzuB/uTzLxWTIR5T25WHj0MEkjUF7zmKUdh+HW27IjZJTfQe4O8yuKfG3TfLD
         DrNw==
X-Forwarded-Encrypted: i=1; AL+hErHabiPpnBLyq/bIjj6TmYTZOsZIXnpU9WtqZt4NOGCcEU82/bhh3cFJSrVywJUeN1c2N7LcGdzImMRijYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PZ6MtKBIRNkFZ3zYr58EV3VSXseL5G9UH9gg4B4GVDgPKT+JI
	s0ZB0GUbn9yxnrfJdr0ZkGr3J4vFsQw4flMwJeO4I3Zu0DyX/p8j/3nkLRuiwr3tLLg=
X-Gm-Gg: AZFdTZe2tyXopkAaEb7ZfgoShuQp+iCgGOVcXhkyHJBg6ZLULjU/TC9b0Bb1T3krCYR
	4b8lH1Rcy8Sokn++YwfVpKRdpM8Mf5Jx5fMeCvbsydjrBPoL2ei8m0nT1y0ZoKV4iEhgmQR/R4B
	kAAE3iNJs8ifoKHc4mHiTxK5Dzo03C3hQnLK/A9UJqaNQnGTa1AMsV+4d7FJH/uEzpeF1tjhCgp
	sBbBz4KoortXqS3AHO5tPtrGGFYSZR00Mu0p01fkkEWesWkBNoxDpljT/pRQtOuQdv3RwKGMQDQ
	3XJ1XaIgxqOZo9N8lZh1+E4w8jFSW7ZGjrC/u9WVoTyB4hdl0Dw0tC2SbtjgFklZjBJ1+cN6ysB
	jFR2WdGApbh69niEtzUO9fnLFcHXgN0HHTcNvSkSovsLEzVklwgk5zRnwb0zA0xma3MeI3Y9+IT
	vMR4kMafzCSNwcDMmQdArxTts/ruysjqDgTcHU2yfOd5XFtodze7RWU34cxfYzqKuWIfUj8Fyue
	0+VpdOsELKE6KHL1op+fvX5AETBW2HJTKVD9K3JitW0zerauSYoqEoVVRS8k3p7JVEB9ZMwWRXO
	YzgmpwYqSH57e//vyTwyk09fKlDo9yd2Anu4iAbBeR2oxZvnxcZ8KdkNePX8u1angPaYniqt1PR
	kC1DhD5A=
X-Received: by 2002:ac8:59cb:0:b0:537:59b4:3338 with SMTP id d75a77b69052e-55d76a6e956mr66914661cf.25.1795192023791;
        Fri, 20 Nov 2026 08:27:03 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm25370021cf.29.2026.11.20.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:27:03 -0800 (PST)
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
Subject: Re: [PATCH v2] mm/slub: Respect MPOL_BIND when taking remote
 partial slabs
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Andrea Righi <arighi@nvidia.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 David Hildenbrand <david@kernel.org>, Gregory Price <gourry@gourry.net>, 
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Jan Kara <jack@suse.cz>, Quan Liu <qualiu@nvidia.com>, 
 Lee Trager <ltrager@nvidia.com>, Seth Forshee <sforshee@nvidia.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119160430.1113397-1-arighi@nvidia.com>
References: <20261119160430.1113397-1-arighi@nvidia.com>
Date: Fri, 20 Nov 2026 11:27:01 -0500
Message-Id: <179519202192.412063.10960263756664574511.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-19 17:04 +0100, Andrea Righi wrote:
> +		nodemask = mempolicy_slab_nodemask(gfp | s->allocflags);
> +		/* new slabs for the refill are allocated on the local node */

hm, is this true?  I think it prefers the local node, but with a null
nodemask it would still fallback if memory is short.

Is that ok?

-- 
~Gregory

