Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186971;
	b=dZy7zFy8dV1vYE6dEFCqa+nBcQFz6acLdPOqOUyLvKH2bd05ZaV/r2Dw3PdOXRHEP+g5
	 CpJFumeW7GpV3GRZynwe9VGXSsgkBXsDdrZpZgRY4b4fXVdlWijhJ1jMyOPsgLQm0qhP0
	 JM0Q+KdVB1nvk1j3APPMXrTDUpTMK9Hd7Jx7vriDAnjkRELDJ0inj+y/JrObehXtt6bWI
	 AK3H1sgbX2DeaX1KeEKxO6XPUfpVV55+fAPzsPHnb9W6bWSnJp14HX/uGJAR/0SqMUtf5
	 Z3t4oChgdbc8qJYEmiOcV1e7LTaxdUr2NtAc0LkLzIZ0e/9nSpnsjY9/IZzIsYe1xJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186971;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RjjrO4x33/X7qoxGWKBXsMF2h2L17f9YWm2FAzoV/0w=;
	b=A+nUOn5xh4EpQuf3L5xOV6lZ/AqUdH5599XbxWf0PPctDgRemAQ8DY7RUTE8ZWyy81k3
	 Y3fKEWdVN9R8mY+sdEYGR7kCjXlwJajXEAdbEU4AnO4edeNRirwC+ZBzDwp6PwaOOyEpu
	 vh5SnZVBuF50C0uwNMzOwY3FKNwe0viNmztiWleSdWs00UJA+IscCLS2AfvNMmxubdvHG
	 SlKK3usFEj6Tw3R3PB/JxpNomlc4iT6Va5zfcn2MC6U83F/xg4pp3GZ/ZVrvVotpZLIZp
	 r24kOc4sWiqyF7hs1VqWYV+ObZwTlqa8TzXpj5Yd8gPlm7/iANyc5MiQtq90xLDL/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ssBNuUQb;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29115606BC89
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29115606BC89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ssBNuUQb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71E89C62220;
	Fri, 20 Nov 2026 15:02:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6057601B9;
	Fri, 20 Nov 2026 15:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D5F711BC0284;
	Fri, 20 Nov 2026 16:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RjjrO4x33/X7qoxGWKBXsMF2h2L17f9YWm2FAzoV/0w=;
	b=ssBNuUQbwq+8FpwxhUsUTHSrrYka73VXPRpTygtfqS1ZSQzQtsQt62hmFZUL14zgBsO283
	lr5lgLztnkraf7fTmuJ3p/N6c6YYEsBvn2TGoH/imr2/EgqJnrmq2YGSvMpO9nVfCkCcIl
	IoeFMPcpKiC2mI1vy5nSW7jLE77LbyFSzxBbROEXbwbT+q3kLOg03K8JDkIyfIBPK90wnG
	v215Yx3iDwOlbc+7Be755B0ihfm675EuWfdEiS3udLQAPKH2qzSlpsjbETduT69oCjQ52E
	vkyCuSKcQwydIwfbZhgkg67OQ2NjOkqqQARbnnlUpQhuCXu/dk48+sgTxZ//TQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261118-submit-mtd-empty-io-v1-v2-1-b980927931ef@gmail.com>
References: <20261118-submit-mtd-empty-io-v1-v2-1-b980927931ef@gmail.com>
Subject: Re: [PATCH v2] mtd: core: skip empty read and write requests
Message-Id: <179518696810.3401781.11014509839002382803.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:02:48 +0100
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

On Wed, 18 Nov 2026 10:18:36 -0700, James Hilliard wrote:
> When mtd_read() and mtd_write() became wrappers around the OOB helpers,
> they lost their zero-length checks. An empty read at the end of a raw
> NAND device can then compute a die index one past the last die and hit
> the WARN_ON() in nand_select_target().
> 
> Return success from the common helpers without calling the driver when
> the request is valid but has neither data nor OOB bytes to transfer.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: core: skip empty read and write requests
      commit: 3db54924e7fa664dd6303f3bd0cb1eeceb1f513e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

