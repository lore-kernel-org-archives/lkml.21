Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091951;
	b=k3wSwDHBDnevYeoXXxAxWXrCdGeZB6K1tsBvWWwVfNRO1l2vLtkubf1OOec6NQG9OcUR
	 daCKogZE1x0UFi84maNztAKc2lGIQZc3nk8G9hUekb6lufRa3KoOOSftf5/8bzVjOwBqO
	 eMKWmU11zc17G7QI+0wvHOkN6ou8bRvDjoHa03mTTTouA2MAJL1jW4REYIKK2anHcA2dR
	 bOoSuRK0R80NB1pXsVXj/Y76K7oXdRZyNf/4kTTl8PDYJ67BFX+mlAxJQRmOqHB61UX7M
	 qb6dzXPiGrz/bCSJ73sG1wghdNETN/2oDc6pK2faVpHbieriH8Oh3dPZuQDa22ytNeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091951;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=5uvBXVKpfHUXXnQB94Z/k3wccuWyyeiGVIjxT1gQ4H8=;
	b=lMIdN0rSxgRKro+4JsVDbBn2lcxMYFSiF+y86OwuEOExE3ICsmua6ZbNFoQ51ZDWVvVU
	 v59qwm/dP4UauN/WN2EbIswmQP8vPOPtCw5n8lMCO0OgH08Xbye+bEw7DM25+UuqIY5vQ
	 8s7bRokKNOMB3qPHkGclYN9U8qaSJ9crwT51coBFFGqZsmX6TKuBdD9QpQu8QqMtpTKMe
	 S9CEUtaYqj6C+T9rmPsXXFfATHqsgGxyqh6RSqOoU0EjywFkyu4McQkxR1i+lUVpar76M
	 gka89COWdEN2DrE8hiJFLSYL2U237qEoogu7hxK4uPSnaddJzn3b9tTg0vhbtlAxu7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Voz62wi7;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B660A2626
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20B660A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Voz62wi7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5CAAB4E41665;
	Thu, 19 Nov 2026 12:39:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A65860237;
	Thu, 19 Nov 2026 12:39:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3749B11BC07AC;
	Thu, 19 Nov 2026 13:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5uvBXVKpfHUXXnQB94Z/k3wccuWyyeiGVIjxT1gQ4H8=;
	b=Voz62wi76ErnklyF73F1jL8uSKiyeV1H8vJq3ZHq0XrZyXUqZKUD+ueNa8oOlOx1oTAN5T
	Vx04/0RCWqePLwBWlnkwep8loR6OsWfQmZLHeu1+dskuv8/FnZp6WBEOpUVAATAwt79XTe
	gPQf0YBxB831+AgmGVhwQ80RGRb6RbkrLxpo0nrFtpVqFIRE/QLy1yR5Bc8umjrdsWIjpx
	u2UVvk+w3XI5jC+h1lWwg3vU5ftehQQFkBqQ+AIpZPVnyF1Alt7j6g1ODzBSczD9CmoZvg
	+mwSWrYrjFLjU8CcB2AjTBuhjX7FjAB60req2M7Kr3pHirDTh39BeapHm4DXFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: mtdpart: convert printk to pr_* and define pr_fmt
In-Reply-To: <20261117142817.2658-1-mihai.sain@microchip.com> (Mihai Sain's
	message of "Tue, 17 Nov 2026 16:28:12 +0200")
References: <20261117142817.2658-1-mihai.sain@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 13:39:02 +0100
Message-ID: <871p8hdmhl.fsf@bootlin.com>
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

On 17/11/2026 at 16:28:12 +02, Mihai Sain <mihai.sain@microchip.com> wrote:

> Define pr_fmt to prefix all pr_* print statements in this file with
> "mtd: ". Convert legacy printk() invocations to their modern pr_err(),
> pr_warn(), and pr_notice() equivalents so that the prefix applies
> consistently across all logs.
>
> Where applicable, redundant "mtd: " substrings embedded within individual
> print strings were removed to avoid duplicate prefixing in the final
> output.

I am sorry but it does not apply on mtd/next, can you please rebase on
top?

Thanks,
Miqu=C3=A8l
