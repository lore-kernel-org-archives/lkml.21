Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795651988;
	b=jLJ3iJn4p//g6uJ5K7z+KkuxHQG1opQYEKUqwjMGgPLKr04KO+tUpWpqlWXQdLvito1Y
	 1ZZ4guVKCbUwKhMOl/6lOq9C4pvD5eHhYNkOefERKPKoOx7yDVVgXUDRKtkKz2dgRoOYP
	 zVLlA46M6kOF7dGetVXFGcDpBzaqpWxJs1C/hk5YH1uSVWLrE2sDYcoH4SI4tAcynZTT/
	 F3kXUpbocFtnqYoERkT96NU00LhPJNAMXadaur3bXvaZX5cUEVcTfF7ZhE7GJ/WZCE0qW
	 je9Dvv1/Xouc82qrYRB/VmF5zl1tEvK+xmf7zIOW/3HZrVo8E3kGsNubMWVFEFJqgMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
	b=KTMv6c6Jban7cCBfyqrYlQnoqH3gNuTNT2a0IEB97II1Hw5WzUSv7u8ZjDFgpgEIUhKw
	 7PPaYW++7CywfM5kx2iqyPzCF13+nkc6zljyBGtD/D0FaLVEmTE49z79bFzqdwCO7247L
	 AGRbsEH0Cnu0CV9eRe+ehbztIiOapmQ1G4RA8BrvgOIVz3mH88jiYvo2SwNFS+fsZKBWI
	 jyEebvVTKy7TscOWdD5PAow/P87VHLJQwkCT+D/NZwQaDXwCGRxB8gk2jT0Pg1rRcuxDC
	 WedWEafFF6UBA0S+ujgMKhnoJF3qWpMnIBMXxJWNpTr2Gcje8soD1Pjh2le2CMmghOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5ZMaa78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2722606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2722606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5ZMaa78
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so51594195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795651986; cv=none;
        d=google.com; s=arc-20260327;
        b=i6tlnOpsluilILRPqqTOpYV04ACD4j2inyTxxRRNZyDxzU2PUA8+SKNmoESybhHk7H
         68J9lJJ1NFG4E//wo+mXRQi0/7MPIAjC405RxPk4TIJxKjTDba5D12Q+YRtA8ZvxchcA
         af8/ACXNEwZznQr7RNtLfzEuz6UYO/kY9Evki26vgDIuFF+8jipKEah+M2xtXhxwOpMT
         E8z7bWnlJGd5n0A4bP0qV7fhGaUgvgudKCTTNexlig/eYrNREAYh6VtjZspE2F7IKh9L
         e6l+8Ka5gn8T/9PrGS+fVNJDv8xE9FjY6/xF1frj0ZwzvgiVZfvQ7JH1jsMbjOUMgX3c
         vywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        fh=1u2YxWa5MqXAGHLNyXQEkRSiZ7nCUuVzFcgDREx3tqs=;
        b=ZaT91l8Ybk05e+6p3gA0xLTbGGAAOkYBNuO5rLHdQ6fywT8aF4SuQlwi0PqomlRv94
         0tAGC6IUjQj3IoT8DKGEVtABn8mAixCUYuG9nlbx8qE9O9qSfsr3b8WKrby9e0pZd/Gl
         6sr4ErFudtFjWCwDrXT3Usv3AFS6o8dV1jgK2uXcY3RsuQhm6BdvMT5yAT6MfVkWkX0Z
         ER7uGJwFaQmU3V0NMdO70A91jRw054YEEYdVRaspq6OBWhSKqsiNmciWa/tbUtbni6eC
         n96PnvuGGsNgCzLvwtUW2KVGoB62KBnjlCwKgOXp+7h2QLYtEovSYPAddRwUWwAn7sBX
         X8jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795651986; x=1796256786; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        b=N5ZMaa786HVLIXm4kJLIBp+7wktWZwdl5Ff5A4tnHAaGTbg1dOQN9JC9rn/kUqy0cI
         +06XaTJghywoq+N69s8aZo/Ur+L46R2VyCWfGB/Jyf3wZhV6HfqhlvNCjpUE1MYp3hkO
         8fKCzwhV+4vDlYO902/9eXQbM8c3grv6SA3bfa9biJe3JOM8HAMTwWa0wEL2qWS5Tgv0
         A4TSGPBgVu68BtZsWvKX/lI8G28y1QfacQfqnOpPVOMtT5yd0Ugp/tyTLrsuedk2CHVu
         4//c5aQtjPtgipJia4CT8MkHRBwL3U5d8lQ3NL6fO9wIw1ULxwGHZqDmp/rjNEGOneZM
         O+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651986; x=1796256786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        b=UseQkK8PIyGnhz1HSGDG41PPxOcjc5fEfeMTzCUCZMKnUpCNScWTMm2WklXto2TRlA
         8jUZURUMVOpyIxe4RxdA+DJ3ziFfyVkC+8Q0YzaVFei9IIgSMeHsIYcxclWuIWyGGvwM
         SlRBEbe9f91gSOaaqAWSKVSkGSO54NR9eNLN9fKmfHiTi6qaqx3iGch+vqi9NylFNr5F
         Vm+3nU8k21qKcK1T26PnAOSGRYuAt1tXYLSLUJVzXP+ylhKO7C+y/ZQbOS8uBhx1Mv4C
         qg/OFh2MoozsSRHEuqky0ta0bQ+vKuGOOKmsmBI3rmGj1eCzkFaaOx5YOcRKnANolNFj
         QW9w==
X-Forwarded-Encrypted: i=1; AL+hErEGtlV74alMu9uvtASY0P6bA+6nNNNF48tveNzCvW28hUITmFu5Jqv7qrywyWj7JHgKXTZDCLPRnOSTm9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xzYEVKjmanD8rN3N3Z62dwSI87K/aq1O32r1x3JK44jsd1PkP
	u82QgnzkZx419gPPNBJfuu5Ji36qd+U8455VuPPy1ZLIi76Mp6/3WgMNgsLFbPAAd8UFNHUV0pE
	Ig8pExawjl89EkBtaWP6MMKEpwbUV9CA=
X-Gm-Gg: AZFdTZfnfObrm8bGQOSt0+NILsg6mPXwmdNX9QFQhmDiCdoe/F4OGCCmGVKSgRtp8TB
	Zp2/IveTOlYaYMHcnS1GClRu4tF7L0CwJ0stjr5UlGQBV/DBK69lgmnGP7+C9OuPYTbO8oa1BTy
	Ffju/1LxXw6SD4X+GnyYKLKbJ0ChqY1CP8HaeFTVHFXInqrw3+Sg0O/iEHGRXXUZwQ7zTxbDm4U
	O9nn01+P0DCViYp1Ve+NCwg18f2+Lh/FIaMCcciIGdmnxdjl6JE/JHpCXJIlt2sOKXoLlugF4FG
	/oQLtaaIELw+CSbWNOQUdYTZ4DbDACt0mxrmp/oqkKoGcGV0/k/rhk0Q0cr9CCnTSA1eEtIgq9C
	+ziHj2E+4F6cdmIsRvLfFhNGMzIro6rouCPbDc+Z12mcf/zAjLhHhf+E5BAlsjr7FmMY=
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4bb8880abafmr462648765e9.9.1795651986199; Wed, 25 Nov 2026
 16:13:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120102754.778283-1-magnusleatti@kernelriot.com> <20261125173155.2073979-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261125173155.2073979-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Thu, 26 Nov 2026 01:12:58 +0100
X-Gm-Features: Aa3M54qC3fGsiPPBixEGOnzpXrpAk5AzehFlhpO5G9XQuOCyUKhWAYQx7aS2YrE
Message-ID: <CAKx9m6MuwhnMGrcy+bBoCG2X0F2T65jZfhbSTGH4-YmsXGYm9g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown
 hook and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks for the update!

Il giorno mer 25 nov 2026 alle ore 18:32 Magnus Leatti
<magnusleatti@kernelriot.com> ha scritto:
> Thanks Yao, Maxime and Giuseppe! You're the best.

Thank you mage, you did a great job mate.

Giuseppe
