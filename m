Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773903;
	b=bVv3gZHg/Zybrn2cABVmEq06bmfoQiKr/EAizN2CFuOjJ/u/uiN5cXTHqbJ80BNuDX/p
	 LZsCtYQDIyO0dFGH8f2KdW/0lk1/MUxh0xt70XlTV4VItFWuxHW/lvjKDtRpGl5qC3MVy
	 8L8mfrUDe3TolbY6Cutm25QjAFkcSzuAh3S9wpDRwRCX/BwvQMU23FsnvxlnOzkSxedB3
	 5csOVoRv1DLRPQr72jb7RaJ14vZ2U69WxO5AQ8hv4+vXam4jRWn/DpQ1cjVKC7VqlGGGE
	 OQzkhMLghx+37Vl7xLRjT01kK0dx7v2t8aj+0QqrahUs+XcQyHL+oSNCM1+OLROh8kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6LNt6LCYfisU+3PUtDqGPrc6AXpiMExriMvsMZPkWPo=;
	b=i4ivFv5WZLInm3gb79DcoyGyVypfyqVKSCjoEskiqud9aEWaHOX2qzMcLEoelvEqYFTn
	 B7Bo245nz1kG+XoMC3EOW6sGgez275tp7X9jZWQKBPlQDGCmTWwprLRl1Xg7hqTl45npL
	 0BYxze6Js62QLGe1k9hiTY/ruH9HgNQbgbloICBDcMXMXdFsdHzF2e38e3xwtq981iZFe
	 +o9m981KZhfFU3eWPXfurrB/gFtqcFq9xy+G83UrzzGk/hUtl1jgPOyDiINKtQ8g8iVem
	 OMEvJlzeIFUWTPULLYBstMOD1U+sDGASp1bE+EyiuXHz3CisGF5qT6PMTOR6DXFSu1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Ij3OBjgG;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7F4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Ij3OBjgG
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4d6981c67so50775667b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795773902; x=1796378702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LNt6LCYfisU+3PUtDqGPrc6AXpiMExriMvsMZPkWPo=;
        b=Ij3OBjgGvdsYsaMFenIVx83KMXTYHdXbxYVhOn2SmApDjpV7OsNoiCmskMVgCRqt+h
         5Y6IP5QxOnpdNQLhwWfAed9km5jncqo0jqNDNd5Ck5+mdsmAZksgTF5Ksd000G6IYNJM
         HbngFgL+CHPUrYhbIN5CNoiRZor+cQsbEGP2uR+ouOgCYX2hhoXpQNFHH1RapK64zJWp
         o+vA+hiPhfe5pSMucQzdT5max9zFYv/7sIg1+tr0fGTQW5OtRtOEenecMqAKI6CxVBUv
         IwS1Ew6pzlXMq8BRq9GJRA6GGheRsGdPXhowSfxx317vaY4XFVxdPQvjhWxi51hYwUjY
         44OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773902; x=1796378702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LNt6LCYfisU+3PUtDqGPrc6AXpiMExriMvsMZPkWPo=;
        b=oNSs0iElgwoa33J9PmXoD4mcF3DBQMaJv5OsJgItPgLvOAa5MlgY7I/SCJ0G1+YW/g
         urJDnIJxnetv5EdK17ABrH6ykz6c4iiJjWHw/WxN/KGInP25VSanpLki0I2jS+eQjXWK
         fvbKhH1UGiHiar2gVFTYS8Xd9bGDveiegcm+Dii3+YwygUXOgopSDbxVRxVCvAUXgwec
         yDtY8E7H/MFG0c5A0hhSsAFShDMrlNuD8sW7qOMN5pNMgqZdAmMzhl8sHWL8yWUHgmYt
         7krf/h7ssAB9JLhy4QjvPzjUYUdKiy6sVlYvFVZhLbBDu7L2MS9/DFq8/B997OW0Hh19
         PJfg==
X-Forwarded-Encrypted: i=1; AL+hErHXk27CuM4p5S4X9G/rbNFreZ1524s3iEObB5/PwYujmnn7KcbGk4FAJVtLrFWCHFuXrbkQAWdkMRs9wQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dUSFMG4RWHhIBKr4nlmrm3wZlDbulNoduPsgrvADmx3Hbr58X
	q3PpSBjC9o+wBEcEynE76t/FoUNCtI3gQAxijJBpHFqDt4SmMBvxSzkETFoPdqOzTBWfkz8BhTt
	G8CtCSlqv
X-Gm-Gg: AZFdTZeiSeP+2J+5vfuTroMcAdyYPk1UhJwyIHUOmh3jj16VFeP3IPsU+uTT5v7oX+P
	GMvddjWGbYWsw3vXY4zN3coblEBVDWrsZK5XkTdSTeBRydWHOgo0k8JP7LHv7dEpFWaCVHytubz
	cbk5NaRAr787j2NZ3G7ufDHT+onG6G/EJLaPQYbLvhLp+qebUQbS/z0gOqx42yW/9/PuCGxuj1Z
	4arAWX7hFSpqjYZLmJtt/dm8B/TR9Civ9E72xnY68oU4UcqBJyGQpRtOyCWUJZhklNOtd/89YBK
	Q9gM2Pn5BkJAKPYT3HpUtL+7/P3C90jmls3F6NU7o1MBgkBf2FgJGmTZfjqye7EnvVamZBUhN52
	cr9iSb6mwKP46GhuE9Zw0tJF97BB8XdyxJSf2ivP8OMC0hSuCeXRcHDXO/M3/jJhtN+Z9nnuF8T
	nr9fNL7a5c/H762y1pDkUNtftvk1LjYFQccdfsGabvjeB0HlqR5QpfWiRGPB5zX8j44W7bAKC2x
	yH//zmPe1CX7spFpOgxgGMnyVWORjlnR2IZUAXXh9a4jFvTPRpFWmzEcq5BUg24bYx6Dad1TPuW
	SCdzppr/fPf5qkAMWqPT3DF7uhwxhPgP651eQ3RgiH/L7TwevP1CdXFjYjf6HFPg+cHNpGLmVw=
	=
X-Received: by 2002:a05:690c:45c5:b0:8b4:d882:49d6 with SMTP id 00721157ae682-8b5201f68edmr98152497b3.0.1795773902358;
        Fri, 27 Nov 2026 02:05:02 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028c802sm94799507b3.11.2026.11.27.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:05:01 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/gup: fault in ranges that start at address 0
Date: Fri, 27 Nov 2026 05:04:57 -0500
Message-ID: <20261127100457.1388226-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f5ff8f43-c75c-4b19-b683-fdff0c6dd7ae@kernel.org>
References: <20261125173202.3636133-1-hengyul@cs.unc.edu> <f5ff8f43-c75c-4b19-b683-fdff0c6dd7ae@kernel.org>
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

Hi David,

On Wed, 25 Nov 2026 at 23:51, David Hildenbrand (Arm) <david@kernel.org> wrote:
> Okay, but you did not actually run into this yourself, right?

No. I found it while comparing the behavior of different kernel
versions, and I don't know of an application that hits it.

> Likely this is "nobody cares" and we don't need CC stable.

Agreed, I will drop the stable Cc.

>  	/* Stop once we overflow to 0. */
> These comments are not really correct anymore. We don't stop once we overflow to
> 0 anymore.
>
> Likely we want to be more careful when calcualting+handling end instead.

Something like this, in all three functions?

	unsigned long end, cur;
	...
	/* Page-aligned end of the range, 0 if it reaches the top. */
	if (check_add_overflow(start, size, &end))
		end = 0;
	else
		end = PAGE_ALIGN(end);

	for (cur = start; cur != end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
		...

A range at address 0 is then handled like any other, and the loop
still stops at the top of the address space. This is close to what
the code did before a7797e74bd39.

If that is what you had in mind, I will send a v2 like this.

Thanks,
Hengyu
