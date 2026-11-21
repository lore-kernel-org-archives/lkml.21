Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272357;
	b=XFA43Ecco+NVJzZ2QuKpzbf49c/ICgpvKadY9ztY1jVT3qsdqdnVyAZH1FZUQb9Wn5kS
	 vnfRalJsEcQgRWfVI9hiiBiZzk19+IS8BX7j7gtDi7LL0/ue/gF+5l1OhhBL+4p9LwtCb
	 HUG7ovt9FdkSQeoHBEuM3aD6tGjilAUKbx2XoaYRcXqABcrnalfNHmN9TpmQFlc+WhRVK
	 k79Hr9XFp/HXzwIER28XK445SoPjvZfpw05HdoAqPyrNHvXpI7Vqxsf2HAzogvquXeEcA
	 YLwOL+vv/8HAEtAbxnJRAz2HoSdT5L8x6yQPK3RWaIEmdADmeReqODp7Yr4kuBSdRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272357;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qoJjT3XHzhhR0jlFcDuVl40OhsAjxWfq5HgQnsOgtGY=;
	b=2Xafu6/K87tNDTXH9hXnw8wmoFubom/P91MBI6akeHAUjZTP6aTfG3MSOOiqfQXCCsH2
	 /dy1OQJak3cdzaQTZvbnjewE2dVwW22lAP8dcgEaM0E4bQjk21wrURk9oMo7ujtZI7XVb
	 13V/rKC5ZOnnbQq+RtAjKbPA7n5dqf/4hPrZik0f3qUApytY1nmufvNkubpcQga+K2k/N
	 c0WFjs/4/+r4DYqOuNKg1J9m2WtEJa+A6rmEmLgJItr+qOUOo/BD7DASQiROW4q9ER5nW
	 rd493mn1M8cWXG0hreZfIaABPoiUOkILAo2PBnRTcjlLPPeovjW9gmhsxBRUn+8KNJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hELqwDLM;
	arc=none smtp.remote-ip=91.218.175.62
Received: from mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11776606A339
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11776606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hELqwDLM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=smKWGNoWfIILM/j62Dml3s9EICUrHGZXqHo1D1M0PPk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795272355; v=1; x=1795877155;
 b=hELqwDLMoT6afUpg9uYamEVtxMrqHmyfnhtB/yPXRxI+EoYhiiVPBe9v5ZA3az5rJ9nlBwmK
 ewlaHExFuT8nqipwsYGzw+qG9B5vuDzVRp9qgu0twhkXvy2GJfwgt3R3bN/JJq8RxOO64eZjVbU
 ojX75tC7xglTyOah6i9Cg6Ec=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0fc2c6103f5af1b;
	Sat, 21 Nov 2026 14:45:54 +0000
X-Mizu-Trace-ID: c0fc2c6103f5af1b
X-Migadu-Flow: FLOW_OUT
Message-ID: <23172468-4a69-4986-ae85-ea1962717f30@linux.dev>
Date: Sat, 21 Nov 2026 22:45:46 +0800
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
Cc: cui.tao@linux.dev, cuitao@kylinos.cn, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] loop: defer the queue limits clear to a workqueue
To: Bart Van Assche <bvanassche@acm.org>, axboe@kernel.dk, hch@lst.de,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <20260928093512.3153646-1-cui.tao@linux.dev>
 <df36224b-7fcb-45c4-ab78-d7e726bfeb9d@acm.org>
 <edfc22ef-799d-4f70-8668-bde0caf67bcf@linux.dev>
 <f00cd07f-348d-470f-894a-c70435f45076@acm.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <f00cd07f-348d-470f-894a-c70435f45076@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Bart,

在 2026/11/21 05:23, Bart Van Assche 写道:
> On 9/28/26 7:08 PM, Tao Cui wrote:
>> I'll send v7 with the comment fixed and the redundant cancel removed
>> once Tetsuo's series has landed.
> 
> I can't find v7 in my mailbox. Did I perhaps overlook something? As you
> may have noticed there are no plans to merge Tetsuo's series.
> 

Sorry, you didn't overlook anything, I haven't sent v7 yet.

Thanks for the reminder. I hadn't noticed that there were no longer
plans to merge Tetsuo's series.

I'll refresh the patch, rebase it onto the latest upstream,
incorporate the changes we discussed, and send out v7 shortly.

Thanks,
Tao

> Thanks,
> 
> Bart.

