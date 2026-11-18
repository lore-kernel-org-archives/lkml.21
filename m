Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011141;
	b=4e4gp0z3+5WIRhK6IB2QEm+d1erX/BdyTM0eq+iSwjrBChWDmvPtbO2wQkB3z+gnoA+f
	 EH1eD/soQyA2V0OrGkX6nfmA0iqwE9/4ih27bFSajKakwVfYkxHBw3BjIhq9HZWmwsXEu
	 GHBvWCgxBJJHP/Q/GpvQ9hlXYBgeskTT76QAz4zvSgLP4jf3C/4g3xPI3h48dzcfL60f5
	 Cg8/z59MCLHT6xOSj1PtwMFwYfPSkaH1CKeJOUx9P1rw45kRTndUzHpRAg/OOaoQLN0nn
	 eu0UE9RYFyUCquuKP7LpPBJh0CzvjSfJcbI1MVOrSu+zcSGvC2kcJZGDFCmWcxlFcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=aZUtL6/Zh+PGwvVCL/LrsblWzIm0zKOhzUlFpTCrzCY=;
	b=kOM4J1/YMHwQx+4xQ4ygTB4CSFJJMg0qHkckPT+shH4XauiXvNBDeFWTKTzdgntBDIEP
	 IFmIbou5tPsjkamZoBJbC9RX663IU84jZmbkT8N3gHh30AnaaROjtjxXsx/lth5VCB67+
	 iA2S4qlITyX4j1lAauAiwLeJBALFOHWcSYbQGfTlfXO4OIt6u9UFTkCvXOBbHOJufrtT7
	 nqpxZw7feieoAw8LAVW1jsuaGt9fDHekUEgNTvqTPIHBIS72Gi9hGtfEm6B2e0hnsgjd5
	 MIHeOVn7xnXnv6Ko72BQUQwOdyTXRaXVHllxoRv6q6i084vdZNHEh75m5WoOE79Speg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="mLopjy/F";
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CDC606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CDC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=mLopjy/F
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9495d543c42so100254285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795011139; x=1795615939; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZUtL6/Zh+PGwvVCL/LrsblWzIm0zKOhzUlFpTCrzCY=;
        b=mLopjy/FWyaePPgsuWwuOKjCR11EwCSppNLOhSXESKB/06hq1gR89aotb7+i6h1yzk
         4pS0coDD0y7WzNPKQRm4TrTQewjKvJCmK0gDifoqLKINkm0Av1vXBJpMDD8YsVKqpGo7
         ZKKvuMzix0DJ21EM5qCVACBwFg1f4AoESXKeucXt/wsP4xPfRlEWt3Z0506NRvO/Sek3
         2Xblf8uR9i2ArLTrvX/BSJH1twvMuYu1lhLMxORqheyoFTMDnqx532JxmhkqpFmiH/A7
         +qrkbgx3eLDwAGjTvxf7MXMDg9pPq6uTBTSf/b/dBWASK5KMHG9rlnV+eDf3kO3Z4dlr
         53Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011139; x=1795615939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZUtL6/Zh+PGwvVCL/LrsblWzIm0zKOhzUlFpTCrzCY=;
        b=l1oBuavtftKVydm3g9/OYuyiwhBw9ll9hiT2Z8NeZPhxdyqrn//FJDbiTMPEfD41JX
         KFWDIDkW1AqXBQWrRXYtlWG5FP4v3XBYH6lnQ4y2kkeV4wd+B/hTmLT7c9MOBYXHJfZE
         pBOSG3vmbTlkqfnu/VyX7FKdYs29igocJSQhXEqZyZ4m3mJIHM9t0qnrYNpSXIjYO6ey
         k7GNHSw2NEuvkgm85WhxJtCKirASSeuoqvxmYrpqtDqGUuzKw35f10pdIuQ2L7aIVaJd
         abMLyU512Ze/gi9BsOdN/rgPKzK/chSr6umU8qD9Q3qOUa2wB5Qxg2LNaKhE6xPme2k8
         /4LQ==
X-Forwarded-Encrypted: i=1; AL+hErHYSx5UV6qWI2xKKNCB7PUyX2jM39SxHqORP7aNhlr+51sEHcy1pOMeVJimxeh7DbwDlpRQN0sbqzu8B9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uotH7j1fiTR9IllQAxp/LMSDDXFEiVWHACaafdYL9I/C2ABZq
	TvoNrEjD+UXDfYHj50PP0eVUQ4y/b+XFmNJNqZW50rYBygH0+wFAAJN/1in+HNArsI3yFLqDIcs
	ueysh
X-Gm-Gg: AYBFou3DmHwOh0aOpqrprKZucHgdFJt8UGjQ6EP3CZtHEH78VuyMuhQ9ebP+NIZRxB2
	MSMx6/aHbb9nLLGkFL/0jOjSoJqywT9cqKIzElo0ckKwYkkXwzkjkb/TesheDEdncSMnOij2Y5G
	4cfXHdxal5AVvrC4Em5S0XePrM6YVloCyN7yyLOQWJVLwm6fcAFsDBphqIHCOf4+h0LrRoManxf
	/PnSTy5NhHGj7YcROfPazAvfKMb6rljWlB+WQQJNUXFgkMIXu0wvoOhq1btERtbJMIAhNTdLDU+
	5yUgM4grsVOte7HQqpYqb1HzJEwAZoH6ie4IYQXTzHDSF/Da8OBR19lSFG3HOFbZnieBX+j3ywf
	TVu27U99hzdYh/w3gfDt0K6Oz25UAyO9lmM6UVbGz0wDc+JOTFvOLgwUmYoSzoPqjpTgcGbcNVq
	RdkDTjHFjZFsqRk+5SOLO8IXI0EHJJOcc4M14t2J3PK0BJGQUzeI7G17FRe36usQATqrgwljfzB
	ZApJNq2mHDmK5SqQRbaJtPJ8U5POzPyLaRjRI1LhvgCei+U2s6NJNTapxUge4T/itCOfuvRv24b
	/4DQ+ZgwMmrKph0d3FFEnaWxZsZGehSfQgTngPudYwV/k5biKHqvCMtLXyw1uyz+gDlWZFZCsnp
	cRd5vAJo=
X-Received: by 2002:a05:620a:44ca:b0:93f:3163:3e25 with SMTP id af79cd13be357-949996e2da8mr497886585a.24.1795011138732;
        Wed, 18 Nov 2026 06:12:18 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b454facsm191203985a.5.2026.11.18.06.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:12:18 -0800 (PST)
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
Subject: Re: [PATCH] mm/userfaultfd: reject DAX mappings
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
 Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>, 
 Jingyi Sun <1045704958@qq.com>
In-Reply-To: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
References: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
Date: Wed, 18 Nov 2026 09:12:17 -0500
Message-Id: <179501113767.2932576.9608927748315673286.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 11:03 +0100, David Hildenbrand (Arm) wrote:
> UFFD_FEATURE_WP_ASYNC made DAX mappings eligible for userfaultfd
> write-protection, but the DAX fault paths have never fully supported it.
> 
> DAX faults use vmf_insert_mixed() and vmf_insert_mixed_mkwrite(), which
> treats any non-empty PTE, including uffd-wp markers, as an existing mapping.
> A read fault on an uffd-wp marker therefore returns VM_FAULT_NOPAGE without
> replacing the marker, causing the fault to repeat indefinitely.
> 
> PAGEMAP_SCAN can also write-protect a DAX PMD, but the huge DAX write-fault
> path can make it writable without clearing its uffd-wp bit, breaking async
> write tracking.
> 
> Device DAX mappings requiring huge-page alignment and cannot serve PTE
> faults after UFFDIO_WRITEPROTECT has split their huge mappings.
> 
> So let's just disallow DAX mappings in vma_can_userfault() entirely,
> making UFFDIO_REGISTER fail with EINVAL.
> 
> Fixes: d61ea1cb0095 ("userfaultfd: UFFD_FEATURE_WP_ASYNC")
> Reported-by: Chris Mason <mason@kernel.org>
> Reported-by: Jingyi Sun <1045704958@qq.com>
> Closes: https://lore.kernel.org/all/tencent_1874C71D4177A1624528043E008DB1A5EF05@qq.com
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

