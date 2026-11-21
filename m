Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260471;
	b=NWEchMO+Pgu7ljTlBEPTZF106E48gN9QvWoLV1Rs66K/QFmsDi3l7mVfJ+4ngwzRnz+G
	 BagoPAfZuKCjxqv2FHo7nSQ9hSJt3IA9Frv9c3X5ZuLxT5Kh3TeTtkfmhWgREje0ZalZb
	 HiXMSxVHF0gvTW3zbV7eiKSKYtCYXTBrOsGt9jEk8woAC8YRLw8BWuOl9Fg+3Ts5rkB0e
	 1vmraVsqVPmRDmaksg6AtLIWmX2d/AFHPkjCB0Sba/4ym782qtyULDqN8DAS1hIihmCj4
	 +rPRaD7cxDheMZQbOAdgx4hZoHyWEh3qW2a4Yv5KTyu98vr2FkwXjGF93/XO4FZJ5fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260471;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zWbeHAaU9PSKfsLTHzffi5B4XV2cAowGCcU8h7Q3pis=;
	b=nQ2YdZWxALjM2t1JXAwNt79oZyzBgTrecAG8EbhJJhl/HVGalafUKfulDVidJffwFXUn
	 1ELT/Usr3AbYmT3+/w8ll/ZZXEcoc5sHMBKATuImJTCz5wO4RDwpR679v+C1anQaqCb1q
	 HO3Nsq/Kd4rnaWWltu+BbRmyya3S8hQjVGm94peEOBc76wQ/ye+OPkxdRQrxR2nIJ2c8T
	 jo+pRG/bVSysqbLFxDujsWC14iN0Wcf6ROCZcfOMT9FT1hMrR3M01mAV4kmkc2mxdafke
	 o+hu4SiCSikZ8WAdPajzyuBgZk4tXWAkHb9G9srJLMFYv2L6M5ZxGEbKt7/zgm6dtLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eA6XC8N7;
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F35C606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F35C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eA6XC8N7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fvBF6/+ij8xwF+iLXx8bSG1XL2OxGVsMqLATzmvR4MI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795260468; v=1; x=1795865268;
 b=eA6XC8N7w8n6rG3EcyNd6SeDscaN4tXzB/yTtsTLbhPKM1eqn+9R6rt2FpQ3TtkCc7LKVfLt
 WMPPvctvB8FXvxPR+imly3gdB19SIJrkreqQlDRDyDk6dzOgHunr4uzJrZg0ArOi+0nL75Ox/aa
 fQjXeTP1KHHwETXhFIjICcww=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 99df8f76e236daff;
	Sat, 21 Nov 2026 11:27:48 +0000
X-Mizu-Trace-ID: 99df8f76e236daff
X-Migadu-Flow: FLOW_OUT
Message-ID: <edb8249a-7bc3-430e-bbb7-243e1881a0b8@linux.dev>
Date: Sat, 21 Nov 2026 12:27:47 +0100
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
Subject: Re: [v4 0/3] block: delay support for error injection
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20261111215838.103356-1-haris.iqbal@linux.dev>
 <179501806989.17649.3138860274842922761.b4-ty@b4>
 <20261120164416.GA32719@lst.de>
Content-Language: en-US
From: Haris Iqbal <haris.iqbal@linux.dev>
In-Reply-To: <20261120164416.GA32719@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 17:44, Christoph Hellwig wrote:
> On Wed, Nov 18, 2026 at 09:07:49AM -0700, Jens Axboe wrote:
>>
>> On Wed, 11 Nov 2026 22:58:35 +0100, Md Haris Iqbal wrote:
>>> Error injection can only fail a bio today.  This adds a delay_us option so
>>> that a rule can hold a bio back first, to model a slow device.  The delay
>>> happens above the driver, so it tests the code waiting above the block
>>> layer, not the blk-mq timeout handler.
>>>
>>> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
>>> are not applied to it again, even after a split.  Christoph asked on v2
>>> to avoid the flag by allowing a delay only together with an error.  I kept
>>> delay-only rules, as a slow device that succeeds is the more useful case,
>>> so the flag question is still open.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
> 
> Hmm.  This still has rela issues as pointed out by Sashiko.  I'd very
> much expect a resend to address them.

I can resend with the fix, or send just the fix to be patched above 
this, since these are already picked. Let me know whats preferable.

