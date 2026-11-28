Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875867;
	b=pzPq2RnRzf14TTbX40LuPRsyRvpZI+4TAvzkHiihAJFIdiUvnMjc0gerC7hndT+6RyE6
	 YniEacl5tXJCLrhIpoO29SBXO5tetQzjqDe4W6E54at0z6tQLzEEDD3/rrxv6fd4kGZEK
	 eI5Y3owmWvh8gBIiyjucZCBIrmS4MvvG/Bc5H+JjX8J/O0KHhyZ92gXPXSuJ138VrtBOg
	 9y1bpgT7zRSNp0LvRFqFMLm8fdUVaATD4UVqCPj+CvEzqnYtaV+wUTIhSdTU5ohmErw3I
	 9ID8+wQEIIqG25/LI1MpI4+NJaxCYYkOfngzSzA7NMPXCtUBhI1Mx2zXqXLB7bqOjmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5X8d3HsDBivPLdnAdOrzG4BO+ebQzBXrIMOSDxhQM0I=;
	b=jqTK2nZZtyiStjJ8R7pfq+WGF9sFRdUm+SDVW6PmifTL+AAN1V/6QmFqam/eNQVRador
	 sOyZdhPnDymQB12fwsrTT8ej045kmWtmKYjppgRx6XyYD6Zon1mzeRwLw8rPWSbpQqaqS
	 q7aFeRdbG3KNkCmKnA+yyZmE6KRIcNxQHxisg67JJgNnp3F9ze6OxPBX1FOj/ydOi+Tbx
	 Q8b2KyywHZiPV9jGaHS28YZx6e8oIHMiuNnP6mFzfLtkkNpSYvHYrrZOKrrpqsIiOXnnz
	 5h7w/oqBO2TTymdo6tPP+qUHdJY3goBn+DXmkAchnz5SRnTRlDafzKKKpPmoa3cxP0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXvWUoup;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0DF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXvWUoup
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso8123775e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875866; x=1796480666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X8d3HsDBivPLdnAdOrzG4BO+ebQzBXrIMOSDxhQM0I=;
        b=MXvWUoup056aojkZQ64kDIhuF72O54OMEH/2rvWL0ShljRoGjaKEqN03MATwapdPF2
         baf+o5EUuQKsYq7e+b1wKfnu1a818OdkTOJL1mluAV08w8E4rYIjKwj5GqHCxlrqNJJs
         sZJ7Ympoxh9gYih8zbcOmyB08m9wco9SlU6CEzHlssjmgAzBcj2GiPtVaFEnqVFwEu8b
         7bPGyaeZpLmRwOXwCE/yW03qfzxtJuxjMcctj4CqlGvfEyNorX6rQ6kjcJsWyniTlInf
         DnCc6jAE599wdemXnSerfkcTx3LIEwBn/c97tb3Ajno2HjE2MQtIHWHpkJsJmXp5LoCC
         Ikcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875866; x=1796480666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5X8d3HsDBivPLdnAdOrzG4BO+ebQzBXrIMOSDxhQM0I=;
        b=gUEfO6i5xGjfbK7eF+hj5b/65H4TpuLTTObNqezFyywSGAzSbpnGmepc6dSr3rmIJT
         yNML1Mec4CX+Qp3heFanWXPNTsoz78Y++40oax7FnTMvDYiAScoBgAKp0fy45qnUBQLA
         pCDLBJx9OE8q7j7DakS9oSqnzErhk9dOzeWTjxtHS9h3K0bOzaxfw+vUshhSiTAI+29F
         zhtkTvKCcTBrBVYZ45ex7hR6rbw+2nRoJq/lDN9PunFML2Vmoih//G6e9eSIgdacfoEN
         4QeApSZFF9+ukWSkDYkAyV/MymWLhlq5eviu07rkrSxfNO76WQ0mqqUQeJdKeQ9grz7y
         9jyA==
X-Forwarded-Encrypted: i=1; AL+hErGjGuAmh2J/9rCLJTfvkzD9Flpsyh49eOu3RlTbZP1dfT5arNuF/u8ygphHznZaJm0tG6oN0Kl61d4K4qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z966TUnKAZ2UpIcdgQb6ZbULlGOMu2BqBk3TO0oXMsVI58amDsT
	wmOyr1N4CL1aWB+daAn6zzwQopPKBTM7NdCBz4bVseOR153cSdQ86xKl
X-Gm-Gg: AZFdTZft7tAXGGRsBzDRA6rr/88YtBoH7DSNfdy1jIHr38Lt/drn7r/XJRA9/keAmMH
	H1w39FCO8HwB2uT79QQxNAIx8XD9tI8hOrevGOZffVgOuvlUECFqTOmHsPLZCmnjo2CRoHCNPDG
	D40vw5bICm2fj/4dXRdkweXyCcm29BiKXsEvUPiy/EO+R1P2GpOl3rgWuJwIczCfJrPOvbnIG4D
	TFjjIIAFvSmokQrk4DlXYGmz6dEYEg4iWkjOTE7VRmi3p/2p43Rrh6FTRj7A4SawxEjd4iH4Mz9
	wf42Mzt1K9C1KiukvMbhB40aromuo6KsUJxO5q/iKJ3duhs6au5vio+7VLmir2XDrNr5kOXoiqL
	dM6XBBpxDJmjQZbcSklWTSG8F6/QoKmb11CbLQiHjgVUJndDRkROiCOxiKu1NQJu3KgfkX+/kc7
	yHuREJsp/hQzJkMMibsUQu9dt1WbBuqIZ3RRZ0ICB0ph10x6hDlizgRk038Gsd+iK4PyTY8jKTy
	9ZCbk7zQAJ4gI3KwTMiXUS3b39oGfyb3/Ltf77miUpPNmKhUKOZiNzXYeZ1WjxyypKNKy9eX0xa
	xNuqZ/hhYlSjNJPbZbkAyel8agP/YlhZr1329ULQbPXkfF+5PSNMOACMp/zdmz6bsBz6
X-Received: by 2002:a05:6512:401d:b0:5c3:38ba:937b with SMTP id 2adb3069b0e04-5c338ba94bamr2049562e87.36.1795875865485;
        Sat, 28 Nov 2026 06:24:25 -0800 (PST)
Received: from CCM-PC ([2a00:1598:d30f:a700:4c20:59e5:ba8a:3252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c344c5e10asm501588e87.43.2026.11.28.06.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:24:25 -0800 (PST)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Stanislaw Pal <kuncy7@gmail.com>,
	netdev@vger.kernel.org,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [PATCH net-next v8 1/2] net: dsa: qca8k: let regmap serialize register access
Date: Sat, 28 Nov 2026 15:24:25 +0100
Message-ID: <20261128142425.5385-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261106225403.272212-1-yongzhao.derek@gmail.com>
References: <20261104120130.48455-1-yongzhao.derek@gmail.com> <20261104120130.48455-2-yongzhao.derek@gmail.com> <6aca850a-ef67-4451-aaf2-977be884d1b0@lunn.ch> <6aee175b.f01aa0c8.37eba4.18ea@mx.google.com> <20261106225403.272212-1-yongzhao.derek@gmail.com>
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

Hi Ansuel and Andrew,

I am following up on this thread because Patchwork marked v8 as
changes-requested on November 11, with no replies after Stanislaw's
and my messages on November 6. Stanislaw's MIB and management frame
series has now been applied to net-next, leaving .disable_locking = true
in qca8k_regmap_config as agreed.

Before I rebase and send v9, could you let me know whether our
November 6 replies answered your questions on 1/2? If they did, I
would keep 1/2 unchanged in v9 and add the two-reader work_buf case
to its commit message. Otherwise, please let me know what fix you
would prefer.

Thanks,
Yongzhao Chen
