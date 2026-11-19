Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087123;
	b=WnfB3xp+lHa5S23uQdj/oL8TfV8faiZK1MVfiC0ET8WHgfburSppmF2BIi52yUCGktyb
	 lP5aN6ZOKm2MG7CagBz61Zy/GkzeFWt8fhIq6OMJM5seYg9YAHC+GZmbG3iO5eTPzW6u+
	 4ogW5wbsRaRKRJ7U9qrF09VZMIXY/NWaIRLy5Ny/v1JYa1OiQsiQOAJrkkpZGeg2wCkEs
	 VZZ2Md/nZa4cZWzNc5DLsrUeAuvvFBDWSo8l/ya1xCgwO0tf7ffW5VZJaoQu4WJO3J8HW
	 loltzAukfzmmgsmNT/6pk/lYfNxATOK+D55dooyDFnvVGmukTaEptiQ+Or7fNE54Cng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VrCvkLrp/royT60LvX87nJ6hEmqSNe0EsAi3XYZ2mds=;
	b=37/fO83pC7EoYcja5CoS3oo7hDH0JxkXZeE5d7PWkWp3hFepYGaPxfy9oJw3sWm0OWci
	 s++YzQfmowrvXBnSp5JAX9zCG0MymOe3IQBn+5VL5ZMFfceeoXQNJBkN8PJQv1Ny0tCGu
	 nStF+Q1gTd6cr7aOgtJLKu1to5WTcW6XBYjsfjqEoai7Vn36dh2GltXO71T+fzp5vupOX
	 MhmaI70xzI9c2h0jBb8hzLKthq7JYxpIIoL7+0AAJn+pMciHaWMjU1tfvKMYDWPlljATU
	 +N6bknEiAblyEB5xt5dajeV56Nkxal4/JD+IMph2JcZdiD/veCs/xMIWZijjvGf9AKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yw1+nWQX;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 50E6F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E6F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yw1+nWQX
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381d542bc29so3873089eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087122; x=1795691922; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrCvkLrp/royT60LvX87nJ6hEmqSNe0EsAi3XYZ2mds=;
        b=Yw1+nWQX/9MPwkAQh8pdVQIdLTe/NkpdOgbv+Hll9VJQoYPfSURkPu2iscTiJkjEct
         TpTa0Ptw3z8VupAMDUdwL6ygvS39Yn5ve7hKPF5Q+B6+04VKOjLIBq2KKBqXfwRYy3Iw
         +oLKJ9tvXlfNyk14X22x8S0UMhzanidJDLQ0Z6Ryh/Ui9a5UeTGY1JBG0OUmc5jU4f6G
         LTZyf0htrPp8Pm953jpotEQR13HKi5NqC3e5weOdI7242gW20nnr2gOVHO27wxi9SGrn
         3aOQs5KKbKsmT895tbtxnO8OJwW/pe7+sbIkHUKTC3BG1sfiQhXBSOqXfHJSWTizaMQG
         ZrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087122; x=1795691922;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrCvkLrp/royT60LvX87nJ6hEmqSNe0EsAi3XYZ2mds=;
        b=eafJsH5Hu1UFSlHpW77g9Jat6tUOMN+Wu719czGctDTfrlZf6hjTwkhQAutpsqU2py
         3YkO8fVXk16URHkjuzquBNEAsLWtfsax3/zh/jQeKjqwLKQD5yxVSUTTAR+haEHVh87b
         CAfkpYZTC9xOkMIw04517JUzEtISwqkYUeVGDQi8yogZ51GAtF0nBTZXjlXhJJRMpVmS
         J0Jl8tJAZeTRRwUy9CmyOecT8GoUfR8sL55XgIji9q1OQyjfRjCIpq44UkVR4L7XZenX
         6i7jDQ/tTw6uL8fUaY7R126Jgfpv48mRIxjsBQcPTpOmRBTBktnTQs8zzC4cJ//Zb0fQ
         Yung==
X-Forwarded-Encrypted: i=1; AL+hErG/whyaSlStavlhrE/7V22RW3wUcfzYVFdY3/mc4OTdtS8oMGgILyaHep9eO0OWS8EB7jjsO1+cudJR/Hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YS9No3+6w0P5tOLcRZJLM0K9edwTuLxKsh+Nx0qk5707gUX/0
	/7fPBUAIVQiNl6EuZJXbzPJ795iyNp7zSqwszWRgcYfv7YlepNOCl70NCX2niIgN0gJodA==
X-Gm-Gg: AZFdTZcdZATsoBAULMwhzdflQbjNqKuPnHizAuSaUIg7DmJjqpD0eMhpoVdRV3gAMC6
	4gJY1nlhIlmOtNW3KGWPoz7n9joduKxvRIltblsYndqTklhlisnQ+0svmBQxD1/t/taBDhG/Zj3
	SU5r/vOAabYUnU4HEAoQ3+jK4LX3dRsfHfQO45e0Onb/B4nsv/c3694TYGxqZh8VVaI+w4ZTnvW
	0a9xTQJu2iMqfzrWhxagQc8405s3dXOGocN6JCf3cPwFSGM9bVLGLIZgPzTK0hFpFK3Mh9WpTsm
	VU3nYXqxtErGyA2p41lqtenZ6V298MSFjjQ44ZmDqSXmwqr3z4o4VtpdiHA8cVba1qkIr3AZ7S0
	QKkaKRFQJXBsByyo33G9KWcHWDJWyTzVYbyiT+57v9nL0CZEdxqM1cIdSuLaGcZhn5yXisCn2CB
	VMlmrnRt9rLUTZq9NvTVKHKXFDCYjc8HiLeCSnzsbViOlN+xy3uRHj4tcRjJX3n4Aseatrip7wS
	vy4YPXySIWRlRntun2R5HQmWkIX4A48PKtDkdGmWFxRMfEf0drWkRnkb1DU4ekKlAc0/os7ZpFL
	s5YHGlMo/26z8CfCkCCUaacGvZYACUaC7Kk2kD9a0Ge2ipxT50OU7ZhiYGzgsXi8/TWVCNgM3NN
	aafbnyViVQNm+wJSG8blQOhql
X-Received: by 2002:a05:7300:b2a8:b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3828171b0afmr5821926eec.31.1795087122102;
        Thu, 19 Nov 2026 03:18:42 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-382a6304efbsm27440350eec.7.2026.11.19.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Thu, 19 Nov 2026 19:18:35 +0800
Message-ID: <179508711555.3615492.10674834361832600268@gmail.com>
In-Reply-To: <20261119062203.GC2300348@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261119062203.GC2300348@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

thanks for the review.  The code changes you asked for are in my tree, and I
would like to check the testing question with you before posting a v3.

The delayed work is now disabled before the interrupt source is masked, so
the handler cannot queue new work after the cancellation, and a work that is
already running cannot re-enable the source behind the mask.  The shared
interrupt is unregistered with devm_free_irq() rather than waited for with
synchronize_irq(): the line stays registered for its other users, and they
can raise it again after synchronize_irq() returns.  The RCAR_THERMAL_MAX_IRQ
comment, the loop variable and the two comments in rcar_thermal_remove() are
as you suggested, and the shutdown flag is gone.

On testing: there is no R-Car hardware here, so what I have is a controlled
ordering test on a KASAN kernel, 17 checks, all passing.  It uses the real
delayed work, workqueue, wait and signal machinery and a simulated interrupt
line shared by two handlers.  It shows that a work queued after
cancel_delayed_work_sync() still runs while the same queue attempt after
disable_delayed_work_sync() is rejected, that a running work undoes a mask
written before the cancellation, and that after synchronize_irq() another
user of the line can invoke our handler again while devm_free_irq() ends
that.

What the test does not do is run rcar_thermal's own ->remove().  It
re-implements the removal ordering, because exercising the driver would need
a real platform device, MMIO and a thermal zone, so the behaviour of the
interrupt status registers on real hardware remains unverified.

I can send the v3 with these changes if that is useful; if you would rather
see a different shape for the removal sequence, I will rework that first.

Thanks,
Yaohan
