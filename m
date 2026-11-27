Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794935;
	b=a6nea9rMk8NccRi+z9MzbhT04wF+tWyOi9bvP/DXeMOX46njvJV/yYP5zXqDoqL4dKY7
	 l845BZZWd/L/BHQFS12zS21kjF/PvEbRrNHtZRMQwfuRvqeajolbGsYbVOYK7yhw/WMDd
	 bftzR1AF2fboJSqaJngD9TuK1Bodv2OhVALdH3XDgqwYWrt1tb3SsJfAwckIiS0mL/+g/
	 qwgdifC3doRR5yY+VeixK8ud/cnopt7BhKl/sn7rVW1OY+rV0jKU0lXkb0N8bopwRAlkb
	 PkeoB2sViehoG+CrLwsBpExkkSi9zScxK9uEPQPPv9WgbSeXyHPYUqpJJFUrd3e07CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wS75VZIU/CV7fzps5LoGI33tbGXtO4YqfRFUkbQMcR8=;
	b=zaCYQfs3I0mGwWU9qQArn8kWdgGuwDrMBilRofnVAqlJaQk/FOcFPZfiXOmErRJ1WLMH
	 S/DSNlYsC65QIY80sCiTSq0BP2fFRqeNNsAWSbzSSQiJjwVupF9J8gemaHCGtowzTLBsP
	 tO5VdEN1bWTBDaVJgMM/QlXoWM/eVvOSF33oN48fxqjqMKoM5AK/k/bOeqMxIE6DFeh12
	 3i2W1NN3GWugjq1V4mSfK2qJiZSCEStb5YTlKwr4oFqC2u2Np2T0N0zhlsPclQvWEKAX3
	 dSeaIY0d/vhHjr/1uk3FkrmviwkZNBlZhLmIzCI5+STYmcW9wXBXAlh2IVxaN6i49Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZG+9J2qo;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE28B606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE28B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZG+9J2qo
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d427836e9so1088191066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794933; x=1796399733; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wS75VZIU/CV7fzps5LoGI33tbGXtO4YqfRFUkbQMcR8=;
        b=ZG+9J2qoisWPukjhR/qF3725pfQkRWe95jvQ/k/cEMNDjre2ibJtO2dYUd6USozKkn
         ozFY+W2RXyvEF1WMTmhInQidKuVQoO5uDyxOlI/08h+HJCdq60lrTcGORZwrINouNxvG
         DcV39xVz/f2Utty6FFvUDkiPkwgGiNfh2D/y1Lmmbn7JInDxIrvbOjpyBjkOowNoaQnP
         got63kHKqNuJnZUuE3ea7EQJPSWxhZPzMdEkvIkceJ6LzLCXvHPLY0lEtl0wZQtni+im
         w99oYZ10vKGO7khXt0rtQ914JSf35tdZEdpEGhYl7daQrfAJuXddRStflPTylnp9+L6y
         RKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794933; x=1796399733;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wS75VZIU/CV7fzps5LoGI33tbGXtO4YqfRFUkbQMcR8=;
        b=K9yQjbQNggldrErt8B4e8NEZQwbQW7AmeGsxrXbSpivCJ4Zga8kb0XijeJqHPJkoCn
         sOjQIf0Jix79Fp96kx9YY6V4uC07+a+m5TzwWxa/3VCC94TLxc6mrtkzYq7SmEM8v2YE
         viQs3ld3QnNcAjFEpYFiYNgakE2nwb3YBkr1lBGknuEFfHm+mIvp6CwHxEPjgiy9pufM
         i+2IsVeDzEFZP0KT3X8YtObnnRJRqSj1FPcAkjGfTEiXp+PxtXP3rJR2rOXQZ/MX0Ch5
         H+J9423795iXW+vhdKnUtH32XjcTNt5N/WdvQI9yLuhnzJP9SdM4FYwKzrTlFZcKAsfD
         EHUQ==
X-Forwarded-Encrypted: i=1; AL+hErHLb28NwZ620sLk9dj2TNV41DcJVCFcNxS3bb60gFDshFH0izfXYmNYyHZvX4FGRD92udr0PFHZfuI3vZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cjkhCj0ycPgezr+/yoto+PP7YCkDhIkQNB0UMdXKzNlWow67+
	zn5lUZIxdC5cKkhBzYcmDqI+oTFU86xVUNRa//AAZ9CNTPd2F2d2WJ/8+7l+S/tmpPs=
X-Gm-Gg: AZFdTZf0qG8ejBFMpS4ljbRiFjnH4AJGpU18wFY2e3eFkDD2rzCGOpHSTBMNcfl6NCe
	MBsqj9+aT5LMfXwjDMfhc7p+yZXTo2z7mgNuW55bFyKK+n07r4Ee8tpHD6D8eusMErEjx8ksT6H
	aWJ1V+RlBsDtoN1Id11LOvcqF5qYdDhql0ezu44F0BtNhpyZhgiAMEMrH8InxTNjUTWRy+Kq7Dt
	KoT0de12Lx+27k9xhVfDCe5QUDy0u+KMZRsUfBa6EGhPcXZ3lBmBBBNgNENumoXW4Vghxh37V2N
	702TQWVjRg34nXMGGV5s5p/98idLrQgNtYWSaJrmLm08dL+Egdk3ML5SX98vAy+KNKG3SeOMqCy
	JDC2a7KlEdbdFyy8Zxf7617nVIBP+cRD+ApuYgesYXOOdLwisWh1s98hkTrQGw+hBIbnCGMItcv
	Ufv5w1h7hm/u7UQrzTE5spTbp6diIsP0Y5uZo1plTPSzbNGUBHWZvDiyrgp8YGyQTmhLZTOiRgV
	jgkRQmVilSp4v0az2y5ZcABD++GJJ7ePmuFiAiuS2pcaXSDu+XhOh+j6vAfyHBOAdQJ2RoFP/6Y
	7N12yrfYO1pWRfgDlscTbJ/7SZ52gItzkwmacxuEFTyNHwJX+g==
X-Received: by 2002:a17:906:d7a5:b0:c51:249f:7250 with SMTP id a640c23a62f3a-c513ac66e13mr1543392266b.39.1795794933110;
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm874646666b.35.2026.11.27.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:32 -0800 (PST)
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
Subject: Re: [PATCH v11 2/2] clk: gpio: Add driver for GPIO-signalled
 clocks
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
In-Reply-To: <20261121-feature-clock-guard-v11-2-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
 <20261121-feature-clock-guard-v11-2-00c633a667a2@bruker.com>
Date: Fri, 27 Nov 2026 16:55:28 +0100
Message-Id: <179579492872.2809466.10829283277864895608.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4470; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=S9HRg5M9YhN+qcVMQ4DigH6i7w8pyJamopzDDHtWhu0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcyz/J5rU/43j5+82EQC1R2znPbzvmvflc/iev0TdG0
 J5HwO1jRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACby8R3Df4czQkV+DdnSgf75
 566Yfp0loNz6lz/n8/tm5YIfCllpvIwMx5xkJ/I4zziQct+4ZRcrS6XR3U08+h0t4lfO39ufe4K
 NBQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Some clocks are not under CPU control: they are generated and enabled
> by external hardware, which only reports through a GPIO whether the
> clock is running. There is currently no way to describe such a clock,
> so consumers either initialize too early or rely on ad-hoc delays.
> 
> Add a "gpio-enabled-clock" provider for this case. Its prepare
> callback polls the GPIO until it is asserted or a timeout expires, so
> a consumer's clk_prepare_enable() succeeds only once the clock is
> actually running, and fails otherwise. is_prepared reports the
> current state of the GPIO.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
> Our use case: peripheral clocks generated by FPGA PLLs, with the
> PLL-lock signals routed to GPIOs of the SoC.
> ---
>  drivers/clk/clk-gpio.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 918b2c6444ee..ae6ae8993d76 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/err.h>
>  #include <linux/device.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> @@ -241,6 +242,112 @@ static struct platform_driver gpio_clk_driver = {
>  };
>  builtin_platform_driver(gpio_clk_driver);
>  
> +/**
> + * struct clk_gpio_enabled - gpio enabled clock
> + *
> + * @hw:		handle between common and hardware-specific interfaces
> + * @gpiod:	gpio descriptor
> + * @timeout_us:	timeout that is used to get a GPIO value
> + *
> + * Clock whose status is determined by a GPIO signal.
> + *
> + * Implements .prepare and .is_prepared
> + */
> +struct clk_gpio_enabled {
> +	struct clk_hw hw;
> +	struct gpio_desc *gpiod;
> +	u32 timeout_us;
> +};
> +
> +#define to_clk_gpio_enabled(_hw) container_of(_hw, struct clk_gpio_enabled, hw)
> +#define GPIO_ENABLED_TIMEOUT_MIN 10
> +#define GPIO_ENABLED_TIMEOUT_MAX 1000
> +#define GPIO_ENABLED_TIMEOUT_DEFAULT 10

Those are definitely made up limits carried over from the bindings

I don't think the driver should copy this over. That's one thing that will
eventually get mis-aligned. The driver should just be concerned about what
it can or cannot do.

> +
> +static int clk_gpio_enabled_is_prepared(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +
> +	return gpiod_get_value_cansleep(clk->gpiod) > 0;
> +}
> +
> +/* The clock cannot be turned on, only waited for. */
> +static int clk_gpio_enabled_prepare(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +	int value, ret;
> +
> +	ret = readx_poll_timeout(gpiod_get_value_cansleep, clk->gpiod, value,
> +				 value != 0, 10, clk->timeout_us);
> +	if (ret)
> +		return ret;
> +
> +	return value < 0 ? value : 0;
> +}
> +
> +static const struct clk_ops clk_gpio_enabled_ops = {
> +	.prepare =	clk_gpio_enabled_prepare,
> +	.is_prepared =	clk_gpio_enabled_is_prepared,
> +};
> +
> +static int gpio_enabled_clk_driver_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk_gpio_enabled *clk;
> +	const char *clk_name;
> +	const struct clk_parent_data gpio_parent_data[] = {
> +		{ .index = 0 },
> +	};
> +	u32 timeout_us = GPIO_ENABLED_TIMEOUT_DEFAULT;
> +	int ret;
> +
> +	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);

in v7.4-rc2, there was a rework to devm_kzalloc_obj()
please rebase on it when you repost
(but let's wait get a review from the DT guys on the bindings first)

> +	if (!clk)
> +		return -ENOMEM;
> +
> +	clk->gpiod = devm_gpiod_get(dev, "enabled", GPIOD_IN);
> +	if (IS_ERR(clk->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(clk->gpiod),
> +				     "Can't get enabled GPIO property\n");
> +
> +	ret = device_property_read_string(dev, "clock-output-names", &clk_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing clock-output-names\n");
> +
> +	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
> +	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
> +	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
> +		return dev_err_probe(dev, -EINVAL,

The range check duplicates the schema bounds;
DT schema validation is the place for it, not the driver

-- 
Jerome

