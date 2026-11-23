Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441384;
	b=NFf9BtfSMW2N/Q/o7dEDhW7nzge9r4fTePLYOz1bwrshxjp0My5qwoOnZrAS/40ZtS9H
	 4y56PHEmVdEM45IFC/YeSwwKpgGGDCfymUibGaALg9VaHD4IDSxk3Q5F7VdeLleGnn6ps
	 urVUkIRtWd7Sxuba7lTjDIajEkjAIEitN8EjnNenWbR8+/+SarhHfk6/adglqJbIUVbXx
	 9A4fsMG64O+deeS15T0jnnXLsBPsuuJupxjbmFUHETucCi2I1e5/69OVCK9eT6geRhAvj
	 6za2JQQuF91GuSH+LPDMJuxceHozn2Jt0EqN3+ElFNxZHVgbOOyo3idAC776YL4PoYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441384;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DCQx/SItVG2utyNVIJWfKgNvluAQSFlMsMHNGPCyXeQ=;
	b=f6sM5GUYjz23g3FhViIAnvxQzOkWwgPRcxQ1k4dkUVrDPixqzBQfHRLUMApECNdwFP/U
	 fz9WtLnEtNKv4+QnVbTztdRHGFf0V7v21jIf3BsNlz0dpjPS/xst8OkvdnWouMr/tyjWF
	 /rua+a21bG9nivVzWT3ZeIFSNzvDW5TF+TacwVeql772zuYFvyfZ/5NuRLsJu5B0O73jS
	 XBUI+zUULjtj7U6qLEF9S2kX8q0cM29gT+gdPg3YkYN2OnemKp/DIeIDn/yOK8FHXeNC4
	 WIj1bqEdb06zTV60vFWCMRWmHtDR6qrLsTSJ7FTRUpbRXgwIJcnqGd9V/1sl80/B43w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eKU9GntY;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E2606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B72E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eKU9GntY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/UJnZf6f4DUrDz4PUaI4ZIVfRtW4AczQ3P06vh6Vzso=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795441381; v=1; x=1796046181;
 b=eKU9GntY9TAczlQTnYebbPToDPKacadV7nTWHCa4f5997dUzRLNzOhrtny8hjmis/tUKXG37
 XgLw9tKwxCOKSd2FPgiwzcwl/Or5nKZpU99PYXq8/aDTnQI3lTwNLrI2em2DaceONv4UgIPL4km
 hlorNir3mvzo8LLICMsCZ0Tg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 11ba230085014a12;
	Mon, 23 Nov 2026 13:43:01 +0000
X-Mizu-Trace-ID: 11ba230085014a12
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 14:42:57 +0100
From: "Pankaj Raghav (Samsung)" <pankaj.raghav@linux.dev>
To: John Garry <john.garry@linux.dev>
Cc: Wayne Gao <Wayne.Gao1@solidigm.com>, "cem@kernel.org" <cem@kernel.org>, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, gost.dev@samsung.com, pankaj.raghav@linux.dev
Subject: Re: [RFC PATCH] xfs: add a per-filesystem switch to force atomic CoW
Message-ID: <awRASEIJGTYGOx46@quentin>
References: <LV0PR10MB997684D5CA8A6AC037F6D1CD8AB9472@LV0PR10MB997684.namprd10.prod.outlook.com>
 <1801b5bf-6cb2-40ee-b553-5bcba04875b4@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1801b5bf-6cb2-40ee-b553-5bcba04875b4@linux.dev>

On Mon, Nov 23, 2026 at 11:44:19AM +0000, John Garry wrote:
> On 11/21/26 15:47, Wayne Gao wrote:
> > 
> 
> Christoph was proposing something similar here:
> 
> https://lore.kernel.org/linux-xfs/20250714131713.GA8742@lst.de/
> 
> Plesse check it. But it is for a difference purpose to what you propose,
> below. Actually, I am not sure on the motivation.
> 
> > 
> > Hardware-capable devices normally prefer hardware atomic writes, making
> > it difficult to exercise the software CoW path deterministically without
> > changing file layouts or affecting ordinary writes.
> > 
> > Add a non-debug force_atomic_cow sysfs control for each filesystem.

Why do you think this should be a non-debug interface? Why would anyone
want to disable HW atomics if the device supports it in production?

> > When enabled, route RWF_ATOMIC writes directly to the existing software
> > CoW path regardless of hardware eligibility. Keep automatic selection
> > as the default and reject enabling the control without software atomic
> > write support.
> > 
> > Sample the setting once per I/O so in-flight requests retain their
> > selected path. Preserve existing validation, completion and error
> > handling, and leave non-atomic writes unchanged.
> > 
> > Report no separate optimized atomic write limit while CoW is forced
> > and document the control's runtime scope and lifetime.
> > 
> > Validation: strict checkpatch passed. Linux kernel build and mounted-XFS
> > runtime tests have not been run.
> > 
> 
> Hmmm.. you are just describing what it does. Not why.
> 
> > Signed-off-by: Wayne Gao <wayne.gao1@solidigm.com>
> > ---
> > Hi Carlos and XFS developers,
> > 
> > I would appreciate feedback on this proposed interface.
> > 
> > The intended use is a controlled comparison of hardware-backed and
> > software-backed RWF_ATOMIC writes on the same hardware, without having
> > to construct misaligned mappings to trigger fallback.
> 
> Why do you want to compare?
> 

Probably to measure the performance of HW atomics vs SW atomics?

If the goal is to compare HW atomics vs SW atomics, then a simple module
parameter in the nvme driver (or scsi) to disable atomics even on HW atomic
capable device should force SW atomics from XFS. I am not sure if it
needs to be in the upstream kernel.

-- 
Pankaj
