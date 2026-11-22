Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362241;
	b=kipXcwiCOwYHDIun7LUfYlV8TGiC2ZgSsThAXCK0dZ6vpXqWmlkju7LRalp3r2sRpuJp
	 4zyuO190E9YLbEJXkOf+CzfFK/VlFoAJQzWsmhVtPYrl3DNQa+s3FBi+W8yxYWn+J4QmE
	 E+BF5mVfBGXsiseaZBlJ2mqI9kiuYybymqBzmzf+t7g3q2qxTD6x+gLVzZFM2zDdaZwKp
	 7njAlzaoppvHdb4D6W+STSxs4BC4wg3R3Xu4yBMMQWtG7TWIy+E5gg6H1THSQqiNWe5j8
	 aXg1UHDb1fXs5Dwf6+O/A+wFr2TrVinDc3CkbMkURMNxp9XHSahZS+dcoMNaV9JSGyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
	b=PfiHpbIw11OYuyE02dH/OtpJhVWldT7d3ma7OR9lelkzoYZZIo3xkxJOufejojMdJyA+
	 GgEmS3AZVLM0O1q2XFNY8kGc4ri7807qJEe3kkFjRLhl0FwYwrMEoEZld/j0MfD6bHFqm
	 bgI4fWCZYr5dMCcAMlItF+tQS5BPFZqsMBIgpgnaTh+NfWn0LmQKGfTXZEMW28WgLIkMw
	 Fj8/HigHcFXbDwnJFoapKtoivgJHaSBQ0YfGcj69PqLgH8YwVWFlg+CZjULSP2lflujKv
	 jmaHrrrqtJpSsECLO8gIapYAiCi8KAKb8WVTfq8iSh3C4tvX04s2ifDBof0O5H4+7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QB1NahZi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F899606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F899606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QB1NahZi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so22932535e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362239; x=1795967039; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=QB1NahZiK6TorK5WMu/AnSDAFcm8/vwmmHq90ZmqMPzL/O+gilg8DS+BIDsYcPwVDK
         ZaAfr5L7MTW2v2aeFIz12nf6mWQsz+ep7qDGd9PDQNuoJG4rEiAuvkh5ndtg8Gx404cm
         ifN/vnIfqb2xlPYSY5W/nGj4BqV+3Y5DLJNJ2pKRqOlPiI0qy/v16GVyiH7uaV73DXPC
         dWIdT2A3gRxBh9llKhWX9O9PhgxhkU3R9p6Ct8uDIusoAlnRaMcxayYdO2CyywIgCn28
         5UW9OXCT/EEhopJS2VSC/dyIdbWB7RMgVmT85eQbwkma2l97Xac+Q4ncDnPEcw7XhOKQ
         QWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362239; x=1795967039;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=IjM8pb7teI8arHfow4llH9xrmooy64CrgerllMyaN5rBncJq4w7wHSJzoSLDAROFz2
         6Rw4K/WBgJrtQXYbXOVpSTrdt00fves7oNz15bMiqE2MSjmyxGdorGlJ9C1XldQZC7s2
         l6ZPD1U9LKTV2/MvFLPTlJxK8v7ZRiYRqaaAZyiHzAYVdEZQFDzKWsEmDs6A/VOc3CSP
         MAAl5YNQybe02l3kDsqpEzWDyGe1iXtnQYrx2Je1DhvhrQy1u1FnUNcgVzdn9Lg482BE
         LYy0tj3KJMysZyPOoOKpUWgt8WwiHmIC3QYggyZcBnvMvocI2+wupxTHtn71MxRo47nK
         bnug==
X-Forwarded-Encrypted: i=1; AL+hErGvNA17Lfss9CO5PZTzgW+Yrz4Lf/RqQprWnJlUmTMoVKpyz9XUb0l0RqQbqSSLMUC2Rs/5CVPb5y13pzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BRgD3/HjEyHAeKnVyhmG4SbESMFh71OJFQnZgcubYgosHAne8
	P/jwio5F5Zm9Ix5kJxhU7nfPQLgK2X+dMssSeGWFJkygx3Ya9Anl0LgfK3IBfvW69Xoy2t8Vbf3
	j08y5jI4L9A==
X-Gm-Gg: AZFdTZezkNQ1Akyooh7fDJoGO8oKWXWOYiwhhzKWYWqF29WfXA716NxdlX0gizmwNky
	jI308BiKNo5ylj9Oj91fhiBopeqU3qnEPowdQKe7fEgddp9oKpWoCUMQ5U1t4vHPi+OMD/PRtIW
	VzuFDSKaEpDxd5ez/9XjiLppcggU1G2Ma/qbsklDfyHn21gL6hRJQ86osfPdWgX1u4KUrPz0KKX
	Cw+eM3Qdj8brW8M/ff0isqw64mCEyjjLbDjekYeqFtFa45QRPYmdVJ2rKcWigP6XKAwaYYpOFH/
	k13nSBzLcKXlqh/nKljCx0rK0nlIRCGjwpxAJjkD623qsC4AUs4vKfw/lzkHQfFMaSPt6A1Raro
	aP6Z7w06aIspHtvsD2tqZIiLrmAwqA/NmFDVcgreS1c92x3ZvierMzJ8NYWjkXXhwyNbVHLwKbo
	7ase05BDKSmAvreml4IFqcMTU1nmYuQitxs+gIR5ThxjMX1WAigbW2QKqj2tYUkwjt8b4ucvyOF
	lVlyZB9Fb+RcXqSX0T6lDzr5L4J2ZEy1nN+hqnw6C8V0G7VgoR1lS+wrn5Rv4Ly9VCkQld1Ckop
	Z91jI8KWEfjYgJoqUdqxlJKKzIlYPa5/mH7Vn3APQpx4TOV2fw==
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr179650485e9.30.1795362239768;
        Sun, 22 Nov 2026 07:43:59 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm124899915e9.1.2026.11.22.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118100523.11395-4-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-4-changhuang.liang@starfivetech.com>
Date: Sun, 22 Nov 2026 16:43:54 +0100
Message-Id: <179536223421.2728475.4581137443338131034.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Auzs4ujqrLqv73w/LdDQcDLJr4HOPar7zURfN6DCgsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMvHv2TjpSZauWVl+5civr/YNXd327fkT28oZp9925r
 55bIreqvKOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQATObCW4Z9CxquCpZGC21aL
 Nnb/ULh3MGJ1xL3LTCLMsf2bf3tLXzFnZJh+JWddZY5f3cmoAvMfRhNWZsfl89S8vsdicKVzk/h
 XXn4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table and reset
> auxiliary device name. The reset auxiliary device is registered with
> jh71x0_reset_controller_register().
> 
> The clock table is made of struct jh71x0_crg_clk_data entries, where
> each parent is described by a struct jh71x0_parent_data: either the
> name of an external clock or the index of another clock of the CRG.
> This way the external clocks need no index of their own, and the number
> of clocks a CRG can provide is not limited by the width of a parent
> index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
> used to fill the table.
> 
> The JH7100 and JH7110 drivers keep their own probe functions and the
> index based struct jh71x0_clk_data for now.

I trust you'll follow up on this.

-- 
Jerome

