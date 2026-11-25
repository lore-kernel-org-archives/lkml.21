Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607461;
	b=Lr4aHy33TotBf2Ycm1uO/AX277c4po/pswbWM9kDiFmqYoP7Aa2jOn8mAZZ18f/DDK4F
	 bk+iIk2BnGF6wp7eLe1IiwfeKm3GcABymauQvsWVLM+VhQyJRiOugVwG8d8MWJGZCCQkZ
	 7LIQyrNR/6mXy65Nji4sUhiJPxWV4GSXP6kzuJBYzer2ZZNximKsC2dP9rVJw5obuZTRl
	 vkilMGxGtvJeXsG6MZeu/vkaUAP4EtjtUphh5sCpVFJ3hMTBRuVQJfu5WBv2o0YzDt0Hy
	 cFp6HMZ5epBT3ISibMBFXoOO0zLRi0nitpJ4yEBXrSBLszzT0T0bIMHCsw+RkG3Ii8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5PVf7Z9Y3ZYTlZU6j9uRG7cWLP6I1HaW6b5iETcLWko=;
	b=upbKQ/4/NVFQxxgRHn635sHxb75sH80e3d1BRwn0OIfdhDHczez5xBKtYTsHfgKtVJyy
	 qe7T7qRH9e9w3WtZEWPJckTfxi1wipd7fljeYIGhrfJ5HaggFHCCmtF3KYkQ0VSrwEZlL
	 VPTw7nx/jEhA1/xcEezvN8h4Ke6JzpaZFFGVnN/kobhToePj+h556HysJV2Zr8/5Jr96v
	 tmYQiuQnXSm4PhkiUNqTB5hvaPkuoROYd7gc3E55Y3QYlndyZfcNnYbcvXNEvuSEzRLeg
	 2IDLkN1eKsMZuxB+3H6tdbWYjRBRRVVsY05diapJTxSyHB9nTUfDQ29oUgIWyO5/Kkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLZ4vT1D;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15275606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15275606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLZ4vT1D
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso3601086b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607460; x=1796212260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PVf7Z9Y3ZYTlZU6j9uRG7cWLP6I1HaW6b5iETcLWko=;
        b=pLZ4vT1DgRiLYjixO04KSatjmsH02RLsB8yIOdQMvZ6C5sUD9s1ENYkhiXQB5R4TIf
         QudOHsxkdUuo6qpJKchQl2xz8BBQKM5n7h0L67llGHav5bYDqXKN/IQNkx0puZCisIjG
         UZ4zH4IDZEqwN3w3hwRt6b0wzgYo+GCO7hrNvPyRkQjrnVBQoW5t5AdL+CGEvKdM9PWt
         l2KsOSJ9BgRB7cRb5XPAtmHwTAr5L2up0Ptg5NcvXFDTA+bD/XHNI1EzgFS6Ppl4b8oU
         UwB5QQXzAOsH69juZpjJwr8uPfJL1lQEWlSfoYlIz8sR7xx/r8U9GJxMW4gJwAgF40Wj
         v5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607460; x=1796212260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PVf7Z9Y3ZYTlZU6j9uRG7cWLP6I1HaW6b5iETcLWko=;
        b=dWuLJ2eibBnoUU7uA40zQ8yEvREfdU+i1d9R3Zx6mNee7qaWg98uZ11nFWFKnzTkwi
         sMje0I8iCSP1L2KEqvdS3FfbuGzUPHcHeSk2SGD/zrQjmxz/B5ZnYRsNATLrG+wlv7Fr
         i4y+jnyMSK79hTDGhMUSGhHNRj53dEFTvLIkjf7dVSFZCk7vuoGNad+STLEfc7Pn83yv
         aiiUs65KLAMzy1pKW9xsw3/bApTpCnkwXuFC/ULgdd8V5TAKpVH8kH33/bG6eBdP4HLe
         yZ8m4UiFLx27JLdmgtDjuY42/CwElT9ZbAzxZSs4bIOeuGKfzB2AiK4XN2VC5QB5VXUj
         iDRA==
X-Forwarded-Encrypted: i=1; AL+hErFMCh2att762dpWYLzJhezmJ2BS4UrVxjb952SWsNkE87fBkHGGUqpEfT0qbUh/Fq87/FfUhQhN6gCVF9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FsS0G89KlpRwHrUiuYZ8pZxFSXbN53MbVaLJyv63ZsNR87tSP
	nN63HmvyPijDAtuh2SaMN5wdMzsmmqdUbH/I5E8xhUue9YPFzIWCIOJk
X-Gm-Gg: AZFdTZdI7hGC63nP+Kbb5O7z0D5/3M7HORNXHIAHG/Sb+DqPDnCYj4xzylkVq516A+Z
	k2+SBhgGFlRwK5Tg+2TzFM+jReb8lJiyBE/cay/AhysCLKhjBQSjcmnxjwmAMaEq98aAPtRaRWk
	xHzBvyMo3DTcS6IMPaM0gquOiq8ZPuZy0P3S2a9aHtfvtdyrZtDSKyJtRPKwmRv4RYwi/7hZNL6
	zLkKq2UVZO8GTD0oqYPwCs1VDpJ8FM+daQ7YbhZPsw2Knlj/1Yd41tXWM7YsOmeXmT1gUS68xA2
	enT80xA5So21Tj+t05ARNxhzE0jTgwpR1U8VsH59LDKKn+GzSTYfmCrp+qxdM138Sdk4F14iv9b
	VwTM6L50/1dL/lu1LkV/XINIaQKjhErOR7ZWNls/RiV+8a0XqZeYXDVARmaXvK+QOrXJzp7g/UW
	DXNAlxvhHPTxfhjfNOMxFlck9FW42BkTqsAqBGmF9h4qVe5Ypxb8I0+HPNTWbCa+2IiykVwgvRH
	cNcMTTd74ZAXi2hXH6hRsE+ZT2dewBwMXfKuor4MX8aTmNwku0gUxfhlyY1pyzfhbGxgqhP32yX
	PJKoFEGD3fHIqGggY9GskwhJnZFWNduxhA==
X-Received: by 2002:a05:6a20:da12:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-4014d35aab3mr11946036637.16.1795607460361;
        Wed, 25 Nov 2026 03:51:00 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm8804824b3a.3.2026.11.25.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:50:59 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v3 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 19:50:55 +0800
Message-Id: <20261125115055.4146985-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87o6bdz1fm.fsf@bootlin.com>
References: <87o6bdz1fm.fsf@bootlin.com>
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

From: leeonion.muyu@gmail.com

Hi Miquel,

On 25/11/2026 at 10:48:45 +01, Miquel Raynal wrote:
> Can't we change the default for this chip then?

Right, advertising the requirement through chip->buf_align is much
better.  v4 sets chip->buf_align = R852_DMA_LEN next to the
NAND_USES_DMA declaration, so the core also bounces misaligned
linear buffers, and the local condition no longer needs a
justification of its own.

> Please drop this comment after fixing that, it is not useful,
> this is information that should belong in the commit log.

Done, the rationale lives in the commit log now.

Ping
