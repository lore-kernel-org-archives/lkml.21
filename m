Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187040;
	b=Zfchb1PTWx4i8p3Nv6WfA5u9yjBlZctAg6K89gYdxlna/lMsHDhL7UyYSA5IQxcyqIEN
	 mwe3TVPit616EH/XpYYw0CYzsuCJG3gtOj/IEV9KrNqBeNJqasp8l15hX1IPPvEWJS0V9
	 1Q6dfv0DZzzzI1pEPQpMO6rAAdan9me2jLLPaQoC6ajFN0PHxX4mO2U/VWv8Ilx320evr
	 dflgh57vJ3v7hpU9yf73dRN2t8RWn7ASQNt5LvAg1sb5Wp6df7nCV8AEvnUAbcxXkv5UL
	 r2E9FTQEHnU9IS1jLD9pvDtAnDMMcblYvgeemnf8u6Tc0GCp5l3/83kEBpx574i4Wtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187040;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=nOuVgZq6Hoapw7L/D5ylHIq8Pkp+9ypRHxYDY/1QJPg=;
	b=lcte0O8QGja707Ixkm7uJsdf8X74J2F0NA0ggjAc6LAmpb6XMDaHUZSSjJ+jrWByLnSE
	 aeCSxC/VzDWAwozdYeISWI1YxcIRb3fAZgnJvnXRi+HTdCaSqTK54bdsfiUzBJBiWCDoo
	 IIZfxw7wPaLz8dNFJQuGVl2zG1e/b8abncmQ0HP6qDbxPeUpO5owm7bY/l9jIlSd7BUP9
	 bTHNIC+70D6dswwZsWWDyB10Fr6PP8AmegYiobx3NBeIu3b2CXO/DYXXwjBZWHT8meh4F
	 lxU/mSoXAZG6X4Pyx4TfkpjeLGT8BA5ruWPGNi1RxzvvcDj9Mdg+ueP/3mC5i06/q8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mPhrbuKg;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C02606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C02606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mPhrbuKg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C87CBC6221F;
	Fri, 20 Nov 2026 15:04:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1719B601B9;
	Fri, 20 Nov 2026 15:03:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 996E211BC02D2;
	Fri, 20 Nov 2026 16:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nOuVgZq6Hoapw7L/D5ylHIq8Pkp+9ypRHxYDY/1QJPg=;
	b=mPhrbuKgkGFfVq1M+FbaSdJNag8+QMHghjsqZt1xBr+JSbTyJbmRizNcemC1hdW7PrwiFo
	WP/wojGAB/Zf+e+mFgQB+urYvFAnZlVlICelhyWemfGFuu2yZV0N7X3cQgjOs2hQLLgOlW
	iHBdI/vYsUVY2YNmMw5ULtLnu2+lt4KYDv/eQvSAg1pqV/QE/9vEvMM8m4Qhjar3ubDuvo
	y+fEYGsrkXhDaTEnooWdnXvYipsXmQoLZpKcDO8/4fxenAEFjI7ZxUzctGmOqST0TUQ+6s
	GaT7fMt6QPaxwSAzSoFTvyxU/a3nQ/FaNmuJIx6v6jE7/2niftHYZcKITa/u2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Artem Bityutskiy <dedekind1@gmail.com>, 
 Manuel Lauss <manuel.lauss@googlemail.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org
In-Reply-To: <20261108-submit-au1550nd-resource-claim-v1-v1-1-8f4c694fdd39@gmail.com>
References: <20261108-submit-au1550nd-resource-claim-v1-v1-1-8f4c694fdd39@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: au1550nd: fix the memory reservation
 check
Message-Id: <179518703043.3404688.7884533552313535041.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:03:50 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 08 Nov 2026 13:55:11 -0700, James Hilliard wrote:
> request_mem_region() returns a non-NULL pointer on success. The inverted
> check rejects a successful reservation without releasing it, and proceeds
> to map the NAND registers when the reservation actually failed.
> 
> Reject a NULL result so probe proceeds only after claiming the resource.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: au1550nd: fix the memory reservation check
      commit: ba3893473491d9810f1dae8ddef38d9d487d630f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

