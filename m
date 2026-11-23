Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433677;
	b=ezq2ePXaK4ZNnQmt5PZft/Li3KzgW4N7qaszCKZ08xCaTVFgECuM0IiA1cxLcmzhax9q
	 VjlKQsYhahnkLHln6ej+8dT/Q6yak/bi88LgJ1gl0f1DoppJ+HYk9hysY/8Nky2RIGFYC
	 8pA7VEP8dI96pgciy+5sOziUsFg47ev3Zzys9S31TI14Mm+PWuP7OhMokQQ770AbvnvoX
	 cN00SQNnlzehClXtvrgT0w3j4BqrOdkanaTXLQ+ztHq2AfFSUAYJAT+QQl+i6Mvr6E+rP
	 fXgOR878BvKAzpRZIbOj/LmQ+CS8N7MhU/dj+9vYFlZ0IcFFHtp0YrgXgf+jIsDMq7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433677;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0NW5PHzU8niu/Vyq4xWZ0l8rjf3Rlalc4LXyc2xQlwg=;
	b=rKvP7JqPPy1rys68fuQKzo9plU6lAjFERRUD6YTmAwPAqoPOorCmYzqQNorkz+KCBJ7u
	 308nB5X+HyBszOunxyu9uc4/TWuyDk90xG459J9Rrpi4KXpnKV1M4BvQRnK86F9dKx6oG
	 84vPHbypzVe1budgddm2DzmWaGb3ZIc/Hz0GdCjCbDIRs524qhBP+OYb8P4YjWgo9CUPi
	 UzMM+vjXETnW9ql4okmV5HcUIuAIHZ4p8x1LIibL25W4+eRPFd1OoJnltQFhD16dVDd0y
	 HlBo0capB+D3we2kIjqNsnTjhrH1PCZhXaA31aO1ENNm2AstWe23z1B9W9WLmrqJq0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W1HjE5bz;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60E6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60E6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W1HjE5bz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oxaCqIVg13ImZ+B7nAeaMCiK0nlxtkXNZVdvJO0RIyc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433675; v=1; x=1796038475;
 b=W1HjE5bzp1rH8OCW52+xWhhIRSJeMKRMn6cVUnk14tIyopR95KQN/KHY1nNoWzRztc76DvVY
 xYynpAaIyyjGRJG79CvDaaJ+qPr5uGvmc3IbYdYNoZwUZFtL3bYRR3iq1OAoqKgLdwSpLYf35yC
 Eurx2tzpGFpBw64JT8nIvJ+U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6f5034aee4cb3981;
	Mon, 23 Nov 2026 11:34:34 +0000
X-Mizu-Trace-ID: 6f5034aee4cb3981
X-Migadu-Flow: FLOW_OUT
Message-ID: <28200e68-464d-45b8-a7c8-c3f239b31841@linux.dev>
Date: Mon, 23 Nov 2026 11:34:32 +0000
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
Subject: Re: [PATCH 0/2] block: fail short atomic bounce bios in
 bio_iov_iter_bounce_write()
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: Tal Zussman <tz2294@columbia.edu>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
 <20261120-gratwanderung-wickeln-mitkommen-1fa50bede59a@brauner>
 <20261120164309.GB32683@lst.de>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20261120164309.GB32683@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 16:43, Christoph Hellwig wrote:
> On Fri, Nov 20, 2026 at 10:04:37AM +0100, Christian Brauner wrote:
>> No objections per se, I just would like see Christoph take a look first.
> 
> No fucking idea.  As far a I can tell atomic writes are a mess and we
> should not have done them in the first place.  Ask the people who
> create this mess.

For this series, the 2nd patch just removes some duplicated code.

As for the first patch Re. bounce buffering atomic writes, it's a 
another similar check for creating multiple bios for a write. To me, any 
atomic write should be stable and userspace should ensure that. But 
whether bdev_stable_writes() should also check for atomic write 
capability, I am not sure.

> 
> ---end quoted text---

