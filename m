Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691010;
	b=OxBWOdjLDAOJt1US0mp0xP5ZZFkalLbjCqlhgbeQVuJ37TfDz5psLTBOXEgRRqUasqZX
	 JlVrAjc4lxUqRVzl8EqohCeuTFT2RnguA2Yhbfokz3Mr6B2ohBBz/Snwgju17wJdOob8u
	 tCr7kGGc+qKu6D59X2J/hBvqGRlV/q6oyh5T2z1RUpfwUFaoUFVmrOSY/uhL09fcG0c3J
	 kJrqvGaCV0lS/IrjM6Ae19ClM0wrVjmZWS37vyJvQduQ3OsZoLLS2hQnvifdB8KyKdDK4
	 BEIDO6Hah5ZkwWq0Hd1AyyX6FmiQ/GUdMIjlVRa6PKxt/Dk5fHlk9SE13mmtuj/3eLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691010;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=npSdeVNnEXo0fDaSskw+IfPzWwdyEZ0iRyxES/k6S44=;
	b=uDHFE+6Z+z1h7LvPfxeSoOdliJ2KwMV8VTS0xJgGjli9vou1EgifL9FEwlcEYku1eSns
	 mdQQAny7GuzAhbx49/1i3OnPA096WwECCtLfwsOVFwEwvwWC6/cZK5aT//zmfC5bK6x+a
	 UTKTc1V49/pMPl/CpYkMWfXnfbe0DotZKm0oNMdZw2iNwIcbWJMxRnnvoiRlFlx1GYBc0
	 HRrL8Gjf9Jo8jo6V+R7d3om/cofV1A7BCME8o2o4oR3hmsWosYsZ9T1o7tWfoVlOc93rz
	 B/Y/xIVy4Gcj7alhZTvqqBOmyk/th++NPLynysGeTEYX6D1GIkFeoICBtdqmnhS998A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+h+G0n9;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0086606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0086606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+h+G0n9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1B55DC2B9C7;
	Thu, 26 Nov 2026 11:03:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFEC560237;
	Thu, 26 Nov 2026 11:03:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE2711E6B324;
	Thu, 26 Nov 2026 12:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=npSdeVNnEXo0fDaSskw+IfPzWwdyEZ0iRyxES/k6S44=;
	b=C+h+G0n9mX/mNGp0csm/ZEJBKWuiiM+J//gekf9DIuq+MESc/W++D4MYhgl+EsGx93Re/J
	O8XFCxeOmyzAADrMFX9/5TokBtaN+XDmpiU5TDPQDPnOd+GhDoOZ7U3hnizImaKsJVMEev
	ewr1rJ131MK1T38yvCaxOpNc522jX18vt4Kh6fDKXY9gZbtdfntpLmnS6yQBiwU2K5dts7
	0tFlnMcgz6e/oqiszhpE1kYkyC0oCjzFcPx8PdPBFuY+Vs7FW0YbSOH7qT3PchQtmoGprU
	1pIPC8j+tMm6QetcsNEJtpdZOPvcL7A0bT5yQeiu2dKOjVgE1wsttdKJ7wsCkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261126060216.3155872-1-leeonion.muyu@gmail.com> (Ping Li's
	message of "Thu, 26 Nov 2026 14:02:16 +0800")
References: <87cxrtyss2.fsf@bootlin.com>
	<20261126060216.3155872-1-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:03:25 +0100
Message-ID: <878q2fyhvm.fsf@bootlin.com>
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

On 26/11/2026 at 14:02:16 +08, Ping Li <leeonion.muyu@gmail.com> wrote:

> From: leeonion.muyu@gmail.com
>
> Hi Miquel,
>
>> Wasn't in this driver a bounce buffering operation that is no
>> longer needed?
>
> With our patch in place, a vmalloc'd buffer now gets bounced by
> the core through chip->data_buf.  But data_buf comes from a bare
> kmalloc(), and kmalloc() does not guarantee the returned address
> to be 512-aligned (with SLUB debug options, for instance, the
> redzone padding shifts the object placement).  So the check in
> r852_do_dma() -- (unsigned long)buf & (R852_DMA_LEN - 1) -- still
> has something to catch, and I believe it cannot be removed.
>
> The second reason to keep it is that the local bounce is also the
> fallback when dma_map_single() fails.

Ok.

Please do not send new iterations in responses of your previous
patchset.

Thanks,
Miqu=C3=A8l
