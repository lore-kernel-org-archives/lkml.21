Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803038;
	b=z9iffVCATrShS93q9LXO94dX6A1218Nk3+/Q299nPdR2mnhaRjwFiC8W12akDVZTLjV3
	 F0vQ1//G6cK+s01ck3P4sPzpaVqJcnxg4FkZPJIXcGoV8LEihWeBuCChYlbl3m/AMx4dW
	 A7ysQ4iagQUjl5bGCIkxbWLTIVCMQtFqvstBML4frbhIeJkZ/UoFShC5o7LVAUImjg2QT
	 ynzZLlGcPCMOUFbCkzMJ7Pw0LyCwP7HGtoDxX5ZZeyV0b0AZQMAbGGsyGvNB8DKGCzj1V
	 I4Com0L5qgg4kAqjJhE1iubcv6T8uchik9iDPusU/uSs/KuqDibPa8qLt5AE0z/XzJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803038;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qj6sXs+CgtyUP++7pGL9qFS2nskS1G5FtRqYto9t8HU=;
	b=zDBaTdYcOptCmex9x84ZSbz0nUnVSuiFAQZEAaqSiUD91AGGvjCgzLsTtAeO1uJ6RD6O
	 5a/e/SfRfmaLj5k/cKvxnG4IkqsEKsItEeyVQ2fhsuaH9TmRGaSHTAlkgRtHYdQsCfNpm
	 am/lFsZS0mkKw5RjelyBL8rRAsNTO+/qDadF8l+8S1QBES4dRwbfLW31xd8S0IihTrdUU
	 W2luHxcsf9V33RztULA+VYkvTN368wESVeozGdRP/C2k6/StUEKS9p2BDmanYmwj98BtW
	 YLz+T4nOsy46TyhysymugCBT6TBHpwr7V/tp2vI9m13Mlsdh5RdVafZXL0mSlWZyFZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nRu0Z70F;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D3606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nRu0Z70F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1795803035; x=1796062235;
	bh=qj6sXs+CgtyUP++7pGL9qFS2nskS1G5FtRqYto9t8HU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nRu0Z70FjvuE9643w2vwHolULu8DjKKrgX8iiERIiDc2pVRN4UBH73JYuUcmdUhHN
	 r0LW+TlwkO3zG4S2h00YDr32ea2f2ajB6imuWnVo7kbX9IugHsjRd9BKgBiRicjD23
	 pziMdIdbinnCn0JI1uw2u5+jdGfCSgg2GK0tI0w0jkDrdnkcK0zzQq1IpBNRqaKsYm
	 i1UQ0J0785ZR8Ttfuofwg2v/5saz2L/wkJenMC6Gu5ns4h6EGyDH9wKgxkVed3/qBb
	 dS/zGYmO6KluR8cu4S73aLyizbckIMXXYYSJQO97fT3zlRFxPa2Jt02UJtJkDfcyVE
	 NWS9pj7jhjgDA==
Date: Fri, 27 Nov 2026 18:10:27 +0000
To: antoine.pichot@gmail.com
From: Anthony Garcia <TonysTracer@pm.me>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org, andriy.shevchenko@linux.intel.com, dan.scally@ideasonboard.com, djrscally@gmail.com, dmanresa@gmail.com, dave.stevenson@raspberrypi.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Message-ID: <9M76pTkfqTFYYV0x7QQegwNjy5ZHwG2LsiwewU-KWrCowx5tvfp2L4W6za362xj-ymlfYDci3p_aGCNp9tPMPgy-jzBu-OFHHZJaNw-1o0c=@pm.me>
Feedback-ID: 110080960:user:proton
X-Pm-Message-ID: 87d127640e83a2597299a71c3816e4d5d9aa84d7
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

Hi Antoine,

Tested on a Surface Pro 7 (Ice Lake). Its OV7251 IR camera sits behind
an IPU4P, which I run with ruslanbay's IPU4P-on-IPU6 RFC series on
linux-surface 7.3.0-rc7. I built kernel/backport/ov7251.c from your
surface-ir-camera repo (commit 83b3ca1, so mainline 7.2 plus the
linux-surface gain control rename and patches 1-8) as an out-of-tree
module against that kernel. Patch 9 wasn't tested, I used the installed
ipu-bridge. Capture was 10 runs of 10 frames each at 640x480 30 fps
through libcamera's cam, with the frames saved and their mean pixel
value measured.

As posted it doesn't probe on my kernel:

  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
  ov7251 i2c-INT347E:00: ov7251_write_reg: write reg error -121: reg=3D103,=
 val=3D1
  ov7251 i2c-INT347E:00: error during global init

That's the INT3472 supply name mismatch D. Manresa fixed in 59cab094b8b5
("platform/x86: int3472: map the ov7251 power enable GPIO to "vdda""),
which is in v7.4-rc1 but not in my 7.3 tree (linux-surface/kernel PR 199
is an open backport of it to 7.3). Same thing Firas hit on the Pro 7+.
My kernel carries a local workaround instead, an ov7251-side fallback
that asks for "avdd" when "vdda" doesn't exist, so I added that same
fallback to your file for the test. It picks up the same INT3472
regulator that 59cab094b8b5 renames to "vdda", and with it the sensor
probed and streamed. I didn't test 59cab094b8b5 itself or a 7.4 kernel.
I don't see anything in your series that needs to change for this, on a
7.3 base it just needs the INT3472 mapping or an equivalent fallback.

With the fallback applied:

- Probe passed, so the firmware's link frequency is one the driver's
  table has. I didn't read back which one was used.
- 10 of 10 stream runs delivered all 10 frames, no kernel errors.
- strobe_output_enable works. Lit frames read 29.0 to 29.1 and the
  frames in between 8.1 to 8.2, alternating exactly, and 8.1 with the
  control off.

Not tested yet: Howdy end to end on these patches.

The tests were scripted and run on my Surface Pro 7 by an AI coding
assistant (Claude) at my direction, and it drafted this summary.

For patches 1-8 on the Surface Pro 7 (IPU4P), with the local ov7251
"avdd" fallback described above rather than 59cab094b8b5 itself. What I
exercised was probe, 30 fps streaming and the strobe control, not the
pixel rate, 60/90 fps or the rotation controls:

Tested-by: Tony Garcia <tony@loafecho.com>

