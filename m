Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028162;
	b=DtzVVskX42xiKQgU4HLt29ZdFUX1uAurYNHFpfmR3PO800fI3TsjQ2WqrZaxBuBzoazJ
	 yp/5RERXFtuBg+SgcMSt+ii2ct6pFAg/bXCXGOO9Yg+Bl/zq+fOxkkFZx5N5TkUyigxWc
	 iCtpS5f0gWgA5v0b3oZ7HXiQTk1H6ulIWvsBp6digUhXrVSfT5cCzQJvp8tzds2QxkXzT
	 pc3/CC4oPpVLWVBJ3ysaesNNwCTRMeWtKXnVHC99a2K502qYRHOCRe8z53pGNJkF1lY8i
	 totHHS3A+yi3kvSohyQqL4D2IlwODi8pG4KzsMrEy2O7OxqVXrIUn3Jn4xulzenh1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
	b=T+yRQlZosJCzL+rudmGSV3LUa1VfhjRKz12S4R79pCNgGZbwcFLuz3JTJjEA7zc5Ou8m
	 GRXRdSj3V8V2yV4m27Mrg2FExLzvxGPOn9saFo6oRyUhL378BGvU+RmXJQ/qCaGIMABjc
	 RHhN7Wt86m2dqYEKHWtAWZdHgOVmJhjx08XsuLD4YtWsJTudPe6Gf2lRY+odiC/F2hPBH
	 RHfF28IJ9THNEabcjnKm2Wn8/geDSyz1mUGi8/+a0/s6LqtPQZGJXX6Knifyk7BZE7Fgy
	 jIXXHM9enPJ77c1kgS2pBUr2/8QGq6grSnzbRtxC5j1it9azbJLsLQYltnvp2wg0vww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJ16PKhA;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6F7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJ16PKhA
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so820479f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795028160; x=1795632960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=BJ16PKhARz4s2Bmx4dHGIkvXvP+ysfTMKh0Pb344yReW5izVeLzwpE11JY2MQmmdzb
         D9fOusFnIy34U/SBJBkrm8v/779ctX/QEdyEVxeDl5lbwwJOrIsdvLR1emWtqoA4d7ks
         yNe7dg66UC/RcnoaLgcildHFaZW3E8TViBGRxsUAxu6Rf56hBQrrep+xTKR1lSHbhgKN
         ADuob+YUfULgVnmm9JCfSXjuoo3yB2xjUQsol+gwVnYS+QhKmNhKlwDWaPUnSQUPc9hp
         tmWpqhDkDWGKT+Ju0dGI88hIPlrekzQQ5XOL0HLCzCnYOZf1CLWnMQG7F89+4VezUXCV
         nuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028160; x=1795632960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=q8CYQYubfhNF+lI2LFM7tvRgQHWRdF+DyUGII76JBh4pUg+dDyYhO6MFGSQE0MJ0GN
         gmD+TQhDZEQAPkkc7LSjtLt+AXUw/TK5rMqFpje1EdIFkZu+eDJULqrDYAgZQPyoi9sf
         Ea3lQ/qXcp6Fz5P52/reZqCi3LeXllPJ6IG5KeJ54rcROMHBu3srvdbUepfuH/epycn7
         CEbX0mNiN/vdRiVXfEp2UtxI7lZLXxFFHxvcsNRGuWfvyxWH/XIVu52lo6EtSPlznhj3
         kZ9y+Sq1PFnu6C8DCAa2syl2j+BZzMHMsaf21YmsLLVMBcVRzpP7v3tc6L8wzXWu0555
         vtaA==
X-Forwarded-Encrypted: i=1; AL+hErHci55rOmsiamwz9V5u/mVFjYm4/0BgLH3t8dxmvZO9ZyQcP+L+NxXthCF/Yo6zNPL0FXZGoL2CgL4zKHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3CwuU8RHT29evs/msvLrAHCoaQRzBL/XglxHEYnqS92dBchsG
	pbnJOzLkTu5oqfzyNG4mdQDhZKbuPdUbLdrqIbwTa9M/N2TUUrl2tRtlS9aWkP7GLY0=
X-Gm-Gg: AZFdTZeS+BNRAp8K9YAS+1iup4ToMqTDq0EyXo6JYMJTm4Pgsr5yOzEPRN2GqgtzagY
	V1Bp9SHW8nfEBwEOXxcJaCi+D3z4wvLcCPqxbYcyfVu4alrIrJq/gbWah2yHl9QVhxVJ1/mVncQ
	E1IJzHWvGkeYVMoMTRjzG91tISzYDu/Kf1atpdP1k7CjN0zZYTGiftUiqtE13IagtT9+JZDueaD
	mQBMkNlDG/+9G/nr+8E6d10Gtset6Edrm5tcGwTIlShOrRkKH0z/WyS89n74RnImj7KJ/F4Xo1s
	zufMKA1eO2SWo7ke0xhhXp8DeFs8ghyffLN3NNWjKDzWFyQw6zcQr6R0i2fO623LVfiAMlh9ZKA
	ZcDVyC9MAbju4WvU5KxEJY199vF4PGuFW7ngmvn3p/UmM6jN06yBO0P/zK/2tcL+Vzf8FR+OUkY
	Sk6aayrI3nmu36AQQYq5R8qLL7jWtfvC2PQq7bgBT+JSvSYaM7MSuW3dKCEAmJS6MLcLevklLxf
	+1h/62egCPJ8x0vEIoQAsDR3Dv3Z2WhUkQh4FBCLQdUQJmXUGpEwix51wS1wb7WkFgWu1QMO9Zb
	LPB+0PEB2itME34TdIdaSCIyUXmFgejpWA2GbXgAEN3dBNCX3ZQPLPRr+eWHYYv3LoQI3RvNXLD
	PbblEfJu0LCkAEhJ0szpnb8VLah1LavQ3NTYBKHj6JUCrgQ==
X-Received: by 2002:a05:6000:4914:b0:491:8462:20cc with SMTP id ffacd0b85a97d-4a63ac6b48emr8023295f8f.37.1795028160455;
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm6144436f8f.37.2026.11.18.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:55:58 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] clk: amlogic: Add S7 peripherals clock controller
 driver
Message-ID: <av3zyakd8-7QfIk3@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-7-7d501d62621f@baylibre.com>
 <179499607256.413320.17594110166305844754.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179499607256.413320.17594110166305844754.b4-review@b4>

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 peripheral clock tree is derived from S4, but its clock sources
> > and routing differ.
> > 
> > Add support for the S7 controller so peripheral drivers can obtain
> > and manage their clocks through the common clock framework.

[...]
> > +static const struct clk_parent_data s7_sys_pclk_parents = { .hw = &s7_sys_clk.hw };
> > +
> > +#define S7_SYS_PCLK(_name, _reg, _bit, _flags) \
> > +	MESON_PCLK(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, _flags)
> > +
> > +#define S7_SYS_PCLK_RO(_name, _reg, _bit) \
> > +	MESON_PCLK_RO(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, 0)
> > +
> > +/* Named ddr in S4 and in older datasheets: the Amlogic bus to AXI bridge clock */
> 
> ... is a driver claiming it ? If not are you OK with it getting disabled ?

Not yet. Amlogic told me it gates the AXI data path of Ethernet, audio
and the AUCPU, so those drivers will have to claim it when they get
enabled on S7 (none of them is in the S7 DT yet).

> Did you test with or without clk_ignore_unused ?

And yes, I tested both ways: without clk_ignore_unused it's disabled at
late boot and the board keeps working.

Cheers,

--
Carlo Caione
