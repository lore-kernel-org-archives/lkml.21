Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443271;
	b=NDAmetX4kqIp3YNGz+JQha8WbmhANV9Wa4iQaC4GZFtQHTpTr7H5jL014fTPb0r9YyLo
	 ppGTj3ye2IoQG68+bkBBfa6COFkSHdCn6Wc3CQdG4jkph2yLVsi/khWtyDCtD7glF9w77
	 +J+TtQ9HBTsMP4Lm3DDHGAT0A6LV2BBOHliOIbi/Md52VGLTLE2Lux5Er/n4SvEWS7mlA
	 GPBlnLV15Fr1UAED5f9Lx8VMdrMP5ugrm/H1NS5bsiwbZ2wrp+GQwyjyQQdJDcvpgGZQN
	 osV5JBRhMiGzSSXv8vdV7CvClnDgDoTZHfWlrW395YzclHY6od0LYtJle0OMyRx+OkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443271;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=YFuuXMnMJsjCk7IZEU6QZfVyQzHNOrTyxoyMyX8RSv4=;
	b=YTLJOkk5jfKg6l4awDy+b7DutJA2o7yBxOnT9lyWB1z8C5rScX9WEQ8V/ppoZB7U9lKU
	 Nr0V0qeHcVg1scYSQC9P0LdQgBflV7Z48gZ61rvvKChqFI/FwDDl9lVxl6nYVJjUer1po
	 Lte/LXms1aV4unTIUFqtuQmrcty7dqAy+jIdjwzdflw6uaRnCT4RpI/iE+kFukGB6HXTT
	 ujJRB32DFFJANgiFoXt2uvJ13R3PflgjiUQe/KkGNFnb1SSLYJkNDImZxU2BlZXPmRfjT
	 SVEkERnumRuz9fqYGWwjJW4VqMKrY9ma2mkgJnDoUqz31dbtDbagfUuXNiBboV0tIlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PEVEkdtw;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E23606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PEVEkdtw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DFBAF4E4126E;
	Mon, 23 Nov 2026 14:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5FC3601E1;
	Mon, 23 Nov 2026 14:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCC3E11E6A4E0;
	Mon, 23 Nov 2026 15:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795443268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YFuuXMnMJsjCk7IZEU6QZfVyQzHNOrTyxoyMyX8RSv4=;
	b=PEVEkdtwJ3ypvl2uVYdoLWPkC7VS8oVuBbq+e5nfvuYY3hNkl6Nv+x0wezwbYtwIOyw+mb
	Oteg8KFs5zKYzRMc77Go5nbInAbCL4r2VE8HvpudxzQjLnUzF4GLsjnZX2no2HmCOEkNRV
	G6k+xXLkkBlQTLN8SEGQsR1JGlqreIEl5jewc+92j8mBUcfmoW2Jxalfu0TDEny8SS1aUr
	mTWVCdP14qBSW69oddfAuV2LAlTdD1E7s1aZ8u2y+nVprzrEiW2uUs2pQ4RJX6zOqDqzx1
	YbJGL52HoVJvjCecE6NEwLZiScqUxWdsKMvXRJ5g1TfimfHUuYnjyy3KlWsZLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Mark Brown <broonie@kernel.org>,  Kees Cook
 <kees@kernel.org>,  Tony Luck <tony.luck@intel.com>,  "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-spi@vger.kernel.org,  Bharat Bhushan
 <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham <sgoutham@marvell.com>,
  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v4 3/7] mtd: spi-nor: Add support for panic writes
In-Reply-To: <20261016102917.171095-4-paul.cercueil@bootlin.com> (Paul
	Cercueil's message of "Fri, 16 Oct 2026 12:29:13 +0200")
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
	<20261016102917.171095-4-paul.cercueil@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 15:14:25 +0100
Message-ID: <87y0ajtz26.fsf@bootlin.com>
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

On 16/10/2026 at 12:29:13 +02, Paul Cercueil <paul.cercueil@bootlin.com> wr=
ote:

> From: Tanmay Jagdale <tanmay@marvell.com>
>
> If the SPI controller supports it, provide the functionality of doing a
> panic write.
>
> Update the spi-nor core code and controllers to make sure they won't try
> to grab locked mutexes or sleep when doing a panic write, as preemption
> and IRQs are disabled.
>
> The information is carried down to the SPI controller driver through the
> spi_mem_op structure. If the corresponding flag is set there, and the
> SPI driver does support panic writes, it then has to respect the same
> rules.
>
> Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

That's reasonably close to the NAND version.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
