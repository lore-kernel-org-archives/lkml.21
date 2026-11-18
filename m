Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017754;
	b=Da0XvffUd43ALY0TO4jhf0+yZqFQNrh8UvxRkW35YtHaJUdi7qAfoXBVmrevmqYbZ8Z2
	 tW9V0vrDVZnDXhu8wmdRxNDvyGcI7Ep5tFUij/Hmk8SAn6B100bpWhNObwyC/F3wmHHky
	 duFych7hwqOoeXnRRA1d0y7Ikx7/1bqEXs5Wq3IDPMtKF/qyxltDfbkk7uhEEbVsqw9j6
	 0k8Nqxo7h/cxfDOvoKhuevLcKEQvzIid99L+NVyfw8F0ShagshJi58VAiKEkfBkvDq5Lk
	 6lOb/uNetVqO4j/A0hePHZh8GVzdXBaHdbqBrdoTtiBHxuZ0kRE2v3v7+GBut8uwSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017754;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=4GTSb01MmOhA2XPo9Xkd5dYWZ81pB0r37/OWJT3zMpI=;
	b=b6Xa1JLLg1/ZqJdKbHpx+eKBfBKZZ/sVxrGQM/gDQ/KCvNt1mfmqU5KsDIH3LiFhjQnj
	 1OfEgxNbQKD8V+wJTz6hRNkX1Z6TV9sF/e27js6UvZ3RpqlXnLq9Qj4f5G1Oy58yM4hcT
	 /SWsgDWFYJIcvv09taFkgv1s8qbL/8f62aqEGOrLr5RLV3T6pYkIzzdZOxiCa7apYzfRf
	 RmFD0vyo1PVXAtBTKoQmtPDsQS/vzXA8E5uYk4chp22bZMSEuulIs40x/x7HEA4wWsIHE
	 veREvvGaAc2aNvBarON7VeoAJmbyLXY6Q9BqhPFeNOujnSc3NHoZ7vnIv1LtJjvPbFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d2AMEmgS;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF0E1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d2AMEmgS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 448FC1A16D4;
	Wed, 18 Nov 2026 16:02:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 131845FE9B;
	Wed, 18 Nov 2026 16:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997C011BC2660;
	Wed, 18 Nov 2026 17:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795017746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4GTSb01MmOhA2XPo9Xkd5dYWZ81pB0r37/OWJT3zMpI=;
	b=d2AMEmgS9kekaFUie2VHKKBhxApfscNozpOI1gqktKKg99lBoZluEawtDKaRV64cxbRhGe
	ShIDcbwJhGrWQ8t+6rX3Tdyjqi6xLtzuSOdIXdCazIMX6BP8ghwqfe4OrdzLqIp7yCRB8U
	TMRWqXGOuDPRh3vBHtrfLKJogsuhReydnIsUJR7UvqpBq7fkysapc1ig2s5YPgvLVBxai1
	DNtuI9kKBgjm14/DOrfzcx0wDy3emMfP1v/bjUiB4jFFag89FwgdM8ByqQlyCNwJkzR3lm
	WhfBkI7h0AHZOfXb6zmFZqJgcYn30nBBzH5UFCw0gqoPLXjJoGStYd0LdKXeqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,  Kees Cook
 <kees@kernel.org>,  Kees Cook <kees+treewide@kernel.org>,  Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: linux-next: manual merge of the mtd tree with the origin tree
In-Reply-To: <av24MbMORkbY00UX@sirena.org.uk> (Mark Brown's message of "Wed,
	18 Nov 2026 14:37:37 +0000")
References: <av24MbMORkbY00UX@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 17:02:24 +0100
Message-ID: <877biagmb3.fsf@bootlin.com>
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

On 18/11/2026 at 14:37:37 GMT, Mark Brown <broonie@kernel.org> wrote:

> Hi all,
>
> Today's linux-next merge of the mtd tree got a conflict in:
>
>   drivers/mtd/maps/lantiq-flash.c
>
> between commit:
>
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kma=
lloc_obj() family")
>
> from the origin tree and commit:
>
>   fd1cc5b1dc4f2 ("mtd: maps: lantiq-flash: fix NULL pointer dereference o=
n probe")
>
> from the mtd tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Mmmh, I discover this mess only now. I rebased my branches on top of
-rc2 and fixed the conflict so your fix should not longer be
necessary. I hope you told Linus how painful it was for everybody to
handle such late introduction :)

Thanks for the heads up,
Miqu=C3=A8l
