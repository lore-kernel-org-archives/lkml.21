Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998606;
	b=OYUuRqIiZkUeMoNCCMYb+NhsDQuN0cQZ04+tFerAiTTWyEtLWHdf7hG3gkSisL1kO4G/
	 uKxpYQMbEnQZlJa5J+p0Vj2ylGItidEKV02ExI9GVf5c8CHyTsgXTvFWWzGykE3dDqlmx
	 7fqjqZZpFbiWDiLBSciD142QHTXGKuxQS2yKvnh8XHfhi7jGAbjhY5DQYSymvadtAHAFO
	 4fmzpwIeBJSoExXI0K4KMmbleF/XpakWd0yjbqAKQUx8puJ6KoFR5X7gRAq5ZHfasDirJ
	 h7TkDLtrUt/WlpUsEaW7DfaNzRsyDu/nge+LK+q+UhiezdQ0XVsMfRf1T6glf0BBh3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998606;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=eF/hHeUma+QeQ6xbs3R+FZONvsSTm0QVHzw9pn5uvQw=;
	b=GwNZMv9j6eNCkxjao06pzu/5lDpY35COwv48kV9VT5CmDOrxcK2PAyGlvbWq7qf3udW8
	 oRuXOOFeZHBPz+0XF6YcTO1YZB9QfFgAn8DTnWwwtjVMVF+6Tj5iDVmgUPU2mkldNX7+V
	 6sW707G9HIaoDw7DjPav/gRLGRxkjIxwTVoay22LtNWXjTfaAkifc/YYKnhq5d56UGe8v
	 oInUYu7BXK3T7tqldmZ2mFng8Q8B9GEh1XVgkgaD6VMbLCzFPAcC1YhCepckVNB/GqK55
	 /D5N4lPmFaN7eGEGEUuESBQ/ItA+0smx1H2+oyYBSooNAAfXnhTu/Inejf0W8ENIB8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=26nx9rUx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7725D606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7725D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=26nx9rUx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81E05C4CBE8;
	Wed, 18 Nov 2026 10:43:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96F505FE9B;
	Wed, 18 Nov 2026 10:43:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 925C311BC1151;
	Wed, 18 Nov 2026 11:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eF/hHeUma+QeQ6xbs3R+FZONvsSTm0QVHzw9pn5uvQw=;
	b=26nx9rUx2LQCLUilaAtaApd65Ga2TYSQykwfxHXpjXSCMUMYhiQ9uhVLWhb34hEA1Opxg2
	WLB2EndQZK7jjl7YD2/cxqpKTuoxCMJOc7EsNDQ2V991v6EDlGM1RYrRKfxZCQg7oReOh/
	wz1NDbL0oIYHnblJhDiZOEHWj73kyLiz8QMOQWoC9WdkEV+5Muk80u4t17SY0IWXIqCDm+
	X/sG4OGmC8ANHW1Rf0BWO16wP52RCPy+QW76nvHD8JVyQig8m9YUCr5eGWcSJsqkD4Mr4S
	pXl46hpFQOEGYNBINX9BXBcvjHnZ3aSPIoxuTAEty7rleyyvkE3PACIcZte3IQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: core: skip empty read and write requests
In-Reply-To: <20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com>
	(James Hilliard's message of "Wed, 04 Nov 2026 22:03:38 -0700")
References: <20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 11:43:19 +0100
Message-ID: <87y0aqifnc.fsf@bootlin.com>
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

On 04/11/2026 at 22:03:38 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> Converting mtd_read() and mtd_write() to wrappers around the OOB helpers
> removed their zero-length checks. Neither mtd_read_oob() nor
> mtd_write_oob() stops an empty request from reaching the driver.
>

Yes

> For example, the raw NAND read paths select a target and can read a page
> or its OOB area before checking the remaining length. An empty request
> at the end of the device can therefore select a target past the last
> available one.

No, there is a guard against that.

An empty request at the end of the device can therefore compute a die
index past the last available one and hit the WARN_ON() in
nand_select_target().

> Return success from the common helpers when both lengths are zero,

Ok

> after mtd_check_oob_ops() has normalized lengths for absent buffers.

This is opaque to me, just drop.

> Keep the existing range, write-protection and operation-support checks,
> and clear the per-request read statistics before returning. Both return
> lengths have already been initialized to zero.
>
> Fixes: 2431c4f5b46c ("mtd: Implement mtd_{read,write}() as wrappers aroun=
d mtd_{read,write}_oob()")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/sashiko-outbox-198544@kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks,
Miqu=C3=A8l
