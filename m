Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578205;
	b=i+Ms9z6ZnPC9v1NfVhhAok6RLnGj+RfRU4zxvNFA53H7QZkn2MKqOtKMUBMOVVaLULWk
	 ZxTfTpZxxmPM8o6QJ+vZ0tO2h766O6DYi89KnALLr7VyRX1FAGsJWczFA07Gj6VmrasT1
	 JWTOHISivbPa7Oiwfn40aq4Gx4LcsI7GHnHKkPkIBDzaKjePf887YQmfSMdFuqTXib/+0
	 0/3bsLGL8LwmLoEwiaD6soKT+TaHpCBB/SQ4r9gmxoVzMFF4GFhZ146E2/ZoyhQPBEedh
	 LFZogybb+ROITRuR5mWY0zwX8y//SCmNakBhyCMSEzGHILg4aSntST6RObxevOmqEMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578205;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=SoZ7grorL+n8DKqrdd1wAaI5dBboW50o8fMv+joHKz8=;
	b=SxxZB21OGBK4EgRLLUwmfM1w3V02pElfeYvA+TTEjH7VkjTHWEztFe/3a4gS2/x2v7dj
	 7MDCUHUuil+l4jecxlNnDvSozoHtt12LkLg3BLqVsgR+azjRYDfDncRnro/pFqLdMY8EU
	 yQ8YfRn4pkJkiyQSz3fMvBBb1vJIj1SM9ncyqftUN/HEGEK6LXWtRx6s9qKMMS/pwNjxu
	 EOpASxLHNg3SGI4oxT2Vbv+B7zOwgyfoL75EmHTVgFyCrJVD4/u9pt5YsrdM05RWYnYbF
	 jekbgEZqYh6YCYTKQ7Mv+fPKC3Pynn0adOqHEsA4A0whK0BZ/GlBtQU2SCbFnzw4CMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=f6QeNauv;
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF74606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF74606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=f6QeNauv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CbClVjeawVI/BOCBHpvWu57rNo0mDD9eas63Rjr+JY4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795578201; v=1; x=1796183001;
 b=f6QeNauvuP0xik9T+HM3nDb8eerHCNkVFfyHw3oGPv1ElFtFhpx4mPRFwr++xHo8sSR6zB7l
 Bu8uGod0kclnPrIv/k9RyYHMrUFcZwOnMEPCLVL21mvTwV1SgNjMJeUX+i9Pe+qt8smsyEsgR5t
 uyd0j3dv/GqGF7nYiJeh0oewA7c+xiWRX6LAwwmRdW8PlQ+cNuk0WJ9oLp9IcZXpwrWb9tsQtoC
 sWcgr/4t0OWhC3EkC+98fCfb/o0+kf9RLfK0mAs2TTxQTPhexLN8g4DXT9gclcyIIdpeJUNkk/1
 CnVHbNItGIETdjRkJ1junjykMtk7vNz7wrvlO/YOqyQ/Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f97d83fc035d789e;
	Wed, 25 Nov 2026 03:43:21 +0000
X-Mizu-Trace-ID: f97d83fc035d789e
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 11:43:17 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Bruce Song <xiongwei.song@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese
 translation
Message-ID: <awZZVV3BlovD-xNf@wyuan.org>
References: <20261118131636.5131-1-xiongwei.song@linux.dev>
 <20261118131636.5131-3-xiongwei.song@linux.dev>
 <09ef3d3d-0e68-49c6-a6a2-c754104ede9e@hust.edu.cn>
 <946792d2-4241-445d-820b-301a570ee2c3@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <946792d2-4241-445d-820b-301a570ee2c3@linux.dev>

On Tue, Nov 24, 2026 at 10:23:50PM +0800, Bruce Song wrote:

[...]

> > > +:翻译:
> > > +
> > > + 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
> > > +
> > > +:校译:
> > > +
> > > +.. _zh_cn_whatisrcu_doc:
> > 
> > 
> > Please double check all the references. If one reference is not referred
> > from other places, please remove it in the translation.
> 
> Ok, I will do that.

Let's make it a rule or instruction, shall we?

I didn't find any specific rules for label usage in doc-guide dir. (only
no more top-level label on list) But I suspect there must be unused
labels in English docs.

We either:

(1) make it consistent, i.e. keep adding unused labels.

or

(2) check usused labels and do not create new labels for it.

1 may be easier for manual translating jobs that you don't need to check
every label manually. You just need to add a '_zh' before each original
label. But apparently this will create tons of unused labels. So, no?

2 may costs more attention, but I guess agents could handle this
nowadays with proper prompts.

I forgot to mention this thing in Daniel's series [*], shall we mention
this now, or send a RFC patch after they get merged?

And also, add a rule for English docs that _do_not_ write a label which
is not used? This will make our job easier.

[*] https://lore.kernel.org/linux-doc/20261119041009.63651-1-danielmaraboo@gmail.com/


[...]


> > > +概括起来如下：
> > > +
> > > +-    使用rcu_read_lock()和rcu_read_unlock()守护RCU读端临界区。
> > > +
> > > +-    在一个RCU读端临界区之内, 使用rcu_dereference()解引用RCU保护的指针。
> > > +
> > > +-    使用可靠的设计（例如锁或信号量）保持在互相干扰的情况下并发更新。
> > 
> > 
> > |The original says to use locks or semaphores to prevent concurrent
> > updates from interfering with each other. Please change this to “使用可
> > 靠的设计（例如锁或信号量）防止并发更新互相干扰”。|
> 
> The verb in original doc is "keep", and the objective is "updates" here.
> IMO, "prevent" has changed the original meaning, and the objective has been
> changed to "interfering with each other". Or do you have any other thoughts?

In my dictionary, "keep A from doing B" means "防止 A 做 B",
so something like:

Use some solid design (such as locks or semaphores) to keep
concurrent updates from interfering with each other.

采用可靠的同步机制（例如锁或信号量），防止并发更新相互干扰。

Thanks.
