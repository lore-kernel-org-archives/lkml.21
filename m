Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440600;
	b=cxzGfjE1J3LhoS6yPLWG9CZ+UKXATucJRZC+ReVgp4uQ/TcCmqhKRDsRyAoxSXLraYmY
	 wTLefRjaRo0SSP38OCncYnwWxM3VYOLs9R4YjUeNpWrcd/LuCQBdSQaHVv706PWr2EY0x
	 I1+TOAxznTKK71wYO8iE3do8j6vw2fAUsS7CbmSuRZjEjlyItZhE7ACArOpET7mGFhf4Y
	 zG/5kZV9daJ9L3g2CyRuRrsXi9BDDfKNMGwA+t5u6hpnWix25MbRwlzBxkUQNg2OMdhcg
	 RNZouJ3DRaWCzC64hq+e4swFp1o0ntKIUgz9d3WQIjLtkh5306HUym2DEHTsMzOPdOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440600;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AgB/045LOM/DU0ZQ5PFtkUZFRoV3SsvyYBprk7gKsaw=;
	b=NhuPIyKecDLncUsK7TRnjT136WdP90IETLz0Lbz4prXM7Kan1qljFGjOSKNoe9DZJJh+
	 8khDs13/j8+vOf2TPa425r9FQt8sYpZGr4PhzoiEOBjltfGoAIjr+ssT0gyIp3KRI8Zxa
	 eDFOQTaAo1Tf/6bZZYdEuGjcJWrwkLNAOuq4GE8xlO1Cvk+YLs2IPrjHW+yn/uAE+3ADC
	 sqslbA4ECrjF3YlpU2GF7Jl3JROIwzxpOGTplL2cd5UNbGz89E20L/54Tjk3j9a9bIr7e
	 dU1N7zKljTW0EOVMOq+nAWylhrmb4W37p3pLNcfKUFzZ2jd9KUbzYQSylBNYbeZF3wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ja8cZVQB;
	arc=none smtp.remote-ip=91.218.175.76
Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ja8cZVQB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7IFxhjDe+u/lM8o/tJks4Z3OHLmd02D1xmAocD2YqLM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440597; v=1; x=1796045397;
 b=ja8cZVQBOMGsCzhsKSs/Bx/7LC3f+yhwjb3UBJDrKstn3dNs4zw/EyrF4hQHmsgolQtQA9rN
 QwDupC41MgtCngq9kFMHRLqf3TlWfIhtXrk5HEz/abYj5AnJUHXEdoHSAtpT46+cu+JISzJRi8+
 Ax58FwT6vID8fm4RjBA+vWN4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a3e3a6526310b552;
	Mon, 23 Nov 2026 13:29:57 +0000
X-Mizu-Trace-ID: a3e3a6526310b552
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so8535e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHZVmI/TR/HO6BGuHeRELyI2QmxJQfZZqvzKnBmNhFK8gYRd3aQI7QLTxAKC1GHAVQsyjr3GATGjqS+ZOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sO7oO0ZYPBbzkaC8S5/2xs8PgJhKwcIw7fAP5oKE/uGR4xt2F
	v8haqDNA9OwlCM7DnWzUg8KHba2t9u2mpybeqOxxuNA3uIywX6L59uyMlKi940QtQ8pP1tk1M+H
	ZGQCYn26bas2CnOA4KTTaZBzQY8X3VtXENfVNzY6u
X-Received: by 2002:a05:6512:3983:b0:5c1:ac33:5a4a with SMTP id
 2adb3069b0e04-5c21a27a14emr207688e87.14.1795440596288; Mon, 23 Nov 2026
 05:29:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-4-fuad.tabba@linux.dev> <86ik1nzopr.wl-maz@kernel.org>
In-Reply-To: <86ik1nzopr.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 13:29:20 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxDGNLdKDRJF+uNg=WqxSqnm6aHtzXtCxFtgpCvgQQCkg@mail.gmail.com>
X-Gm-Features: Aa3M54qQFhLnTZaxFdOsvcgBtt8YqqV5Nj2yTBedsspH-OGSsxIcqI6DPQ-Yr-c
Message-ID: <CA+EHjTxDGNLdKDRJF+uNg=WqxSqnm6aHtzXtCxFtgpCvgQQCkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Zenghui Yu <yuzenghui@huawei.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 13:01, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index 6932dd0a02c42..5756ffe4ec13e 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -5854,7 +5854,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
> >       bool has_v4_1 = false;
> >       int err;
> >
> > -     itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
> > +     itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);
> >       if (!itt_pool)
> >               return -ENOMEM;
> >
>
> This one really wants a
>
> Cc: stable@vger.kernel.org

Will add it in v3.

Cheers,
/fuad
