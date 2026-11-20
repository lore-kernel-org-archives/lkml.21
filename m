Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187169;
	b=WAp6o2Fa2Vl6t/TirVTjgWbq6A5emGDcsuF3CUMtsKlOy/rzEGfuH4R3tAjfQrI3vPMe
	 adwqt20VSQ2pxc5VwjCYx5jajPe1jP9s7jODjTLgQ/gTad/AB5e9fsbDMDtmZny7R1Dkl
	 9RjqDdmXSr7+PNiSZ4FR7FJNZjEHyyYOlnsWjWwZKV9JCYhsSRfd4j9S5a78z1CWRFkSB
	 dCULMDPrNPNeu/lqXRQehJtMoQ3qww6gfaLItWLb65PLvIus9ZnJfUDpCZ8nuNkahYw4X
	 1dSES+o7Vih5gNLVmxllj11LEJ0tyFR+b41QTVFmw0h4OPWOQ49Vdkuy67Mpd28h91g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187169;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=0D4DjLZFm1OPbY3hPmZXMk4q8RitgeV+4nF4Pu8y04g=;
	b=BWMjlAZiP0LYIMRz7JXLiNtlP6tJ2kZHgPtBK6x24LXLCs4joT+tz9aNbseBVb+U8+9z
	 OYWYaE1aCToqZ5RbOgSW+tHqeXESpW0ZtFIKDyFMs9B2QtQDaBZ+4S+U0e5lwF/Mp3nme
	 dtRnDUqQYwGYJ+IrdsRiN33UDF2Wbu77ETeolxCjfjsRhDdHReZYXXZ2EaFiYPArATuBG
	 Hd11mf5ub0itN6qXRe5Hw8suxRPdcFiicFS934VMCXOoLq6JR7LQ3akoQHLDnQNBpFQTq
	 jlbNtEvf5rDH/tQdoiqNex1obLtWY4NS3fQJvp72IMuBJo7+F1VKEmzD7gt7+wYkcWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QTuKldGq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1511E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QTuKldGq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC1DC4E41687
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:06:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76EB7601B9;
	Fri, 20 Nov 2026 15:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07C4611BC02EB;
	Fri, 20 Nov 2026 16:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0D4DjLZFm1OPbY3hPmZXMk4q8RitgeV+4nF4Pu8y04g=;
	b=QTuKldGqnkISP7B678bwBJLk+9PaheqR1QT+9tcF5ON9WkUhDUlH9uYfaGPhPyqWSZCihg
	T9qhBYkBiazLHjEKeWwiS9xrcmZprpEeZSlSuxleVkkY015H0urWA6FUESUKeBc0qb7jcv
	WHoCc6LmqCUFMGl5lY2soWsVjOjbu2poXHJ2/ogHwcQhycweGgZYyecaqXo0fWpYhzilvn
	hBibGtCG6w5yBDSZ+WQSxO6h+cSwiMp52JxU3+e6OcTALo0vEcKwIapCs7t8GviCX/LPJq
	M7ppL46WB8faNR4taSxdaTvOxKuvl6N+FkA99zlL0Lp9wa2ka6LY1NGAWPa49A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261119-spinand-set-req-type-in-bbm-functions-v2-1-4dc4f995dfad@gmail.com>
References: <20261119-spinand-set-req-type-in-bbm-functions-v2-1-4dc4f995dfad@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
Message-Id: <179518716377.3408766.1616521798459198415.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:06:03 +0100
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

On Thu, 19 Nov 2026 08:57:42 +0100, Gabor Juhos wrote:
> Commit 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
> added a 'type' member to the 'nand_page_io_req' structure and updated
> the request iterators to utilize that, but the spinand_{is,mark}bad()
> functions were not updated by the commit. However in both of these
> functions the new member is implicitly inititalized to zero which
> corresponds to NAND_PAGE_READ. This is correct for the spinand_isbad()
> function since that uses a read request to get the bad block marker
> bytes, but the spinand_markbad() function does a write request so it
> should set the request type to NAND_PAGE_WRITE.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: spinand: set request type explicitly in spinand_{is,mark}bad() functions
      commit: 7ab84dc9c3d91c7cd72abb96ec4e253e44560f95

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

