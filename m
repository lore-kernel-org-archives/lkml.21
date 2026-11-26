Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725235;
	b=AnPwVvXu7J/bedvmsXh7ZxCJ0wqc9gTpMzksj7T0V6EVoiklkPF9GyWXZBRKaKWvnL+6
	 bSu+bp4pKmFXRYTPp86Winw28yiSBuWY+lX/TTMbrTrSEpN7VLO3o+ECfjZ4Wf6O7uxYO
	 aL474UAvp9hT7yTV7sH/Jyt+UsRhZiWxOo+X+1aXzToOW926tSDcPRwrdTg9ZrFzY0ejw
	 7rwWF4YYOJVIgI8hrYbnB8WFxRz4qW8Ee4eaoxRoPNWpymhopC5XG6zLRRGFLhjfxCpFj
	 BKFu1NS750LWRFGpa8b1dDAuqnA3tmx/bMRolal8mrnOmcFxTDbVwOmTSfMQ14mnhEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
	b=bzNtZCWjvK+BQ0L9+s3Iaf36jgJdR3JTDYe3Jt9Pe5x1FgYeA/UTi4sdKErLkBtOp4y2
	 H5s5eDc9GhOe2E6YMkv/tJEFLN2PM83xCzzTMIY4mtjR3fRE8fCumf6kM1UUC6Qebe3XJ
	 Ojw2IVOFiYuMrzgFaIrtIeMIi+egE4J7lK2ZUrC6jmL2DBf6woy6s5WQKu0x3u4u0RvB7
	 NaLejp5ChBsPftBmkxFAirXBXKADbNqIzuK/lfyYJi5Fdk7dKvAnFAPCnTsWBzclndzM6
	 fMeC/8GVGNebCozTOGHssI5+EKLjbz+KW8mQe0M+APt3El/NC2ejOsimecDtHjcjqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ki7lj7Iz;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335F606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8335F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ki7lj7Iz
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4b0348a4c79so5123237fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725234; x=1796330034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=ki7lj7IzqYkWadwnqj6PgQlP9aUyGwgU5E6yX6pdQV3YeHU1khswnjP+jW5pftsJ7C
         pnt+f1ngrIJ2bmBCHrG4FW/0/vhgDJXdVWuGQwLf83LcE8uBAjgR6ujhbwxkvSHofQXZ
         asrOrtlakJUqMZ9EVGAnWlkUZCh7MU8McKfGDZjePn1L+QTpHpwRONn3wuebp6gB6vWU
         IpEF8r0arMvF9klc4QSs5BvQzqUM4dJRhyFeL9E6BgRJy4ZCX5fZe+SGfo5UL18yQM1t
         mf79GpaG4qogum7upxuxPTUL/HZDgK/iTQcXnApXO9nB9IjFJNQZbUGj5/jIG2T+YeQJ
         sMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725234; x=1796330034;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=qzGllO/yZNxF7rJkBwlMcD7UDWJR4nIQo54nKR3KTrEfLrPkX8okedkYpXCcGKohnb
         w6FKQyLqoXoVBzmCbVe3VbQn+Ppw26PzhvkUxOTkqfrdhllflmCq0z0ip2vVDj2+fb38
         M+zhDh42T3VSs2gZX7A94PPsj32Hvp8/CS7UbUYMTpx2tB2gclVkDwA7qyZzjCT/steg
         zekdOmgfk/Nyfgro7B9YFyJK58UQTajDgK9zDM5s5/E6wzsJKzgTw5oK8QwzcqtW5Blm
         7raNT476+LgBa86hTpWZMpekWXiFPyPdIw8/ytGaR8tdtiI8kmsWYEhldGRDoUgSWjgY
         lW2A==
X-Forwarded-Encrypted: i=1; AL+hErHEtnxSnliLmOt60JGvKR391SMKm3wwKfSR1Fbu5IzJt+doGZP1XpQGU6bNQbCxpOTNS3I/sRDZbMr2+L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bdlQNDTVN5uaORssuB8tq4+I0746UrCvlAtJGhK79/Q4+YWPT
	ayP+XTTlmtAeu7Io/81saqHBDGlrFiUWAatOHzZeCnuqd/+hI0NGnQJW
X-Gm-Gg: AZFdTZcZgx8javqoWkCUY59V2MA62H1pN02ZZjHfJcWiBcgzvoucbjRxzMHc+OvMP4B
	+VG5OayaO+OJPLFCL5YQr9gVe5UJErFHf/tjt7GvuCRDep56wIXx6N/Q6V1KNzIkVPc5MCk3bsp
	bjCqP8DR41K5zVAC4W/NO5IcgBdsu3zuI9BNIICC0PheMaJa4JrH2taPDe21FRO+qHt+q9ri3ni
	/2wZVvMHVRnuMONWaO363Od5dWMpxUdNLSKTBEFWwYOgO5GaM40v1xfiOHDPHBLvgA54mU7D9S9
	/kxD88xiMOWyT4a+W+Aiyi4VXRmAalh3zLOM9YTOm3Po5Jl4u/eSj4fNcfcYlYeFYQj7aQp6JCm
	WsgnEKgz7PGinM8Jfiqy/s+2EyRjrY0Zm+vK7gBt+O/nXI2pa7a1AVSitv4LCDFhzf81C6oUbDE
	7pHI1iNO5CeRRjbRkZve9yGMDvq2lFQuhTpyzgdfEJnwnhA9WGCnivhBYxcNGhogE14tPrlK5o/
	V3/4FpQorAofe9hpnzHtih+BXYYT8tbO8eUh7GX/Bqn/SKPz6Rgsmi04o4Q4kshCxq3zW+aCb4r
	psKWHxqQyiwz9+r2BZSO5eAlr9F3tXe8VFpd8lKAshpLc+J3MhXkYRMfBEVqMIg4UeXdV39/DDg
	Iegn2iYo=
X-Received: by 2002:a05:6808:4fd4:b0:55c:859:adc with SMTP id 5614622812f47-57a0c5bfaaamr27052957b6e.55.1795725234464;
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a31929223sm17049002b6e.1.2026.11.26.12.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 26 Nov 2026 15:33:52 -0500
Message-ID: <20261125-a733-02-soc@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com> <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com> <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
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

> > This should be evident from the schematic itself (the pins are used for
> > I2C). And then the datasheet would tell you which mux value it is.

A7S schematic sheets 7 and 16 show PG8/PG9 going to the EEPROM.
A733 Datasheet section 4.2.6, table 4-36 gives function 6 for TWI0
SCK/SDA. The v6 commit message cites both. In v6 the I2C0 group has
/omit-if-no-ref/ and the RTC clock include follows the A733 clock headers.

> > Someone please test the PMU.

On the A7S with v4 I pinned perf to each of CPUs 0-7. Cycles and
instructions counted on all eight. Sampling cycles at period 100000
delivered 193 or 194 samples per CPU, all on the requested CPU. Its
PPI 7 interrupt count increased by exactly the number of samples.
The two PMU nodes and their interrupt partitions are unchanged through v6.
Norman also verified PMU counting and overflow interrupts on all eight
CPUs on his A7S with v5 [3].
Vinicius also reports PMU counting and overflow interrupts on both
core types on his A7Z v1.11 [1].

> So I wonder if you could take just that binding patch already, to not
> block progress here?

The binding is Vinicius's v2 3/4 [2]. It adds the A733 compatible with
the DW APB UART fallback and has Conor's ack. Taking it separately
would cover the DT dependency. My console tests also used Vinicius's
driver changes.

[1] https://lore.kernel.org/r/20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo
