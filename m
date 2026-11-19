Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080397;
	b=ZIknoiouFjVMr5nz3LRcv7tiq4OGfDOF5hFHE/pjLQZDQAAVgQT8ozplDO+MnwHpwMnO
	 lUObdlKs5Dp4QcVlhSM5QhbTp0k/hBe4RLn6NCPRgR33LbcgdAb7iKbg7qcjfxydYgGvq
	 tslIdvRIOr0Xaea8AkJ0iAjmjtg35VqoT3zNGihTAJBOVTQrXHSXAJYRhp7Tsz6TqQ+rI
	 kj6v2x+moFO8yCshdrU+cA4Y24LPMgAJ8mLgdMw3Bkkn/iQDxXG+WgP6oFdcasUXTI+Lu
	 6aIVFcynwXmr10Jq/0nY2kC0/qzqR0rfQcELYmgw6lSGJjyEgNc0v8MXg1oaNeBwDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080397;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/z7BAnG7MZSAVYRW5pPZLxA05bNqQ3NUtrJbGTCFDWo=;
	b=S6tsfmi0lpH/zqNzu6hfiAmxTfRp3AeWPCXGrc67hvaHHjXrD5arP2ofZGSeTVgR5R+1
	 Bj0OzsTDL3ghgwlLp/2lhit5Diz3WtmuNVIxwcs+5DMcVaxDt6km04SeoDlaGNau4tH9L
	 s5QXYAPO0BPe0HOtjhbjf4Q3jdMFofjkCjg+C6ZdiHaY6mnmJ+zntL8YBtQq7ENZ1/QWv
	 uARn6VfB1sfhUqZM6R32OefZhbB/hYlUQWpkIE363pKhHjCPirOMxSkTzQRO83JkTBAG6
	 9PgJ9Ed7CQknDplky76i8L7fMrytAd2X9lXkjsso2VSt84ne83G0MLTmvabSNUu+PGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Cz9JAfUU;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5590B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5590B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Cz9JAfUU
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 589B24E41662;
	Thu, 19 Nov 2026 09:26:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24B5B60237;
	Thu, 19 Nov 2026 09:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 372E711BC1FF7;
	Thu, 19 Nov 2026 10:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795080390; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/z7BAnG7MZSAVYRW5pPZLxA05bNqQ3NUtrJbGTCFDWo=;
	b=Cz9JAfUU7IyztCLVofDhmCUhQWcGYKI0HmupitglhbNt8Ay4Hkm7G7BPIhHVA7mPmGRq2v
	v4OnXjpy1WnIdP/JLgPuWvD/0AwiaPVh5aDImotDmfmllARdNxV/SPL/bofqQCLjBeInU0
	cQsFdO6gPvZL9sGKVITTIMM7PM9eawYPD0Pv1YN9a318KmLJ5cBh/310lntmvKo2ztuvxk
	e3eVpzS877O1iX5V9BLJkufMaChuJ0PCpsohkpmc5D/nHpdAlqJRxHNyDtlp3nHAJCnZl4
	C/o5UdXRbPnrR1sqQ1n6zlz0jMFt5wEGsJ82bVVsD3xO52hZXOtZj1ECCFpsFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu <ray.liu@airoha.com>,
  Mark Brown <broonie@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: airoha: Explicitly prevent continuous reads
In-Reply-To: <37fc133b-a5f3-4b4d-ba2a-002239bbcebc@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Wed, 18 Nov 2026 21:37:21 +0300")
References: <20261118-winbond-upstreaming-airoha-cont-read-v1-1-acc0b6410868@bootlin.com>
	<37fc133b-a5f3-4b4d-ba2a-002239bbcebc@iopsys.eu>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 10:26:26 +0100
Message-ID: <87h5hdf9z1.fsf@bootlin.com>
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

Hi Mikhail,

On 18/11/2026 at 21:37:21 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Hello Miquel,
>
> I think the patch is bad for the following reasons:
> * As I know there is no CS issue with Airoha controller. It works properl=
y.
> * Airoha controller supports large reads (but only in PIO=C2=A0 mode). Th=
us
> =C2=A0 continuous reading may work properly. Unfortunately PIO reading se=
veral
> =C2=A0 times slower than DMA reading.
> * DMA reading is much faster, but can't be used for continuous reading.
> =C2=A0 Maximum transfer size is 8191 bytes.
>
> Thus for new Airoha controllers (en7523, an7581 and newer) it's better do
> not use continuous reading and read pages using DMA. Old controllers (like
> en7512) does not support DMA, so they can benefit from continuous mode
> reading.

I had understood that the problem was CS handling. Therefore, the
approach proposed here is not a good solution, let's drop that patch.

Thanks for the feedback,
Miqu=C3=A8l
