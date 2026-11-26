Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689379;
	b=fGfdPe6Kfurckr/42uPoyC+HQ/C1QVXDfys5oN37BY2JlDG2Jas97ej8EH9aqHlD4B/s
	 AVNtoriJ3fVr6L6rMPugdJtdvUw0Bav31H5pFfv/OtdS58UGJXcxjtjcsVnSNl9xhjXZ7
	 wMYOV347a1RXwUf3yQLDz/EEGeRFrKauneM2bUASpUu0x2gIH5TFiexCyh1gxauWmTkkB
	 290FJ0rEX/ubjstPJnUiAJ5QwZenBztTMyfiTWBnDI30u8cC4F1+aI9ChZB1ReiFzE88U
	 VVlavLyu5FT4NMoV8Asm8Sj2ZK03EK0A9yp9NTOab3NR5MdIyjyJrnuot64SVrzfRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689379;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Jw+M1WRUyiknpCKAJoMVGDk38c3faU3rcCZRwbIRH8o=;
	b=18qjAO6vo4tCb11UeWdaaE/Ipm0efRmGibh1eeGQ11GxmH9VIk75+sIIxuYc+zRsgr+K
	 GBDIcVmGcl93FJLzSIY1uC/epWIc4UlMXjQOskvOfn7pSiBtwuP8f3r6h2p9TQ75tFUsn
	 t6fZnPafzlBGH8PEhWm5lKx6BdeJTuWb/MbcA+CBlhX/ZaasWt5xPZbBCMoEvLF/EUQM7
	 54d6EO+xkxcIxt76Op5CM9ettbeM+LAAPDPV6Q+n2ltpKkcMV1/sUkyw0INXHqCYxXe58
	 ARPKKmjuOSPmzkcZ1wX8fnlOgjzYvHMDcxslmjFhylPap2nrKHg5x3kPgRwuP1Pm53g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ep4xBEZf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=orq3f8fr;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC420606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC420606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ep4xBEZf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=orq3f8fr
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795689377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+M1WRUyiknpCKAJoMVGDk38c3faU3rcCZRwbIRH8o=;
	b=Ep4xBEZfE2lLSui8heffp4kdNyg9qnkHjJIc5Z0YFhGminsKa1BZlZGah3iPGy6zpnC1Z3
	9akFZbQtH9fhuy32RWH7CB9yM3qzhO+a/hP3OupiQBoq4yvU1K8bLYbjeb+o7nDStBbivB
	AsOarDiGeJD8rubgVMmq/JAA/VqkEvLzEJ08zolXYwh5r2jwz65pd+NBrYlCH5aGXaWVbr
	9B/SMSSKbl29ABKe6P6ejv+nJ3nyG5LWtLfHEO6qRLVavgrmmWW7ev8Py4n7UCLar/JSUf
	9zAQZ95qwvjv+MO8pP0v8JVRIPI6RHCNxxmHoIMNxX4wOblN/RvknW0PfBTKwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795689377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+M1WRUyiknpCKAJoMVGDk38c3faU3rcCZRwbIRH8o=;
	b=orq3f8frHv3lJP1UXZb4Vnpv0pV1N0t4MYsp+g22wnYIvL21/kE3PMocuMMJbgmoscjvHV
	lQrr859RDvdKUDDw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
In-Reply-To: <awa28PGg8L4rEDha@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-6-john.ogness@linutronix.de>
 <awa28PGg8L4rEDha@pathway.suse.cz>
Date: Thu, 26 Nov 2026 11:42:16 +0106
Message-ID: <87h5h37ucf.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-25, Petr Mladek <pmladek@suse.com> wrote:
> I suggest to rename
> nbcon_allow_unsafe_takeover() to nbcon_check_unsafe() and pass
> *allow_unsafe_takeover as a parameter.

OK. This has the benefit that we could later introduce a per-console
policy to forbid hostile takeovers.

John
