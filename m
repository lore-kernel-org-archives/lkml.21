Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413194;
	b=LOUkhONIgbsv44PCeI6ng1UMAhGvXwxoIL1A6eZkdKgSS7vWHkU3058ohXRTJjMyn6Vu
	 eQdIlcuY/uPEFl9pf8kbgBd84FMaSwgQipvuryFF1wAc3DS4zquKxf8P+fdhtYQERoU3Z
	 xHz8EXAM5WbzyctQDHw/oy9Lf4lXgqXgnUYwf8ibg89qJyWr6XJ8+zcR/NOboZmD21Xqw
	 /1KDYUMwKs+rsFMMMOnhRTBnduaOpjelLGGAA4SAiJkOesizU0nJbZ/aC7+55BDNl/T9h
	 PhKhK+AGDZgEnLNFUMc+/EGJPEw91soeVj7UyPQXcnvKRSOHPFUbW+UqFS6UjKHay4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=eQLd8QgogrHpSVXIhi24k1QGI+Nh03QUKUs1yU2g3aM=;
	b=QnM7I0Kant5ZO85304gPW3JcTWsNHV8MtMagI/Xgm4wdN/0YDiHn7vCAZK6KNYGu6mE/
	 HPzXtdNKSRlIGQYXQVU5AAS00/m863NJx2YgSuZv2F+7516fs/AaTTMECSKciQgdFGoU0
	 pOEauTQNJqMqmsz9O+tSNI9yECy00RHvFwWzGyePIIw79s0gQbWVFn4EHmYQ2M6Yt7YHR
	 rLadgdluQPD4wfcaYut+a5sX9JVQIivh+DvrPgBlRJb4HFHpHuxiWiqVlkoWf89Lzh6/X
	 qCTxD3lThEOoEWMGu+A3B7oaed+Tiom6IdtqK3RiptpaZl4h/+kWbz+YVjf/AvVdg1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kegsq8uh;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F2B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kegsq8uh
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4ea3c5afaso18253497b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795413193; x=1796017993; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQLd8QgogrHpSVXIhi24k1QGI+Nh03QUKUs1yU2g3aM=;
        b=kegsq8uhmtxjR/pJOhtAujkXAVHKSFRBNZ5lrlH8efJHm2VcBfXxdujDKKMzi5Mipr
         SfZAkGi5sRSP+SBD+2v7+dgCYbevza04Rs72gGs6ihAO9KvLXlkEoHv3/sb+u215IWoK
         T4VxePiP3BCDMF9LUIJVizvgJEpFQ3Q5wjM0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413193; x=1796017993;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQLd8QgogrHpSVXIhi24k1QGI+Nh03QUKUs1yU2g3aM=;
        b=pAhXs7L5VCSoSEXcQQsKdyL+2EU/YcGM3YuhuD3UwQPzFRpB1Yu/Fjk2JFddD1YaPe
         gGm2RyzgwPqV5Dz5RqOYSiNBVc5MGFw5DstZeQFjhLlPAIbT66J/uZHBP5ooZyggfFLi
         MupHq9np9x/Gl13nJXP1KgYVQpi75NPl6VINvJBYbfDYKR8gs0TH5dfOwHGc/z+BU6qR
         ECDAnlY/Z5jM7V9/yG+llLwo6Smwccux+ROH8YGGGwBnK0rlWwuAEDZZX0snnWDvRbeN
         FxAuKvXKIdxLspOle60WZpSsno1X81OKkCAZO9wkEmsref+DcqNApb65bcIyScIISZhs
         XH4g==
X-Forwarded-Encrypted: i=1; AL+hErE1nps8LQoUzSeXCd/idM0brT7xRaNceM7XxkgGGulcNQZxvc4Zl6SCkAg3ygDxfuoGVizgWJ0URCKXjN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QanNyRIyqboJ5S8oya3Ef6UBU0gPMy3y1Q0yJfp/tXTDW2pxW
	Q3RSJTSXy2zkgjVlI7eqoTxOQkj0EmU4+GMNQi7R8Fe17yPeUOG8cq3pR+x0YE6uoyA=
X-Gm-Gg: AZFdTZe58MkQwifaeWhi491sEIz1PdtW8QnyaCZDDXQ6pSzObrjM4FljPlguAUokX/K
	1KZrg7G1kXupmlRd/XCXxaWeERfnQUAnswTm78Dxtgyqk3aWDwyX4tn6U3+PYQ2CgzcufhuvqFC
	d3fZGW2uGVFqJGIAG1xVEzDwOvNB5LCzdvQyTqqKF/KNH5ofTJBGLRXUdWog/RUVjBjAH+jyi+T
	QK2hGLC4y0momRx8R5A86a8c0cq3oD2LHERKycGkz5CRBMGaDPtWFv4WJkIwHv76bPeVM0Qcmzc
	NayJ4IGWD1fhiKPm2TwLQYbCZJYb9BEPasZYd7HjaQNQXP199vzAsaKReRT5T/fI3c6QFUXi9KW
	EtDz16PaCvqDMLtmh/GtBF4t8dLhNNu+2reHj156kclvgvTIXXZ5ZP2oTf9zx3SefjGIU44N1Yr
	9094Yl8rPwEwmlxqvjCjdhJVsyoePxTP67BB7L6UsLNR6bT7ND9g7B21BbPCqDjh1YyUONcUZHQ
	p8ZumegWty7e2O1xiHvWK/aaKYW7eOOl0V7+4flpoQxoZjdwB+BrGmmAmbRsVUipEJLlM5hn63/
	4oQD1s3/Y+bf0ReTRWx7IqxUTdLat81Hh4WlIxRvoXzQbXFyIaJo2CpJjmPjE1u1RHd07euZQcJ
	+NKZfsv6ry4/1YACxP10jteQWwuZtFT+eTVhBm6SxhyDgGagH4BukObQAPNvHD8AErf4qsp7yTQ
	j3kVJJsF/YuxEg2HHx0IbR69GJ10vMKPRrQ1NIRDFfOJ2hb8Sha0KidbCC9kd5O+huvjyNExztN
	KIUbwG2w3a9FiF2NVJ9aMgaPByY9eNrhgGg+sHSCCzfqQFesaK8yrrtJVkbXN6OKA==
X-Received: by 2002:a05:690c:630f:b0:8b4:dfc2:be60 with SMTP id 00721157ae682-8b520528bc4mr36338177b3.107.1795413193110;
        Sun, 22 Nov 2026 21:53:13 -0800 (PST)
Received: from [172.20.0.3] (static-host-74-205-137-217.epbinternet.com. [74.205.137.217])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202dd36dsm41031237b3.26.2026.11.22.21.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:53:11 -0800 (PST)
Date: Sun, 22 Nov 2026 21:53:09 -0800
From: Chris Down <chris@chrisdown.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>,
	Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH 0/2] mm: fix deadlock on the folio lock due to inode
	eviction
In-Reply-To: <20261122-migrate_reclaim_deadlock-v1-0-83c56185b0fb@kernel.org>
References: <20261122-migrate_reclaim_deadlock-v1-0-83c56185b0fb@kernel.org>
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
Message-ID: <awPUxY7eDWuo_5qP@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi David,

Thanks, this looks good. I exercised that in a VM:

- with the series applied, migrate_pages() on a virtiofs file mapping
   no longer allocates destination folios while it holds folios from
   the batch locked
- splitting a file THP no longer passes __GFP_FS to the XArray node
   allocations
- and the migration and split_huge_page selftests still pass

That said, I didn't manage to practically trigger the deadlock with a
virtiofs mbind() migration racing an unmap before this patch. It might
just be that I am unlucky though, and the code looks correct.

Given that for the whole series:

Reviewed-by: Chris Down <chris@chrisdown.name>

Chris
