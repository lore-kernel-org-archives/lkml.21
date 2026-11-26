Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699724;
	b=rydPNELasfUe/+ikf7IN7Sjv2LbdvZI9DP9Oki4cb6DF8AQgs1quZxtD7aSphY/OQ4Ie
	 1C3O49tsmSABGBoW+GozGWCUOIbDWDZRHB9beix4Gn3hmJyL7r3GygeVtMfFNopnZnrIr
	 MvwJgVwUxwHjNIcwgoxobEbgluyJuSFqc0YbtrKuMRE74AczHQsf6emV2bH9+wkqJMK0t
	 3qu+RBkddmybaqP/FkG3cBrBj6uXrQGHdXDifSJ6rsgrf3xUV/vC1WnYJ0YJ7nmA1Nn+v
	 rjS1XMNiih/pwmaEkA3lbmXlBZu4UysCLdgxDQ7vQ3Zr3XSG9BTnUB/GTq5hrYVn5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699724;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=HlSnUqYSq8NTmz7Xjml8F8b9Z1YROOAV9ZRHKtryZS8=;
	b=ah2Um5P4hBCy0yKYeOocSspi+hgfFr0etmLtVhtaGghVerfPYE7WiS+I6l+XwsooSTVC
	 yz9FFK6UzertnTDYV1SepmoFmGIKqeFMUlVyPMqKRxpkZr/uH7YIH8dp2YG6BjE1y1TGq
	 hULcMx5YIEn613Tw1bVGnYjSACM4lALW5uSnPVE4WX8PvV9GQ/IzNfdFvkiRDus5qJY4Y
	 UDOUi/X/fNSd/oriJNojnMqd01EvRegEfOLaFAA3E6dEOztrsYPwsW67HuV7uG5xMSBXN
	 gFRUS47A7NCspCpR1RczEhu7CXE1PjqxKLEiCnEKrSmhAFW6HQ5kuJIU/BTj1TiO5lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XCjNZe7u;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80EC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XCjNZe7u
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15C591A1814;
	Thu, 26 Nov 2026 13:28:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8824604ED;
	Thu, 26 Nov 2026 13:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31F3711E68181;
	Thu, 26 Nov 2026 14:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795699720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HlSnUqYSq8NTmz7Xjml8F8b9Z1YROOAV9ZRHKtryZS8=;
	b=XCjNZe7ulzcHLS2ZJwG5KqJTmO/9QTXz18jXAJuTmeYIJ0yBLU8L/gAqLBvDae3wxFsuQm
	ffefG2NS778v4+hNjmSnxA40/r/CIuG8l42m66p25CtsiI7Y+HTisCgNXYrlqNNiSbNcI7
	IcsxtNsqk49SVbiCHVw8tOiqqJcC5vtD3xeb8Ka8GBm5xeA7gxY1ko/BEf9wHWYLAYVViW
	vqe3OUWN4gBD/OgLE/pZ60c1WExMoHn3ZBRUyjuQL6lwT4Y468ML9yAJHT+pLsyrrZycak
	KB4vtJBRj/neVAj74C6jXyWZkretjjx+gYTww7WsG2xJ/W5uHXxuAlc313SjpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261126112409.8491-1-leeonion.muyu@gmail.com> (Ping Li's
	message of "Thu, 26 Nov 2026 19:24:09 +0800")
References: <878q2fyhvm.fsf@bootlin.com>
	<20261126112409.8491-1-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 14:28:37 +0100
Message-ID: <87fqwnwwl6.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


> Hi Miquel,
>
> Thanks for the reminder about the threading, and thanks a lot for
> your guidance on this series.
>
> By the way, if you have some time to spare, I would appreciate if
> you could also have a look at the kvmalloc RFC this series came
> from:

I gave feedback 3 days ago. I am litteraly spending hours every day
reviewing AI generated patchsets like yours and you dare asking if I
have "some time to spare"? because your v2 has been waiting for 2 days?
:-)
