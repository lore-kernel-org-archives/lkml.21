Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527634;
	b=1W9C4Ve0h5oBtdE9e2AR+BKimc3gbTFYj5xFkEnZY851WPwt6+Odpz2UPA/TDbKJpYMl
	 AwVrvcwxcTT+FNff1oWmq+ibD19Xw+RWtBe3wyfew7FhlINZn5gEOOQ34EW6l24YXj/pC
	 OMFp2q1f6ALzsWrvaPs4ZDkzBJSuloUbxZURfXa87Q/SmnZydhKjcegl1EpC6AefjKBye
	 yIDe8hZr1qzOO5CpFLMMHV//9tzpsfnEBKanuipdMRFep7Qa/uK8V572EoGuBWKVmJE0d
	 A/4XVIbzpqSb+iIgnagSXaEUPZiZ1ni1PUSeHk3pcsTl8TzVz+7ftOmbb02tSECQsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527634;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=shErw5dZCNwMc8bI9hdpVPwYuPWVh/mruGsCFe1/Ngg=;
	b=Xt33l9eFWBTlXr+uHGjeW7kYtfxFy45rNDbI5yA+q5M3+o+4RFsuasoKEzejSCXPAIyL
	 tMOlSZjPyzWlfxJbO+AqBCKm+xn4TuC0Ls94TUQFs45E+zO+oblJCHfgNUVLl09d/DjIa
	 rhG+wFNCaurYivje2u2KOKJdkNmaVvEk0YEKs8MlLwCls1cH6lbC9BvyEaLxjLfp+SjDS
	 xhfru5YhJm3Ou0vhDpsba9iy4lrOK/eCUXvfvkpXppfCMuM2YZiAEMW6sOIEQuZ/tsQ1t
	 6/iC5eaL8A+4q/kuCJRZD+7fYkWQEFHu96Yu5kApuq6HNzuqRgsHyjkAdGdtmOIC/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0zOH+RBN;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43B606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B43B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0zOH+RBN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 460F6C2C648;
	Tue, 24 Nov 2026 13:40:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBD83601E1;
	Tue, 24 Nov 2026 13:40:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1233B11E693D6;
	Tue, 24 Nov 2026 14:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795527627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shErw5dZCNwMc8bI9hdpVPwYuPWVh/mruGsCFe1/Ngg=;
	b=0zOH+RBNnFPCrYL7eZLEVQPtOIUR2I2MlrubeF0PDqim4cn6JTDJZtsgNp4RBs68ko5HSf
	q0Qut7eAxwDp9FevbB0OuK7u+C/ow62VPDQwkiFO/W1MRW46Rq+NA7S8o5v9zmQDYZiogi
	z2asUIjmCXm4IPQtQITki+DzofvOXlALYn+/5ICeD/djnUEKErHZ806FR81IQIZZxdOkRI
	8t6CxtGSvCkwqhw7yaN5NMqK9yurCG4ONY+1D3Mamu9g0q+oRVwXK1xWt6t+oN8UiR7ldz
	YsBs1NkvXFcfiE43lgMRG4XMhm50r2/E1jN0Lm+wNVvuZ9lqByxBFx5elfk1yQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Teng Wu <gigadevice2025@gmail.com>
Cc: linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  linux-kernel@vger.kernel.org,  teng.wu@gigadevice.com,
  weijie.huang@gigadevice.com
Subject: Re: [PATCH] mtd: rawnand: Skip timing mode readback check for
 GigaDevice NAND
In-Reply-To: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain> (Teng Wu's message of
	"Tue, 24 Nov 2026 21:06:21 +0800")
References: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 14:40:24 +0100
Message-ID: <87qzgas5yv.fsf@bootlin.com>
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

Hi,

>  	if (request !=3D tmode_param[0]) {
> +		/*
> +		* GigaDevice raw NAND chips (manufacturer ID 0xC8) support
> +		* the timing modes advertised in their ONFI parameter page.
> +		* Skip the strict ack check; keep it for other vendors.
> +		*/
> +		if (chip->id.data[0] =3D=3D 0xC8) {
> +			goto update_interface_config;
> +		}
> +

There is a vendor driver, you shall use it rather than polluting the
core with vendor specific fixups. Check what
macronix_nand_fix_broken_get_timings() does for example.

Thanks,
Miqu=C3=A8l
