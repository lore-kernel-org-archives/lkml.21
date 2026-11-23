Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414991;
	b=WFVP90OFOBLkGXYjE1Nokufa2e9x4bgHKm11ftSH17pydaLAi5z9PVxKBpV0lwIUxs3n
	 DXYzWXAWYaYfwRqWPI2HFXp9MQgGWNsdrn1d5onjmKh1SpAamb4Rwp46zw57kJawqbef0
	 NybBzz7XHEYLt/rQU4+KNNj2VOahj/HmwBnH4nsBF95rjFFl5DwWTu30uf3EP14kkOdp1
	 OnP1Z9u5HvTWTP/nu46dyOZCtuCRzm30qvq0Z2XNCbCUdckYiwkf/PldjE6QTxDlOjbR1
	 EOw/yx2N06JYB/Ka1fDr4+oX7KxhtyGts1lMJvECwz/exiOJuEYz1UgX0T3epTfzI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pgzjrQOGvack0Ux0RqI5gfXnGjGneOAYcUfumwqcad4=;
	b=XBX6caFQ5Sf/NINxJVjpgZ3S9qygKdQ8+LmrzdYAmkFVjYTdjNkDZm3vUBrCRoHSGkt2
	 ajKTTEN5w/nmoxeoAq2hTTdaoZGX/98+dQ3LmKe9apVC2cXdOGA32qY0uJ+2+Ul2xmNbP
	 LzxpOXeuyb7o+ieVvMG0/o3raolXFmUwG+6efe3wI/67T0vRbflbXFqYCv1/lEcECj7ob
	 guD//AjX8ipaVV8rTf/ZeZliUggG2UzQrO1aWgOhtc4nUyqbp2DxMNltQDA4k+YrCAo52
	 l9pYa17M7RAyStDB0pUlfh9+PRwUZlS9w81yMz05CqI8fBTtJRwomQb3+ruGcZnHuJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAqusSx9;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA30606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAqusSx9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385c497bf94so1348417eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795414990; x=1796019790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgzjrQOGvack0Ux0RqI5gfXnGjGneOAYcUfumwqcad4=;
        b=fAqusSx94ZatdptsvlDWJ2B/wjzk/fIcE/mov/H3R5d++wV2kTKv0YzNh0I8waeqa5
         quCc5++8KLJimu10W5/pQgbNr0jvDI7N7buVdsLqXuWOLEKBLACMWlPIMrzJsbeyNOMT
         yHHPspqd88M6Zjt5KvEuH0AsuCrFthmnXrrtFcakVukpfJc3tsDhCTQb5c7+nKRxeFdi
         K9EK3cMfd/Wk2DGw7hBE/R19Pwse903FdS8su9cwHTCfwUwqbCaOrTvcptnefYRgklbw
         TmKvwuhIryaveSF1VQoXDHfvqxBNsMG0i+/DRXAAJZ6MpfE3auzrSlgQpcV5xdk7fQ+/
         HDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414990; x=1796019790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgzjrQOGvack0Ux0RqI5gfXnGjGneOAYcUfumwqcad4=;
        b=ffV2dQdpcZ9bzr8/+xZOcRYubzvdLCRJyxlPyIUwlXYw/Ahwb+986U4ZlU/UbdiYvd
         dk6dUy1prhJrmr2dkCHC1FVCTWVyrXxilwt/QzhyK/UhASgpyEuvQg2mJsMP2F89v4KM
         1o/2pmql8fUpZZZj60XFjzSh8BHWJN+eRkt0dXm9yy8HqDUtpz/2xrcMiYTL09UkV7q7
         5MQ4zgbkwlb9AXogeoZebGP6Cy82oXZM0Ehy3+rgDReF0LjHpI8cyFPhMQ2BH6UjNe7G
         X2VtAPZSRhRDlNlkTB//0v0Xsuthr+3JLSB/bhtCAoeEK/YzG+9vaNE5W6IYBEFvJelX
         i4Uw==
X-Forwarded-Encrypted: i=1; AL+hErH9VFg5ZCYBKyHI8zqHAI0bHuAf0ni67c1ObMiVuOBd0u/aVnT6mJqFkvKNr3g+5PYyzKlI4nRl0/A/hGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HcrVphM+wjiwViY6LgbwBhqpMgWYbcUhhPQEFlA24jkpPoCkM
	NpGfMsIJ9ZKdZBee+KHyJ9f8qDsy44iBgncyo5Ij5y2q1MwSfG/081A=
X-Gm-Gg: AZFdTZflye0VONrZCu53Xh4yogjc5viO1X/RZYfprzf/MX5uRRf+5Mbb/Mzb0ZWYFke
	lMx3rPR0uwTnZYCwUc+xvFJGVg8O1kB7AcWT51qJ7iy+C+o4I8V9r1SnNWnWOqK9zg9fWtPc5wE
	6P7y80F9cecQXJyUirErqc9rf2AbLq1XQALwAookJHv22/xWqKQmAfq940EOFgPa2n2TFT3yUVv
	3lBCXmLmtuengjsE8TZWYmtI+XLwKr5HGc+8eUwS5G6ihnI66tGYHX3udncDeXC5cDgeDomfezG
	o3pf9udgQZOJzVTtr1gOXNl2B+1dq6nA0l5/Ps3IiTtYl2GuJwyR8aXjK6zPmsSGf5fDdLNao0s
	vxlOw9enIZegW6NkIZRcOwKvEc2gCUVXmVJ9iLvskNB7hZSmycesvR35AUxeRtX8EigljAmy7WO
	5B9J3vH/uNr9HMlE0qX/uj84aSl9JiYvoMfJReLDVqS+SH+O38OxOD6r3tmxu1cg0P1bPeWwvi3
	bforc0BYmU8G7z3x/WqoMaFxMGKGoUAIsIpkA5kEOawkH1bPBmCPg4r9t9hN/gNcQBE23HKgaR2
	5xYkF5yIgpR0J7wduHkAN/y4WgE8DBkRRALSin6UA6I+HDmE1I2lExNpnV1qtfbJslLVar4ilht
	wExoYHrwpnMurdXRZcUpvVkd1QmnwbQ==
X-Received: by 2002:a05:7300:c00f:10b0:384:bc32:fe6b with SMTP id 5a478bee46e88-3856e63b194mr13329612eec.13.1795414990426;
        Sun, 22 Nov 2026 22:23:10 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm30844266eec.7.2026.11.22.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:23:10 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 01:23:04 -0500
Message-ID: <20261123062304.11498-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112349-gala-unrobed-637d@gregkh>
References: <2026112349-gala-unrobed-637d@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Sure, but again, you only check it once, why not just do the logic there
> then and not have any local variables?

I thought of that, but i did not do that because it creates a order dependency
that being USB2.0 has to come before USB3.0 otherwise the code would not work.

> So how have these old systems been working so far with Linux?

The feature itself is not that big, that systems would break without it just
warns about it:

usb: port power management may be unreliable

but new macs provide location info, so i thought to add support for it.
