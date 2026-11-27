Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802835;
	b=30t34HUe7e4SqTIcdCnhBf4d9CmjN/V4AiudSAqFgS6hWNNk4gq7E268JxPAPiAFOpWx
	 Aj2MDJWExlLp6pWmYqT7tZnlW6TjVHzgR7YZIjWkiasfB8fLzFVuaLmA32rdcC62/veTg
	 W7TRH0fctrxamRdFPuWBeb6UL1VxjzAe/BiHe5uxPTetN4aazqAyAa7afPLPP16/hlqdo
	 o/cZNUth0isCz7KtKDzyyuEenPxSUtprRUw4JgevYu55bEzfEimtrGAJiAt5UwS6Njrdr
	 luKASB9Tn77Jc/uAlpny3e0fz9Pyx8uaAMFRITGgU58mHBYA0+Zd52iLYh9MkuQlpDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
	b=fh+064DDLDUi6DHsycXK5yWEyz+UF9IF55drmOGAV5lqRhKB6U3iPo/dQLdouf+xbsXQ
	 Rbe0ShLGkiryaq5kXDIf9F3Uh+c90Ryjd2DepRs5onQrykDUff/oTChMsMpcDUWHgBqa2
	 2GQHZsUVAaKpuNsdQQGRW0H4ILu3sodoTWMyLHCZUlONfwCP28obHWgCmUfNDJzUTkncA
	 yTTlY2SdbENBxs/zjmfEo2mOKHF0erJC44oNDMy6B5SHDHOB0OcME5ID0S5MNiF4GrERO
	 yoRiY0bIT5hbmXeqCMRoq9l9uTais7hpOsDHXnetPcCOp64PaCBhz9Pb+PRKrLxj05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vV7J3gzr;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CE4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vV7J3gzr
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4bd734cf350so4704846fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802834; x=1796407634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=vV7J3gzrc2Ynuj6Kl8R/Gqecn+9qYz5vEkrgs4TQJH5XR/fxcZXk6gC6a213kF/wJX
         3KosVliZRBSjj4KdOS8ljP3kxqc01HhnlnZlc6/PfyfzWu1fTt8+bT8S2T0HtIolyM1f
         fEwQRigkIaGkbUyKzBqbeU9X8ZMYZ9WFf7hmBptyYpVyoEvjAdy7ntVqETkF4F95mDBZ
         FLNoJ5HrsVU2gSi/GM31yCkXka5qL0FSKhhHIZvM6ibu/76PpICq7VO/2eT0dO9cGrPX
         /cuI+G45+Ah+BUlLJrwvbQR/lYgbMpZCgE6uOTgUEwCSuDfE8nF0cePmsg51fiqBEvw1
         YodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802834; x=1796407634;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=Yl+odAyQ7xtktJ+YfLzteX0ztQcMNGlxLXQNIlDKfdPKW2N/cjKzwa3xb0Hyk0mQKB
         /nLfU7uWqT4+b84i5Ihmtam9E1sJiLl4k+j/8Kt40dGFzS/tAVZcH7tXFrjuaTgI6FcT
         ic9uUsJr2b+eLwM5gC24mOG0A3G/RDOd7fg3PUzrwmSxBd5YXJt9k5nIDmYu0bC5PPki
         h1JFjNjbhbk9IGisPNRCXfUsbCItji3awocw+4h+r+jRB2mMlAwLo5AG3hj/JpPRZ0L8
         ctxJUtwie4LetKYQ8biEX4XFyK4d8El43xqAgQXPS5XN9ZfFJBCwQWbzm2Fg9HiBxydJ
         rrQA==
X-Forwarded-Encrypted: i=1; AL+hErE6V9g4JrA0nCiBF5Cj6/qnQN0l/ZDptXLsbZa1VxKI2Y31PsLy3m6/T3KUnIQb1S+SyvQ87yt4oVvInsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ithJ7PjkojWGmcAaKsjkZCplUPl3tvGjzuhbmmAtxHKpj8/kL
	cAm9fq3eqWdxjODTzqYAwy9NK02aNXkhBo5jLAr2X64IOTiJyNHa+usBa43CvpSQ
X-Gm-Gg: AZFdTZenpfAVGbEZMfKQDClvAPdCqGIiyHIxIp4Srvw1suhMQNpplpNYrEZt3jGFncO
	eB4HoMd1NXgQ6wBo4iWDp3pSp61aXHNgY8ODZBqtYm3y867qqq6D7UfPnfcJIHJLToiDQuoueMM
	Gw3+GsYNr5xny19ocPvcDycosnrvBjSjV10Phf2b3GSeXjuR5FGW4hvsfvMAAYdKnVjo8k+87Ah
	TF7zj8SKxY+dVnNCIr522HJjKoWPS6zq0JAmZRwxgbqMYbMGnpPEyLuLOUYP3LBlxKz6gi3XCiK
	TwfnS8VgB+PsLEkepAsyNGcmHmmaMX2mkx0IVo7uTrSKTntO96ffHLk1/bzyWP6AnM/dZDYs+fR
	/Uy1UNpjn090rEXImnHIq2dzpUyqdaP5cIFem6YIU+99wIh5jO9LoLeYexknxSkFy5ymwx6vifw
	gTvaajwqSpIEUu8mdMSeQjf9cJLT+L0zDE4loz4NmIwuj6dO1nKyl0g61vSkSFUpMxdnjpM7JSa
	8kKq8FHMXhrNz4l/E3C5F+S3DPacx9Aa5mRcY4YZ5lO+172vhAPRyS0hOLMrH7i03M7WG6HR+PM
	GVBmAkXP+Y06/nEVrpIJoD1RHP5nyAvjFZag1yl+eGMiJ2cIJpd2cBbwyOF+FSgNwz4D2UyHyJx
	d+n0YjMYek4j06QRK8Rcrb25P3FUm
X-Received: by 2002:a05:6870:440c:b0:4a7:6dc:af5f with SMTP id 586e51a60fabf-4bc858f9583mr23176950fac.53.1795802833555;
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm23406139fac.16.2026.11.27.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:11 -0500
Message-ID: <20261127-a733-dt-v6-02-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +			linux,default-trigger = "heartbeat";
>
> I don't think we should have an LED wasted on a heartbeat when there is
> already a controllable power LED. I think a second LED should be left up
> to the user to configure. If they want, they can always set the
> heartbeat trigger via sysfs, although I'd probably do this on the power
> LED instead.
> So I believe there should be no default-trigger line.

Agreed, v7 drops it.

> > +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
>
> Since the Allwinner GPIO notation with bank and pin number is hard to
> read, we always add the pin name (PF6) as a comment, see other .dts files.

v7 adds /* PF6 */.

> > +			reg_eldo1: eldo1 {
> > +				regulator-name = "vdd2l-lpddr";
>
> So I saw the same issue on the A7A, also with LPDDR5: the schematic says
> 0.9V, but at boot time it was 1.075V. The kernel corrected it to 0.9V,
> without apparent problems, but I didn't stress it at all, so can't say
> whether this is stable. Various LPDDR5 datasheets suggests VDD2L should
> be 0.9V, or at least in the range between 0.87V and 0.97V, though in
> some configurations it can also be tied to VDD2H at 1.05V.
> So we are none the wiser, I guess, it would be good to figure out what
> the PMIC reset value is for ELDO1, so to know whether it's the
> vendors(?) DRAM init that deliberately programs EDLO1 to 1.075V, or if
> it's just left untouched.

The reset value is not in anything I have; I have no AXP318W
datasheet. Reading ELDO1's control register before the boot firmware's
DRAM init would settle it.

> > +			reg_swout2: swout2 {
> > +				/* VCC-IO to the console and microSD. */
>
> I guess you mean "GPIO headers" instead of console?

Yes. VCC-IO supplies Port B, which goes to the GPIO headers (including
UART0 on PB9/PB10), and the 3.3 V Port F path for the microSD. v7 will
say "GPIO headers".

Enzo
