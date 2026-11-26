Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679585;
	b=i91EkFTItRrbYcbxBIZHyXmr/XkuyEerCwJE6wyEaM/YPdHQQ04Jffli0ForQR4by49w
	 thq7aDKDUAT5cZWMujTx3u61PyYxLKIQMNHGc4JkyWOkhlxvKKxPWRKwZLQMJzdgEeEx1
	 v+yK/KLxKIbTqIjyxrIAAdljiFfFY5XbVJU7uOp2Kmn/g+pb/1WNh1Ku57PcCS5kjQB8g
	 2017MJ4N+iXAyDHlzf1ihQc4KY1JQH9LRKPAMX7VVPuIXWTM5JGy8fSgNuvlssEKD5HpY
	 gwNkSpeqIciu9oCEgjWkpAJF9Zujjb7+0eP5IIszJQEEkNcJR9b4tIcUv8RZs45pzqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
	b=hfWmlD/YXboqMbkJ9Su5e0MYa7xPGPS6jpdGOeYlMWwDESa6RoAYDDM7t+k4TWTdLpn+
	 bGXqbBRcb6tGjA20xxI3ZGJAUTEiMilkBSBEIvXTiiAYVcWazDgaVFvokuyV+eTlTHHzL
	 LMQ+WTrg+eqNT3QpGoYIFEKpLccPVVO2jVvijzAP5MF1QDf+z3FYCD6VR4qmxk6XHZFxU
	 hVly82wJywPqcJzUD1U+tLr6CKCYDQ/UhltvTiz9FQdDAF3W6QZ2VZDbIx24b2ZmruGkZ
	 2+1ku71/A29EVjAW6f9ClQWprNbKDnmYv5HH0kBqOsVlaltfSZ6ifi6nZhSi9fPdeYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXaX6gaV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C0E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXaX6gaV
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f14642adb4so4067399b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795679584; cv=none;
        d=google.com; s=arc-20260327;
        b=hcxymcL1f2oCVLdWE+7IhfrVkLlZR4euwp+nMy9rTelt7D3YhBqZHHRjTOFkWDv61t
         tvL8iXathAq7cAopljGTZeThwTH1xKivywVRx7UoPc4WDiWbTh51ELjX+IMUg4SNCXeT
         r6FTtxBwfUpicxSIIzidjdTZrL9WV3nGYm+qH9qwAP2cB66VL8WC58Tt+vzf5QxxizSZ
         /ocy9/pEydrxgAaWYYz2x163wcYoZ1j5kGoaV8GmxlJX1Z3VCT9mxB4vs/+I+K1kUY7Q
         0quOW4adioi/lXVnTVEGkJJbeBd+0n5mel86a/mRBvR07IFfNMPVj9TRN+CcsoH5kKsp
         jMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
        fh=yW7g7iS4s/zrihmiLoY5TkAMUS3tpL0Q8fA8w8O7I3o=;
        b=NxoifgaIcWBTc6ns/jL/IUP5yhycu24dANKsKM1J3PNoNqlx9jS1rFMCRKMRjCsjwk
         Mc/3nJTGuF8TRzFNdzgy8ECZOOfPxJT/M6aDHKbKdaeeCYbtq6in+JSrPQoBbV7Ltzjj
         9vG516VLNpmQ3cruV6sZjbcMR4Snc4QAMLcyda9jFI/u+SLQKV1KFq71a8Cc+asjr88v
         iYpzjLcI04RpJ1Eg9pR3Q8sGebafllmLTag+gOWzAmdsTXoUfBlrfNT2X+P3oi6DFHvQ
         qRx8nWam+ePuTqDWFADmUMq06bp4Ys4XLk25ZksDHsiYjc3qQybrVy7o46YiqIO49uMS
         cl+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795679584; x=1796284384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
        b=dXaX6gaVPEpBSG1a4DW1qqD5jfU78SQmUFKYJutzcBBuh05xCQs7aaVmknFM8GhNtI
         FSyt0KMUFIeSXrEbMh1bZqfEQW3Ymz8r5SAWAL1loMPxTIHyGAmSAGSQWeZiEnYDMDNA
         bFVtex5YCY1BqOuRrdYYuSV6cpGFKzN0Cie2hmRtZWQdxxS7eF1JzoYBYd0TPiowNp2z
         dqupeYOe1imzvhfLaYJp3bRPCd9RW2Zjbcz+SkHKU2bi8CLtOj5ednRPfPX3ibfy0Jq+
         zwWz8UaoBMBPO8ZjXi0r0VjXioo1TABCWN5kLinto7eFrm1Rrx/h/YwHqixA8Bf18rpM
         +ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679584; x=1796284384;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
        b=p0W09Jh6x9V5nDHO3uj47uO9SQhwqcW8az8SRzRos+kdkk9aswW+6OKvDe231sm0ay
         jCaqBhxIxyXq78WsVN4Gq7LY8HoEwieqp5T5nC7GTk1dzzZIhMpIjUgQnA70F5tpQ4fP
         VbWE64NgTHipURnl+AyJ3HOK0uevBL51t5ur4ySBZpR3+jRLImZ8O/ztEkPnT4Un24z6
         A3Y1dnO7AgfrRvthdtED5hp5cSXHUV3hsLpX5gfCk/2oW5GlC16oJ/m3rQ8Vll459Ay7
         CZJjbr5fYhY+6KhKR3s3at5zuzbg5wkgMk2+wxZZHqfU+qpVb8OZyFo/wUadlfxjQVmV
         mPJw==
X-Forwarded-Encrypted: i=1; AL+hErFz2AS3m/e0bSlDrn7gZ1Mj+8qicKzuxEIRILk2glMqGfNlVHy+G3tJU14xal05JEK15pxoUC2m7w+y/g8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CFgMOrXW3eqPpEkxSBQdT3Ua3q/XdCLiy4xal6/K07W+bDkGS
	e83SuX+CfdZouaOdeRwGV6TWPFHjc+asRZKB0wzsiVcn8o8CwSjfb2cd7QNxhXrbMr4EYca56Xr
	QSRifjGIhP3hn2jXfspKYubiYx3+6VLc=
X-Gm-Gg: AZFdTZfbFnD+69yQzRoYd1TAgRDzQP6+xV6FyKpJaU8qnX+Yo6Nm0efLyAEaScChYB+
	6Icl3pkBot2FIb3f868P3LfywD8CpKooLm2SM0GFE2yW0LaS6zUjbF6vBO8IsAj8pvUIJ4nl+jM
	sy4u6QkCRkPU9ctaditS+RYD9ZB90HcxPgsLUfp0bJNNM/09RMZGBir8+tnCwbMIM3qBgBYde9b
	C+PEYsl6boQAfW6xCPEGxn8c0VWBgDrXOB7s1zH+s9E9Q11aQR2XCnkzblqF9oYeQuRizVC3rnH
	CeMX7kiXyaR07HDvjx55409gzw2t09aoXVDY0UdUozRUXnjCxe5pgni9H18CBa2V5jEfU2IYrK0
	C1oPuEW6t+pLtzPqxxJL6myISdH8AHQTfoL37G+ozTuJn1oH8u7puhTGHtM7e1i/z1w==
X-Received: by 2002:a05:6808:178f:b0:55c:888:30ff with SMTP id
 5614622812f47-57a0bb6edfbmr22917560b6e.45.1795679584108; Wed, 25 Nov 2026
 23:53:04 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 07:53:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Thu, 26 Nov 2026 07:53:02 +0000
X-Gm-Features: Aa3M54oRNFlRfF9nHUJQxOdIqVCkVuZIpejqbVhd1Y_O8sr1Oa2Dxu_tj0Coi9k
Message-ID: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
Subject: [PATCH v1 0/2] usb: typec: ucsi: gaokun: Fix DP detach and
 orientation ordering
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On the Huawei MateBook E Go we observed two cases where the display
driver got an incomplete or premature hotplug indication.

On unplug, the EC can report no CC orientation, no mux and HPD low in
one update. The DP SVID is already gone when the driver checks whether
to notify the bridge. Patch 1 remembers a previously forwarded high and
delivers low once for this physical detach.

On attach, a UCSI connector-status notification can precede the EC
report containing the new DP orientation. On the right port we saw EC
REVERSE with the QMP PHY still at NORMAL and channel equalization timing
out. On a successful reconnect in the same physical orientation, both
reported REVERSE and both lanes trained. Patch 2 sets the orientation
switch from the fresh EC report before programming the mux. It withholds
high if setup fails and preserves the detach notification.

This is based on usb-next plus the two patches in the Gaokun port-update
series [1]. Its per-port event path serializes EC mode updates. Both
prerequisite patch IDs follow the diffstat. The separate HPD_IRQ work
[2] touches the same bridge call and handles sink interrupts. If it
lands first I can rebase, preserving its IRQ indication for DP reports.

I built an arm64 Image and modules after each patch. For a cable-free
host test, replay right-port bytes 09/19 followed by 02/00 twice, with
the right update bit set. Observe switch, mux, bridge and PAN calls.
Expect high on the DP report, one low across the two empty reports and
one ACK per processed frame. A switch or mux failure on a high frame
should withhold high; a fresh valid report should succeed. A host-side
test also held a status write in flight while delivering the fresh DP
frame and checked the final hardware-facing orientation.

The earlier hardware build had the left charger connected throughout.
The monitor showed video on the first attach and reconnect in one plug
orientation, and on reconnect in the other. The first flipped attach
showed no video and no right Type-C partner was observed in the samples.
EDID cleared on all three removals that began with a populated EDID.

Those hardware results are from the prototype. This posting obtains
its own switch handle and selects ports with a DP bridge and DP report.
The Type-C status callback continues to publish the class orientation;
a separate switch write from the EC event can precede that publication.
The exact posted series has been built and replay-tested, and still
needs a board run.

OpenAI Codex assisted with source inspection, implementation, tests and
drafting this series.

Thanks,
Lee Youngjoon

[1] https://lore.kernel.org/r/CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com
[2] https://lore.kernel.org/r/20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com

Lee Youngjoon (2):
  usb: typec: ucsi: gaokun: Forward HPD low on physical detach
  usb: typec: ucsi: gaokun: Set orientation before switching to DP

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 68 +++++++++++++++++++--
 1 file changed, 62 insertions(+), 6 deletions(-)


base-commit: 90d6263e867be7089b3d3323bef8d2accd327c77
prerequisite-patch-id: cfd37d1c2c80a677a55355503949110e2a427bef
prerequisite-patch-id: dae17ae41b9e4a6710e956900347d5d637ae39fd
