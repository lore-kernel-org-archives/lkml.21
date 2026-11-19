Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091850;
	b=wBWH5xgxhdZbQ5U68KIh/BD+YkcmHh/XnJvvqFTgWImOUhs74bC1VMdz9vBlUNYYrgLR
	 zz/Hr/Cq5r2QlWXkaBPRlzv1Wtk1ltQCEV6hAwIxIQQv7wClbA3LZLGxatBH8BzapnbOz
	 HxW6pLKj9g8sodE0TJZWxTp8Y3hLvr8yHp+k4D4/XsdqsFmPygg4ZYUmJONI/54hyvDn8
	 xyuOogbXWif7SDcDqP69tPNoVSQgr5cJweA3o4qQ1H6o1jwE/8OTSKWXS5PryxKVBCMcB
	 jR0k11JR34BgH7U2XhMT7fX8+X7Vwv+QYv0EJi1XHc9DnBTLVIB6cL0zIH/bH7GfMDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091850;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=PoTjrDwaaROZfYcyiVMNXY2eDUE3A9RMMRmZDiOLOV0=;
	b=2E3O6V9G5Dh1JCF/GBGYWN3R8/qeHW4jyryyJR1B8N7Lvsdy2FUVb+fPjJvEirpsNiWM
	 MNmyeWMee9gLhFJXYMhX+WJRo6XRzKr7uQ3IQ/22uQXekVq405EBe5n3GcgQ1vBCYXcga
	 Q5tQAq55pncgTGdlQ+9eBLkYWIwg+CDdgWpyCGT0pcy7rlEOhFDtnHnTvnlwynBATP1Kc
	 4OrZlhgv5Qen1xBngZ/8OmlGUNJqUjK8x3NYCsmGzC9e3ozkYyRKB1N+5vbSmsMvp8aXx
	 2gVce5nCdAyItHaJxFOXz53LmnBtx05WRwgXhx4sXPpjtuGzejSEibSfatumMPlZTLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Omh1GDDh;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A28606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A28606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Omh1GDDh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0CA9C4CBEF;
	Thu, 19 Nov 2026 12:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 640A460237;
	Thu, 19 Nov 2026 12:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CFDB11BC0662;
	Thu, 19 Nov 2026 13:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PoTjrDwaaROZfYcyiVMNXY2eDUE3A9RMMRmZDiOLOV0=;
	b=Omh1GDDhb/OW7/i6hnOvWKaElu3Kt8qWLLxVvNgKoDJjrUBFveqntLKc6YpVn7/czS1aD0
	YeXc7hbxoBqt8gCCI0e7z5WjVeibhvbKco751UrPU3+Uk9bR/LeFM7cZ0/qtvdeKXmWNz0
	GX2bRPiRxcN1mj3Um1MSHL5riXiRGnvCIKxlb+WrkNI0MVRqTZJQhVfBPhUxpx1+3+CstH
	7nOPwlusLMB1WIevUyjSBzc/jvWKVmCvIt/Vf6YAFWlWW5OvUUEyvqkse7YeR+5ZAOH3UG
	n26S+hnWZImEiPYINtFesES3MlA85mcJrWrhGOLTlKjbxh103oRjETWWdX6Z3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-submit-rawnand-bbt-read-error-v1-v2-1-1a3f5d121c5f@gmail.com>
References: <20261118-submit-rawnand-bbt-read-error-v1-v2-1-1a3f5d121c5f@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: propagate non-ECC errors when reading
 the BBT
Message-Id: <179509184715.2889394.12952023230770454975.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:27 +0100
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

On Wed, 18 Nov 2026 10:51:15 -0700, James Hilliard wrote:
> When loading a bad block table from flash, check_create() invalidates a
> copy on -EBADMSG and schedules a scrub on -EUCLEAN. It ignores other
> read errors, so it can report success with an incomplete table in RAM.
> 
> Propagate those errors when reading either copy.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: propagate non-ECC errors when reading the BBT
      commit: b497770236858dfd9711b1d1f0ae319b7d1926ae

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

