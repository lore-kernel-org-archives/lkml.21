Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683872;
	b=iZ7gTiAlsujJruAmX7tfOVwjQnCwfxqztN9K0M6kbALeYJZ/9naLhR/qBBXIjDO9oU/l
	 NrH9BnSBcrS2hG1ZZk4xY3AJYEMVzZXt5OgO9laN6S0uafTuZ0qPqV0VMJX7OOVFNe+ya
	 +5qsrj11dP+2AXnz3cvCmLkOo1DEVOSo6iwb3mKK51IQdi0hV4nE7a927Y862W46Rad/d
	 Kl8rNA9WO6pdRi3eMmv4mZOxOCHEab5QFV7NnIyvflLW1vwAxdyJILlnsdYn/ZE6Q8Duf
	 ssVBlbctzejU4bnTULrzL/XZaTY1OKtNwvFYCVLEP+YGKvsJf7aRncDILdsLbV76D0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683872;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=+epy5iM857+Y35amMUxIo3MbWvv+HCgyMNGV+6ss8Jc=;
	b=kQPDu8cdDWCrS6L5xoPQHzOHNHJs4FGYPegz7+dDpyYXAaMx/ok7Qvy7v1CNlElnBJVq
	 Se/ZhUigo2brcM0ayJj39KlDxiKQKkVf+tYo45siKLG714aZzbaN6ERRQ+e6qtSdZnoWI
	 EKmWnR+JUDQHhELbtwy3kv3QqqvvR9MmUKCnOEi8TfNujRqu2n/yOHOEHCfekkq2NrpbA
	 raUzkUhyQCb//KgDLf0g6LCR7H0ca84dVPnK1wIpUJr+48TlZKJPA9g1csqgTmDOHLPOd
	 /6vFJT3GOGRdKI0s+7VT14GxNLeFdSwxGhZyH0smjkXaBtO8CTXQM62IznVXbxp8aqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aRfbTQxw;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAAB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAAB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aRfbTQxw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D15BC2B9C6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:04:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC41C60237;
	Thu, 26 Nov 2026 09:04:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E862E11E6A5EC;
	Thu, 26 Nov 2026 10:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795683868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+epy5iM857+Y35amMUxIo3MbWvv+HCgyMNGV+6ss8Jc=;
	b=aRfbTQxw1eIdufWRfZjIxbnYzQRjaNO8kbsIB3/NLSgOF9LgkCiOHwV8FVBVhPUZ8fTmLe
	nP4ruagJL5vXaGjwj/mMtgyFPeNWqfQ7UTIjoNiqItqtKsJEMLkdVIiS0E4+ti3voy4It/
	bQG8T/si+rQsvxQgodVf6NIArUaF6suxOg2P4QxFhKd4FGLR6UOnF7vwZSaXxrp1vYa+qj
	D3sJnLJwEnxn/1CqP8x3iNBIy+DfR6yXCvb5LGe+VIjtYTqcVyzQfwlJ9Q0VD4vi2jYHUC
	HkZBlxoORVjAiSjNbDfblzMU0etdQ7qnWA0wNsjylJnClPGYspFZiIq9UmToXA==
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
Subject: Re: [PATCH v2] mfd: cgbc-core: Add support for conga-PA7
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Markus Haberlander <markus.haberlander@rosenberger.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261124-cgbc-conga-pa7-v2-1-18a114b1801c@rosenberger.com>
References: <20261124-cgbc-conga-pa7-v2-1-18a114b1801c@rosenberger.com>
Date: Thu, 26 Nov 2026 10:04:13 +0100
Message-Id: <179568385320.302193.15039118220494670733.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 24 Nov 2026 10:22:38 +0100, Markus Haberlander <markus.haberlander@rosenberger.com> wrote:
> The conga-PA7 is a Pico-ITX board with an Intel Elkhart Lake SoC, like
> the conga-SA7 SMARC module. Its board controller is of the same
> generation and is accessed through the same I/O ports, so the existing
> driver works with it once the board is matched.
> 
> Match the board vendor and name.
> 
> [...]

Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

-- 
Best Regards,
Thomas Richard

