Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020735;
	b=B+We0puC4U9WRG1Dw7TnPg71In4yNym6Nn/EBwJ9nXrJdL0MSnYSmNs5rDIw0Jd0zFJC
	 8eBZ8mFDp0dtyvRGGMIFQXwmQaMndy6pibiSLAI8gFOl1lEyRFPaLF7p7Npc52huDkFMY
	 Y6FyoiBMmvEN/egZLFVDAYE3A1Qw9hbk8YOh8HGTk0EUMC5U6LMWxTohiqNPOMfLbUlC3
	 NCVmZYQCuziFQd0m3Yc6hglHiiB3b16RPHAT7zh3X0UX1FXvw4TPPJiRtVoFHzeMclYfY
	 xQG2rR97vQkWJgZJ7JLK99UPi5ITTGep0Zt4B892xEI0+ycl7t6FJAyK169hLPPmwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjRCxVsOqeAjiMswucgxugEspmZi3U3IrZmdCQAxIno=;
	b=W/eZFBe5yQrZyz7syBcSrXE6lADkTKgL9pyj6C85kqZxpY+KjA1I9vHhivzPa6Xp+d3R
	 B5H93KvbFABfYHB6oViAPUx4r6V4sbY+dnTCz2jXsvmlE1QWA+dg8hxEaqL8dRG1y7anH
	 Kv9KIU//F9gTSBUQjepE83TEtL9JxMBWjL23zUBuPK6aj6X4jgvuQ3pU6GbCcLUmBmWd0
	 TWLJ1FeVAN6gWt/mJWLHlCdkCbXW8EIshbxVwLDu79YQBD2YQ8H3slDxKJkSfA0RqDexp
	 wuEGmlbU0+/o4Usp/5lj38gzmb91KsNi4biFx07zmUf2O0YVMkbHB2jCxUeAekQywqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2tsrl4b;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08560A2636
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F08560A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2tsrl4b
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11992505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020733; x=1795625533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjRCxVsOqeAjiMswucgxugEspmZi3U3IrZmdCQAxIno=;
        b=x2tsrl4bT2uSvJscsPqR5W/OYVq6+XC98r4tNKhfRq5o0qu9GfOkkzlqNdl5NtdlBE
         FVwvFnfo+Qio/FoQIyMxLJiiWYcEvr9pWnZ2dwMuy60N9h+piI/WAe74pDOmRzfyy7HX
         Gmt5ya1pSivUcyicT4/YPWIlzdRvfBUXzasOskFUgmdisUsjv1WcQP24lIVRgTAOkAYJ
         OsH7wx4UgWSC1ysIXWlOcAGtA2nE/B5M7CEhomzizlZQcgBjU78p43GYrERIwMCbvBK3
         DpzglYOtQJp65gkG2maw6IvMf2WBQoCXmltNQey17Yass5pMMVN1TUfi1NyDwjx1GhMC
         +f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020733; x=1795625533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjRCxVsOqeAjiMswucgxugEspmZi3U3IrZmdCQAxIno=;
        b=uQ8MFERDkh7hMb+fwk4NsQta/hsOiIiWLT967payMeaazqLwcZ3z9CtDmGtbst35Wi
         Xs2JJymKUU8EekrmvR2/FuEX3SIRqw3fm9duYZ2t8YJYxPWM5uJ7kFGUqt9L7sNpyIAY
         ISi098Hm+iOzBpqQRadBZtl06z70R5ypY2EnrRypaQpEZTOn10crN8ex6CUu9VDNjIU+
         ET0r6JkbyKRkRLb6MzQMMit2kJAWePLlXeTCUn77AkR/F9mXQH/ePEMIZ/j2BLve0IuS
         KQ0P4GbovGYPrBa+dZfcmHdbSJki1scehRWEEyMd0IDBWyL9Kk+EGRoWurxY60Sxc+Rf
         MnCA==
X-Forwarded-Encrypted: i=1; AL+hErEgvPphLjPRmsOdg7v9r2pkBZSBX0C8LxaPKqgZTCGs7nxewi9W6gITxNtzj9kAClJPyjpXHiaSoscBGyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PR2iBLpWIPUSyd0NyuIF729f6gWzV3WyS9kzf/BAGEsoWDyps
	ceNnpfSZitQNb/Cdf6HzyvO8HT3XySxEX7Qx/Sjkm6La48IAjmq1cYCz
X-Gm-Gg: AYBFou1yyfMK3WKxjF3QsVZU6+PqcVRZdMKf4BpgHJZ2tLTN2aJ1KHDnSges/tvKajo
	m1bIrxkleUAc+LSClFCXlSi3BFJxOkwp3wDbYlz4/JWOAvBeD9lxYZnZfGmsHQ+43YkFvjyT1mS
	K+ZCe69rMawBSR2UvhtlN+1Lx1BIbbcOm4DQ9vrfkjxR//MAuMhI4Vlf+exODgkvkhbiVe89ttB
	QcQAYMqW5jct/2krJYdwoybYzU0ur2pXWpZBk1UHC1AN7rD9TrU6LipPqFv6n9zDzrjg8+c3NMt
	Kn1q2PUmzJBqtLbkb/rap5X/2JIGg6rsf5PhQu2Iw51blBJKPYL+fwS9C2o2ZRpvs4l7aIOUJDM
	vd9NqFTRcZ1vC8rD5SMmVTs4krTp7Pil8x3V0BLWD0BWMOM78E8sX3pPGEYZG0ihQtMTS/cdp33
	njmtJhVoGDP3Wrpr5iCwULC83ETnXdhZcM2+eDc7tl/dfE6e0dwDy7OkQRpoQBxVh6soZmn2bny
	LpnQhhfEAR+g2qtdoO0VrKy5iBkCu4IlNX7tGV5C8xslPjythN3c7I6YOSfB4lAZnlW0wHOfZcJ
	r3DTb36UwaxfZ3eVdT3JXFZ+7qwKSg==
X-Received: by 2002:a05:600c:6746:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb7da12d14mr61880185e9.8.1795020733237;
        Wed, 18 Nov 2026 08:52:13 -0800 (PST)
Received: from fedora ([2001:ac8:24:6a7::20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e5ae0bdsm24093625e9.4.2026.11.18.08.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:52:12 -0800 (PST)
From: Tommaso Perondi <perondi.tommaso@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tommaso Perondi <perondi.tommaso@gmail.com>,
	dpenkler@gmail.com,
	linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	=?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] gpib: tnt4882: set iobase for the ISA and PCMCIA boards
Date: Wed, 18 Nov 2026 17:51:40 +0100
Message-ID: <20261118165140.1481402-1-perondi.tommaso@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026102704-deletion-handcart-ee29@gregkh>
References: <2026102704-deletion-handcart-ee29@gregkh>
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

On Tue, Oct 27, 2026 at 05:29:03PM +0100, Greg Kroah-Hartman wrote:
>  - Both detach functions call release_region() only if iobase is set. The
>    region is never released, so the board cannot be put online a second
>    time: request_region() fails with -EBUSY until the next boot.

Hi Greg, Josef, thanks for the fix.

I applied this patch and tested it on a National Instruments
AT-GPIB/TNT (ISA) board. REN is asserted again and I can take the
board offline and back online without getting -EBUSY.

I don't have a GPIB-PCMCIA card, so I could not test the PCMCIA part
(including the new iosize field).

There is no gpib list, so you may have missed it: I posted this fix in
August as a two-patch series (ISA and PCMCIA). I won't resend
mine. Feel free to add the Link: below to the commit if you think it's
useful for the history, or just drop it.

Link: https://lore.kernel.org/all/20260815195757.2001555-1-perondi.tommaso@gmail.com/
Tested-by: Tommaso Perondi <perondi.tommaso@gmail.com> # ISA only

Tommaso
