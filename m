Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978559;
	b=4J70qMpIFN/p5a+hIzjzUvAHBQkLOv0K5N/uqM1J1pLWhgT1h+57xON7VF/yQ3QOJrCC
	 jqba1oWgdjnvE1CkFEPHvMzx1l3uwBR78G2BgSvxNdAo/2ynkwNaDtsTEGvW8g+FjNYLO
	 S1II87odu5o5HQIC4e5QQGFkcGHTRDl7E6jlimhSltpCoKs0q07SgXGkdTarZgdWUZSOg
	 Na128SEv9LAPkCVdkEnwiJLRA37mhvmnJql4XmifjsBf5MoajzwNCUoSWAcIYwTT3+orY
	 J74uZMqQkviEptqQcwW9cmi0HLs9W4LgXJHMsQXFO0Qc4cyuyOs3+tdbJRG09RsNauw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978559;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GDWt7Xx8f2hrTHrvXOUqAMcvT8tyJ1b4aUv40Hj2kOI=;
	b=qdtu7lyYXrTRVIz0V3DqYnQboYk3DYHMBCn1JTGATL9lRkRZQaPmdkkhBDyC8aQdz9y/
	 ngNY0WsPaGEe7MWdA0KTspp/BUd4rfC0jY8ZE2erVchijdewBNjigZanCOF1WM5R0aw1U
	 ke2S6s5AsBrqojePiiYZpJ84ozg0A+lOMEIPvDwdMJPUJe38wgNj7m/byAlFpTKkbMx/B
	 DZvXpr8qqe/6a+6TY67zow0p4D6mUErmHQeBUD2wTdv0iJJ49oAfzDrzMbEZRJWF4BD4S
	 lmHDLYkBCtmUnEw+f16qmFIycfVBKmA6bOGf/a2cj8qBqOVU5vzm2SJOxiYm33OEW8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE6606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09BE6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so352620b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978558; x=1795583358;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GDWt7Xx8f2hrTHrvXOUqAMcvT8tyJ1b4aUv40Hj2kOI=;
        b=Try0kK6HhJE1EzYmJ8Uox3xqCl/y5gVFjw9X7y+wFYDw+d6j4vcyzONVOzc2Cof/Vp
         axJ0ZSViiLjyxNCLxjx+f4ZF4C61VyNieEa7GhkldI5O9+Y4nsIUWnabU2HBrJrxo6vp
         n4UVGgAlq5ICzxhqFaStrz3tfKMVgKxX5R90dDSo3lW9uJzvZrK6wJkAYwBgE16xIZwk
         st9rqLnNCzjA6EtEYDDCQtz8QgZZ0evddAX8OJiY/5fK8qc5IwHqG94LnYrBSmsI1f3f
         Mz7eqAJBfUveG8n3FrBd/FEeFxLJwVAp6cigRaUuXNBJmR3XF+/21qGKR2lZUrH0rXWA
         0URw==
X-Forwarded-Encrypted: i=1; AL+hErHy53ZN/ZCHxDbnQNr5PCeGfUKYAU2jY86gSBKBvANvLYn0Sox333nDy5/MASdPerNXxoYRiSjYeQXtjTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dkues2P6RFv4PaR6WdzLXk8lcKu4hO3CIJKAWXYjjxRuoJgoA
	CMLOdN1x2DITzr1BJ9miIlVCw/Aqehlcpot8LhheEdUGZAVIOJMHHGwXEJIKBMWn
X-Gm-Gg: AYBFou0Gof/dxqUwL5upYiOC7kQj2d3/j2w/NycP85aDz0EyLhNVhlNkM2QIKXFUIe0
	ogL5Oq06ingIdC71QiQQLF7s1F/MGLCHDOj1IGkmt9wih0ZScLDRwiD2xrJkCD2xdeRPXpYqp54
	5nxZCDER2PwcPu8p9L2N0CZKcOsuTp8EBj0b6YG4LTQ4C0ik/Ex3sOUhspTQws4KSHdR+CuwtX5
	aot4KCAQmGS9ws9g+jioR0cqfgOxwKCFGuxEZsX07JRkEDHFeLYiKt0/ZYL06rrdzL8o6KFtMlY
	OAEvFxhkstALeI58ntPFqIZwFEl2jUBW/qARqVRd0P0fzxNoAZFICaaGJsdtBd/xDx2AeqrdT9Y
	ug2PlFLBK1jQ8X5g3y4uRQaLG4wHvmNI0xuxT4+IuiQOFzkDqdxVBJAfyjxpIs5Me5T2HN1V40K
	U13JGaMk8gAXEM0bQsZHjUVQ/ZqM9gyMmH5iZdgNOPEc5BYH2sZrAlw3dHeIeQoSk0eCn4PxfqR
	Ctd9h7iJ1FqQnRbGr+WmYR2zd7sMarvGVN80D+sxAZyNbJhuOODwA/F/QpO8I5SapbmNlJS4ooj
	JyYyVM8G3xE61JB6feeZIicILV7hKtu8BELsOGlYXgvc3fzbrDWX/rv6VDA7GApEHUuAbAMAxeM
	cjVr+RfY592mAcaU93bI16LXZ83bjxHemcla6Qg9Z6znN
X-Received: by 2002:a05:6a00:2da6:b0:8b6:59a:2aa with SMTP id d2e1a72fcca58-8c5d52a1a61mr1251888b3a.54.1794978558331;
        Tue, 17 Nov 2026 21:09:18 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93d04bsm504711b3a.49.2026.11.17.21.09.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:09:17 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso932922eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:09:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHkikkocIy511qr8JSgY3Zl2uNIKR6l6vrVBW9iUk1D3WhdXaLIHjWrOOj9DGsksrddI6imBG+JG6hu0wM=@vger.kernel.org
X-Received: by 2002:a05:7301:710e:b0:36c:3b8a:8090 with SMTP id
 5a478bee46e88-3827db0e75bmr1699348eec.2.1794978557201; Tue, 17 Nov 2026
 21:09:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
 <20261116-omap-mcbsp-tdm-slot-v1-2-6c9f7aa45a29@telaak.dev> <179495350668.2707353.9603940609466130588.b4-review@b4>
In-Reply-To: <179495350668.2707353.9603940609466130588.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 18 Nov 2026 00:09:05 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4QAvENNYMNz0vfjhwGPi8HMUJO8M3G0zBcxn6nBd1SrQ@mail.gmail.com>
X-Gm-Features: Aa3M54rshe7OANZPuVP9PlNMTTXkt0PN_Sfmm0dIkeYRICbDlqlKakJADXPsyNc
Message-ID: <CAPY4CJ4QAvENNYMNz0vfjhwGPi8HMUJO8M3G0zBcxn6nBd1SrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: ti: omap-mcbsp: Implement set_tdm_slot
To: Mark Brown <broonie@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Will this do the right thing with a card like simple card that sets
> the sysclk dynamically?

No. A sysclk of 0 at open fails startup(), and later opens keep the
last stream's rates. In v2 I'll only limit rates at open for a sysclk
set outside a stream, as simple-audio-card does at init, and check the
rest in hw_params().

> it'd be good to validate the params against the current slot
> configuration

Will do. hw_params() will check the channels, width and rate against
the slots and sysclk, and against the other direction, since both
share the sample rate generator.
