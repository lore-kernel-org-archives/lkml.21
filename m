Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091851;
	b=j9k7C/qo/Vyuq/SUp1y3lkXv0BGfPVWsxyfnop92Yy/wcPLxHMID0hNYILt2DYITkdUf
	 uLw+RWlR/ByuNTICVmqCPYUMf4aI5RQBkCAafplLe8oiXKXSNG3YFvOyS1ymNFWBEUZIz
	 /WHS4W9IlWDXdesN5TqkRwa0IcLPvPFwevIQCbheTjLsp1aSHNH+ujgcbZkP9jB5mT0N+
	 o/n5oB7+okoY82V5gRoNC5KZ7mYKu3jQCueusTU+6XhgwBaSUwA0aDONdgCwjUr8tVD+X
	 bZVq8OdkT9e9VMa9QKs/XFzrb0BubQLEK0UkpPMRzy54hQCEcri0J4726ZnCxOJCjmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091851;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=n9LRXQiucnKvZTfU+jubxPCclkTh+n2ObBQM18+bSMA=;
	b=SA8GQcKHCDqcrklqo4p6JRW2gm3QkEg/jvmIrvdu0bMjS9Xe0gdhyKe+eonqmh83wxhD
	 7PU8KDeZ6TFW+2SbZPJP/VmXy8HknATuAAWiDcz1ACKDxqOnw6e583zbO66ZKRiDwQjBM
	 Vkrt2+VVDSqUgInbMwLnqAIBAp+TS4KZodHcx1Dt419jfTnguuyYPT9tCOmHxU5ReLNFP
	 6BLsSjk1U85Hu1e8JdDgYe+B8wG11VtQzIl3LBFGTQIGwfkp4OZfmDDzOfXOnHAm5V6VW
	 vk9P+MGYbgEQltP1rfHmLY8A7CyNGvClsMma/RKxzUsJgQ2jyGhdfSaCTAb05HkW4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="lbRXD/AN";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56060A2606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F56060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lbRXD/AN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 178594E41666;
	Thu, 19 Nov 2026 12:37:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB0BB60237;
	Thu, 19 Nov 2026 12:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26DE011BC0757;
	Thu, 19 Nov 2026 13:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n9LRXQiucnKvZTfU+jubxPCclkTh+n2ObBQM18+bSMA=;
	b=lbRXD/ANAZr9SdzPsnaE4N4vy/thaPq1M/IRoMPwJ7hKI7Y/lNLJzoxvOCDKjHdS+fB/nw
	nxs+hcT3+0pk2KJduu2fST73f9NK4auZotj7Oa6sPYJWryH5yqHsQJs5cgZhPUagS1lF/i
	SqVcDhMBRgb9x7zXiVOmvg6ZTM7Pau8HDXqjfotwR704AYJnmBHzYSfbrCArjaYdVc5FUn
	RcXZaaoFEBaPo24JqDmwGzQyVDy7JJ6uOYMoU7CTNdx7E+PSFld6ZcY3PVEOFDF+w2/Nx7
	L5u/XSFgZKhtrSkwsfywzGLbYlA9HAF13Y2mK4SG+SPlyyAEhI0Ih13/CrTcpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-submit-rawnand-timing-recovery-v1-v2-1-d14d4b79e543@gmail.com>
References: <20261118-submit-rawnand-timing-recovery-v1-v2-1-d14d4b79e543@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: propagate mode-0 fallback failures
Message-Id: <179509184807.2889394.1359685294062461416.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:28 +0100
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

On Wed, 18 Nov 2026 10:52:25 -0700, James Hilliard wrote:
> When GET_FEATURES reports a different timing mode than requested,
> nand_setup_interface() tries to restore mode 0 by reconfiguring the
> controller and issuing a NAND RESET. It ignores both return values and
> returns success even if the fallback fails.
> 
> Return the fallback error in that case. If GET_FEATURES itself failed,
> keep its error.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: propagate mode-0 fallback failures
      commit: 21cee061c596d003f1a5ebc37711f0dcc8729fb7

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

