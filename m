Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771035;
	b=ePSrDD2ei17B2Xr8WULXI+WiayKyoBVPcz9awDpcf8AoJPtwK0lSz7Iy1f+JVCHzBvHr
	 8sXgo5WP3Ppwfhp4/zWL8bnF8SkjgK9PH6I7qaEtCREoFkqoZNWrHRmVojMVX/CHQw9ub
	 BBog5gH/P/bkBdxJkIp2o8KGpadtd8r6y/QRfByn9E94rVakO4JU15zKkK08DgRSvcVmR
	 2bmxPkbVTMkQ1bfGhf2wjPXjjYLRnSEDXXIPPxr82Rtda6mPBrHDkyGzv+EDsI+MvzTd8
	 KXbD70KfcQTcLbPZ8K5ZqDyY/7x+OusUfMnmgXkgJjFLjGONw4OkQtI241H/DxiewFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
	b=ywXSHmAcxbFH40SX1GgMywkPyE2lwZSyjlfZDzab7GS/O6p1tr+SOjZH7vqI3fqyAnWW
	 5QzAvoVDd2F7boCB0nQB28+712YgWuxJRw57QWfttbZVs8gzcs7CCarDF16umuWDgWynD
	 vYSclqBAAdOy3cvFONrGl2eaRAiFhcY6BW7Fifa6a+9ymdEiXyNYZFfc232tztznfUvs0
	 xBN7lRp64mIMOyeomK3mXQcoUFZUSbi6ybtDdJbdQyruF8Pq/V5BXSLwhr0cD8Bz5KPCa
	 mzcJAKUKVLC2oYb9qC9X1BRctLAA+DgIYJGHiaw4ehnXRyzshOpDGSC7hhdvxoFXJ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51484606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51484606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a358881793so4126952f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771034; x=1796375834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=iBRw+JF7XI+FsbMljrWUMpxaiKKpfOzx9BNFr1VLGWhsoqp2VSaP5SWnYO8z1hBxgi
         IQNbBMdeJhsysl+DyR6W0NanRt2DWD8sIglYpY/x5UY1LoWAgPv5ZUnnBfND0YLbUSfl
         Itsk0XaTbtlowa3WI5Gxl3k5nAWrW+1EmwyyX02Xxa/mHvv+dh/iykowrav92nNUb9uO
         Bj83vjke6GeDzVChb/+X4O5URXYdSZf9UGvHEF7bClbXmYZAtIIFShgddgG0GM0/SIrH
         tcAyTh1+lo13Kmdf0MVGZ9iMoPoBNW3igWAXE0c5LOGBN4lH4dIidyqeIIR4bXjt1rJi
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771034; x=1796375834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=2dxAG3sqvWeWE5JgPNrjkm4gez4fqRKwlxPCBWWT40Jal8lSVc4g7noTCRNCIIPaM3
         Y36dDbahCxY6ph8r1p7fpyf+CQb1oHHqrh2f0IJb2ArabClZKZVFympPiYok4II7w+3f
         vgS2zKlJEjq/QKyGt071OQPIkegESBnjNquKrSwkHpOhczrg18VUB9YUeWbA04/jg02a
         H5qRB3ilxBYlUvUXdLc7PbocIxer2oH4xs/9meIuvgb5jmFXq3BBLEOhbeIVzFk985l7
         ejZIcsLAX7AZrE1hMpzxllXCjclCIRmeobJh3qom4EPWruVm1SojLNbNDMmaRdA/YMGd
         2tMQ==
X-Forwarded-Encrypted: i=1; AL+hErFXoMdKe1qufh/fDagp2V81FMRgcf9cJ/5B2xIarGw9QGlciaJTo/FnrvdSaJDDU+EB6z4NKL49s56JMN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w+ScJdNvToI+tXOAIzWo6Vwjul6ur0VwRtQfkdRMHlSIrQ2+h
	5OXACTBHNGm85r8ivbkb9OrvLzjiyUlcWZAOMOyH7kD+lbm+d0ayKRJF7MBHJwHnIJA=
X-Gm-Gg: AZFdTZdYSbFZc1LqlfdhT7yKtp0IUP1taiaRl9dsE5stkdec2wAL402jscLzjAzodfT
	HwbNzccg6is9kVOOvsen2uRzi8K/bhw0RUNfbYV1UM2xaceEeN9ThDqZ4fYkzNYDbEoTVhLiOTP
	cliRFnCOCp9AwhK2OYP7HTsRCsHdBvdFDdXWOuxx4wzRsmm6tbnYfxf+uxTlshQ9FE3IC78PqO5
	pcLbS2GrLJy5/+wWvfhpHa1XzYXg2SUb3ZHX+yYOP/qXYN7cc61h90AmKd7+l2C2Zb4b11NmFqX
	nC7TB+f93f107DEJZpc9KsMvX0l81kWnAtQVtNgk+FnJwcL/d72jUGeSWO6ZIBd/VkL3DRHl3Rc
	ojwiY+t+0OEQHnqdaskHuBw5gnZD+MrgtkVZwwztDtCrz2CHx0RZnMawSJq0Mrjy6VRFPCqj3Ll
	P0xJvHZ7pCyr00HnnFTyDbKhQqkMVUEu/uzmnd2s9U5lgU1Wo+LlKVPQr72GRlE7/UScs+N1cOY
	lEulSocq2suFe8rpP4YfIQoWEoE5vuskZhSnug4AxRhxHg5J+0nIMov2rnCFLdg0/rRgw9Q0FkR
	b90JUaCFijdvpkfO/GQdZcXkrBMHCqYUlZZd
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr45324253f8f.30.1795771033589;
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm45914055f8f.42.2026.11.27.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <bc1ac983-16ba-4165-9827-a7cde032c988@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:11 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
> pin controller provides a register to select between these two options.
> On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
> the Renesas RZ/G2L pin controller driver to allow selecting the I3C
> power source on RZ/G3L SoC.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
