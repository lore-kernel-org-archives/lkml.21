Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186973;
	b=4nmZsvfmfmaxglk/pHqN3PCJIvogvJk4pZuzytIcNQgGZ83RSW73KkDYpfjAUTn3B19x
	 lfrs1V7VA8oEdr9zNMCxSfJiXEjontY/zqsLZ7CCwuP/cHijq5jwFQqIaK3RC4ls5LXhQ
	 dmGKUWkl6c/RiQNQbEDFpz+U1eksALOzM5Y3haMUMw12+qyYX48KF2qI2LJRjaUGxInyZ
	 cOfvWSi4S7dmHlbiBWk+qniA4oqZiZNcF7QFa+5iNVaQ07llllBmGOMWjhAZ2JqtkpeZe
	 SbbUsE/MmnnzqBsu86ZCnIJZQum5bdkPu7q7BtE37kOhSVf13F3R7VSuu5OBJR4WSJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186973;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=w2JNVqlywgOd3cbja4YeU0OvXBPq0KJjVEc5VZH0bak=;
	b=yXwr8wr3YKydl2dniVaBz7b6COh2+R22if2oSB/ycSSrnl27Rm3q4Re0oEkrcXNDdwY0
	 l0YLpOXmbwgnBxRHlzA4JFxotGjydy39t4xXeq8QzgLbpYsQ0fwRaXiPdpSYxL56rugFo
	 FHfQwc0HEKRDvHECVXQCAvXI9CDaqnO1fX/SuKEX8EXxc7oiNOAcatwxiZRNMnzRnHf3s
	 jeesqpinCz6fL9BqFwJZqN0zMEeHC8vduZ5nCiO0xBuQvFMAv/owhvs9KedJnYYhXDHEP
	 pMf8RFUMzeIaut82MFQKq/fO0DEheOjpkL985Q1OyxsVoXCCzS0lzTwtGOukulAvYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="u+RlR5X/";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B717F606BC9F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B717F606BC9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=u+RlR5X/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 288194E41687;
	Fri, 20 Nov 2026 15:02:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F185A601B9;
	Fri, 20 Nov 2026 15:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A43011BC0287;
	Fri, 20 Nov 2026 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w2JNVqlywgOd3cbja4YeU0OvXBPq0KJjVEc5VZH0bak=;
	b=u+RlR5X/Uj6VONc0iRYDYVpdkcj0kNA1lDot50DNV2mar1BrEpZsOfJr4/O4yWwaW8o044
	3ejImhs/SKhlL8wsxgGHIMOa8/E3jNUu6D33IpC/S+nI/0+d58Kxmfiw18AXSZJeHQyTQv
	zjmwTgghiWqQ7IbK5SFpZmei2UphSMrGrH8mSlmSe+Rq6NukFQccwK1RjIT8Bc4jViJkgZ
	HCG7eShjD70zWQ/jlK2zB3627gtrK1Fjln5zjZPK0TCm7za/sjBkxU375N6V9f6f1Ppvo4
	B4RrsjArf9bjmOzLd91Apfp8blykd/vC6YbW9Yl0mfQLjALhn2YajrqZm8NRxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261106-submit-mtdchar-read-stats-v1-v1-1-173ac5c3ceb0@gmail.com>
References: <20261106-submit-mtdchar-read-stats-v1-v1-1-173ac5c3ceb0@gmail.com>
Subject: Re: [PATCH] mtdchar: initialize MEMREAD statistics before each
 read
Message-Id: <179518696919.3401781.15182182480121919685.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:02:49 +0100
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

On Fri, 06 Nov 2026 21:31:18 -0700, James Hilliard wrote:
> mtd_read_oob() can reject an invalid OOB range before initializing
> ops->stats. mtdchar_read_ioctl() nevertheless accumulates the per-read
> statistics before checking the return code and copies the accumulated
> values back to userspace, even when the ioctl returns an error.
> 
> Initialize the local statistics on every loop iteration so a rejected
> read contributes zero counters and preserves statistics from any earlier
> completed reads.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtdchar: initialize MEMREAD statistics before each read
      commit: b3b86fbd14b98c6a1786308ba0ecd666827dcb0e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

