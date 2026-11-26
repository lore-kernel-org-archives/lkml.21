Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711332;
	b=seWDioH45N7B31jS10hu8SSiCZa4m0wnBkqbjetpmr9IQIv/zoNh+bpxB+Beavmgsq5S
	 DIkmP1QAQ50AWwj0uBQjyg8+IZ1zOqtA8DIU5v1ksm5UzmUYUCkxClX3yxmU4lveo1UGi
	 7ussGDBOwVYWRH3WuTtC8bDGuISBWdr/kLpwBpZQWG8aoHAzQ8mWzfMqdGh4Dr1vBRpzO
	 zMJhOrcWHMKrWE6I5oyIUqp8Gu9/HycLQ42UZJp0sWXg9CidNOia0tAMLltlkC4pfK0Oc
	 PMETjYk9A4qWOLuOqFB2NGbgYex6PaMKnbsTeoDaGek5fjRKtV95WdenqBOet/IjkUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0SFwWsGiZKpcFIvDxjRNjibN9AJpRHuzGw1nmpgwE7E=;
	b=Fzf/KSNaBy4a35eiwzzfGqZP3pF/oIG8eGdzBhwLGHNOkuBStnIoV6B1hvKTrt5PnJKw
	 BInYNzGN872wsIsKr+CBSA7RWZzAPQ3xbNDJW0WqbvnHGfzgEzomU1Qc21Htl8sj1+2Ls
	 pwi+3hwy8SY6TKRHs4wkSBMAy/YtO8PwPPxDt4/YcP8lCzN4OIfLfe9v8sFlaXtSbQpxB
	 Kw4azvZ63OaO8vBtsE+vY/ihkZ8klBAI2gBytpEsnsdiml53OjlMsfowQJwckaoHuPwfI
	 Rjn+O++OYysuY3p0LYDdWN6iEH6DbrT0hhzDXyhG03mKtVADa6m4ASZM1+PqysWO7lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twxqx1T3;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E14A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twxqx1T3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380c28f9e35so8173528eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711332; x=1796316132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SFwWsGiZKpcFIvDxjRNjibN9AJpRHuzGw1nmpgwE7E=;
        b=Twxqx1T3QyB77vh2Xe50mVlXXEkIgcbKw/MfEGmsfKUotd3WIvIR5k4NkmL+dmXDYO
         yPWGawjLWciM5kl/7eC3+Q+rz+lIqPnMeE/NX8S4GlQJRwFDQ6RcahGBlQ25SZmY6LRO
         XukW++Ufdy1YkbdqXIg+z8e6qc9VmzF+jf7IuBbbse84kfh6ly7HqFGBL1QVUX+extUH
         TgK3YhHINor9vYnz0BfAarDsc0KmizPe07pLoTulK9mPkO3LTaWQ8uqxTMVLfQssnCsD
         NRFlPni7fKjdnHlJKQZkyJqN69eFd1UAs0cT17BaKJrzW1FuSp1Ldy3hmoGPhJpvgI6D
         dDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711332; x=1796316132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SFwWsGiZKpcFIvDxjRNjibN9AJpRHuzGw1nmpgwE7E=;
        b=uCWqH1eRNLjcKSnwxLyI8xNFo0ipjtdXaOdic8NT9hAR5QcvtRlaH+9/P0cb73ulyq
         fCHnolWUgSfTlGkTP34LwPWxla9k7lgFu/q5U2GmQRlJKRyQDUdM8QsJt/brzvkjiYhx
         lvZQqFCi1meTXafTW4F5Wc3ZobHXWrMwXEnWiKTDJkOibKCm5O/4/W1sFBQMVx5hedSm
         aNvWfvPD5GRbft9QW6UgMgs10e5EEikoSIwPRuUBgNUudwVzDCCFPYQYZy2pp5HuzDmM
         r7SQtyG7PAe9LS69PWnQBcwnPmFNts4ZHHuudWjrZxNiWps1/jrV8956+7wovpqB4MlP
         dCNg==
X-Forwarded-Encrypted: i=1; AL+hErGwGynbr/IO/nTAT0P4JOm8sXX9+Nu4Pcf1LLhqM0KTULzQKHsAXStCfQY9DKvx0y7inJEl1A5ZVJ4FHi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Er2eUMLihkOzmoQwt/pBAyBjOLQ6sPeB4lub0aOZZ/4+nMgJ0
	Od+BKI9RTuBMBOcXTKwl33SPLXuC9A3fVpJ3oL8+9jIh4wiYI5u8OGoh
X-Gm-Gg: AZFdTZfjbjo8ENwFSuMuP+NwKnwkUexSpDVkgJdFtBY7fomMzNlY2GDzp02Y1mce0mV
	b7m7mXBtkdOZXjX6uk3BMYW9I7zCJPfAhMpm8c0dpAh5Obu4cj1iudCMmMvw1TUhUopdEZLgvjU
	Nah7EDiupK76J9sjGfUaQY8hqiS7iWNWQ2zwRyl4ZtXkmNeUR/KoMWqA1++HCVZj6z7jqpPCUFp
	IQt86UayHegkH61hLEdnt1SZ6k6apNG2dO0EibJrmg03iZp6+C3AK5pfFBVsaOMMGkUE3Rf2n8q
	3lNi6nHraSPZxSsMdNVjU1PWMC2vGCuRZAZkHzAyNdh5qYOyGEHUK1BQXYrGvwk7MsDlsYej+5H
	KRZAYaucnksO3/32nZyHXcN2zx9Nno9G+yTfEB++bqgHXmhbbhurYu5JSMOIraGPD4n0LtAaqQ0
	Ix7jzJ21ZZ095b5eUWJ6qxhHhVrGjbmhhQhfJb9ZYhGmMCfQtWDx/RjaVpXLbB2uBDBIhPSsQCY
	7LxEtpO5RwqfWoReuAwJ6u9sK8UL0yA/fxYMTuR9yw38bhoRI3QnAiMqmfgrIkXRkHL2Q+TdySR
	m+FNC6yRioztafsnq4Pv3to0QRjY2Qke7fPSVkyFLnMoEqHluVYkt4Pax633siVshnRYbi2/3dX
	JKwBFfcZ+RWAIuNfcDgsBGYt1TpGVLKHrgt6ENK0P0qQj7h6qUnVwxY20C/k9+Cv/EXq+1Yem
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr24317744eec.25.1795711331465;
        Thu, 26 Nov 2026 08:42:11 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:10 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 0/8] ptp: fix OCP routes and SJA1105 pin direction
Date: Thu, 26 Nov 2026 08:42:01 -0800
Message-ID: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

This driver series contains the SJA1105 pin-direction fixes and OCP SMA/DPLL
corrections. It is separate from the PTP core series as requested in review.
The PTP core v6 series is a prerequisite; apply this series only after those
core changes. This series contains no ptp_chardev.c or ptp_sysfs.c changes.

Prerequisite PTP core series:
https://lore.kernel.org/r/20261126-timecard-core-v6-0-ahmadexp@gmail.com/

The teardown follow-up removes ptp_ocp's early timestamp-disable loop so the
new core unregister cleanup disables channels after user operations drain.
The existing shared-PPS map shortcut is unchanged. The DCF correction is
unchanged and retains Vadim's Reviewed-by tag; tags were not carried onto
patches changed in this revision.

Validation: strict x86_64 object build for the PTP core, OCP driver and
SJA1105 PTP object with W=1 KCFLAGS=-Werror; source-derived teardown and
sysfs/ioctl race tests; SMA routing, DPLL get/set and ART capability tests;
runtime mutations reject missing sysfs locks. Hardware register and IRQ
operations were stubbed. No physical card or switch was tested.

A coding assistant helped identify the issues, develop the fixes and
regression tests, and prepare changelog text.

Ahmad Byagowi (8):
  net: dsa: sja1105: keep pin function on EXTTS disable
  net: dsa: sja1105: keep pin function on PEROUT disable
  ptp: ocp: preserve timestamp routes on DPLL frequency changes
  ptp: ocp: restore disabled SMA inputs when binding
  ptp: ocp: report disabled SMA inputs as zero Hz
  ptp: ocp: correct the DCF output frequency
  ptp: ocp: match ART DPLL frequencies to selectors
  ptp: ocp: defer timestamp shutdown to clock unregister

 drivers/net/dsa/sja1105/sja1105_ptp.c | 16 ++++--
 drivers/ptp/ptp_ocp.c                 | 83 ++++++++++++++++++++-------
 2 files changed, 71 insertions(+), 28 deletions(-)


base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
prerequisite-patch-id: 6bad78c955ada1724510b31a0276a3208ce76a5c
prerequisite-patch-id: dc638755165b24f907f718a498e20d4aa1c6190a
-- 
2.54.0 (Apple Git-157)

