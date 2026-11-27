Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779223;
	b=dMKxlq2TMJ2y3TYt6uKiTlS8u2M0zkhv8+xsXGB/c7ubdOSmNKKz5RSCEztMMzOb/T3b
	 G75e43wNeJGmk0sDGjD27x7YquuKXylMM0XlR4G10APW7UNuDPzN9BBymhzi6wijp6+S3
	 HaxWwP+Fq/8WUXAnXlIGGGE6712GqI4hFBuMb3bztu2Wz7uXW9oTQstnzGbQaeqA7wycB
	 IECJxYrWTCm42jiiHFgcdTe0jfrQmt7P3Syeo9KI3zyhJBdYofVzUJ6K5vD2nrPI0mLRV
	 WB5AhNCMEnRbwH0JKWARquegD95W653Xw/FbBUqRF/cyuNib/+18oE4EP9/HS8Zcm4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
	b=Je05eWbrMPskJDfD52DW53CipS/yMssCeVYfnHhIFaNeMJimKaM98ci14xAOqGZ/ZmNx
	 s4dbo7hU+gn9p+h8+hTZU0k3sQ5w+v4V8lpZGRNLiPkdzfypwIc52vWjKnr0M1sJWB574
	 4JzGV4/8iETRIhWGEE+qt1uny75im+9Vo2zCY/9Ww4Nj60wRrW30cnW0LlecNod+cc/ap
	 yVaM5XDG1O7+70Bt/mh4RsTKvdvHNFMlriF7W/CsTwmetH9yS+p9HPX9sU7Qsxxwv3Z8W
	 TdTVLbIZQsedX3qfZnKh43R2cgAQaiBA2S6VaynnrKPxNW7D7jPLvFGuThpX/HF60eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e4p5xD3I;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F27606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e4p5xD3I
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5133831027so1111591766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795779221; x=1796384021; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=e4p5xD3IooLFZbWq5acgm4Ma1/ZA5jdl7FSyZfGfmi7lF7mHgQL9XNHXfYAMIVCoe3
         edN19M6cbwwpnnDlEowq12ljG0UBnuyc+67+O6n2X6LYs0ZOAHBXtjDWcdgX3Vhjg7/i
         BJqhm9slCr7BcL8QD6ib3Ny9IKZklL9X+0nRg8obbIzH8WSf4MbQArzkgXWG80r4PdJE
         1n1/05Blcg/X7IYQxfj6jg8C0G+/9ZGWmRitQUMPp3yHgzwcI7tFPgkZX6DpbYV2t9/b
         98zH+e6hWgsOIkWd+/n9pBaf/kByUNR2wmlRdLqXiAtjGrbfeoyf47XaJI30wORwd1tu
         DGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779221; x=1796384021;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=Qegf68kTtHkkpt7ZRAFb9g6Happ3F4paMuJh/SCKL+6UZI8PN+iNTaOYVQwGc3EgsZ
         fyqR/hwWbUcC+0x0JrHpIzwRItddHzVA1mBRpg6w50X5w/NeLrN88ItI8BTFNEeMJ3g5
         piatbQP+uqTzWXE83lr4tCHIICu8hkuYp0rVHw+udRs+xmEKVdD04P3iI6N6Hq1LnTog
         62jwz9Mnbj8PM+oNWd5XgSXeEcHwhR2qwqn+OLRGb3dkvBDorJEYcCtV5Y5oxhBUnnae
         YfVVNF+nUgS81dXn8AtH8hUQ//TPeSAIR3zmT97TXTz9axuI8RFqaZ+xD+h747SmW1pd
         lGag==
X-Forwarded-Encrypted: i=1; AL+hErGGRqEci/N8sEMc/af3fqlAU0Vikr77z6hD7M5j7xyFqOnS6zLorvOH1/lXaRX47hCCmcDzyTl8QwFEmRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x+XkptsbSvLehMhkDOlMF4j1qtcE7WspVNruZxqWTRIkSUNRG
	/jZKUe95SPmNrcXZA0RkkKprkpVItcO9oBGZ49nTIuH6Tn3p5YvO3QZriHX/1viLYaXh7OJxjXa
	Z2XZL
X-Gm-Gg: AZFdTZcGabRasL9BFb8EpDHRZ9/GHFFKS5MSwEhBtmPvMVTHcLHp93v82CxBKpiJd1g
	r+c3BaTknIJi+uVG9wo6EEJrs/viH0wNMUrGk6M433LVfTNtzv2ZpPL2lx4S9+I9qtNa2gaQYQL
	Y9xahcmWil4qNXqiVz7i/UtvSRz4hZfth/1IIfw5CaJdCMg32d3kHpGDUKH/rS566kA2ZECvzB4
	Wsj1X72vobFlzyPgCRp+JhbWLfNAEjILst2o6ypbwWLI74ulFId3gjwIBeFKKB1XWyvVooQnjRU
	pxi7HaATJOGS9oy+cHMPwDgzwB3WVWK9U/YPDIQi+FGnK6ZD0ddokzz6zQMaPdehC5bQketnGGz
	VDudI02cbcxZ14tNiwugocBjWCpDd76wd0Nou0yRwhrfxwAX9Xfsosx6dv/AbLSySYR1oVxu3fP
	Kbl+GpMVkKjV+WGnAdMHFUkx/8DaRntfc7BlWT8FS17WJe/aU3F9FtPvil+t+en7TYstl5opzen
	G7JbZ2u2rrg8t93mn9u+3IX3Y2JOFZNvH9oBge5t9iBBhiZVnitKbqRGQqv+UW8BbVS/wT8EeWy
	wwDnBZjKg/2OEf2XKI8RLnIf4y+8FmnPHdhESQ5ub3HRgP8brSJ9RC8jYqjKiqLwt1fstQ==
X-Received: by 2002:a17:907:8e88:b0:c40:80eb:c543 with SMTP id a640c23a62f3a-c513a4347famr2083302266b.4.1795779221611;
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm830289666b.82.2026.11.27.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
Date: Fri, 27 Nov 2026 12:33:40 +0100
Message-ID: <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 15:36, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_aldo1>;

K is bldo1 according to the schematics

> +};
> +
> +&r_i2c0 {

-- 
Jerome
