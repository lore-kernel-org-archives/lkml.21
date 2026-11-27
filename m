Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798904;
	b=aLf8l5Ig3TTAYIqQJPVY+MF/BEDQqpMw6Fa9E+mULE7qh8c8UMyi7Ti4gLNDyPjXlwKc
	 zbjRdx1toEL/NU62Rs9wGGOP3cVYkFSpSjV96aSinfc23BtSSAdzqwt14kKylmHF/qf3I
	 1PRF/7r336l0Ae5EtSdpMGZHceUoqSIaFkOplL+v2LmYiq2Bngb9JjYm35xQdX76ntenB
	 G9w3wqeZmYXEfCB0l5tAYrhP8EHYS870n6zQBaOll7bokRuSCycp8z0DvFL9kVmgJJpKc
	 BQd/zF6aidGKK/eKLARFSeB9LbcYtAl82lbSf24zyxt39HSslWPDjNu4ibHZlepRz0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EGUm1WARozo+i2X1STejQqT6PhwjcryBll7NJyIlqmk=;
	b=TE/8Cn4SuAx7FEII9ieE4MlU2d/uvMn3ZWuocNq7pyvTlTNpS7M1mTtGuS7faMGXggYv
	 fuST8lOZCln5+oGGMZfKO2qNEWr1SYLsEY2kxdbDaDW09x9yT0lsD4BanqmcBCQnT9Pru
	 tEuiI9seWJn4FnSM9G1ZJaVuFEtJtHPAab/0axFRssje8SGzU7sn3+c/pXALRfG/bfFS8
	 DaODewgriNPtftBvNsZ8T/YGFQzhXY3t+CcCzlqSUcBvyomaFGf7R9skfZPnMpmMHKNLU
	 UpjwGFKtvIoWKwgTmygrYlcOQhGZs1W8oA6v0WtaaJkPg+/MAlHxoHNhBAmPL9bjPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTf850uv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79087606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79087606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTf850uv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5961034f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798902; x=1796403702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGUm1WARozo+i2X1STejQqT6PhwjcryBll7NJyIlqmk=;
        b=hTf850uvrjJbgZ6iJ/69YwJSmu8EtRtoHJcKFmM4cCRRUC33GwLuUB/cnLsIAwYn9n
         PXADskx87Ee5EDDMcjHGUVDoNm6Wnnw5Ke6YZfsRoZEyqRFbnwWv/P5Znn9TZuJNdcH7
         iJrInWT9qkTAg/lfEDdTHy/+CSp/GHpgZ9/+AdeaiudqtUFlMgM+i25yWIhCZIhq7abZ
         rJ0ZJoBnEsQjH9SE7pb9Po6n2FK1huLCBZuJP4LavJzl5LHdL/rkXcyplTL+4uts48wk
         rKLS8+o57VVc6Mec38BebgVEOtcp6XWa/UnGU2flaexyhtZzuYjDBbZStIpNPqq41r4D
         9DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798902; x=1796403702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGUm1WARozo+i2X1STejQqT6PhwjcryBll7NJyIlqmk=;
        b=238M4Q7uNCSgQM/xdGuoow4f+akAUBKiR6cDKamM7XTiBzOLrhKh3HhfHbWwrN4XeX
         1C9Kf37+1Bq8AHIi/43EApLiIFFmQLcUlRibWSd5gvUl/bbVl20JDXc+0brFwZEZ1mqW
         Ac7Sko/V/J5JjkLqD7DtUIbbr+iSvNT8hj6Ae5Wb023qk9nNKwFS1fRu3lieYMyXCco7
         DHK/2TpmAy4Cgv/9I7tcDeU72kT8inCioBLIZ3QBFzWGH9Iena5kPr6sCUEJfl1o+vfK
         q0t/30xREsLsw6YJqnu78KWM/FIVqxxSCGcrlvNK/XiWMj4mXM1ukC657/r5l4Vfadzj
         xYQg==
X-Forwarded-Encrypted: i=1; AL+hErGaCipPIybGpusWt6uph8QIQfLzD6i+/MnCVBjyAxX+rLK7Za2LA4VRdmTFyJTIr6A/0kjtgj1dwvNF2lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7lvUBdDn7IG+jAFkL0WcFYCTLmS4ayhufw735fd3oYc2q5B24
	wNW4qV0Ib766CUkjb0XqCjBT/KsrdfMNapsnoT4v2P7LwxHuwqICpvpX
X-Gm-Gg: AZFdTZd5YEmN+0oh7BOV5exXdy/44sgdNfIgSaM2Uba2RzREqz9FR4oIUv7o4f8p0G5
	o/ZOgoda34ZaEdD+qCBNHcnzQBOd7UdzzaI2DfknrIz39zExVbGY+DnKclRStOmCnFNWMqsKRkm
	y0PjpJYsWHTU6qu8fecXcN+ydB4vD8sjKcf2aRuIRu0uENAEP+9JxeQNpsU3VArAz0ZmPJ50bVX
	4rWu90LV47yP0JgJXKWwxqJipRkYGviFT5Kf6/2BEYBaHzoH4ADkSVogRHpMpzd5AsO+9hFv9de
	lPhLRzBq21LHJeAeBPe7O/G2//FgKE3swFH+qIXh42UR8teKskdjQ62wyaihk1RzQjShLV6Qws3
	ZjpYI6hLyCvgLvIU3O8UsjR/Zd5xH1XMI7sZ9ZkLVjmGlla4mWIv0xjt5SbW5QPM/jlGg1qz8f7
	Lz0XVEtH4CmPYLUaAKEwWaXI6R0ECWIZZ7t3sNFZbbrFPJJFEjCTPy/USy23K+Yj3fw2+ncsO2y
	ytOOEgOnTusC3nakLTBVBU6fBZJhPUJUBmIXpe/NWs6AICjhiH0ARV99rma5Qu+kKYxoO365/h9
	9LF/YDayXME8NqNtuz1mGUblu/A6npcyt3+w3lVp470icWIIOr0CkwSbGS70JbkJ3hFplYyWuvx
	Qhp+/54acDFNQCRsV2dAs8MGw8LYUQyzDzLD4tDXLbHMvdUElOqYChCJ61Cp81jdZ/cSh0iu64D
	U=
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr510208915e9.19.1795798902154;
        Fri, 27 Nov 2026 09:01:42 -0800 (PST)
Received: from othello.home (103.153.90.146.dyn.plus.net. [146.90.153.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm407300475e9.0.2026.11.27.09.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:01:41 -0800 (PST)
From: Cassio Neri <cassio.neri@gmail.com>
To: thomas.weissschuh@linutronix.de
Cc: jstultz@google.com,
	tglx@kernel.org,
	sboyd@kernel.org,
	mlichvar@redhat.com,
	alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	cassio.neri@gmail.com
Subject: Re: [PATCH v2 4/4] rtc: test: Remove test_rtc_lib.c
Date: Fri, 27 Nov 2026 17:01:52 +0000
Message-ID: <20261127170152.41109-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903-time-time64-to-tm-v1-4-660be972adfc@linutronix.de>
References: <20260903-time-time64-to-tm-v1-4-660be972adfc@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes look excellent to me.
