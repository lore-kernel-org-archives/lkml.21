Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705438;
	b=BrMaitmkYjy6vwXizD4kAijIdC+lk+8ZTygfgE6+aMGn4NT636TcYKaLjwe2DZQk+5if
	 OYmFCCY4afigkjGJAL+EUTfd50Ch25x7QKtxOVVrvD/UTVTTgA11+0z60pPODNE3zYg91
	 q6IlLxuteEfsCpWYR9nRzp8mPZA+xgCL6dRgTe1CxMXDHOX8kEzOwVN2xtY0INTJILBk7
	 bEKwFBYBT6lAL3qaIhPkf7vg+jl7DcKLeuT6/wmO7652R9LPp/yPCUGvt8LbkCJL0TlgW
	 cX91TlVhejAxl9idbrAqNpmoQhnChYGa/0/4Z1sYZKygHexhw3Xm/YWcaEYUstdEVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705438;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=cXAbbENRHdarSgHRXIAEN8kf2z9aY1mP+g/6wPRUGSw=;
	b=PtNh8FJ9W2pyDj+KvkId0dPifqaxbRc6drZ4d+dIUyf3Hd51D6nc+JP6Z6AcMf+UN+7h
	 Ocpw/3RFoPWsyF1ZjUk97VIP6AD0kDDvXZdCkJmXXVaP8urICApH9c7JNyEow2dN7k5ln
	 nCVABKikG4O2L1i2mKF882hYRgFOnU1n1tGddDOQhCuMhpxaqvMaG5PW/rd6XWASj21lX
	 qUoXFJtpKhPKkYCKxOa0uMU7Tx3Z73/q8VGhRN5Pix5W4+uZkpGg7zCQlB28kDUz3xNPi
	 2VG8aFrlM9RNzh+Enb9aymunHP8CQSddu1l7+QK4Y2pYubiNJtgThDnpgv7j4EGBqoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lJu2H4Hk;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048A606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5048A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lJu2H4Hk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45B26C2B9D1;
	Thu, 26 Nov 2026 15:04:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D58AE604ED;
	Thu, 26 Nov 2026 15:03:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2E811E69022;
	Thu, 26 Nov 2026 16:03:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795705433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cXAbbENRHdarSgHRXIAEN8kf2z9aY1mP+g/6wPRUGSw=;
	b=lJu2H4HkhSU19ssS/2UIAUGPBMMsESe6yl5UG4PV4r/4iaYAmboj6/1rQXD/NGr5VRtqqW
	M7E5dD67FYaQtp/QNRqrHoRlAhP312Hiu5gM/HreBVwoZgktPbjONp843Poii724FBzOxR
	Rj9g+9HWGb0X/aCPZ3AcRasRjb9iPbIBWtPG3Lhdf4TL9CyJiIOBlWHsnmlvHOguCcVeqg
	UpL4szb8nVrohyl/LIJy86bnMc3QDBfQGhq0k01gTqW2xBNCGEmRDWgwFjg3tKh6GtV/w8
	Px+u05ih5Cg5+Gv588hd91HL00tw62Jne73qQftzr2nEGE1NNJ2c2A6J/99GBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Cheng Ming Lin" <linchengming884@gmail.com>,  "Marek Vasut"
 <marex@nabladev.com>,  "Pratyush Yadav" <pratyush@kernel.org>,  "Richard
 Weinberger" <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,  "Maarten Zanders"
 <maarten@zanders.be>,  "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
In-Reply-To: <DN01NSO0FLT0.11GY6QPV7JVR4@kernel.org> (Michael Walle's message
	of "Fri, 20 Nov 2026 13:41:19 +0100")
References: <20261024001658.222147-1-marex@nabladev.com>
	<8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
	<20261028081534.945416-1-linchengming884@gmail.com>
	<DN01NSO0FLT0.11GY6QPV7JVR4@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 16:03:47 +0100
Message-ID: <874id3ws6k.fsf@bootlin.com>
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


>> Would that be an acceptable direction?
>
> Yes and in fact with the recent changes, you should be able to set
> .read_sr2.

I am indeed trying to sort all this out, hopefully Macronix flashes can
leverage the whole QER/SR rework:
https://lore.kernel.org/linux-mtd/20261126-macronix-upstreaming-spi-nor-cle=
anup-v2-0-672a59abed62@bootlin.com/T/#t

Thanks,
Miqu=C3=A8l
