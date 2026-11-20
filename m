Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177952;
	b=Pp8nIhrwlsOyndHCheOCfK/KI+yEDuNnwseEi28bEkSccCERMsiYBBHUgxZA5a+NwJ3M
	 8jInXCzAcwEG+uIySajiCvU5r/A2FFJzWaG80jf1/xisTgxdzDRUYJ/ipiKPgR9n+aB5E
	 QpQHYPkHpXQwSgY7Xm75IexeR+55GoOHJlU500dBt2kNI9nvUZLqfDO/N17XgJNRt3GzN
	 9Lqx1NxeALew/7OTRnO0/L+I2JPOdJ8NflVc4dLyBaZ6UMebvrxHm2aYqh3ryM5Fi6vEY
	 bstr6u/W9TMAmwFPKXEWA3wJYMZwVRglP2SWHF9hD8XduHyP/DWeGUtC4QmncRm0wvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177952;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:Date:Message-ID:
	 In-Reply-To:References:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xJgqJ1GzLT0Cz85cGPOr0HyND/H8SVlikDVF2XvQ3RU=;
	b=3NgwGtA6/W/S6usaIbknMMoBpsImN+TlcQpmeAz8lZKIyMtOUdiUBIfKTlfAjJLgQM82
	 d0WpFu5VSWJ9+yDrBVFrs4R2kWGhtj54qgAbiRed7kovizKpr2CNdbnlD4H2O1Jexs8nX
	 IedgTZ1gRzN6yRZfe0Y6mx3JYV/bQpRJDUdZuefV3Jtxa2MupcxmuPcXMrrC/+e9wThrn
	 WSn004wMPMK92mcQM6a3qfPfEfFzSSZc+LVImsP98TwT9mc9J5HJrWclOwWR+//GZLSZj
	 +s0M6gY1n8X2AlnK3pwbqHy3hd00zKWt1Mlm92enylQ9XKATgUbzX91kJtcNNGFxFFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aclaesson.com;
	spf=pass smtp.mailfrom=aclaesson.com;
	dkim=pass header.d=aclaesson.com header.i=@aclaesson.com header.a=rsa-sha256 header.s=protonmail header.b=dQdQelpQ;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE279606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE279606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aclaesson.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aclaesson.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aclaesson.com header.i=@aclaesson.com header.a=rsa-sha256 header.s=protonmail header.b=dQdQelpQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aclaesson.com;
	s=protonmail; t=1795177948; x=1795437148;
	bh=xJgqJ1GzLT0Cz85cGPOr0HyND/H8SVlikDVF2XvQ3RU=;
	h=From:Date:Message-ID:In-Reply-To:References:To:Cc:Subject:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dQdQelpQE6ziXihNgnYqxdHRHwR4Ng0knHbXzOlXKtBgb3AClyGog0tku0wLWcOJA
	 ALeYMY1F0zEP29de/HxmWxgzh/HFOCt738weODI/naeYiIwZCuwDGkzFvkX0F6MuFA
	 4SZg1l9HBO61dFpDuMCPvncc6jGNbzqvvmbnOw7o91tx6OwjqkTMX+V1S9u54yTtsb
	 j5dKbwwkFKG0MlxEeC/hAxVweEit577pLna8IbHNWYhMHIhAVWXwvw/yuHn/IK78JE
	 gDoX350uKaZqFn8KjFJ7tXHbwvLE2jFECOkNyFO2CC1AOHzlMJP/kMC5p9K2tv1w5l
	 mHfw48bFsto8g==
X-Pm-Submission-Id: 4jWF8n1n5Zz1DDr2
From: Andreas Claesson <andreas@aclaesson.com>
Date: Fri, 20 Nov 2026 12:32:24 +0000
Message-ID: <179517794443.913379.16756320627305412346@aclaesson.com>
In-Reply-To: <30po4s0s-7n8n-1q84-40r3-623n6n45p005@xreary.bet>
References: <20261109-hid-corsair-k90-uaf-v1-1-0621c2c5c451@aclaesson.com>
 <30po4s0s-7n8n-1q84-40r3-623n6n45p005@xreary.bet>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Chen Changcheng <chenchangcheng@kylinos.cn>,
 Danish Khateeb <danishkhateeb03@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] HID: corsair: cancel LED work again after unregistering the LED
Content-Type: text/plain; charset="us-ascii"
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

On Thu, 19 Nov 2026, Jiri Kosina wrote:
> Applied to hid.git#for-7.4/upstream-fixes, thanks.

Thanks, but I think this one should be dropped again, sorry for the
noise.

for-7.4/upstream-fixes also has cc8d022e8679 ("HID: corsair: use
disable_work_sync() to tear down the LED workers") from Danish, which
fixes the same bug and which I had missed when I sent mine. With the
work disabled before led_classdev_unregister(), the LED-off request can
no longer queue it, so the cancel_work_sync() calls my patch adds on
top (e624a56578e5) do nothing, and the comment it adds is no longer
true.

It is harmless, so if dropping it is inconvenient I can send a revert
instead, whichever you prefer.

Thanks,
Andreas
