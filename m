Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566720;
	b=mDjgkqPD/aOrXsJeFODHBaXkCWoLl7BVB3cVpkuilt2z1+tDa/02i2HUS7Ga6tPZPgdB
	 kc7eqbQcY7/1cEft7G8d+bwjfjJc7a4rrfAWZozpdYCSYDEPajYN1b4yh5lYkK0V4DusJ
	 cR4Ue4KQCMvwr0ZiREVbNK1YygTWFBPZ4m3+Jwsroa00a6Bo4ju90x4wpdxoKZ6dadCZC
	 dABYDAsaPGy0izbll9LeK8izvsSgpChdLFZUMM0Gpfvk5n6SldvVSiLo0JBvGcCKoZxGg
	 keVaF7+LNA38txR+RaIvozxjY49cUUYe9x+ce0AJfUVUFvMbKFNU9/sW34/u+5xs34Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Gcn9k5RyT2SrLf7rw1mzgR9U0hO9J3AKAxDoC8pAHaE=;
	b=GHHNU3ReB5jjRy+Ky7u8STI+dr5xiL/2jLrGMhc67QCD7ggBDhmzfyXEAl6wF9Y0QbLM
	 MHpZPkEVFCBo0773yVmFRoHBiBsn13OJ2/elWQxXLABSL9+D+DHDYzjVXuDUCOtP1EvjT
	 KliU8xicAwdckyeFb1eQ1azHydsJBaOq3OMWd38Q31UKmSxBesqO0Lhj37rzRmRJ5FQBV
	 E/XLVpYU6yA5oZXhsyf3jm7z0mxs5Pn1vPVSArdmZqorU4vzsJ9f4wA3TfA4iRO9luNvp
	 Xc7u2JJI6gNcn2G70B3zQTTfwIsARA35QrUaIEw6Fv5wWxa3sLWUaS5U3BNsQylaP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQwmHO9u;
	arc=none smtp.remote-ip=209.85.222.197
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0FF606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0FF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQwmHO9u
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so901420885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795566719; x=1796171519; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gcn9k5RyT2SrLf7rw1mzgR9U0hO9J3AKAxDoC8pAHaE=;
        b=XQwmHO9u+G4hYbfjQQeoBtP0836u6rFMOum3quZGgd8jUKrOktAJVwEQuog3RtOmR0
         /ry4sUgmBhTa0VJ+gsXi2il8IjEVQbkCKgqIxFm4In+weX8rQHoGRHvzFqFzB3Kd6WtV
         Z5pZ94I09jYptL+vsSsRoXLBbi0yhwV3eCUMhQmYwmHJdSpC5cWLLWezW+If2da9/l9s
         9IP7EBTwCDSaVwLhAYHmD5Pd5QyzOhLzNqf9+H1zdirHMjrf4TBLtNCd/Ni65Rxt0TfX
         vS8nYnwvKz0RUdhL+Obbgtl1ieYbZFd82+sbfUP9wroXnbE4hVHL3U7XXMoLZ43y2iQJ
         uO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566719; x=1796171519;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gcn9k5RyT2SrLf7rw1mzgR9U0hO9J3AKAxDoC8pAHaE=;
        b=MjkGH8jg8d15Kk9+QdZUPOk3q8sOJNjCppwodBlaR5/DwxjLCjWa3XWOd+DAtEbC2f
         G8LyFivaX3k6VnXObZD7wFxTWWDuEOk7gOkOczhhTZtpSWKn1aT+Qcs6czDrinW0DmSb
         y3c5sRW0v+vlC3VKaSc8+bMag5K7Yl7eubmklkC287o9WCO7rDv0C6kE9FBq/sw0CpNe
         R81Suo5Tul0+Mchtk0mkS9NRjUv1mtzUVvnfwnmUq71mr+L4bKEUeak0DWPLRGU177bs
         AqSBCJbkrmexP0YFvj3J3u5Zw1czNxked4zalsbTGeIE7krq6nWi+ZvMX6/SBVvucOaL
         xEcg==
X-Forwarded-Encrypted: i=1; AL+hErESHPeLFPdOGNlnhdyvLuQfMtcBfsCbKFUyiJ8pRMkWmKX3aine0DWGw959mC4Md0MwVAuIT6iAsKDR2Dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j5ZkugwHYf47jM2BaHzqu0VXNlSvSEl2+Usbx7VzafIde8u6+
	FWWLKM1UFqP1MpUnh8eBk9P6dxqBMR+7OG5UajN9MjWfOn9D1QzHWUpWskllfYwUfPGqdpo9XXQ
	EDFUnprrjJg==
X-Received: from qvbld10.prod.google.com ([2002:a05:6214:418a:b0:921:2ee8:44dd])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:6f0d:b0:939:6dea:374d
 with SMTP id af79cd13be357-949ba9d1fa6mr2800574685a.49.1795566718729; Tue, 24
 Nov 2026 16:31:58 -0800 (PST)
Date: Tue, 24 Nov 2026 19:31:58 -0500
In-Reply-To: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com> <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
Message-ID: <willemb.4158a0ba73d8@google.com>
Subject: Re: [PATCH net 1/2] net/sched: dualpi2: refresh head timestamps after trimming
From: willemb@google.com
To: Zhiqi Zhang <zhiqizhangg@gmail.com>, netdev@vger.kernel.org
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, koen.de_schepper@nokia-bell-labs.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Zhiqi Zhang wrote:
> Reducing limit or memory_limit in dualpi2_change() removes packets with
> qdisc_dequeue_internal(), bypassing the timestamp refresh performed by
> dequeue_packet(). The cached c_head_ts and l_head_ts can therefore refer
> to a packet that has already been removed. If a queue is drained, its
> timestamp remains nonzero.

> get_queue_delays() continues reporting an increasing delay for the empty
> queue, and calculate_probability() uses that delay as input to the PI2
> controller. Partially trimmed queues also report the delay of the old
> head instead of the retained head.

> Refresh both cached timestamps from the internal queue heads after the
> trim loop, while still holding the qdisc tree lock. head_enqueue_time()
> returns zero when the corresponding queue is empty.

> I identified this issue and reviewed the fix. I used OpenAI Codex for
> root-cause analysis, drafting the fix and this changelog, and assistance
> with regression-test development. Codex also performed automated
> validation; the archived results are described below.

> I reproduced the issue using Codex-assisted automated tests on an
> unmodified arm64 net-tree kernel in QEMU, with real AF_PACKET traffic
> in an isolated network namespace and HFSC ls/ul shaping to retain
> packets. No source changes or fault injection were
> used to trigger the bug. The companion kernel selftest covers C/L
> dequeue, full and partial trimming, mixed queues and no-trim changes:
> the baseline passes three controls and fails eight trimming checks;
> the fixed kernel passes all 11. Runtime coverage is this DualPI2 selftest
> on arm64. I also used Codex to build arm64 Images and compile the modified
> object with W=1; additional build coverage is in the cover letter.

> Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>

The selftest flagged checkpatch issues. It is also many LoC if only
testing a single small issue. LLMs are good at generating tests, we
cannot include all.

Let's also include the original author.

pw-bot: cr
