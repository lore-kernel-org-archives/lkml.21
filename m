Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605912;
	b=Rx8tlrLycIrDMlrYsgr4JTzob4aoJ2NsTJccJfitRgXjjqjTf/b3K3zmdGebo4f/x7X/
	 HzGFMprvpPQKJg3hYo2JDebC/TFBRDbjbE5N6iYp0eCbfIBRFh1KjrNltw9PKpy/VWBCd
	 IBnxZAHq23S7wC4t+j+MBaQSzL5xjh5e6FtxDN0Pa5iqJnRtOQ54RWPulwcVP1QgcKEng
	 OOz/VZWT8GRR90NKwQ9JZ1pXDY9ziq5f1rb+rySaubG5nWWGntYCJn3JQgM24x8V3bNoe
	 Btgrhn8W5Sg8IsClsTkw4cBfRDo8C9gDdOQ0ai3HKe5NkTOgPkDkB47wvdnwDtSZT0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
	b=OmghdCDinJuBjbtmxDavZcHwfRUDMiFC91XivqiAbsZfOSOepgrw0Z6pAGL0+ZjQfRnL
	 J5xo9+hctXukF2wKZ0PVGZaSCfRQFvYbQthjpcl+kyL1DgSBFW/eWauoNsEiXKMH3xGFV
	 rP58uhoDyopngQMv6dYYBvV5478S+dhGX5jxUX+BioOBD2lZRBGn5ayViay38gMCuZTvQ
	 XDDkjWaAHoTLQfkpeLftlg5ACp7UN/jHxLDhKqc1ojYPcJCKo0QVMJ0Ol0Y/ykrmF9VhL
	 BWQmr5gXrZcKgcsaV+suX96aXI1DV8CyO7UdFDCAc1oLyBspYFmoA5BkbCV59GVyAjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHvkk1oj;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CD606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057CD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHvkk1oj
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae85e3685cso37489611fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605910; x=1796210710; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=BHvkk1oj1N/Y/8xVLUVFziJRf48T+nJE0q/VVrEXN2K60+RdL5nKgLVeA+3XsY4TAU
         jIA28ewYUk1qausk+ve8RiSz4aRkkDp4d4wPbSkv1RoFytrvlEJVQw0kBXk7qNxH4RKA
         pYQ/keaOTkT2Zp5+BZs8SMJZHwt7xRy+2bL9l2z1NqcKTs5s+pg1To9u50cg5GcLjpH1
         xjYG3YUkLpdTsnsxmGljo05ebVVWSFaK4glJS8cTg1BeFUMM9fzjMvZM64mMpOJEN6Ac
         HJU5xcOa6jUohhpc6s+uKPlog0UaEoCs+xbNCRQ1+SpG+fp5JxNINHyC9SuH5AlLzNsJ
         qF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605910; x=1796210710;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=c1ufsoUumtQqKqfVycbCjBAKLTQOK2MYJ59QbLR55/fkK5L4Fm9343Ptp0kSSsm8Ek
         oYD8GKYNF2mxh7BIUsfdHLOv0kFRmCwOLxlpTAJFbLuHNXLfTL52wEjhQbTV6U7XUYoo
         QbB8OXAJGfw8ZNraiw8bJZI6VPoO5siXBjjLLiHa+Pr6h6IJQ2Rtlf0x2KfA2tTq85aB
         /dq7jiP+B6TaFVPzeSzGFZnVThnDchkHhDao4l2fh7jrZE/UCpKX9glEDZ8JAl4C/Zth
         14rooR2CROzgrJBIOa1V2wonkImtL+vZo6iDUzYL934hZpMqWjcy6f+1QZ7C2dRsoXUb
         VnYQ==
X-Forwarded-Encrypted: i=1; AL+hErHeWEA2w4AtHVzt7vOUIASu3V+RBoMFKeErneBBtJCFghFuipTnJS+jtVE+63ppaQ0gPWpkmlt3c+o7DjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z92LAyLsgbsDTbMbd5CBtR5FYfxvXqXtT0FIfeRnl87tcwpZL7N
	TJw1qX2/aVi782E2+Hnmuo9CfOX7DpwAKt4Qu3qF1DLh33McvEZ1PVb3
X-Gm-Gg: AZFdTZe8jdHDiTgUSiXHe9kC4Ndh7abx21JaHECTzJ3R7b+jaYSCMy5R9IHtR8eytyj
	YOHl85neKK0TJ+aE0QVfJFKRiNDMWr2kPahvkV85kdsh1C4rtXwdzSVin/yB6b2FKsgjANkQw5v
	ZTkGmoqpDQSjxygHivAaPfABuIJdc/NFbK+hVfXeSjjl/rDYPcR4bbSGvm9Psu9eo6Nq13tn8vQ
	DQotxqAC8ZEfupv5uNAf80PBWIh63arCDYkA/1rYy4Een+bZlt8s3EREdMibH1PfSkvHdPp2LsT
	dn9CsQ1EEZi8HOdrQCE69styxMvzo1eg8mWMO2KASCsIR+JycdDByGn9bStdFMv2eMbxLFiVUVq
	RVpmypaPZlmYMOUAM6KnUX/S9SB5U4WTaVdW9HsnI1hILhcp/e+yknc5lt/tSR0tYnKTg6A6nD4
	aP0QUlQ8BeFRaI48LxnHp7yMecmGf0yxXzi3ktQk+bzTgB7PgAXuCkTYb2XlqsLNWNSUTkzfeMT
	sa5Ot5NXkdwX+UVaRYCdVR8YNXRW/OJbuIyu13nvgssnErYkbHmrYSTXLcsUIQxRC5KO6VfdekX
	ANQrlG9Vdz0WsZN/p9HtgxcNW+KI5ShqTDSAZTb4MFgyrLsBP535OrWlBRloONuZjkDjNx27OWc
	K
X-Received: by 2002:a05:651c:419a:b0:3ac:8a38:130e with SMTP id 38308e7fff4ca-3ae7fa692d5mr46457601fa.21.1795605909904;
        Wed, 25 Nov 2026 03:25:09 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee572sm45958281fa.10.2026.11.25.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:25:08 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next v2 2/3] net: cortina: Add CS7542 CPU network datapath
Date: Wed, 25 Nov 2026 14:24:53 +0300
Message-ID: <179560589359.3.5378747793444153378@gmail.com>
In-Reply-To: <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
 <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
 <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
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

Hi Philipp,

Thanks for the review. I'll drop the RESET_CONTROLLER select and both
status loops. The provider polls each of the seven reset bits on assert
and deassert and propagates a timeout or register access error.

The individual asserts matter during teardown, when the hardware may
still own DMA buffers. For example, if the QM assertion fails, bulk
assert would release NI, FE, TM and SCH again and skip DMA and XRAM.
I'll keep trying every line and leave successful assertions in place.
Any error keeps the active DMA mappings pinned. On bring-up I can use
reset_control_bulk_deassert() for the reverse order.

The 100 us hold was a conservative delay I added during bring-up. I
don't have a documented minimum for it. Cortina's BHR4 U-Boot toggles
the global NI reset bit without a delay, but that sequence covers only
NI. I'll test probe and rebind on the Almond+ with the delay removed.

Thanks,
Fil
