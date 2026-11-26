Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714008;
	b=fiQYtT7SUH5NGZtmDwrfq2qP5R4uz5Kx5RVV4QeCLF/r/aH5cwAVPjZ8JtT7iqe4l+Zl
	 xbuWa6Bpm8EduT8lOhvgxQ6kKiVzYIsD/L6Y5Olarlix2wpStkzj56gst39TV3AK2GUyO
	 ZWlPtIFMpNo/K+0umovpeXi3BtfxOMJzXVhO9C29EkLdZvLuyYjgIqVMeA3Y/FIDk6fWZ
	 L2PGpVsGYEU8DSlbMmfrNQ3JeIULdt5ubi4jdnSbKTfcJDef1dyZIftWu5VMf7oZgZD6b
	 krXQgTa/buHY20FeWf4+WbsDRO2zZahzgAv6no7oMPIaJWycrjSF8AAZB8Zt5WmrSZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714008;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hkg4P9rY1WB0Ppe2UyuQnnJTpse7fAASF6bGfed8CFY=;
	b=DBr3cUbBxyG7TQ9xtPdqqmRsobcn6QlRL8OEqgcASzCVd/8Np0flX+zj2UfqDiTaiRcz
	 T4KP4ksthHJGxWCCrmSs+1JNzUfeU02ZWEzSDvQBVT50SfegPrWG/6JzfGLhk4p2HJkAI
	 TNyH1UCVtAj7ishWxUG+5jsJHvW/fDpIgNNaePu38dHtCphFkob/alyHMYHWP6i5kf6/0
	 tQ/3+m5UeCAQbsWrb7Br/EGyJ9x24n9XrqiaYIIX3CTBTbb6kQYnEBus4PAQzDnv3qn67
	 vSKb8UcPdG+SLRKyrK/PUFg0s2INlVxniiHF14VybV+OCTghkb2zl8wpLT1iHRdCmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=korsgaard.com;
	spf=pass smtp.mailfrom=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=kn8LgjtG;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBAB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=kn8LgjtG
DKIM-Signature: a=rsa-sha256; b=kn8LgjtGZm8gDOjoWHrF60QnN42rK7Z4vVodvVcY24vUDQwpSYTU7uFNJJqrHfl3Py/UpLIsmHCijOTU+8ETfCyY40L3lpRSYAKb6GgDxVXfSCK+54rEQBymdCfIr3mcTLUBh+SfESERdpXg4a1VseQ3StUN5Ck1Te/0gfOI07GYXGxik/9hzLtltVvTh6MP90N9FqHsmp5QXLfoKde6ofLLBVqk4aFtLhhtpPQuglgEKgkeyj/Wl4vm5R+uNPB465BNKRemGNqrZfZVhEgkBkfmCDdv+s1nkm5k8jz5zLgMCOldkklz9NPSM+qIREkFxGAT68ClcFfW0WtQ0ECPkQ==; s=purelymail3; d=purelymail.com; v=1; bh=hkg4P9rY1WB0Ppe2UyuQnnJTpse7fAASF6bGfed8CFY=; h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 325574168;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 26 Nov 2026 17:26:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1xWdEq-0000000CjRJ-3Qc0;
	Thu, 26 Nov 2026 18:26:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Benjamin =?utf-8?Q?Cab=C3=A9?= <kartben@gmail.com>
Cc: Till Harbaum <till@harbaum.org>,  Andi Shyti <andi.shyti@kernel.org>,
  Fabio Baltieri <fabiobaltieri@chromium.org>,  linux-i2c@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: tiny-usb: add Zephyr Project VID/PID pair
In-Reply-To: <20261125195236.95816-1-kartben@gmail.com> ("Benjamin
 =?utf-8?Q?Cab=C3=A9=22's?=
	message of "Wed, 25 Nov 2026 20:52:35 +0100")
References: <20261125195236.95816-1-kartben@gmail.com>
Date: Thu, 26 Nov 2026 18:26:28 +0100
Message-ID: <875wxjpkqj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
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

>>>>> "Benjamin" =3D=3D Benjamin Cab=C3=A9 <kartben@gmail.com> writes:

 > The Zephyr Project ships an i2c-tiny-usb sample with its USB device
 > stack, which turns any supported board into a USB-to-I2C bridge. The
 > sample implements the same vendor request protocol as the original
 > i2c-tiny-usb firmware, exposing a single vendor-specific interface
 > with no endpoints, so it can be driven by this driver as-is.

 > Zephyr in-tree samples must use the project's own USB vendor ID
 > (0x2fe3) rather than a donated or third-party one, and product ID
 > 0x0013 is reserved for this sample in the project's VID/PID list.
 > Without an entry here, users have to bind the device by hand through
 > the driver's dynamic ID sysfs attribute.

 > Link: https://github.com/zephyrproject-rtos/zephyr/commit/281b5743d183
 > Assisted-by: Claude:claude-opus-5
 > Signed-off-by: Benjamin Cab=C3=A9 <kartben@gmail.com>
 > Reviewed-by: Fabio Baltieri <fabiobaltieri@chromium.org>
 > ---
 > Resend of [1], unchanged apart from collecting Fabio's Reviewed-by.
 > Still applies cleanly on current mainline.

 > [1] https://lore.kernel.org/r/20260820213958.41276-1-kartben@gmail.com

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

--=20
Bye, Peter Korsgaard
