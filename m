Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792670;
	b=G+vVMUJARXnFIPZ4GLUmAWts6YVQGBvXJqbJJZvgeWgODoMeF0JRmkJiIs3B1/k/yfBK
	 glRRkAFxBqQtWdGS5EhMZxDh5Tsipq5EQAorbc+eJbLqauWTwTNS6BD2IzHnnPZyuhuYe
	 r/PE2jg8+yeGfNMf1av8YAEbyP2Bt290PoDUIErMnagxJngKtdBHoP7pEetV8kWVjqcjF
	 Nirx5zBPpQ/02YaF4MYBsKDqWGgaCBu1uoj2JxBhq2isyHpJZJO2AxmUQoqeJijv5G0HF
	 HpIRselS3jUJmELStkWsh68lv49iA742n2HRz3wdEVjDvkjA+YAknuFQqer4Zgxhg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
	b=kBvJQznGd50YpF+Y62DANkMYYW0YTJW+MXS5FBkf0Jmf23RQrXsQ3dgCzO3CaeEcJQIg
	 BJUB9zPlLzs5SlDNW4aO1dqfhp1cVgTaPlvWNFfpnYZH62HI09O2EMMfQhWRMCtpw6v82
	 XIa9mNKlFSpYGtEfnB/EBcmFZPFOEBvddsEF223QLUw1IcRp20U56ZHkyRHj9UKh0kn3y
	 5Cjz/LVaeFgMRLbUKd/bNwBJP/AQn34bD7ID9HLw1Hirp+GmgK6etQue7bbmpOoVDnxXM
	 c6HnHetEizAyyvrkcqqO40FLowE/PXQuG5195ywWSsWx881SfCqsFttqZP3PwszcSrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CqHyoLTv;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CqHyoLTv
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso10049034a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795792668; x=1796397468; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=CqHyoLTvOKND7NqUor3O8BtLLEwmJexce1Y1TE5HiAn9JEy9DGO/hrGTADzvlIWQ9g
         YjVZs51SMkiCZPf4M6QkxrpBstzbUh8XHOkuYmEirdAbJyc2ZV5gyHjJtEwOHITGsCGY
         t5+PFWXkazQXbc2ojqwuubEJJsJnm39UZfaYa4zmrAOWbiM9ObULIiJjYsJVpzCFdw3s
         Xhz8oxrFrg8K8yu04MtluUViiVcJ+ZUk366XXZ7AqB5r1iXhoaGPTLoxT/pmb42h1nyg
         bEDIHw6JCaw16MjLVHrgovVoIYXMfUw46Ab2THDg8ydTndpX6H/ZtEdLy5KWJQCRZmZu
         J2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792668; x=1796397468;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=ndnI+i5XjrTUFVGWj4YOef9QMfTsPz3dMN4e0kY0x3ksafWtZiBlk+xo/Dp7/EEaDw
         tUVEcv6V4VlrsNhz5rt48C1k/Pgf86LW0Q6mNK1XMSDOW0QIRxYWRbC7TjbxajbMDo8z
         wtqhI77FJs9LVMYFF7h0O4Kt3wQFHyL4TrvIjijEY9+T0PCOkGF05l1nOZJRs39oktbJ
         kP/oJnvZiZh4xX1+O0yMbggLzSACiLWfuucriPFBLoRPUbTl+90D9mJI6V7d42JH6Anq
         U+n3ddIn9qklH1W603F7nEXOHWAGo+x24iknGOHHCWCv0lV/VXbNZabJ2McgV0u79lYn
         SX5g==
X-Forwarded-Encrypted: i=1; AL+hErHlcv8ecBKqLqWqnvjOWr7owas6n6D7VOtfIw6COzdpVz8FJU32hsutBCbPF1AXzlZyJrM8p0DB40vkXck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XSI9YgK1xPbnmlkkY+Ljp+YKBvGV5oPgEi9QGTKJTncek1e4K
	EUHbSDJDIVK95UsSLEOO8tvu2vPgUkvf9LoSaXk5Q/DtVnhiDeyTTiQ7aFCN8HqpXu8=
X-Gm-Gg: AZFdTZcSbDW8qcEv+8G0gR8V8hlzgN74fhaLSTi+YqjUGB9gCBBLMKpHAPwqbN9btwx
	gLMFP1wVuoYPyVKqQNSZZFA5D2XvxLJSUPq96Ot/8TBBxK6IAYe0Q6ORMaU3J4YQTmdOAyEDGe+
	uhJ+D06MC3qXyLhtx/yn+DBzvsWCGjby8JLmRfwmCULgF9siVWSBa4oZ+er1q8VT0CEIpjDzOsJ
	uNKMpsm6BPzrg3rKNEqyYS1z7Tx/f7AN0ju/yTgplMacqE9bOuezzbIJ15WnaggcFsMrme/IFII
	dd9mhVe7/QL5Ej7XPNQW65W7zOf7BqeQW0+R5BJGjDSWdBSRMinmVVI7/7mctgUNKMcybNOKsMp
	aCQR09nZ4CXK/eyN3ZXTEoQqRX6MmsSu36pEz8tYCICppFw+kJezOhY2jc1yGuQNr20If44j5uT
	7LZPr3gmSMqRn+pM47WFlQ2G+Js21RJHRzA/4+0oGMs9bRIO2LjQRt4RF07+wnaX6DaYXEwvmG7
	zn3pmSwG2qGOfNgJv9ippvlXV4BjzJeVjsGb5KmCKJJTR8+QZrIr9CCWP+wMAXrCYKZChaXTM4R
	4I51Ie7XtGp3qLtCeOwUGDGgW2pGzl2qG6LVS1AXvJv7p9Hm
X-Received: by 2002:a17:907:6eaa:b0:c46:d837:b358 with SMTP id a640c23a62f3a-c513a4355afmr2170185666b.3.1795792668210;
        Fri, 27 Nov 2026 07:17:48 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm859922066b.0.2026.11.27.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:17:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261123112053.20400-4-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-4-changhuang.liang@starfivetech.com>
Date: Fri, 27 Nov 2026 16:17:40 +0100
Message-Id: <179579266081.2809466.3640091940793174076.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Auzs4ujqrLqv73w/LdDQcDLJr4HOPar7zURfN6DCgsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmc8yXzf/RN2tJSERXL7DKNlb0oVm2pprj+/tmXGLan5
 F97vIe5o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABO5tpPhf7jYzTTPhobs9dU5
 Es+ad+yIzL/j1BRxOay13sIn8031PEaGOQnv+/Ii/HRy/gl69Tkl+l6+qnVm5ZTQLNX4pS9NPjL
 wAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table and reset
> auxiliary device name. The reset auxiliary device is registered with
> jh71x0_reset_controller_register().
> 
> The clock table is made of struct jh71x0_crg_clk_data entries, where
> each parent is described by a struct jh71x0_parent_data: either the
> name of an external clock or the index of another clock of the CRG.
> This way the external clocks need no index of their own, and the number
> of clocks a CRG can provide is not limited by the width of a parent
> index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
> used to fill the table.
> 
> The JH7100 and JH7110 drivers keep their own probe functions and the
> index based struct jh71x0_clk_data for now.

I trust you'll follow up on this.

-- 
Jerome

