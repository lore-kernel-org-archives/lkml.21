Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510819;
	b=1kdJrIaYd2Q41h7Qv5wyd5d2oQFJQP7rsv+neZbwc6J/zmFOi628OZj/1vZ2LAFEENQR
	 417ccMv0IkoSQTBbhCPfVRYZIzxmIhHzI9Rt3CheNQHXkOF5xRPOGg8BzwgDnvVWJB1Hi
	 AYY04Z3mMN6DpWLoViWp1pelQRultaTSL3nY6n6JCIE1c9/lDZrI+gI4+LKGtlMBuHy8Z
	 t33LbsD5nFdF+SRKlFqK54pbpuCRTKoTdMj45AQROj2mnBhua66T7mK6vxeiypPNP0b3Q
	 Xusjb8E6q+T1iDdWq1Cd2UNUo7Uqox2MdoNDdOJKTtvtTVwskQp41eQytUnZSKoenBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510819;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=smFTUIcx8cfAJ0RIWvn0nwR9mA44PKis6Nxa17lG3+k=;
	b=pjlr4kYB5i7H+bQ+FwbZDj38hjS8qT6Rbz+sDwioLHMulreTrGIBt4dbowI/kz8Yh9SH
	 VyA8NHr/vHHIi6kR58WsgsUkZTsuuipbVFeRySZF6uGbSieE6qm12lu1a+y3wMAUnH/sw
	 DNU2/+ZZkG7VkkHMooTvqkS3bnHfYtygJNcmS/BBl+1vuYwQr2IRSlZe1tlK3LWdmYmWR
	 QQQZ9BqJavSHOy2a1Zm+MDZRVKA/AwTzAF+2qiEkWIhA/tlNS1pSJ6Br6ZeNHiqjy5WyJ
	 eN+iRYfwoga++vkYFxupHJHYuGNiFiTKyFWsxcNlpq/Ol25VicxXCEBJ2mZGAl8DIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kiqmBDZW;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD0A606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kiqmBDZW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1B9571A16F5;
	Tue, 24 Nov 2026 09:00:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8CFA601E1;
	Tue, 24 Nov 2026 09:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 112E811E68CD1;
	Tue, 24 Nov 2026 10:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795510814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=smFTUIcx8cfAJ0RIWvn0nwR9mA44PKis6Nxa17lG3+k=;
	b=kiqmBDZWuqGnmZH8dTJhz4Y+tJ5PUFhdt956ttONRCBoKDeslaD3J7qYRa8Pa5/nsCdZiO
	3i+Ed4vvqdQaggJ1HYYU9eQQOcXh0CeZkgKbGSS3g+RkCv+dLdn2MbRvVOd0UIWrqAG6aK
	9Kw6ja2Aj6AmKtnH5PX4/mdk97e7pAnh7/yb5vOSMiGuuxSi2naFoEb0AOBCyBHZLWQCr4
	s3DwSddEtn/re5H5wwwodR2xAICobnEEo4HQAs/W4aTj4r3+Bjg+xB1p4YKQCJSilQPdxj
	FTXUGkSed0B0upfooAf9gN6XLVD+VFDVkCxMSp0SYvu0HAcpHyxnP+qjzrNCMA==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mfd: cgbc-core: Add support for conga-PA7
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Markus Haberlander <markus.haberlander@rosenberger.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261123-cgbc-conga-pa7-v1-1-f3d17fb02e43@rosenberger.com>
References: <20261123-cgbc-conga-pa7-v1-1-f3d17fb02e43@rosenberger.com>
Date: Tue, 24 Nov 2026 10:00:05 +0100
Message-Id: <179551080501.9961.1835193533099263045.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The conga-PA7 is a Pico-ITX board with an Intel Elkhart Lake SoC, like
> the conga-SA7 SMARC module. Its board controller is of the same
> generation and is accessed through the same I/O ports, so the existing
> driver works with it once the board is matched.
> 
> Match the board vendor and name, as for the other boards: the system
> vendor and product name are empty on this board.

These fields are expected to be empty. It is not Congatec's responsibility
to fill them, it is the system vendor's responsibility. The conga-PA7 is
not a system nor a final product. So drop "as for the other boards: the
system vendor and product name are empty on this board."

-- 
Best Regards,
Thomas Richard

