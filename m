Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794935;
	b=ZbnBzNo5xHj2jWjJQ9PwLGDlClBKnVLJfzrdqCE2OeS1Npt3asWEV8dfm33KKquwqkK6
	 8spwEvDR33EPTb/P0euRzFwe5oiGmx9nJHnd86VJAuLn2MMRi0u5ONbVfOFjuaagc/DXL
	 9FJgNvkEkSMKEbZ2nbwqRU/RVYbOdCNCTNzAyA1pYG/wxdneoabJWzQZFi4U1pJ4+47iM
	 +0dXi6N8vOY1PMlWuF7EZlT8PmnhZpJse9U7TfgWHy6vM6fDooKXGDsXYUb6KXkuiN1bl
	 Vmjzp6PCNPESgxVfJN3F2uoipaWx79EQWMpYFSeP9OPauos0HmyJg0vW4TumlN6TJDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
	b=ZT9kvjiV077+ijsL3KwqXnLd3odlnXDqZ+HwXGZP/QNdu9LGSZZeC4fWr2vEo1ZDLY4u
	 g0X1mENZttEdwGOyzCmUD2NFNh063lZ61nHlQa0ekIertS4X5N2bPe2pTQIjj2cmfCYOc
	 X2Zk0Yjquim6/1zOrNEELDHxqdPu3k2lr05L7op8KFEfSPPqyOwZL5GPaStNnJtaOQsZu
	 4qTs4C5bhFEp8gf3bl6c4wt9YUg7Vd/cyPcj5HAv8W7OIfcvLwBqM1KcVCiHNbtxzPWs8
	 1U6BLI7Hl1VZ3yR2zzKBklQZJ3/WzP/rWpC11OP9IoyX3oL474iTlDzBXOrMv1Shwxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=STCmbWQ4;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB6606A333
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9FB6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=STCmbWQ4
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so12848022a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794932; x=1796399732; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
        b=STCmbWQ4UewMFNdT1uhAQMvGxDQ+Czwg0A/LpYUQwYPo4acKkvPsx8o7EYjxc3JOXj
         0fqsMScXdhYDWKFXgtqS1udFUxPMdZ88Ga+isgQekxQZYQaxKf65iVCeKDoZF2w/JO/t
         AzETHsvchFXd20ugammQpkBx7ZeiY+QnSGU4VJ0HWFgHzLJsMj7IBRzjhJH1MA+8zE49
         Vi0hb1MAeWBYT9Pfq6AQnJJuu02YlG9k0W+ipeVG9dF6f21mePSC9HNc2hukTN2POCa7
         UNa81yms15zWe/TBVSIe75pi3TYN9NTp9baFvLSGi8iNL8GiPwrQ/CI/UawvYTxTogCB
         eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794932; x=1796399732;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
        b=R3Jn3ScExrbb/BblFKNgE08KvGuYAbAXxLSNyClA9T6KhMKAwOCt9YwQoWrGyHvlws
         dWERbxy3EDmPLickGjFnQVQw0w+iIgLbg4eTnnU/ifuSlRzZmcH+gkVAEO0wSnATIs7r
         WjNi/d/2DkgFEJvt+C7FlgKnZjgtLXcTEwpLzVbW6dEoF8R1/UH/x3S0D0r6Kn972X2p
         00q2VKomjRZkG69rIyg+vbgeDTIk6bRglNaj9V2zNxTDKBGriLcFP5tVxKjkFd20Uhcw
         35HXxwQaF4+5uTFKdbx85hquwbghSRBZxw913mJ+ZGBx5wNiTcn/So/j3kTqB5XT7k51
         0fkQ==
X-Forwarded-Encrypted: i=1; AL+hErG1YDke0suI6Dxq/U7/uzeoYYbZ7uw0Lr74cr/tuQUBI6SOtelFWCqhBDKKGak0Gzvehz8Z61i+kkPYnMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gaHJ+VYgJH4V3JW/s0Xe75Bg9RhniOBN62NcKvSWl7CW/sSMr
	igZSDzFLNX/gEoQW/lr0YrPorM3DySXXVlMj3XFIcxvZP5sUR72NqO0JsgNb+mKX+yg=
X-Gm-Gg: AZFdTZcIRHzvl+CKx79jNstr68M2sQKj2HRmXcFH8uwTJWgBal5roM+Hz+0aZcj1vN+
	9Ugu/fXjlziju6xzqoZNzNSE1STngie5ICZ5lV705KEgjS550fe7iUpXRYROXTInIeeIRLMYjHT
	wgu4tvpoRMvwCKZz9MDIvBq2trfQZmFNmha0ETd4B+lwqfNDnhQcWr3pLDJKRbLjanQl3C2Zgxl
	QlhM2yKZoen4ePPWcxd/qPcFUjNR5Sr1WDjxCTF1nW9ojqp9UL5WkZWYxwXE9VVWWql6qPyQ8Vt
	7DPxU6d5Dywm/FKH3WSKuKyAHLRS5+zMqcEUdd6e5TpaNLDokgjO/Uhe1xhAU6y4TMQim20NLfG
	6y9P9x0MsIUOKL+ppDNhYq4qFrzF5qqF+3zB47eJ9gugLOICwDUSshJ7o7BvOcXV0v671/f9BA1
	AQqRG5p3795mpKB1c7m01Zr82dqW0VpbeUxBB+4nMdmk8fKaNYapQ2CBgxOW/6Wrf6gzEWJ93uW
	fHRByx/CivKIMBVZvyL1ZikgFCa3iOJCICS6ihpPDFt6zgkG8lK1XGj0ufwWe8NjKc43EabZr6Z
	R4qPlkpSZsdo0Mc/9cetl7/+sF2omOg8SURxpcO69ONGr4Vo
X-Received: by 2002:a05:6402:42d5:b0:6ba:b20f:60ef with SMTP id 4fb4d7f45d1cf-6bab20f6810mr13142715a12.14.1795794931858;
        Fri, 27 Nov 2026 07:55:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm11127032a12.23.2026.11.27.07.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:31 -0800 (PST)
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
Subject: Re: [PATCH v11 1/2] dt-bindings: clock: Add gpio-enabled-clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
 <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
Date: Fri, 27 Nov 2026 16:55:28 +0100
Message-Id: <179579492872.2809466.854994706444744625.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=EINX0tsXJyuIqPfhhtODzW0RYgk1o8pIb3kiWYxd32o=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcyz9NeeSvuvxluoj/fc+eDxPTeFoyO7wUhVVepi4+E
 iT7z2V1RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZiWMTIcEhN6OOtXNeedfw7
 qyo8PxZ6pGjGTGJI0/pyNvvtxZeNrxgZ+u94BJycfCmGgS3E4NYx+V4240lqPgrX/p6K6+0tiE9
 iAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Some clocks are switched on and off by hardware outside software
> control, which reports through a GPIO whether the clock is currently
> running. Software cannot enable such a clock, but its consumers must
> not use it before the GPIO indicates that it is running.
> 
> Add a binding for a clock that passes its parent clock through
> unchanged and is considered enabled only while a GPIO signal is
> asserted. The parent clock determines the rate. The status GPIO is
> given by enabled-gpios, and poll-timeout-us bounds how long a consumer
> waits for the clock to become available.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
> Our use case: peripheral clocks generated by FPGA PLLs, with the
> PLL-lock signals routed to GPIOs of the SoC.
> ---
>  .../bindings/clock/gpio-enabled-clock.yaml         | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> new file mode 100644
> index 000000000000..4861c87ae5e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gpio-enabled-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Enabled Clock
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-enabled-clock
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or disabled.
> +    maxItems: 1
> +
> +  poll-timeout-us:
> +    description: Timeout in microseconds for waiting for a GPIO signal.
> +    default: 10
> +    minimum: 10
> +    maximum: 1000

Those limits are made up. I'm not sure they make sense for a generic device.
It surely need a value, i'd prefer if it was required then.

I'll wait for the DT folks view on this before applying it

-- 
Jerome

