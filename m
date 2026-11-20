Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186678;
	b=Ma+tINlUZx4natOkkBcjJ6ktWJ3S4BeAwYXoHhI8d1tuaJhIACoHOrjXww8HVTIiWUkN
	 YxJ60FCGcxO+IxJQl+h6XVwJ1Pd0dNxMWga2Jl0kmsl3bkNkXYufpkMfAVB+wewKNHofd
	 HnG72Da5uWAYQaN6sPkqeEzRuLJ8Mxzj1cjFCb2UBMRuE2QkcymsKBWgYo4mKqRuEEkir
	 T/irSWr3/efi76rC+77PwA5YT0jPAPzqcjC6NFpiLGZJHLE9bg1od58xocD2PCrIjvAcD
	 60MSeQafgFMr8+tTG842sE7N4bT2LUAxBKzHQHYhEG36FJEylccipE+zr/z8LVnZSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186678;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=x/WPSxVncz2SiXf+PVx07o/EAYAzdQ5jOOBz5XwDM1U=;
	b=JWxsZX1e6K4btNE2LYkoq/X9e/o5aCHgl/r5N+cvEpX30zjpLE06v3Oo9vNps9Dpx4BE
	 PsFhdif0goZ66rbUmpDIQY+Fbrfy1ztID3xqTdeXEU6hAOHktdhl7HwsMKIJs2l1XyoSa
	 m9xuijyjDhVMXRD11CE2eqATBlKOOVJGwSfhPA4/J42AySQJMDJw9WlRQL6lCkA3dGDk8
	 HlHXlqBMxD6oWYLa/2RTQQz5VFGOY++wH7ga2bUqGngxoHTqYGYFE1m3nU20a/I/7o8/g
	 GGmy07QVdhuJmQb6mt76I8dIXqiGv2steNQNzRK5zfOrUlkfCybOYFq3Qmucp1F6aYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1vgwAHu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24444606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1vgwAHu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DF01F000C0;
	Fri, 20 Nov 2026 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186677;
	bh=x/WPSxVncz2SiXf+PVx07o/EAYAzdQ5jOOBz5XwDM1U=;
	h=From:Subject:Date:To:Cc;
	b=i1vgwAHu52eoSBZ5P5zCskXNTxUk3b6Gc42levAOVJb1XLutADEl9wwsX/tSesDK5
	 Riqx+mT3yYw6wH7jKgAEWm9u2RaSf/sK/5uMmDy+f7C9An9c+Ek8SJb4FrLphcQfQt
	 tjJATOw4q1xpnEuUDxMW5ZH0NToLJvhorcTy/U3ZaPAg6iyP1W7J8/+hbRBcn2rIlZ
	 uIpfm2tOxC1bnV+xyiOoqEuzwewEJo2bjRo9DACdEBFURVYCpEiM0SW+q2GpRQSgTd
	 Lkcf4e3rY+g80Go7ycXstAt/RzhgN2FFAX3MKhzAy9OHlD1N603jc7fY8GK11BBh8e
	 lWG0UkqLUcx2A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v5 00/19] accel: ethosu: Cmd stream validation fixes
Date: Fri, 20 Nov 2026 08:57:24 -0600
Message-Id: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNy27CMBAF0F9BXmM0Hr9Z9T8QCzdMiFuUVHYSg
 VD+vTaV+gjq8mruuXNnmVKkzPabO0s0xxyHvgS93bCmC/2ZeDyVzBDQgEPLaeyGPPE2XilzIu2
 kM+QBgBXykehxKOJw/Mp5en2jZqwbtdHFPA7p9vg3i9r7Z3oWHLhUpvUUnPWieXmn1NNlN6Qzq
 9sz/mgPaqWxamuslc5qE9STlr+1W2lZtPLQEgqNzrRPWn1rAehXWlUdAmpC1NbRH70syyek2U7
 MdQEAAA==
X-Change-ID: 20260827-ethosu-fixes-ee58386e9000
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

The series was getting a bit long, so I split out the cmd stream 
validation fixes from the error path, close/unbind, lifetime, etc. 
fixes. It's a mixture of AI reported issues, different solutions to 
other posted issues and fixes[1] and my own fixes. It also adds U85 OFM 
transpose, resize and IFM upscaling support.

The series adds rejecting OFM transpose in cmd stream, but then a later
patch adds support for it. I did this so the rejection can be
backported, but maybe supporting OFM transpose is small enough that it
should just be backported too?

Rob

[1] https://lore.kernel.org/all/20260717061145.1478139-1-zhaoguohan@kylinos.cn

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v5:
- Drop all but cmd stream validation patches
- IFM upscaling also supported on U65
- Fix U85 shared DMA stride mode and mixed contiguous/strided U65 DMA.
  Ignore stale bounds for inactive weight and scale streams.
- Correct resize bounds for signed offsets and programmed input sizes.
- New patch to reject U85 IFM broadcasting on U65
- Fixes for handling multiple weight streams and U85 fast weights mode
- Handle accumulator size mismatch with IFM2 size and ensure ACC_FORMAT 
  is set.
- Drop "accel: ethosu: Account for kernel dilation in IFM size" which 
  wasn't correct.
- Link to v4: https://patch.msgid.link/20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org

Changes in v4:
- More patches added for existing issues raised by Sashiko in v3 and
  local runs
- Combined the 2 patches for unknown cmds and unhandled parameters into
  one patch
- Link to v3: https://patch.msgid.link/20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org

Changes in v3:
- Address Sashiko comments
- Another runtime-PM fix for driver remove()
- Add a fix for NHCWB16 bounds calculation
- Link to v2: https://patch.msgid.link/20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org

Changes in v2:
- Dropped first 5 patches which are already applied
- Patches 11-17 and 19 are new patches with more cmd stream validation
- Add fix to diable clocks on PM setup failure
- Rework the runtime-PM to suspend after initialization and before
  drm_dev_register(). This simplifies the error clean-up in probe.
- Handle quiescing jobs before scheduler teardown
- Rework the cmd stream register initialization tracking to use a bitmap
  of registers instead of relying on initial state values.
- Handle U85 DMA 2D/3D modes correctly
- Link to v1: https://patch.msgid.link/20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org

---
Rob Herring (Arm) (19):
      accel: ethosu: Prevent command stream export
      accel: ethosu: Move DMA mode to src/dst struct
      accel: ethosu: Track command stream register setup
      accel: ethosu: Factor buffer bounds checks
      accel: ethosu: Fix NHCWB16 bounds calculation
      accel: ethosu: Validate secondary streams
      accel: ethosu: Reject unsupported commands and params
      accel: ethosu: Validate all feature map tiles
      accel: ethosu: Account for feature map element size
      accel: ethosu: Validate convolution parameter
      accel: ethosu: Validate accumulator input
      accel: ethosu: Restrict dynamic IFM2 weights
      accel: ethosu: Split U65 and U85 DMA length validation
      accel: ethosu: Validate OFM transpose
      accel: ethosu: Validate resize operations
      accel: ethosu: Ensure cmd stream is multiple of 4 bytes
      accel: ethosu: Require active weight streams setup
      accel: ethosu: Support IFM upscaling
      accel: ethosu: Reject IFM broadcast on U65

 drivers/accel/ethosu/ethosu_device.h |   32 ++
 drivers/accel/ethosu/ethosu_gem.c    | 1009 +++++++++++++++++++++++++++++++---
 2 files changed, 961 insertions(+), 80 deletions(-)
---
base-commit: b4d01c788bfa50dc65ffb5fbc9db4135004c0e01
change-id: 20260827-ethosu-fixes-ee58386e9000

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

