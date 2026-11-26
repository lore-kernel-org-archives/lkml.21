Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691362;
	b=I20BmDoUdVjkwy66L9dBz8HuWPXjRACKdn7wlGdbXEGX7HRFORHJLOrGp97m4ZL1uSgX
	 rWDfyVSkzZvDfd2+O90t7VddNRTm/e6JtboPFmWhW5FbnE9Vsbc0M55r7funL02jm4FD5
	 a8Y7vG2g7e1XCZeYUvam4H5N/GSe6QVGpUIkmLn9PAausF35KYLjyhaRMv0axbsTvwBkg
	 w/IufuVayCSp9MrtvmlMfu02p+B5NHhsItCa0RreZ2BrjoBT7waKPQM/aIhKIDpUfkbPP
	 Cifyf/H+ToPMjPVPKG/guRsO2+tFe/bBB+4oP2kf2jt4o1jXeisgxUM3FjPCDA3R7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691362;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=y1/wD7Wi9STowuQTsl3HDTiGkdek0lFr2Qc9ETyKkHc=;
	b=RJ3Tb6I9uuKtkvwAcsoMUxm6XC+nRLNRbLW8JxxbQvQZQuJO1TUadCpmYjE9mn7kVJ3E
	 n8bGnEf36Z2i0WzQ/jz9elUfT5+zokdywjgWYJjGx+wqvX2ZqUdUlDFevJeYJRkKCLvrF
	 umc9yT1CUwt3mWaDjCaotqV+YUOnfdymYytXoFaPaqYF2QEyvTqCQhdPRM4IiwfuQpywV
	 PLG+s2RKqjnjAbl2ciUF1tSqieWn1nhm3/33AwBOk+dYY03E7NHrlkdlGuHlTEEUeH+ZW
	 DyXazsw1k9kybXtSJOEBqDjg90kn/XgRhx/XdyQHYSY8Hzd1VBeMt/n77z3wJV/RLDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CT0q90WV;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E68606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CT0q90WV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AEA2C4E4179C;
	Thu, 26 Nov 2026 11:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CAF460237;
	Thu, 26 Nov 2026 11:09:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A61D211E6B368;
	Thu, 26 Nov 2026 12:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y1/wD7Wi9STowuQTsl3HDTiGkdek0lFr2Qc9ETyKkHc=;
	b=CT0q90WVIJc4zyZoQOxtFRwovUp/lD1tvYC8y28IdlSTZHylCR+SJOmgbdnavDoSIkKJZ7
	UQHzhfp1dRSy6+1mQ58pLkQKWb6rDLC50feZHn9Pd5znOcWpj7D5Q9l8chtedbMZd2oDLJ
	ZmLDRvMzlrHQxZPH5Eic6XzwoJQMgIXhdfgkIsLG7EiBT8CbTTjEdoIHRCvVjU+Te4B3r8
	AQFb4tWn9rZC2cYUS3f3KjYpHTHLUb6guHhBk2tbVLMW1Bfs4Eaee4bo7sjgUwuMgJ4yos
	1IXLZNk6X6lqfWFueUY4owHyk7QJ2sJAxW6L5yGfOuj+wpDnU0wIA23rihiUPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,  Feng Chen <feng.chen@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  imx@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	(Miquel Raynal's message of "Wed, 25 Nov 2026 18:51:14 +0100")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:09:05 +0100
Message-ID: <87wlpzx31q.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> Convert spi-mem, all the trivial spi-mem controller drivers and then
> SPI NOR to use dummy cycles instead of dummy bytes. SPI NAND may come
> later.
>
> This is only build tested for the moment and sent as an RFC because this
> topic has raised a lot of questions, there may be things I have
> forgotten about, so I would like all parties to agree on the direction
> before I commit into something cleaner. I bet Sashiko will also have
> interesting feedback to make...

I made several trivial issues in the controller's conversions which
triggered a lot of Sashiko answers expressing the feeling that the
patchset was not ready. The important part clearly are the spi-mem
changes, the modifications on top are almost independent follow-ups
showing why this may be useful. Nevertheless, I'm gonna address all
those issues and send a v2 with hopefully less obvious issues.

Thanks,
Miqu=C3=A8l
