Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367644;
	b=R4tQzH9f1skRCDouDJRoa9PH3mg5UmzfoPHjvaq99E+yt5HtUjHsTRBIeS55C5IuWkWr
	 M+bEopvgaTS1aJVsl6f41OAj65dQjexy3FPamGGdpZfX7As8CJh+RwNrXW42r+jIbEJjw
	 sAiLlvSxFAxKD/hpKGhCcCmGOe/jVRePOj3uVpdcOFYOhW8/Vdiu83pTptEOhi5Cvso1F
	 +kLluX81PjiEHMb/VNXl9CbOp4q35NMHtT1ZTm7XwpJIAbWd0Z1F70ViGfg0eWPADhPJY
	 TxjwKaIlpJelIpcBVcgbg3cMYMEIhfLEtF0qW3mwXZkRL0EhSAA87Gmu82dC4OFdJ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=V1K38TQgHsuSkud7fslaipZoyRFe76SDm130xOdSkyo=;
	b=GSTgRiVw8uKrwGeVeoA9nF9EJ1tJLiSyNRHaE1U/AIJKEZxk6D3G0WLyi7fLpvSkjyqX
	 0AVPMcGjjTn/c8zWEgtSdYGRJbpxjBhMwLJlyOKdK0iUxqzHZ3xEpTHwc2BA+JplfkGY4
	 zQQmws49OMN+kHH2PKGn38YZn9Kak6mIj9/cJ+kCjODmJoy+eJm4Hk2pitFm5ghEq5IVl
	 5S/foW/aWOjc3/AebdqCPz+NwzuBi6eMGSwn4GH4f4J5HZf5mBq1oeocQtiSORjXLK1M3
	 6synAqhykGbu4Fhj4J9rnzy94UCBKWbsZmoCPFMdYoYHShHmcBU7DWmmcQlvJMmr9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QJtt/lGI";
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC60606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC60606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJtt/lGI
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b3402105b9so16927777b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795367643; x=1795972443; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V1K38TQgHsuSkud7fslaipZoyRFe76SDm130xOdSkyo=;
        b=QJtt/lGID9zcB8DlD2IQzpRX82R+JrE/+uex70MssF7uF4fI5oW7dJCH9SOBfIRE7y
         4Zu31fVQ8RekvhTETmsuYuZpk7JuUauJiTNs/O036dUyy+x9JfZkYT4lF6rdRJezm7J8
         u31S0iePpkTbUNB8wi+G14LHa4Z/a7zJiaI1PWCM+0Hn3/vWB+Dwxuu3aLNSbTuEsXvl
         AwDWPsqqwsHZh49W3NPCaqLCILhQ2qQdpVLMA9VSVHCBoIpbfIwD+Qxoyy4OT9K00kWp
         OyG+kbATMIbE6jc8lwvV65seuL+YQvDc500Dh8Q/1rRrFB0kXyHWdZl+Mvz7bpFtvdzC
         yG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367643; x=1795972443;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1K38TQgHsuSkud7fslaipZoyRFe76SDm130xOdSkyo=;
        b=zo5m5DiDiXbU37QGZLKqHzDI81q/OnedYVagMEh9R8h4lmIKnu+7zSO6VRSeW833yx
         sKDk1IdShsFE35RWGXytTs2Wh8sQpyU/DNHHuPBMEx6I5si+gfDeca23JNwuVV0xRcDs
         VVIH08KqbVt+IDLDy0jN3wjjMpWF1jE53C5IXPAyB7zQTyx3P9f1tEQ3lTtDTdNVHOSo
         FwlyDMYG77bPJwtQIF7si+3+ihMKGrDeWTVeQDjWjJQOACUzHLC2PM7f13IU6sMUg50u
         wtM37CYw8Y3YjlV23XY5CivkPIUYoOeyYRt/cXgufYD/6WPUWGcmhZuIPQen13o4c4na
         mPQQ==
X-Forwarded-Encrypted: i=1; AL+hErHMCo6bAr9CDsegvES9hYlTkhENHp2FN7CSAVJp66/IZ2DDQCmGDEVzlq6rCt2Fk/fcOvNrM51X+GR1adU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RItPbcZSP+08wYem7XEC+PXXjwgSp/xjbO03oj8e3/EBoehAb
	HiLF7zF8xaKq+JjD/kr6VY0XHKfp753a7WJLphXH7VLeFprIjvwBqtpv
X-Gm-Gg: AZFdTZcpzfhTAQ7mLIOuge8XsKV1W+hMoatVzipK3CeF8scdmJs+wG64tJNLL4Ei45A
	cQeP/dtq/cuv/DVWIaXyRY//on6dPkJwwgPoz+nyUFTMR98yM80yqvc8UfWlt4Put2us7YXa6KP
	QWodNc5gnbFfYPz930EbofUVWOlf9wStPkGsJDFrMPwnGrT35TJMBWAPAaFLVCW/RrYCbIBdfTI
	FD1tpRrL7r3aaDZIjF43vA9OS/OOz3IRgG3T6ITUO8Mipc7uTNMrj3CQG+HTS1P9L0iwiShhMU3
	ixWU8wIfoj9WR8X7mSx/vyJ2UUic/IceoaoZ22jRSFfiwzSMw7c+S5USm45+zWFMlIS8jBa8l5O
	VAUVr7GXf+6Iavu2PvvW3rVr3a2DjKKqsYXO9/IVsZaLIn/M0829Iby8HGJRO/nJ+cN5Mf/oiQX
	GnU3XFp7XDZrdxTMqFVZFgBdxJ1G6uXmssRXX3htpw07X1xg0MB3CJCjgW2uNqautsd5rhOHD93
	ZcpQQy294GPR8TDkZWz3ElrWUF6AbHvKtAf/OSzm3Y1u5cMgic4mO5C0tNfHcKKBYTsKYHToFUw
	549633X3lm8YgxEhv1ZPrw2git6VMAQcuRIfWQqZ5HCkpoo6ov1m4MtHyvZ1dtN1hY+tnQjxlhl
	g+TLqURlv1XEuSaQYtgDY+wGqSK0fE0Wa9fvMAPGOhXeQGE+aNPGTglmM7Lw9W7DS19QhOoHuQM
	7+J2FBJxofGInCLl06Z7fH1oclpN1XIBBo1UH6eO4USAPh1B2S/OjSSXEziJMihp54dnnRwUaMg
	JxpnC8AbrJSuZeFDd007ri1SGjhhz0vEcWl1cLXSSF/SJ5cvmG13Pu/1/xsgXUs5Q==
X-Received: by 2002:a05:690c:3745:b0:8b0:a432:5686 with SMTP id 00721157ae682-8b520496833mr31116367b3.44.1795367642763;
        Sun, 22 Nov 2026 09:14:02 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (104-12-105-135.lightspeed.miamfl.sbcglobal.net. [104.12.105.135])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52034f7absm36379897b3.41.2026.11.22.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:14:02 -0800 (PST)
From: Jason Perlow <jperlow@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] Bluetooth: btbcm: Add entries for BCM4364B3 UART Bluetooth
Date: Sun, 22 Nov 2026 12:14:00 -0500
Message-ID: <179536764088.21183.18060597598784441550@gmail.com>
In-Reply-To: <6f0b4dfc-4bb3-45f9-81ae-347e345cbe33@molgen.mpg.de>
References: <6f0b4dfc-4bb3-45f9-81ae-347e345cbe33@molgen.mpg.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Paul,

Thanks for looking at it. (Resending as plain text; the first copy of
this reply bounced from the lists because of an HTML part.)

As tested it is about naming and the firmware lookup. The controller
already came up without the entries, but it was logged without a name
and the driver only tried the generic brcm/BCM.hcd. With the entries it
is named BCM4364B3 and brcm/BCM4364B3.hcd is tried first. I only checked
the log output and that the controller still initialises on both units;
I have not compared pairing or throughput before and after, and I am
not aware of a unit where Bluetooth did not work without this. The
commit message now says that explicitly so it does not read as a bug
fix.

You are right about the order. The table is ascending by subversion
here, so v2 puts 0x3032 and 0x305b between 0x2128 and 0x4119.

v2 is already out as a separate mail
(<20261122165132.14015-1-jperlow@gmail.com>) with your Reviewed-by
added, as you offered.

Thanks,
Jason

