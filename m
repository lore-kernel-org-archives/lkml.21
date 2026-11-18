Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997690;
	b=N//opVAnqYOht1dR6PxZ5PfR62Nq/YvHxmOp0u61N9OQTZuXcR4H3Wzmk3Ahi2uJWEa4
	 UgI2eE6QCJLcTQ6rVyjdmMTd+/OsDkNcUsJg0kQViJgcBnepErSRyKsW8qWzHx0sUx0Xu
	 fRFDoxzv5O54tGE+5oeByQ7Z9r8hq6EIb1A2xUmIuFb7Pv8W+jGCgnagaZr60LwaYa/mE
	 oQi11aT4ZyhioTC2H8KCXjLt96Dy8IALsmcKQ0/FGiac8F47Y1Gw0z9JftkLO6Jpk8hBy
	 2XdZu85e+6DP9BwXBILVynR2iST0yPuKmla8SIsitzD0nQIkLALE+QFRLa2jQ+oFp1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997690;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=WTHIX/qp7Jnj/BOwjhzLa4IXBs5/UwCDK2s4rST4pQ0=;
	b=vbU4JujlQ8fu5wU9XAmwt0bqBD45LJ6jG8O0gydBNLOxR1yfVAAaDMCDhtlWICCjVfQG
	 L225WYWcKFJ47HCUmKnLvC/OF2zhYLm87WnWMlOsC6PmldwVBrybRf1VWWoNN/WH+Q2PJ
	 5u7xFA1rsnueGGBmbGyLVdpNFGhMWaiFnOkE8vn0FOrH/RS1UzG0GNpoJl4x9mpUjM7Bd
	 CRV+eu4Hvd/sqipt4HIxfwujnrC24MfR9avKbdIvkW7XfP4ZznvrO1/ga+tBq41iCb33Y
	 luvT/PDRYAQ/+BDjc2LAEuP/rJD1yEY4N2OqicQ8CyKE9yQYdQsPdLk4db6cGlCBLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lUdLy0q7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B656606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B656606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lUdLy0q7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 992741A16CB;
	Wed, 18 Nov 2026 10:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6518A5FE9B;
	Wed, 18 Nov 2026 10:28:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35BCB11BC1054;
	Wed, 18 Nov 2026 11:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794997687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WTHIX/qp7Jnj/BOwjhzLa4IXBs5/UwCDK2s4rST4pQ0=;
	b=lUdLy0q760khVWphycTcUyg1TKxCuX9tmHvM5Ud/Ge5zxTbQhLmGU/9k2FkIASoMZGVUaD
	Oy8pipx7y4fzRgJrFkUJzM3DCOG262OLY6HFCyJ2yin8lTFh5WZDFRXZhrQQftRCwC8Rwq
	oq11crIuIvReO9ExB+svND9b/fECKZXShvgZVTAvPzQyA9a5Y8MoV878lmoR39siZBZoRc
	fEV1nik2bxHGa4O5yu6YlHKTyiMlHTxxgXM6mHSheDk0yX7v1lhoCpOonpiEMiakRe6d0b
	Q+meiYVgU6FJh2iQ+cP31G+mw33IIZGJvUXct3ju/qPMaNzLv51O6UgQ8PgxTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
In-Reply-To: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
	(James Hilliard's message of "Tue, 03 Nov 2026 23:13:18 -0700")
References: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 11:28:05 +0100
Message-ID: <874idejux6.fsf@bootlin.com>
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

On 03/11/2026 at 23:13:18 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> When GET_FEATURES succeeds but the chip does not acknowledge the requested
> timing mode, nand_setup_interface() falls back to mode 0. Both the
> controller-interface reset and the NAND RESET command can fail, but their
> return values are discarded. The function then returns the successful
> GET_FEATURES status even though the fallback did not complete.
>
> Check the controller reset before issuing RESET and propagate either
> recovery error when there was no earlier error. Preserve an earlier
> GET_FEATURES failure and keep returning success when a timing mismatch
> is recovered by a successful mode-0 fallback.

You are carrying a return value in an error path of an error path. If
the reset actually fails, the very next attempt will fail and probe will
be aborted anyway. So while the fix is not inherently wrong, the title
and commit log overstate the problem.

My proposal:

mtd: rawnand: propagate mode-0 fallback failures

When a chip does not acknowledge the requested timing mode,
nand_setup_interface() falls back to mode 0 by resetting the controller
interface and issuing a NAND RESET. Either step can fail; returning
success will likely lead to any later attempt at talking to the chip to
fail.

Make sure the error path propagates those failures in the mode-0
fallback case.

Thanks,
Miqu=C3=A8l
