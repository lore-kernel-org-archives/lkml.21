Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795038996;
	b=yMOMNFtcRWOpqcNGcDPtnoAOs1vqShEF533MNa5eU9Bf1w/b8eLMPKotg3ZXYpj+/uj0
	 pZ61oalwZexZhzxM14Llq2Nl65/mwHjVeZgSOntN02RWBK4b6hqzutSprG6My51sjiy70
	 Fjfw50yMMn7gnLfUqPv6MjrU3gGpKyRUmdPch66WT6TU4VOLXBjfat9YkOgUU41rPQR8x
	 JtqmiyTX60VIrbFouBPt8OAouauYonZj3eqFtyDJ3vwnEwOe4jWax0+aOm7Wz8re/oz6U
	 YXRv1MvfR2GsIuEzijHl24V3zD18L8q+2ldgvpPJSnaFzy7fGCeZuJz4lHaPQXEv/hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
	b=zTmI4ezvntHdNjuKH4uIbYB4aHIdWOI2wM9FP+xqrAoKk9pW7b2J+fyuVU8uej5ZEkrK
	 sT5DFcnn2qyDTuaMeHV1Nt+b5yqpQOVjAWWBCTaztB3Vca3X9cwKoqJ3oHSvMas+4pYGO
	 7GdeeQKmw4kuqelbkd+dexOfdNiqkfh97Nqjygx4yqO/AMhFg5B5fDA7Uk6xiQRSvO53D
	 n3YoYgtcxNh24cTSW/3UmOPw48T0jbgSnhbTaSH7OcgDMNpzePoPDbEuubwMkvdr2MbN5
	 2l/l1D9uk75FJC6srHKTJd/PyqXguBbtA51gBAssolGz7CcJIgT7xJtItmPu6dL9Qpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzFOOmSv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96629606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96629606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzFOOmSv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1729077eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038996; cv=none;
        d=google.com; s=arc-20260327;
        b=lOgZ/iTtDSv7OofY6Shjyj68t+Q0k92melfk8VbEvYM9McrN2SGoWbFKnqksLM5mY/
         eXV7LJKJLsXVDE0ckzPhtdusVnNZw1FYveeuSwsJFjmuQ8tt9jsFIQACpG/LpRTxgPLE
         xcllFkGZCRozgyvmY+8zKpUhJZ1E6Ntf062RgpcPK6t3xtOjugivyT4T8ckT8Zua570C
         tBwMGDMaJ2n1Ffh4ihhzjCZldos+msm9mUY/UpEEUgMOo37kXkvmGSn/vcjdt1k+FOoI
         IpDs8/cafifi4EQc+dYNbL+iDVdApNlsPeJ85936RAuDaJmxWvZmcO6G0gX5ND/sHT6f
         sCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        fh=X/WHJZMYOdH8XX3fAa+mCSL3avAnwRQg6Ztz32xmvVQ=;
        b=M/+1L2s6VHXc9Pp/qbxQFglBHEkxsL5rTF5CHI2caPDPC59ZKaV1ObVw9GaqCXBA9E
         K/CSWuiMzaxwa6Klvbp0dMxtPiSbqVaF2oVviBs6DO57Wd4jDyY7TTrBsOhl6NTaDlyh
         MHs6tQhJAwGBLGEh05jFVHEDJcBsCSyXsZg3TKUVnPYM8Qlv5S5JXyR7b3oDdKvc1a5a
         0ZRJvHEVhJG8pqVafSbt28/9NxIPb5IwhSuYGxH4D/sU4OkcusSB2OtLa9dDrlVe6iIR
         X1MaDPr0961YolygC5jsLQSBVW14YlgTJNT0tP1J3heIS9qZ2tiOcrdgBrJ1EOof8bnh
         Ycng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038996; x=1795643796; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        b=wzFOOmSveXu8HuiVzCIMGW7OP0GoYf2SnRjJ9Dkjrf2+WvUPWZwaJ/L9yscUEhaVsx
         chJo+GeNVFybPEDBryX6BYtsMHtFpmRKcbDI/8TjsTB/2EgBmt+FD+Z8p1CR70Ugdk3r
         wzfq5a2svAb/Lm5Vuckw0Hvln7eYCWw4ahKHQvCf/Cm924mCAxt3pOe5tyY38PkEd09H
         CPz86mmr18fVq7pR/jH/F5f1hDAU2tJn2KvfyIXDCOsMdQ7HaTq8OfMP/P023MDzZmX/
         xZdncSfyR+s0TeyuEUD+6fqlcskr/iGNft1oGF2dugvjdHlPeNRqOioj/vEARpLCDGP6
         4uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038996; x=1795643796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        b=om2eEyfsqZTQCMaNToKMB2GM0sxURTi7JXj4TRdTF018R9BtChwweXy10kqiMxG4ua
         HcNxAeqQ70zLceqtZg808NVevAnnXhtqWMQdCgVUf3m1J2Yb4z5BKu3SRRMCJ7mQwUms
         /k0ZFajW5jYFJ16PpOkqkQfOlU8zFa0JLrZJYRVlcZQmsEoEZOzDkifZYBAjjSunBSUB
         UuEbrGznXLq9LMjAZ0I/yCcosKe3GKshXInpUAxfkQ24FJaRgMlOFNDJf77G9VbU6rRE
         x6p2e1kLagJISWsvunY2S03zOrLVazrn9D2qC+xY9MHvCw4UJz9VXRNRoEK+seCibdrj
         lLng==
X-Forwarded-Encrypted: i=1; AL+hErGNjH8yHAI82fyCM/HxhOB9F3iF7R+1Dq79i6pUkMRtjgmk0HvjCFJd1/1fuZlzFmoOnFiqfMGJAmuZxOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rmJRNE6QxC3/X2fU9/r7kgTiQLsncMIWuHL7UvQtaZI3XSU+J
	69aliiMuMWdxTmg4AvhCPXPo/8OTWmTT/ntqTlww9WnHantdw8iSjeL1yVGhy0uIOHtyJo15feN
	5EqzhiwbHUihTZL1ucknShEC4m1z0wMg=
X-Gm-Gg: AZFdTZcwJ4g8HIztvpCJ2qDI5IDieCbhs71owemnxyAk7HbIBJgTNRgBge8rmhqwnSr
	PKbFJiUB/6dH0gvbFNGFwAtSpZoOctWQR5SypGmgYiH2pCPuajyczWtg2TQsbYtdzm83quKICe2
	ytVJext+b92GIQrRt3QfDwEjhg3rKyzD6TaAQB1KWrrASRJLEf42n+mLygSP+ft+gMbQOhipzp9
	sV9+RMqLENrHzRbzov0Aiuf/TBdADNe02BJEeLhcIPBkBb6BktskEl3kjveTtlJ+JL6F1wW0PRq
	JTqJmBe3w2UpMZkfs+UsNIWQU3pTY7YiVlG+UNNUADocGQ7gtA3O8Bf4k08s2abH6fJglOm8Wmq
	za65hZ5N7vY69gaEOzZ79yTc6CepLcIwgzo/k61Rgkf5wZQqINkefSxN0PoYW9JuONoCzWDKYHS
	2OegumGCgchNOcbUrM
X-Received: by 2002:a05:7300:dc05:b0:36a:7bb7:4609 with SMTP id
 5a478bee46e88-38281cf2d27mr4946077eec.34.1795038995589; Wed, 18 Nov 2026
 13:56:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com> <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
In-Reply-To: <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 18 Nov 2026 16:56:24 -0500
X-Gm-Features: Aa3M54paIcao6XUjgvQroGOuSTezaTatALtRBeHgZB-rqUe0NegT6OT5B_ER2ss
Message-ID: <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Loic,

Thanks for the review.

On Wed, Nov 18, 2026 at 9:53 AM Loic Poulain wrote:
> The above message looks too verbose and confusing for a somewhat
> simple issue. Maybe this should be split properly in two fixes.

I originally wanted to fix the msdu_id leak. ath10k_htt_tx_hl()
allocates an msdu_id in htt->pending_tx, but leaves the entry there
if ath10k_htc_send_hl() fails.

I also noticed that the same error path doesn't drop the extra skb
reference taken by skb_get(), so I included both fixes in v1. I think
I could have explained this more clearly when covering both fixes
together. Sorry for the confusion.

> If this is a fix you should not target 'ath-next'.
> Two fixes tag looks weird, what are you fixin exactly?

I Cc'd Wentao Liang because he had already posted a patch for the skb
reference leak [1], but I left that explanation out of v1. Would it be
okay if I sent a v2 that only fixes the msdu_id leak?

[1] https://lore.kernel.org/all/20260917120112.2150211-1-vulab@iscas.ac.cn/

Thanks,
Changyul
