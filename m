Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773360;
	b=vaa6/ouFRhyShMtyjCJbhGRW72EKQQV4aMwL/YfkNrrjWqiIfz6qDXewoxdQJYRX+myb
	 N13vr5dhbI8/7Z4HW1+oja3ikSV8N5mg4A+FwKbY/4UQjLqbyF7ffzWXfgx7EY/BNglO2
	 KWIvUZ5zx7uagwuUQJxNQOP3fDEDQJ69Esa7b+l5JGx0WDbA3URxvO97XbZ6Q9tRu2Ckf
	 6jyYfZEiJjMWlmpKUYQu8Oq65+2FP1nGPjGPFc/tQ3Zk/oV5AQJ2WsWTN+8wKSKZ9T1OE
	 Pj3wK2zmRDv2pmIH4QVVeszaEod4b5Hu5fj//uqrabrSqEvfN9wcM5km2oOO0xCB92w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4DMcsVBCyuxSJxnBHMXvc5HVYKbb1XH0m0g8E3RsK/8=;
	b=eqy91uzyV7satNJc7CybMRPJPuaHUHqtoZqWW/gxr8Tu3INugJmzuTxxSDVaTov4soGQ
	 GnP6+Zy1Nx0HnKBANWdMtaQB58LyQFxTUnC6CyYfFK5sxKNNVvvshhK1UNEot20wpgHhX
	 WF1lFjGdbj1y/nTRzE63eIr0a9vKAmNwxGnJrzcjikVUm2j/J76nLetGXyj1S5ehxpwXd
	 rEWKjHggs9p8Fc2Scs6IOSrKQDvobt9WorO4MDBaN4B165AiL0ILpYztV4WExFlNP0YcV
	 0ZIRRVNs2zz7Pt8Li2azQTDI87XTCkr5Kzlbbk2KO76wDk2hodcVyxVPAuzwMg3YD1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gv4IehUl;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA1606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBA1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gv4IehUl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so67671825e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773358; x=1796378158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DMcsVBCyuxSJxnBHMXvc5HVYKbb1XH0m0g8E3RsK/8=;
        b=gv4IehUlAFfACXr1GlMwZXYlSNHe7WGQws8IHVxa/AzOOQGGN0RVv+3wE9e64abCtW
         7Wa/hC74CQZFdua4K3CyVlJ74Aplaj+Dcj6tvpkHzzaJ1xEhr1b9lnB8w+1vC2y6yeGH
         V9Ik3fu/oIT1X/fA9WBC2XYIWDOWIVShan1N/5alDShJBDZFkSTOT5sUlvnREQ8hfH2/
         t4ovdCnOEh/aCwS9Ykir/zerQrifK1LJawG4cIYWJpBHNwSzg9NfNMNId8XNsaxGlOnb
         /1vwCxDHvcHNmG4tpEr3hx++3RWDxOFvUxuM+zKcpF8KWj2RW5ejtCCBOws+U54Z594d
         qvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773358; x=1796378158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DMcsVBCyuxSJxnBHMXvc5HVYKbb1XH0m0g8E3RsK/8=;
        b=Ly+VyXa3pNQ6g/U2+6ZtUn+WoVrG2jA7kPDV4Qv1hCEcxe70aodtztKPmysxkBLH4P
         OzFNas05mZCGzAx9PeQms7k5RzdisxTReBBlIKJKH1xVsf+wZLxUJ4Ex3LT9o2cPYsRD
         QLt5aEA7DBASTmesVEWqCWLy250YO6hmpMEZ0YwN2QnDfTI9aWMsfj166gN/FnXv5MwL
         /AEnE+KmhM96Rm0MCVIe9U102hsmmu0bB5mTDFhi/txeJ+tLtxXKKdSzlCxhzxZcu50v
         V3Kc6bxy/449iCXcWxbD7Hib6ijucffHeZAKQxSyTkzaR49+I2tXRUo/N6zvlwOhSyXs
         AnSQ==
X-Forwarded-Encrypted: i=1; AL+hErHS8v8Sp4k1HUaeHboKzJX6pAhGwXqu+UPeYnXhv8/UJDK/Srt+fR08iLey7/JNraj0Qiu2zN+T4QLt0aA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QNnMsmi8k95UTUEU5Zdt0L27G/hYAGkQzxmZAJ3Khd5TfINqu
	hewlS87PvWqmx+LSxidQLD0C/vAspfjqTM0mOU5zk52OZ6figeEKEAf2
X-Gm-Gg: AZFdTZf9zq7HKiMeI3C98PYp0l0pDmDQURGnV0YHqQ83lD4af40So1LmGHxJ7f+/j+n
	yFNOsY2Xq6PycHKIMdTeTfDmeVH3iI53ieZFKHe1oypcTHEyDupZ/kVznhpdlVB5mMl9i0Y3J5z
	Mp60Dbx9PsX5Nqr48RWycG78qCU9CDqa1SksNs5/sz+/UpgvMS2xwGG7d4zOGu8BtGeAV2yyJvs
	s4qzL4B1bCK6GKzS1qBq0FvlAu4HhmGKnhIihTA+1sjFrMVlvuUCIHTedWRWYNzGIKqh0ooJAlx
	mRFol31QROttGKsblZyYjhHmW0Atl82hv0/q7ciOxUPEbrKWDUbUREco77siDH0FRxC1Mx1PSu3
	pT6pXAPVzQCipk7IDNv7kGOM3PFAwbU/1M/Pubdplkw7sNtRhU+P5rmxkFRtXZNE8+FMJgXxQUs
	z7yx9IBSb6BaOTnU21VWtK8QjhfQXyI1wwJ+retraTmDxJcskW2qPNhWcR218fFxeUtdGD8CgDm
	epRY6g/jDRzEZM1i8iRDFetTyJZGTmnBvWChMq4odC0rU+QeU4BZDIFT8AqkESC9utMKSuapbY9
	7vgaYtEoVJz39szs83cWDIIWG3JKZNWPd7G9SBZyW9vFC5oibA1cCORXnPPqqujVg+CwlFXlGMu
	sM+ChNoJXw4FHEpsAvwUrXzMaMkJjndvB0/OgR9lF402rMg==
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr455477665e9.7.1795773357686;
        Fri, 27 Nov 2026 01:55:57 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560192195e9.9.2026.11.27.01.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:55:57 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Liu Ying <victor.liu@nxp.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi: let the glue compute the hcomponent lbcc
Date: Fri, 27 Nov 2026 10:55:56 +0100
Message-ID: <20261127095556.1794628-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143031.880389-1-romain.tisserand@gmail.com>
References: <20261101143031.880389-1-romain.tisserand@gmail.com>
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

Hi,

Gentle ping on this one, sent four weeks ago. It still applies as is on
today's drm-misc-next.

It fixes the garbled picture of non-burst DSI panels behind the Rockchip
glue (GPD XD here), and v2 follows the reviews of v1 (Chaoyi, Sashiko).
Is the get_hcomponent_lbcc() callback in dw_mipi_dsi_plat_data the shape
you want, or should I rework it?

Icenowy, Cc'ing you as you are working on dw-mipi-dsi for TH1520; the
two series touch different parts of the file.

Thanks,
Romain
