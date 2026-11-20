Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184071;
	b=BYQQHTWDJMUAEzL58gEAGLduDfBcAA9VqI/vZiOoEIlpfqEVFEpx/mrf+suesTK2RsEY
	 ZQfVEE0aei55KwHzb3BP8JoogI+HCUZPhhnhIkyClyj5k6q1s0sF9UvytShWm+jUNspdJ
	 +VDjIU0AXly2q0zMiZ/IGOn4EQDBmwyeKMPuZINaWf6HKQDLu4XPe0nK2ODX3jsX2y34E
	 tT7Ko5AH1g5AHv/X29SpbOWWiLXKm1qV9N6KURjMNCNO7XSO4VPRn/4of0Z44lMxJULuF
	 nzTj7X7Jtgubho684y5iYqdvH8R2KBCAC4NiymUTfTQVeXX0vfxt5+kotb7aCaFEytQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=1K1oetqb1aku+hQLcgRLgmMBVGMXjNsPonD4xYIN3iGLYnPOWIE2rWJWpuZa8i8pe6FZ
	 e7Dd07A6+MLpMdupttoqwPqshQaf8rSrwF7pPA53jlevvJlkr2k57iZNCr+755prBccZY
	 dd23+4u9ID9yNcktCPr1B1CksqfSyJf8QkvnnEE3H16DhBqWUmx0jQ8WCevDU35SABMsh
	 2KWzDRMWCqpDyJJRMA2Jdj4Gu7EP0pWA9ze+wGdn1lDOxIBDkJTYf4tp3ShIy5kjC2QsR
	 ceJEmetQuCX5QUKwFeo3HnWT5Hk7VrU37wJxH1YLUaMydLxgoLE2ydbkhv7oKXxD5VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2AQqVDe;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD9D606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD9D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2AQqVDe
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so1062948eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184070; x=1795788870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=e2AQqVDegznQ91rk2GpW7czcgOCKQi2CFbBHrYmFW6KxRzhlXjqXkUCyCybSnMWo3B
         nzHvXgPhCEg2ak+W7ek6OOrc1Uf84An7jaqONsLpA2Cq9KqbZ1AbTMfjxh9OhHHsv40q
         yZwVsUdYp+QfIJHXTkCGh1V15IvcTCjyShPgW2Vm4fZraTJQRx2eU7ygzFk3ztPAIXg1
         UNJ26YGTNQvUQVopLw5dWmtjQ8CQ4twztvQDeNw1z46J3RrrGLCHNHIz75J55ythxEFx
         yk5Qtf+DPaS6wv/2iZA9I/hHzL7KD+ZDx7UphPCQhK66Vqt9WvJAuOepMNGGnUMRdeyE
         sOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184070; x=1795788870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=hbJQYXMU9X5h4GpesAJtZ8lZJ5GueWB4MgynT8rzkUnyn4Fd2s6S3/uxeJqv35yzX+
         JOT+gIHbyfYv6a3okxXJXrsircLkWfHWs01tsDRtW07rix8S79axrC69k16LyewfkXwy
         PgzDjUeEl3doKOqj+G1HOnxP5IbOTVk+SGflQKTeyR0W6PDESbaDXqGX6Wm2KUAxjvv+
         onjxBSuQHVRlLahcOroWH3Nd5ATxtrIw0kl0SFWYNWm74P9HCph836YSVxfqJreIphlg
         rIoZmLXF0UbFRH3qIpfInfY/mNHp4YTfX4dqafDlLOjh691JEFrXlIzwfCZP6TJN1EVM
         +hLQ==
X-Forwarded-Encrypted: i=1; AL+hErFc5hbWAUGDWaevH3WXFmQwFWpTvwr7/uo/rrWD03Vy+/b1XDXrhpC2Z/59CAhDeUjXq+RFKX1IG0afNRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y1g+90TkYIQERwlPMves028pW8YXsuwB7/W1YAQwkjjaD+Opa
	QtzJvk8E2Ay3cznAPA2dJEYd76zYLs0VJaezIki26eo/5tPUyNrAOMYX
X-Gm-Gg: AZFdTZdr8YcTobIG5GEqvPvadgW1XLPPf5TBNQ3znI1O/IaGMrvrOT+dseSraAK+64X
	826wPbPkvBXPwMKfY1KSGRHCIPQBl/Bgk1xcDbRTg0Rlfee41iqFkBfsxrCeoitw+eWo/VZn2Es
	BB9zKNB+XAa/36rvb5omMl4inMrh2kTc1QDHu2W5onXfcCNj5Ua/zpY1vX/rFCAFBV34HB3VWyJ
	VPXlH1H4jXey6/w2KUpHuOyrob+kppL/7Jp9Z21R5c+xEIzpjzxCjQ6OQlmGsHJp5vqZlwhCkU2
	RhOULHcAKdIIppYLRWAuz7RS1MxSu51RztF341Poy17nOtKUSA8uGPic/0pvDSwW+RtwPGbThip
	yMIozXPq1dVOyiQeYYNyguZdwpRunwaB+FIEyYI2mS3wPKH6eYPFwbeRwPmV0v6IJECuc+yhH/N
	AKrLP624SCKN5Epm2jgwwh4wiVOPRc6UM0d4QDFiyziy58sPdgUCv6CeQxoCneW/W472RmKwkSa
	iFfCrndlBW4WNNfpXUh6x8zUnvzWvi/bP/Fq/7Hg8p+krsS3ulKIWOw2UJlX05oCfKN3oxt/dlg
	5N7Rm1V2+riri/Rq0MPuDkPJUJbSeFZRCjXe/Fhnm/TvJxFAz80=
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2607885eec.15.1795184069954;
        Fri, 20 Nov 2026 06:14:29 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm8954893eec.6.2026.11.20.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:14:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: vkoul@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	mani@kernel.org,
	matthias.bgg@gmail.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] phy: mediatek: mt8195: Check PLL driver setting return value
Date: Fri, 20 Nov 2026 14:13:59 +0000
Message-ID: <20261120141359.2532-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179510544374.1370333.8388939289479267591.b4-ty@kernel.org>
References: <179510544374.1370333.8388939289479267591.b4-ty@kernel.org>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
