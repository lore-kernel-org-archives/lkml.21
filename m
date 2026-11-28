Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883353;
	b=20y80/dOwrG9ZcausDxuZ+YAhNY3LavJvQ7tHwK4C9NnivjHBOt+oBkT5bAuNByaMBoy
	 MukJd5KMAqLLbKjmqWaK4YeTtp3hyy7L61aKDbFqJoEuFnwJi/nqVMKjwnuq5MfI8eBrS
	 IxPcGm8qZ6k7p7DoZMXV0sy/5XsyczCJfff5YwrVqXhVrbWUUYXNCWZSd1vcfWoI/WStO
	 yjXMN1gbAJ8XmTYR0pZqLv0yG4U6EKlNVD+Ogproq9IzPIiFVVbWNNFeJaZL/MdVBD/uX
	 9cIUJvpQh2GeZpQvnK4XpDMrfAUlhwCUEPyoQL9glaVZo77X2ItzbxBipgmvHUqMFfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DluxFtlMNRoUKWvupun2bed9YDR+SDe6lRKDozU0OjU=;
	b=rSDI56p4GV/QWe9GApFk6a07Ve1uvdL6wiZd9FQKHZtl9iK3wnh2tbMWmm2hGt+0z4Yf
	 0jylrH1hPCMGuAHQBBK12r+OlBKq+vd+nQod4m+Nb2uY3iZAVaeMljkDpe+DZUDPQD8rt
	 mDEsozIv0J1QFA3HIJd9es7gUR85K/IbeFFcIb1jTwjIRjrIrnoXKGakLMXF33mMCrlZS
	 wJ0RYtwx5GwV1nJM1rFKz75v9cnrqT+cuBEiT60/8xkDExnNmxpRaSHNBrEZhAwJCqNTM
	 CeSb92X6AsACngOskBxWyadDzZ6j/BE+eTCZ7fGx6pjdNxXXN97ATL9P0UI6WsLkalg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oqqm3M+L;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1381606A325
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1381606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oqqm3M+L
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso91197755e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795883351; x=1796488151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DluxFtlMNRoUKWvupun2bed9YDR+SDe6lRKDozU0OjU=;
        b=Oqqm3M+Llrq3Wc2FcuELBIJBZC5OCHQlv3rcHuD2AJ+b9eTfYrAvklUaFk9zeAuXMq
         IsKimKGfp92qBrkVdDB8OBBs21tTl7i1hDRo1+A5tujmAhGIUSngevZNjGq0gIGWJ4hE
         02A73hBJXYQgZ410aog16SlWlZOW4UmQ+F1DylMBtqMRQ2B0kktHJ2AnFRfM1NKc4gB/
         MKkU8ZoB6TFHFnDkVUaLZFk00HXECVNYBtmxwq6RsqPrhFu4tteiMHNs8y7BU3viDslw
         oLlOyg/sR3zQCB3HQ+XW/zS8gc5VOpx7SMetRhMx4ogK+YdNcFiFlq880QiwWr0JARtH
         QBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883351; x=1796488151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DluxFtlMNRoUKWvupun2bed9YDR+SDe6lRKDozU0OjU=;
        b=M/9jOKwohUNQC2ZHQAXwtHICP5kwF/ivCL/4Ujc/Vxb5Nkzmrql0hnxzaLWlr3UkAX
         HpdtmF1eP4OeYUG0Hk0dIvik25A1djT/NO4yEnzE2b0ZXWd53hQzHK7mQDdkFVZPyP7l
         9bZqigodY6qBbBl8i2ieBmK8cBDUH9g+4y5bDct6vcPMdxOVu+MyoWl5T+4O1Q9VNPwn
         FaHe0jLT9EpaFoYHQITTvU4FMKzmUJGX9wrZ6UBa6agN8PklwPU8pPIaLLIuKp10ivJj
         4q/K1CT5XiJlbayglkcK0aJVc3nCX0hafrhm23h0iFX6J1vaFf1dHinPuLQooD5OQV2s
         e4dg==
X-Forwarded-Encrypted: i=1; AL+hErFWNHMWA0cZSj7r9544qWYJR5D+TS74ek3ESkp/0AFVvdOV4P8fARuYeCBuVGiKf0f/TH8dABmurJ63PaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mS9owrN8ihILD6Yv9nL4b5gN40s/DGnyULNUqZHVwB4EoZlgf
	ub19Pl61jaAWSoHDvffhLUdbvhWSbIo3FUTAX9l1AC1crlsYNQMYpROvMR3pQvQmsg0=
X-Gm-Gg: AZFdTZfAfhtI3o21gzsTc4S0kPwIIt2f5Q+W7GQHvlXOfvfLBSem2PCJPQ9H7FlMrtS
	rZiQt82da8zb1XOOW7s9YYAcGF0wotoeALr/Y/gxszC8xh7zLKKkNNTWfylMcN57AZjJLuZt+DO
	P0+kQe2eYrlL1jL/xtj6cyH+OL1sla9B9p6Odra8N8+L+juknQEe96BNBQZgP69MejJOr6eWcUT
	CRQV+VkS3woNr019KZTjC/3VhkVb5/J3z6n610Z0MBDkdV7wfwoJYxz9/E7kAwFJBFIODn1DD2t
	5Ddlg+mlmIDCG82KUQIJjLwmUjt5Cnk9o9n89VgicLmB3P3SjRW0kRhUEA5XHpQvrRmMUTl/Yf6
	faDjwvgxsbx0mx+AKDGjZcWDCz+A3CEY+Kb6q928n9gr1rVnMYMeXwLFcH+raDO3J1psjos/+kb
	/y8YjtHFyb+VLIBNXJKTe7XbdA8apezZwLIVOi4aSptRV930z1Cxry88Xojh/YeavCvxtbn8VLP
	71fVKXVNB61O189ERds5/QNyOrQC2LtUFoFh+ykYrGWajfwsQHUvjr/CJ12uPyOuhIf9w9xMfb1
	+PmgQ2x4RemshpQ9o7QOQzaLEfTFQZXm99XNgq63CTSJhuZ35vMBOGysMwOpvCCrR9gWr5yCejv
	TZxI5kj6Na7QfYhdt83c4dS8Y/wqhC/eJTb9eeDMJ2ra98A==
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr541316905e9.12.1795883351147;
        Sat, 28 Nov 2026 08:29:11 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:7966:a38c:a84a:d91c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm748927465e9.6.2026.11.28.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:29:10 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 0/4] iio: adc: Add the Miyoo A30 and PocketGo S30 analog stick MCUs
Date: Sat, 28 Nov 2026 17:29:09 +0100
Message-ID: <20261128162909.2534617-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128021144.67d1672f@jic23-hlaptop>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com> <awluLgvMt9BN1Aj8@ashevche-desk.local> <20261128021144.67d1672f@jic23-hlaptop>
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

Hi Andy, Jonathan,

On Sat, 28 Nov 2026, Jonathan Cameron wrote:
> On Fri, 27 Nov 2026, Andy Shevchenko wrote:
> > Why a brand new driver for each of the cases?
>
> I'd also ask whether we expect to ever see these as useful other than
> for the joystick function.  If not maybe going directly to input makes
> more sense than using the adc joystick bridge?

Two drivers because the two MCUs have nothing in common but the job:
the A30 one is on a UART and pushes framed samples at 9600 baud on its
own, the S30 one is an I2C slave that only answers a 4-byte read
(value, complement, value, complement). Different bus, framing and
flow (push vs poll); the shared part would be the two channel
definitions.

And no, neither MCU does anything but the stick: no other inputs, no
commands. I went through IIO + adc-joystick to follow what the other
Linux handhelds do (Anbernic RGxx3: SARADC + adc-joystick), and to keep
the axis ranges and inversion in the board DT. But since the readings
are only ever a joystick, I'm fine with plain input drivers in
drivers/input/joystick/, as qwiic-joystick and adafruit-seesaw do for
their I2C sticks.

So unless you see a reason to keep IIO, v2 will be two input drivers
(bindings under input/, Cc Dmitry), with your and Sashiko's comments
on the shared parts folded in.

Thanks,
Romain
