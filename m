Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359546;
	b=pUJ/i7ouxAfHUGChMxHDYxbxcN6XfXPh+UZeKR6vYfpcdNkweQC/afSV0UqM/IU6M1Bl
	 pxg+EgQXFkWPrGAfqmtTNL5gN8ep1qcOU7EV3icR4ZbLmMr6r4OEzOAsjPFTEPnGHDaAf
	 kiCtsynnpApigMJS5RRikAuNs3AQxypTZlcoScfNvEPnAu/moUKq17C1bQ51Aru76b4MA
	 oDcrclcai6rRxZKA6BMPwp1jJMoTChx89BkeqQ0w2x1qIpOSI2xFieTe66T1HuzJxtNnu
	 8O4wNUzSCzpakbPeIGgZbifF2q/WPJ9UEaJPG3Cv2h+0NoOi2FvSu2WbOODtH9RzGEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=V9aQgs949bFx55QdEAPtda6DfCwORIxmNpkfLincCtI=;
	b=LtbjWVoAJRB78xHSnFx3DDvlhVeWMaUFTkSGJXc6+lIPp1iuJVhrwBG8N8p4loeSegbi
	 eg4yD0GwoNSq7ZQwz1Nlz1NMaoHaYSOGshkQ2FHq0kvfnJPGItjiQxWi8ejcRBcSO3A7E
	 6k0Ut2KfYT1MofSjq8/FxyNZMDBL+QqV4SJkIawJiEeI7HR1ANM+D6L7X1+nMDneOr9mh
	 GM5So2iYOxg3xGPrOCZZaSpm5POipwN+S0AnbrQ6Lx7yeQawehn5WkLykX/Ze0SOKRdaF
	 v4PqjlONXKx3lcUTvY39HhJUOvEOttWlnkhLA2Y82MCo5gOCyppI/iGvcz9FY78kjhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLT9KzGr;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6E606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D6E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLT9KzGr
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccca948203aso2527439a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359546; x=1795964346; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9aQgs949bFx55QdEAPtda6DfCwORIxmNpkfLincCtI=;
        b=bLT9KzGrh2Tr356MYIcLuYVLKHo0PpL1IwIVRFIAwPcRonuirzoIguew7yeWhyxzZD
         ZUvP1y50cp19sswWMnJa74cP9C+b8TV8ontKCDf1a0DNCsJN+Tr8vMK622Ryk4ssv+v4
         jBiGwmaqwlNyGPvynbFY7YPmjWZbr8D0f8Znfq9y7RBkadpppas/naLfi2ctiLChB29m
         JhfauowPwGoH5VKxUjLQqxcu4mSTIn0CrAACVeD2mpg57ACN0ULMbO01/SLTD89yta2U
         R2poFeSSUHcla4L9Xtk9i3gMXw7Elqg4qGSo2E+Ac7k8FD4f2Ay6EOdNiLwEuLnMZ3k2
         KGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359546; x=1795964346;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9aQgs949bFx55QdEAPtda6DfCwORIxmNpkfLincCtI=;
        b=n78wQnlTLQHUXgI6DwG08A/2j841y4kFw3TvssXX+yaa++Id0nCjh98FPxzckL+3Km
         PlqNQ3QGrYTn1xHPCKhZiIDqcg7Frd9hAhFcNUWhHJl80G+lNotop07kKvJYP2SVISrI
         TEYRuVyDCEHXpKRHainCV6jN64YuWlkR0wGau8Tcf8WsrYjDQ4bgp+FkhOQaVEXDJPb6
         7TFE4KKpPb6813dqfCBggdakWIrVbCgHZvLOyQ7sng0Rj6hwJdatMykU26QsY1FYmKjs
         q/FSWVXDHTNYqZNh50BDOCBx6oPbMuUpURGT2HzM84D2drS6FbCQ/U8DSwaTl3LxRrqe
         0zcA==
X-Forwarded-Encrypted: i=1; AL+hErEnar1EqHYu1JkBPmY41LWucZCZcNlyw7fnIFJTbxOn5rxYE0Hb/Wp4RoMtrJmEq+XlVE5b6oRcWMpbZ1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p6sbu3zLRXNbpIpiRnI29k76Sdaf4IrFswqfMc3CHLkRFPRky
	xfD07U3GfTbs+c6mQXDZRw2tweseSUBOzVWsiX83Wr7A9PFX8hvaf5ug
X-Gm-Gg: AZFdTZcPEfT6S00hN1H0F4jvNwewVAnHuADpOBPto/Z452h0Hjya393QOIGDvd2O+pC
	f54gPMiT7EaYwdqyWtrI2wy1B/2iwjlNMVRBTE0StaOSCcAVoeqMbV7WLy44a7pc7qVj8Atsl2j
	n+58yhnMrrpZOCQ7ufz0U9P+qEVlS3qNvL4GmYjZvi8cL8jDOJAZh7oqukBIT80TaXaVxZxykWl
	JaXcpCPZ8T2KunraZ6rOXC70GPv4iZQPeKsa7lpVm2qUNIcIbP5/iL+eXsiRp6VE7fMXMz65k9b
	kWNGxWCcjulCwsbd33BlCbrZ8NhLRTShTtA0HMwbLgjDXgt3by4EIE6eqF+R/bjDut5m62heIIF
	vn2n/m/RlDuZz8tJUZ+PLV9hwa6OFCzYG/ca2SOq55E2U4ffzaCsOUpkzEqK46xi2f/8gfhkqCb
	OxaVgKb2mpDfHPL67WMWj/weSnzPrzhMhlUDWhTWF+fS3ICHYz4m0gnW5YcxYsf+UMXes5t1Ru8
	K02TXKHdATuGZQ/RFWnJZHG6imNv1FO3F2pPSIatj+JgseY2dWsBia5Vvgqt40xbTl8/+hG
X-Received: by 2002:a17:90b:2e4b:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b41c8e1705mr7082627a91.9.1795359545501;
        Sun, 22 Nov 2026 06:59:05 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm15343634a91.11.2026.11.22.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:05 -0800 (PST)
Date: Sun, 22 Nov 2026 06:59:05 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hangbin Liu <hangbin.liu@linux.dev>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-Reply-To: <179535255333.3135.10581087211469618015@kernel.org>
References: <179500849159.1877154.14715369660816392826@gmail.com>
 <179535255333.3135.10581087211469618015@kernel.org>
Message-ID: <179535949326.2658908.10317801004319925337@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 22 Nov 2026 13:02:33 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Is this check enough to keep a non-Ethernet slave out of an 802.3ad bond?
> It only looks at the slave's type when the slave is enslaved. A slave that
> is itself a bond can still change type after that.

The issue is real: the nested case gives the same KASAN report in
bond_open(), also with v2 applied. v3 adds a second patch that refuses
NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond, as team does for
its ports; other modes still allow it, as bond-eth-type-change.sh
expects.

Kyuwon Cho

pw-bot: cr
