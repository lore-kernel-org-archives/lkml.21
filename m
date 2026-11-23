Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439876;
	b=jGT1IYSpJXEyyAFgdS8C2TZXzGCW7Yz1oNJxoFdFFRp/RbwNDqbFA3w0vomjl+DDaHnN
	 EM17/Tip/Yj1IW9+yDLSWcfYeCH/d/S3bTdawNfC/CLp66gNcuv99gc11l4qyf0s5oixc
	 u9czI9jEG2ugWx1kLLXRNXCi1BCuk/EvcJzlVKMT2VZ6MnYzvumheOhcDfXOn84zvhUdQ
	 ePzWgo+giLJyvXIlmTPndVZBdNKNCcZJ4UY4ogvviUr1PJv2tFdA6uzd8VT6xKoLz0SPH
	 PUUiqg4wIg6wXVDnBdW7LR4CVwhZADGYdm0r85kl/vrETLEW5YqRrHDCdIINpFn53lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aqM63nnQK7AZCxbMeML2f0tMbQ1WjiGdxoWJz5+hbwM=;
	b=OH9QUw7fzNv8zu3rfBL/I88wLOTrDxYE9kigniQ0+utg7N+lpAaMIz2q0WNtM4b+NFcP
	 3EYH2/8rjdCgTMI4RchYotdiiT8JRVwfyTZWGwr7wjO+J0PKgQGY4q6jon3RJaiM5PDwr
	 nqDH379VTi+/1GAi8zH3VHj8/pHWahseQaOCUnj1cz9oO7YaFVv5toX9y1eRE7Nm9LhQz
	 E9ze3HBQvnKbr5w7teBV7YTvrUaIBcaoBSAMv9PpL1m3rsBnfSDddFXmIzAheFIZPrPPT
	 nbcC46Qny6DBIlm7UgCPcQTQAbtnleubIMtnbTJp2Rf2bqIrMsesue4ALQgju537OCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdMfgzpl;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5879606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5879606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdMfgzpl
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1607087b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439875; x=1796044675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqM63nnQK7AZCxbMeML2f0tMbQ1WjiGdxoWJz5+hbwM=;
        b=tdMfgzplRXOZIIP0ZgnOxEtGeNma0sX7iehF+JL/oob0vU3FsnIrCTY32oNWGOFxoo
         7JhNCAw3xB1ZixXe9RaeXGFri92mqDi8stV/OipvXCX68BKzNOwc5YozME409r1N9bq1
         9Yffhx+YgipdxCGI2RkcMzpAnpBzx6GhpzafeIB7UKai3oYQW0f3m6cAXgMwobdEUU5O
         RIDcserCjuLLJWtsl6YNiHydmyfJAaFEBD18JR/PTAv4maYFhELfRqqu60ct5lrPkMtv
         +SbkYwq/RMicxCN89q7G3djtuTDp3IrPcy1KSwF3uxScaoPN0e43T/pcIRmjEMqdBL3/
         /NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439875; x=1796044675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqM63nnQK7AZCxbMeML2f0tMbQ1WjiGdxoWJz5+hbwM=;
        b=OaHgehP7wEIU//5WCOMgujx/7R448hNncO/97WQhwCC0mskd87WykujMbXCR7b5Qmp
         ctIbEit3Su272pA6gBAbVv/XqK7rHmwdwqoQypTsHreisHK4nSwP36JrQvGpATAQzf34
         MtY8/zhBBxRpcxkFVnggPiRD6QYEfypFh8KkdcVCgN5i+awH2BW9ar3gbvCUp9Ew5+fy
         IOopcu3OUUdc55Y8sIqyosYE6bbkTDhRVg3xIyFFpmEJ7KQ42cYg8rfkCan16Tmv5GO7
         6LNRb85/F4Fz0fOQ/lSd2lidyfjRNq8PLm4iaPNY3XkKrXLuRCPe7050ucL2cIgCAdjB
         8Twg==
X-Forwarded-Encrypted: i=1; AL+hErHF98WhhGznj087tgLyvmkFGirRHWukWOmo/NMrn9bflnDM5+c1iRPea1/GM+X0e83GisrRgnpe9tmrjR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87Z1fxq71l6ibPNQR/q8j9qmtuxbqJeYr+eiYk+/IAUgVI2aGD
	C+fD/h134mVcKS2I4wGWxLJRS5tKvb87F5I4RnFnWePcCxDME3jn8jwQ
X-Gm-Gg: AZFdTZcNrFVufRgkwKuuYntXu5i6UlLuB/kz3od7PQ5T+eSkGuse+6lHw0zdIjO0CQ2
	yKInCeYGMb1wOR3xDPPtw9zLUsb3ROG1o+YsdLbjTkNse6inq2AMF3Xfihw4msaRkWioKWvIjfT
	bcyyyj9WjXo5s7z4W8YDTQwr8HkuOZ9lmcS/Y+7L8rh6LWcvyDW+qgoMdpLYf3cGyQC3Lmq9OPz
	2N56zI8Q6F45nK1JSoq9iTF54MzUGUbHx7SjGmP+TQyfBjs/bjPfpau2+Hc9X2oRAmTfXJ2WDbU
	DkzZMOxxdaHHXL/JljHAr63gBhvhG8Rwy91hJT/VAxzZ0iil9yRN0YA6gHfIJg7qzKKrwdGVaLT
	iDUoQ4n4tG5kCA9fC7NvrIyPvb4IJvAZLmjkVfwB8un4/nQCLjxl3hVNiMtKItr0olZ3NHV69L6
	DAMOMmCEdA42o6QABYRRjkKUlHxhLj9El+2c+vmoT5/ZHHCkbUwJa5OsikhgyEUIbDv1vutDC1n
	FJz8T8d2R3I1gZJZb1FJxIo5TDdVYqy7KprXC+LB2tVToRMgc6P9yodl09PWSkJf/cyOOMsbzCM
	JEdcgd4gISY7PrhjIgyrG3PMZiVJ/DUJp4OufgpMKbPMXxx64/e8SQ2ddb9U0gf+YWLP/fqgiVO
	Avpk9Ufmom1l1W0J88IB22zU7ukqfl24orivTEZ7l4mqXXisOcHM10O40bdTLiAteL8DL5JaI3c
	oyVR46+KBDTyrKSVusN84SSkUc+njOWybRa+xjLn9mVw==
X-Received: by 2002:a05:6a00:1d93:b0:89a:5:92c1 with SMTP id d2e1a72fcca58-8c87d51b324mr9447302b3a.56.1795439875096;
        Mon, 23 Nov 2026 05:17:55 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b27900sm5605698b3a.47.2026.11.23.05.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:17:54 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gwendal@chromium.org,
	swboyd@chromium.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iio: proximity: sx9324: fix proximity threshold writes
Date: Mon, 23 Nov 2026 18:47:47 +0530
Message-ID: <20261123131748.16791-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awQfT6jSKo9pjxjU@ashevche-desk.local>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com> <20261122074649.239441-3-kapoorarnav43@gmail.com> <awQfT6jSKo9pjxjU@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 01:11:11PM +0200, Andy Shevchenko wrote:
> On Sun, Nov 22, 2026 at 01:16:42PM +0530, Arnav Kapoor wrote:

...

> Why not simply
>
> 	val = _val;
> 	if (val < 0)
> 		return -EINVAL;

val is unsigned int, so I think that check would never be true; it has 
to test _val, or be the val > INT_MAX form from your comment on 3/6. 
Whichever form Jonathan prefers there, I'll use the same one in all four.

> 	...
> 	reg = SX9324_REG_PROX_CTRL6 + chan->channel / 2;
>
> Note, reg might still be not used, we have more validations and with your
> approach the reg assignment is in the middle, confusing...

Agreed, reg belongs after the val > 0xff check, right before the
guard(). I'll fix it in v3 as soon as I get the val verdict.


Thanks,
Arnav
