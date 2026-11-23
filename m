Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434533;
	b=XWsP4dpQaWuALsawkkCmY/zgd0qeTLXUOTvhgYegFi4jRXeLn7Dx192upESDdx+Qd8Qi
	 tRHAWC7/1dHRNpdNPJhgB8+2KH3x2U8f2a1ArbHD7nQqIPCD0cIbupyePM3HGnJxzLjTK
	 IWDBNW6c+XaWvHTytDcWGv2BU3fLOoJyPGC2zFs/JWP3kTDQ+RGdTkssozUSait2wM4iL
	 2oqgFzsvRNikDECA6Bt9rrXJ77z4kMZaM/kubXJYdOeAss5/OoYiOaufeNYecMLvZZGyZ
	 iIoVbOR21YDRfMJH/1fc+qeuaB4Wt7QPLuPxrwW48elUKZNmB2Q9CK7VGmTWCy5SBtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
	b=jm2/2ezipUZnYha3g3Fg4uSu/ezOCy/rls273CeGm6Hn6yXylsqYzUFfdigDh5d6g+6R
	 L64T81jyjiHvwoBmPWPT3hQPIIf545+ryHxCakQ6lWgkvZe5hSJCFn8HCfyCewLwZljqO
	 gmJ2dGwOuzXRmMA935H8Nr8aFtVO1+13gzI3pxcO2Np25DKoQ7XfDXyw6bch6UjATNvBx
	 DHJo9i94gqVHuMionK+1jOAKuY/af5Hk/mGP5kYg53Cme00aHqhot9uDt9Gyv3ZPadEPR
	 +CIK9y/NfrAdsnAvf3BFZC6+lSw1Y/Yu2cwcYvu/Jh3yf8CQT11AGiFTK0fvHIsh4rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C92606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C92606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99075306daaso1615775241.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434532; x=1796039332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=PtBRx4f0zHMPWrKCeYo4jmRaJQ1LN5JSKPTl8SuaDwwGOylL4gwkeWZuRFAir8i0Oc
         XB5k0mzLRktyLJg+vl6aem4aZ3S0217Q3kedU2XJ6a+Rx8VhSCyQSgIcPtDw+IP9ceJx
         J7XQA7M2DQ9QOU9CoOt65NNP+M3zGNqHutwCOtJDBV4E2sybFUpiotdRZ3ia/0Br1aW+
         VZ6Kom8GTYEPap127qiISr/1UNfo3AcD6EfhKm7hnT7W26Ny4mS5A50oLqj7OTJQAqFu
         fZ9Is/5bx67lwhC+m4nxemqFdjv14gTMpbZYwWIzCosqHuaHMYyuL2c09z6O+3MlbY/5
         9DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434532; x=1796039332;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=t9Ie1RZ70mx4V9Sw1E8R3GQuxaXliNMy9ym9hdjzecf6TtghPPA7AJ5Z5eWeyi9+qg
         fENhQN6ESRuLXLH7nodD12UWVuovKNG8QFRAENWaOEAktKmyb1tkOJoaNjRdcID5wLPJ
         2DHhN/n9y9/EDsyCM7WESxELci1PXYOD/Vg5tVbcuiRTdHr4BoT09JzUMPyH4VR0G92D
         zVkfm7LmUtCiJ90hom845uV37v0EesCahSiBRIoSgvoJ+MLqL7lm9NOKcNJS5bVDVN8X
         JqOjP3DQpM33qLhAEO9/5hoed1mOK78c46l7sof6zvA7ToMh6VNUdDzn806cd8xoBh5Q
         lXYw==
X-Forwarded-Encrypted: i=1; AL+hErGbHGevPG1UM3ie+jSZ4KkTYd9RDuk/mXaYsi6guuBf8qfURME8SGKYePj/nvwR2jGg7Mhog2OOxWWgDDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VhF+U4R1ixnqxZwNdKZQNV4mTXNpam5mTklGsDXMi33IYSfs+
	PqtMyg7Xcey4nsLzeFqx/v+uQLRAMNU5lwfyvqrnN03MOzUeofiei4BU
X-Gm-Gg: AZFdTZeu4OexJZap9gLeI4rxRM/G9UPe/b+i6Xm5LTqmp1YXv2FRT77Fzrz9oMRaJHD
	oIYs9UoQVEnind8Ku4FG1fZ3IMoFOgkMcacmPYFtyvKw6GFrDPhejLaIhDTolboYo1j+i9PBcin
	yPrFDUu70bxthm8TTYDergS3SHhsEMwEzeNh57hp0hKs/no5dkLqj+r6ylnz/UKeA1h/EA8Aizx
	cGIXaEWXas07PzT/X5KLL4WDYIag4pfl+SRQIdGO0EvUe6HGydG70oflMboiKbeSENuhUNSGs9H
	RajDXYjNdMuC1+SLse6SX8Odft4WPBJ4l3+qnGuEjPoXJpb+5TEPb8rgjth/cfhqHMRXxDAB5Yv
	dRqEoIRugsBLkM6luBIZLM/ABmjZrHwLHzhPLpD6gjMfw5rEYB4RYY5h9l6Ks5JK+0dmC4a2wUf
	ipryO2w65XbE039uN58ma2dOCplF4VDYuVKpumd48o7yWih/rH8N+6gKcGHwcNqfnAOW66SOuyM
	052AwlkYG+fxW5ukEC/Nz97LZdjNV+N5cQiDtY+9Kit6QCxx3yEEKaLRBnMX6aI9P+25VIexrFS
	z/EDyGGHtiq+6SVHd+TweQRuQ+yGPXeegy8=
X-Received: by 2002:a05:6102:374d:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d7393ff678mr5339224137.10.1795434532277;
        Mon, 23 Nov 2026 03:48:52 -0800 (PST)
Received: from ehlo.thunderbird.net ([179.181.85.100])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm11676646137.5.2026.11.23.03.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:48:51 -0800 (PST)
Date: Mon, 23 Nov 2026 08:46:43 -0300
From: Felipe Stival <v0idpwn@gmail.com>
To: netdev-bot+sashiko@kernel.org
CC: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
User-Agent: Thunderbird for Android
In-Reply-To: <179538279534.3135.17423952957860887247@kernel.org>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com> <179538279534.3135.17423952957860887247@kernel.org>
Message-ID: <B373FE61-88E2-4F2B-9796-01B39ACF7635@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Can a poller that is already waiting still miss the KeyUpdate here?

Yes, any record tls_sw_recvmsg() puts on rx_list has no wakeup for
concurrent polls=2E This predates this patch, and I'd say it belongs in a
separate discussion=2E
