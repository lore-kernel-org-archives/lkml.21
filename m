Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020259;
	b=eIoBKtY2LD5GhnZXWQobjp1Zl6FQ32u7/Z/g4n4tVxCzIPX/Od0Jcms1sYMJ4Z1Hb0oi
	 pDIjILVoA1tab+EMV+z4wFYlWK9Y/O0EvoQSNwdZeBTyVuFYCWhLzCuhDIarnhGhxOSKi
	 PDmqoJYgFc3iwER6DvPnGNbMNq75WUQnXeJB3pCoE6CMEs1FkR1Vsw8aQ0pCrXAYvQkxP
	 YreYGoAK9fM66Esy63x4hcgRzc+gjWkAX2AoEER0q7v2uNTyQUOn7SpmvUXHV18avBTUy
	 W8E27qC8F0hzLpG2niaf7+aSylWgkNNxAU2NaOA5XL1eq07y10EP2eKjvjIKAa3V08A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020259;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:Cc:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dvQKDptWWm8R0eb9TuCYWY1w87VP0C5dY/jzQ1Uh4ks=;
	b=sDkBpOym1kanxrPN9AwEIetPJHJGyIaW7cz477qrhwRzrT7dr48AK4qD1Vhlkr9FW6T/
	 22hCXzqplxhSor0ArJ62FxfWvrh4q7K84EypgHny4htnJkeoZw0+Wd1liB3Ui4QN1U70v
	 TJgkOipv+keCzP5ckAwKzlIp2SV3UPNwQmx1howyCZA7Z/ObQF+z5NznxVpe0kDqkK3bS
	 NqjTDW84OHxG/9NC3pV8JbTCFs665FGkpF02SLVWQmWo383RLhwTJ+GNKsVefgWu1h7bD
	 57Z6ECl+kjID1jsiNyKu4sXLeN65E8MBLBjUKLmn2C1Gqo+DrRieli5uphkgcDXeT2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mY74Bsms;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4CB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mY74Bsms
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4mYkAbmJ50bqRecl7WhLUagLCIRRi22IPvNzPbrs644=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795020257; v=1; x=1795625057;
 b=mY74BsmsBP1fmTeK9MELFapEviFdKYTZXA8wUSH0YFl5T0h1M3jgCvb3bV0r6vgjKEfp6QqP
 6Y5RhFfBnTSks18AA58/5alb0Ly68NeZEXq3msPagi/zaQ/ZXSZOQF4hsDBAKT2IOjS5oYUydaw
 vbZ17hjw8EybVBxq6WPe6zJo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5f1217d9bb73e6af;
	Wed, 18 Nov 2026 16:44:17 +0000
X-Mizu-Trace-ID: 5f1217d9bb73e6af
X-Migadu-Flow: FLOW_OUT
Message-ID: <9751bd2c-897c-433c-a4da-5ec420ced322@linux.dev>
Date: Thu, 19 Nov 2026 00:44:11 +0800
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
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20261118025106.623070-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118025106.623070-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 10:51 AM, Jinjie Ruan wrote:
> The collection table is currently sized at a single ITS page size,
> and the driver's allocation policy is to allocate a single collection
> per CPU. On systems with more CPUs that the ITS can fit in a single
> page, no LPI can be routed to the CPUs that don't have an allocated
> collection, and the system grinds to a halt.

The issue on the reported hardware ("384-CPU HiSilicon HIP12 system", as
described in v1) is fixed by allocating 2 pages for the flat collection
table. That is fine.

> 
> Change the allocation policy to allow two-level tables, similarly to
> the other tables.

But I'm afraid that the two-level CT is still not supported: nothing in the
driver allocates the level-2 CTs.

Thanks,
Zenghui
