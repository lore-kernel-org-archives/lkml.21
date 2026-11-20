Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180822;
	b=aif9YQ9mbnKc/QUca7SVrYDZWhMuKFZCyTzeEEIkDQ1Kkzn+LjVC5q5O2miCI76UjU/Y
	 0HiBhqJ3QtOdK218CmFhWL++Qqk4PnbLqUijwqeFXQa6kjvYusCO+WmJlmLzOfqWpaSEF
	 Sico9Te5N6KYKaovgfKfwQcDaPo1djZhAyViY3YgBfjdR2muKBkpA9DEmK3j9hQ2v6l7E
	 7umeL+/3h1sZxg0LUGmUQx5lZXIqvlKK774nv2RnoRj0Aqn2ujNE2UoCdtvklOFNYhO8p
	 Vh3Q4F8IIOgrtMeZ9QkaFjcyT26GZPsT8QN8G7ehJS/paLSWo0Iyz1gCMTXsZa2ZaXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
	b=ObM/aYOgq/mSpZ5fzQwp1l/Y9wj3CGqKonmGI8Fg3mSfMcp+M3t3JPrqrad329oftQ6N
	 BeZRH3j7g402cCbdxWUTfOKPLN92FW+RlF1Nhs7C9p3/8LmX3cQKh4PKi16DsRhJPpq3/
	 Z4NzyZoyhyflYe/wa/0fAmkgYY6GfId7Y1aL+MB+xCqghPkfHyjhYl9q8QnXnks8YcUgi
	 Har9MWvS46LV7NulFS0wkHNT2G4KSk/XhWRiiq1YlGXZIlnI4JhcEr2s699zi9YGTwhD+
	 F6Df3mzX2AKsR2th+1jFKo/ab4NdorQPjWjg9jXVhfQhYshkz5eHliqXsZybavgPhWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQl+MLIH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A9B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQl+MLIH
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so550685b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:20:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795180821; cv=none;
        d=google.com; s=arc-20260327;
        b=ePlaTnL6LSIXkD2Kj4J1z32qkwY2T1a9zmokVVoNJpc46BRsD2EHrcuYN1FTKE3voW
         7IBYAnCi+7gWrRuvfNfJKXYjE0jqB9JqBJaJ6x5RkJcSr2zjMAgKJyStchTfSmTB9av2
         ehwoCPGbWSCnjk77mMB0/N3V8f6MocRuPJx3VDU9EW34T2amiTw0P445pBITlSrvCvCL
         PT9TpTuzb9iIKHjH69On96IhfFYTrPRmFlQ5W5hpAK2fgBjTwIgEvdKf+mOG8F+Up4dO
         fOwJB10KYk0PbNI00BAl8Q8RlE8ajsP92TlUSOKX8oZTR3lnECTodsinmLvNJrrUPdVV
         BskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
        fh=M29VzfCAxm2uZW7LTW9XX+VeC1tmSaGw5QWwgLYoi5E=;
        b=ICd5AXq+lIDxZ3SXiRJ6HmsERPgstrnu8YNc3kxB1xPKER9hzgIikA4GomAdwZ7cRY
         /y9cxBqqVl0YMTSLZQv/5C6y504vdcbK/UV7uctHve63+V9yTVi+UiPic7q4egrO/dud
         0MnOhnwXgEjh2kDIEmI6R6s3Nwo5zRPZ9xi1kTEn+gEgE73zA3YTRebHxOPpVTRjXv+y
         7ovxDYbn028FZKkBpGoty3esbLzGdnow38ruWVfangPEJNbGD6HNjTivTn0uSE8S41SD
         P+1W6QM1rswRoFf3gPEmZ0jc58uR8S8Hv4P9QUmwdZM+qFo3Y9babAnn/ypbRpRrixET
         +17A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795180821; x=1795785621; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
        b=FQl+MLIHdxwh2JgRj8F2f20mWFiFTwsxLkhLfw2HnmqWXMNLW053JwuDeRIRSNOisJ
         mQaJoHu4ojiilJTpBv17AB4JJsn9/4wDE+rhZoMsNVI2tayYp8cYevr9XtbJVJbLUV5M
         bTY3PTNTRvJLoX9Cqf2MvjnIc3OFp8TnJ7wV64uFNCl6fdQ3rA0hiM01aO2OQQba7GlJ
         RosslAOGIoJECwqw0BKLpQrz3hYjYagI4a9IO37GfHuBVJlihHHPWGevgGJrfumFGCUz
         +39Ls3Xfqs+hwDrG7t/dA6PFRsqqnWURHfyt9OIecMFITiFoJtA37Y0NgWRC8PnidHz1
         qEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180821; x=1795785621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UG/+FtkvLpFLlhRjXHK8IzxoHZEuN7shKZsx9WuzrBQ=;
        b=DZGqEspqsZMmMrPUr1rUq9R0a+szZioU6kWyRSBGNRZWuglgvd4JTTWnX95QH3NgFn
         xgOrgJl2RFF7gnzkX+BSi8LDEFQH2OlI+yf1ViPHJhXZtKBck8yiVaulUdb5bMu7znRi
         AMHLfxA4YKrFThXb2CR1n0Jm2LxCrb3vNNyeWEEYPXVB8AtooSC9uBuQD3TMsUsQlJoS
         KAazpYHlIu65cQcDHtUf6DbfxG3m/nwJ2uiohCwTHbllRzsBFky+zmIFqLsHnPIbDR6d
         S6DHXWnNSfQA8Gb2G/d+3oSc9iQFJrv4ZtuygsNupCGywnQ7iS1NdO/thZBRcgjRjqGs
         adRA==
X-Forwarded-Encrypted: i=1; AL+hErHhstSYB3NsVq04wvMVqYwPkeGcYSWUWPb84zx/YeimacAkDTMsDfe1RxBpiXWUBA2kifbmUWk44XOPjTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p3dliUpPdaYsCXkvqcASGwte8dpnTgQLGixt/IjXKovpR7rCA
	uvF36gq4ujBbRazj0XCnYr4a7sy+ICuTDO5tcuO7GyUUoEe4yG5cS8Jlpm5JV9iYPE4ShkXAPrt
	puUR3FK96qGJ/zU8DcYYClsDa8W8T9IE=
X-Gm-Gg: AYBFou1ViETylZ27bMz9F05pzlaDeQHm/EobErQIJg9QJGmAloFYAClC5AddhEriyKu
	paP5q6cy8OoqOkQXOC4e1LFR+BcmiH0xqEH/fVhIMRZD5ycIJPAj7r92zB5kH06CgCJrDl6FL6M
	Sa85WWhSzFmHroBdGKQSbBs+WDbRwQ8UOFSgbtmaW7zVNAz7N4ziIBOIy/oOlEc4jjlFE0CNNIv
	lo/GHZ/On329XDJ4bGaolzuyBjyVeRMDbmP2ATS8ws2sX9ibl7oFngIvTbm71jgB/x72DGKigfr
	UN9g0urHVa7UWRZAqHuw6FGcgD2v1cYE6zKGg14F2icgmhYkNJ46nYiOWsFDaM5Hs1uxSC1Dlcs
	TQJ/mRhAOM+qKorYxdfBEKKOqBhrluowyDrW3OrzwMfHESpUCwgk0QXRJVwmyB0mVCV9y8SJxru
	7Exyi4EuZ8lEPNfVGnu9KhAJY+C7uHOTKrZZAgb9Grp+9MloQgr9I=
X-Received: by 2002:a05:6a00:124c:b0:8b5:b676:4a90 with SMTP id
 d2e1a72fcca58-8c8794b98a3mr3126684b3a.2.1795180820901; Fri, 20 Nov 2026
 05:20:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030125024.612396-1-lefteris.koutrakis@gmail.com> <20261030125024.612396-2-lefteris.koutrakis@gmail.com>
In-Reply-To: <20261030125024.612396-2-lefteris.koutrakis@gmail.com>
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Date: Fri, 20 Nov 2026 15:20:10 +0200
X-Gm-Features: AclHuK92flz41PL9Sb5dfrDaVsUaZV45mmq0Zil7HOyndVUpO8HRVID_wLHjZ2U
Message-ID: <CAEFrfdndWX8_xP6N9GzbU1L_ajrGFE+4P260zXOCKqBiN665OQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] powerpc: dts: fsl: Add support for WatchGuard
 Firebox T30
To: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, 
	sshegde@linux.ibm.com, maddy@linux.ibm.com, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this patch. Patch 1/2 has been acked by Krzysztof.
Is there anything else needed for 2/2?

Thanks,
Lefteris
