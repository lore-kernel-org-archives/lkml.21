Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654286;
	b=0mhrd3D7PLE/Mnyo/iN+LFu3PQMJcFShkjNaHyGzZnvYlFI4ovH7yQ4wDSn9CNB13HSf
	 c0B7H3P4PwCUWgYV5I60HEAwEdYMpySpO8tLC5zuzmANk0oPv4IGtBIVF0RCGIRraLG4d
	 Ip6Tt1L8J9ySv3eMbGTot1I6T6LwaiVj+PSJqgss4UzdcIt+f4X5Ry3yQMD/AQYDfS5i4
	 iXVBri+qXiDSLumIEObgszmxfxn542cpG5wnMKNXu6qEtg+W8rCg7ZxVyNc5GkMSLiKJN
	 0uUw/3ec7LWGsmxLzpmb2lb17JTXR93s4HF+JTy/gFIzLTGJNjnA2vNyT96H4YR3NvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
	b=qtM6+vs/bb28hPQBsPyIg+ic8qUlHLIibInya6Kns/ytdABK4BzOuodp8zOI0ntobS4M
	 i2oSOqt2xPny+PMvkoITvZwsG7vDvSTLuZghPcnRLHHdDDsk3USxBjfHGYrYnRRzBJiMU
	 hcXW2Ek9DkTs2xUmpn65Gh6MkfAhgSkHqci+yX3zepCT+Lgl2Ae9zIH2GdjIyRi/OZppB
	 3zP6tVg/HnEPD/nS1Qs5xDQRPgV6F4Um+8QuOUI1w2fvOlbFhcfwE2S6yBXWrhhp/rZNc
	 I1DzJsDYACZtLjhPVPn8OohcETfCFdhmP43zSzEu/eMiVAx+7BafVnYQ9uvGAJ3aYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NeJO9v0H;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C20606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NeJO9v0H
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so1525700eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795654285; x=1796259085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
        b=NeJO9v0HNsJVgIq81pdvrNaVLAAWj80oLv5htqok4JvCqQ/GTit5imBRIUEGs6k1u7
         qycPZ8BtVrtUMVe0mJUlpzDRRzVeFqp98vC7+Gc3m1hm9Ob7ioriY5Opt7lLGsdBr5cJ
         GxyYqdLbt7FiEKgcM5UFLxSueuLcxsJoZ1ign9HhImAhvDP7JY1LqMzv5YkanKNw+D3I
         zSk1WO7fx6CU6PdkEBWIHL4477rUyYPUA/+vPLjW44kDeidTvP2lSNqnfq4hSFHQcnyw
         mU8wVMfZupSIlPXl6gzgFkqLrS3dk9YWbGP0BRtBVv2p4JS5Vgqv2mTxabIh8V/dNxAr
         PgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654285; x=1796259085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
        b=BsOU4Y0Vo+YqVyEa6TCi5ngVoiYh/m0268h1hAvY1a9ht16jxdRdlkTkz9wz9DAIMX
         IdoqcMufl0jDF6LXOAxvtT1pSe57id/CNdpET2NM/A8RePHHgNphAyFU8Oj/kHJiG4/M
         amHNuAqYlUa8YIvE8CqC2h/SlJubxS7y+iI71E5zAoOC+ymhdbK/bToKxw3Kf9IvZkZm
         ulZGzofPEM6G4qIRlsOkDPh79NA/mcZx7sGtcaYiSzX0+valwJjRsQjnEUOB1cEZ5fJd
         3V3yolnUJ8LlwBA5+0Z8hy3l4pdLIIytndyt2/UHtzDR7X5IhHgp5x+ssA+uWR6RKKYA
         U15g==
X-Forwarded-Encrypted: i=1; AL+hErH11nBTz6ZCHJ+93whqAQRGEDlXZtSppnnitQrwubXq1C/kqJ2z8mJa3K423FhgrD9LFmREG4mgXJN+/t0=@vger.kernel.org
X-Gm-Message-State: APuU4Z88XaCbi1R8RFKHY/iXa6cLykeHW0V+cqkbM3gWjgMKJmXH6A2A
	yeQ6L1BUeFf3O19SYaBhhIWRiFAGVZ1lp8YP2002S38wvoQo2wJy024HaEjrZzARsg==
X-Gm-Gg: AZFdTZcleXnCmZItfWEb/DCeMXlXE6fhjEBpDROKsO3rWR13K6B41NbNcuuZGWV4Adl
	jsfKUP5abp4pLYKQpC7uFsCPN8bEaBfkwnpyNQUz0dJ72qwfnoBLx4SICd8x2ygGxO7bI2hLO1G
	Dtmgdtlyjk2p1jaYdIeop/eP9mFivPy0Uy723m/mHi57BncKzhBhN/N7fhKk5DGvB1RmTgdMHEu
	yfUNfaB4BlGltAATxyC6zGxStEhWPAtjubkA3nfIygpM6XuDekIjt2qz57y6qMMTssTrupGBR0k
	mWRQoq15uGh38Swdw3ItBMbzpCr35Xe8O99JdJC9EZo/CjeWJeLKY7xp1gENSidl3ENxq+LJ3jq
	txWinB4QZdrUkLR3sOWjSSMzfbVhznmNMHhdbZ+njyAOECXpykLlzWmZm0fhc51OlwFk+pNL74T
	rL8nL1zrvPRXaWCIDs7X1AWj827lNjc1lZRCy9AQyCMmHx4lncdU+Yv0VpDx8U/i2cW/IBcq7dI
	pPvcGtJp8d+4oiEYFF9Dwg0v74YJCH7FSvm99L2DybB686ByXhPDSnKZi7mkr45NT5MEfANiuLK
	L/dFC1hAQgAGwwFnZlr8GdmgTEs3IL/vjvqh1sw0sghjUMdD7SNh9ZpFowouhHxU28xQ3myN9bT
	hK32uRj27yVdGgbMmnQ==
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr16578348eec.32.1795654284736;
        Wed, 25 Nov 2026 16:51:24 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm15707184eec.17.2026.11.25.16.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:51:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
Date: Thu, 26 Nov 2026 07:51:20 +0700
Message-ID: <20261126005120.176307-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com> <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alexandra,

Thanks for posting this. I have a DE25-Nano here and have been running
a mainline kernel on it with a board file based on Altera's.

On Wed, Nov 18, 2026 at 08:07:15PM +0100, Alexandra Østermark wrote:
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "hps_led0";
> +			gpios = <&portb 17 GPIO_ACTIVE_LOW>;

My testing found GPIO_ACTIVE_LOW is wrong here. Altera's and Terasic's
device trees have the same mistake. You can test with
/sys/class/leds/hps_led0/brightness . With GPIO_ACTIVE_LOW, 0 turns the
LED on and 1 turns it off. With GPIO_ACTIVE_HIGH, 1 turns it on and 0
turns it off, as expected.

> +&gpio1 {
> +	status = "okay";
> +};

I suggest also enabling i2c1, as Altera's file does:

  &i2c1 {
  	status = "okay";
  };

Unlike the other HPS I2C controllers, which only reach pins through the
FPGA, i2c1 is on the HPS's own pins (HPS IO 36/37) and goes to the
onboard LIS2DW12 accelerometer at 0x19, so it doesn't depend on the
FPGA design. I've tested it on my board. With i2c1 the only I2C
controller enabled, it is i2c-0:

  # i2cdetect -y -r 0 0x18 0x19      (shows 19)
  # i2cget -y 0 0x19 0x0f            (WHO_AM_I, reads 0x44)


James
