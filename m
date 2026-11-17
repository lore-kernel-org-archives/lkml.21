Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944960;
	b=GbDGUnlWFfX2IrSZ8Vv0oMX01gY9tsLmBCfDw2NMTkYYtA6pnIwTPtR0S4VnLYgrDkyZ
	 UOhClNFaECdx702eJShZ8XH9401Q25UX5pJ++V647sfySSW+WfWw47fAz9x5Nr9lhdUo5
	 ZK9q71oLcfUUUylamTdyDodGYXhqdpTR4+gDQHZGHkzw+44CbFxYxIgV1Gh4LjkWoeZzK
	 MPfFaQCo2aw6FtuuX+omIkOt3sjZAxY9U6G5/w4h8OQblGstoXAfGkUTTo4js5pV17KFt
	 2o7caS/v2qiONYnORAH1nUswbPfoR2r0SAlyqnRACXw2ffrLv2o388GMIOJr3D1+Osg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944960;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
	b=OWcUFYVDP+pA+HHexrDeh73owWVZ+7agVbzJdnWuPgz5VlNYY8sB8lKDITZtVURVqjfQ
	 oTubw6m5tIObtYj1wRE56ocb1r0Md/cJsknvXaXf0KxqLzrNEjMWZQR/wuOrwHQ2IEXIY
	 +V/aoYzUVBXRnK5Ts+v+0ADTlLqHruKpPXBdkQ5mof5fh206IRsRkC8T5pLPm+6HPOhpC
	 yHJuGpElwMog9qKnnb72jkIl/1oHUhgjTs1/BiTFTdSyhjbU964rsrUiUofLwFixEor5A
	 i9mDyc7v/5aGdtBffWePIbXZabccX2jBO4jybQUO5DiiFq5SsZUOvTdVDmpoHrLoW3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEEA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEEA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b2f59de176so147336b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944960; x=1795549760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
        b=0m2ZOVBtMQTCZ7DIUUSV6Ageic+TGSLvBOApBI1xf2CC9/5F24CfB0IbqSIjCg0haC
         watlHvRMD+NKGAHihuF4+/N7e3kQk9Pt4i4QVx/16ttJQaGZUpBTb+PN2Zmg1+qVo/d0
         m3jsiGnAPbehySZRG5L0TIs2ACnZ+lEnnDF/cjtKNK/HvWnuz2jOdStYhB8Wgq2QmnfL
         nmjrlrbAcckjGH3n2nPuapj+1vEvqSUc+08FiKtv1sYNtiM6hNTxgoTrM0nELklAUrdr
         yKqFWFPxZLDHnp5RHT0AMH+3RRGAWG2VeOCAaZ8iTO0Q0RQAQwAec7Gr4eD73Oi4Ws7r
         F7jw==
X-Forwarded-Encrypted: i=1; AL+hErHHNtRMTVe7WGlvB+IrcJdYJs/TRaxib8V1+QNmNbN4/TsnsA8xwDAmNtQVhstIdHnm5zTeyZXhTvkwa6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yiiK22SRdG5cPKmmj1XtUhqxuSj4ocVCEwKIgd0PVcRWySCL5
	5sk7exjs2A64nsZl/jQ9oYRHIYX++PwyBT9OWQU15Kc77SBNMflAHlkJKRzP02GG
X-Gm-Gg: AYBFou1tF5DNDZvyt9mVRzYYctrWf0B+zXmtq3iPbYfZH0GbxiE2FQroz/cS9qWc7Qh
	Qz951EsEau5x5rLB1aAey1x8Q72BF3Y7WOI6q7tpRPbMSnPzFXmyQt2Udch1ZEvyS+VX9Z78fxH
	v77dy0lKL7tKxfX78IRHJNsUvrrCG3ar2mndN2pFneUH9nG5QagWmSy5fbkGGhTEZxwK4mpX9Io
	GC+Rozoj3lRmQ6fHCfuTKP6nJ2al2VVykr3x3vv3W/DmXoYcUuJ50DrBQIudkeauxZ3Yd95hWIe
	kWpz6itMqqD91VnIfUpGmmlGcMcOcXxCeT3AA+lsSYeQ6FIHxZ7BhKIcu+cKI97ze+zMmR5UwOD
	CXgzLQ70h9oF+YddLugpSTEOPlPL6dCPdGtzZHXUhJ5yKUdGQFVVSh0uVUVN88r7XCIAvfcnbwl
	0YEvBclcPJMkJsQ56oGaepo/5eU57s4A7/jgwue6D7B/IFm6j0jwh0nBqzlCpMPKC5aKkqv8YBN
	qW0funGHhYO0I6pgkaLIZmNrDJTGybHuHuVeqYWAMS333ctkwwEG5yrm6YvnuSZzFSY/uvvDt38
	YR7DT51ynTrt2uB2klDAQgsMtLySkKnfJcPFApdZ6iPD5jicP57x+GUqjYOaIcTA7aC/9zmB3YU
	/9FtfPPsvySnbUOcACxey+Uyl4sst5vFzE/BjxhHBODao
X-Received: by 2002:a05:6a00:a381:b0:878:3783:8a88 with SMTP id d2e1a72fcca58-8c5d4cbdf32mr176425b3a.52.1794944959967;
        Tue, 17 Nov 2026 11:49:19 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93cde0sm83422b3a.51.2026.11.17.11.49.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:49:19 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so504865eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG7f9qmU/lLM9AHB2S+2vtx5TK+DQNYiDiMvnrvZ6dsjs2SS+c7Hqv5KSKSW6AOEimAJK5AFZaxWW8bvHg=@vger.kernel.org
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id
 5a478bee46e88-3828161f1d8mr420423eec.41.1794944958852; Tue, 17 Nov 2026
 11:49:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
 <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev> <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
In-Reply-To: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:49:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
X-Gm-Features: Aa3M54q2rRrfck_2znOo84tl7sC4Xfyn9RtGeBH_rlEOV0HSVp39Mi9qyquXGxc
Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:38:53AM +0100, Linus Walleij wrote:
> So this has one register per setting per GPIO line?

Yes. Each line has its own block of registers, 0x40 apart: input,
output, output enable, the interrupt masks, the interrupt status, the
trigger type and the two filter registers. Only the pending bits are
shared, in one register per group of 16 lines.

> This is ideally handled with select GPIO_REGMAP
> for gpio-regmap.c using regmap-mmio, see for example
> see for example gpio-mvebu.c that does this elegantly.

I'll move it to gpio-regmap on regmap-mmio in v3, with a
reg_mask_xlate() for the 0x40 stride and the debounce in its
set_config(). gpio-regmap doesn't set up a gpio_irq_chip, and there is
one parent interrupt per group of 16 lines, so the interrupts move to an
IRQ domain of the driver's own, as in gpio-rtd1625.

Thanks,
Joseph
