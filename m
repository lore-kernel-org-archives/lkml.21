Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783976;
	b=hvVkQCEAxVwPBZb53u9ph7aEjciont9RWv6LzCkWACBpfvRymCGaqK0ZFtCUJCGK9oMG
	 ih23+ScRCyMzPCEZEkf5kxBNVS4MUswhu5rwL7ySBvwd4bcMKHmNVCNFYxaFRJ0RRQUHE
	 fH5qCILffwx2Ni8Opd7kqgrw1GzOXLsvcFcGy3Z9s5i0WXHngek1cJ0jBSs4QNrz77mkV
	 ZN81ZFx2tR+6OttK3JRneqdROiPP1PwkpVy0CtCNP545ISuX3y8/+gL3XNS1eolkBByIH
	 JSpNf/S0eZ7HzDIx/MrDaAZpdDeT70Zq/VOCmu0MetgJnI7EodwfFghchJlGlJUdUzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783976;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=kdsz/cTo8c6uWKeIMZKLzgXvIjfdgd2reyR2+XDYsRw=;
	b=DalPX6Q+Jccc2Z8G+SAx/BYaYVSZpk1Rk5D6CzUeSMRMXl76ymwmNPX9PkwHwycMZvsb
	 N0syBv5rfLGFzbYT9nkHOWw6lPa2bevuYnVMbKphcUzLn+gHNANpquvNmuEUI8J6pPvXx
	 ghfGXKGa6XJQGXhRjybXkrQH2kC07DF3j8HsmVM902hE0cMkPDfoLo88ruxLizfkxHWs4
	 JEfrHxqIOdK0v7vpbAfPcsNOcrKXUQTe/Z6BpBfWK7J/9DqY6rUrBI35CoalVTh1s1J3J
	 64NJm55nIC0RwC21LBpkxw6bjMnvmr9i6oMGT7svHNtTxUGorVxjUWJnH5V+Ajx3BXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TX71ySiD;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4070606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4070606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TX71ySiD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CEF04E417C3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:52:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B8736049C;
	Fri, 27 Nov 2026 12:52:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51CA311E685B7;
	Fri, 27 Nov 2026 13:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795783971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kdsz/cTo8c6uWKeIMZKLzgXvIjfdgd2reyR2+XDYsRw=;
	b=TX71ySiD4ci5ER7xxCGYjHEFyC3KA2DYUhkPZjYegw7X/LWIl6E+mSCQVCHMB635fXwqZj
	K/PWN+Q1Hj76frSMW8e5QE+/A089Emgl290E3iDv/GDOJeM1V2qEveuCaPw8vU1ULFJfUm
	geny3KHiOMlpne0YpYj4eT9OCqrAMGW64T7nN7N8dLuzPL40RVW2MxgVSscipl9FxOqomd
	mxC1f1P8MleF5zz/TwQJugZqKv6bmXxAMH14kIcTn00S+U0vwAeXdtSdyo0pbS7vQ+CHBt
	MrlbnFI9b1kU4oe+PGv84fvGIVxEhgDiuBW2gJJ0dIaih99NU+I/DmUEZDEGMg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Teng Wu <gigadevice2025@gmail.com>
Cc: linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  linux-kernel@vger.kernel.org,  teng.wu@gigadevice.com,
  weijie.huang@gigadevice.com
Subject: Re: [PATCH] mtd: rawnand: Skip timing mode readback check for
 GigaDevice NAND
In-Reply-To: <awl2bMa2cqHZWfD-@Fantast-WT.localdomain> (Teng Wu's message of
	"Fri, 27 Nov 2026 20:24:12 +0800")
References: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
	<87qzgas5yv.fsf@bootlin.com> <awl2bMa2cqHZWfD-@Fantast-WT.localdomain>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 13:52:47 +0100
Message-ID: <87ik1itp0g.fsf@bootlin.com>
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

Hi Teng,

> I agree that vendor-specific workarounds do not belong in nand_base.c.=20
> Adding a dedicated nand_gigadevice.c would be a substantial piece of=20
> work and is outside the scope of this effort.I understand if this patch
> is rejected, and I will drop it for now.=20
>
> That said, if there is a significant future need to add nand_gigadevice.c,
> we will refer back to the changes in this patch.

You need a nand_manufacturer_ops (4 lines) and implement the above fix
in the init hook after copy-pasting the pattern from another vendor
driver. Then add that file to the Makefile and refer to it in the core's
includes. Honestly not what I would call a "substantial piece of work" :)

Thanks,
Miqu=C3=A8l
