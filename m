Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104108;
	b=3fid9YXR7VY0T62F0HBYqIJXNDnwcNdRqtzZlxfI7f3CMw49OGJLWyH+ubrwvfxCNl7w
	 HuASRrcCeA1wh44lP9fIKtAxoRV6VgdghkPyzFTS4HlT7LbmqqpkqK1YXfkFoe3jiU/7c
	 KWQzoG7a2nD/epyK05xm/GIP0YQ72PG2ExtEypQ4VhkIQ4uEYtg33NvVvUMPx51R0MdMc
	 B9a++2orxWXwse1AjsYdOJxeKGxDh2Dj6KmHdkJlyWoBT21g2bNmsXTd8Nvp89WyLqKFY
	 kRLKnaUbUL5sHzv526InFPblYagfpJLn0a+R1b/r007DD4PJ6wAokW50Fy0Exhezrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/ZxPIuLt+/kiepGNuwG64GaZNG5kVNJvtdcH3UsJ5V8=;
	b=MnZheE2QW8GvQLgEVMI+fLFwudjwqpKvV65cb7lgUdG3OdHypKiH88xe+ZOSA5Qgg+av
	 fo+jX3hxQl5Bu4NXhQ2W/MNFtRKQZ0q1uv9eSYnfBZpCb56RBV47fjxtZOgcCCWXRod7T
	 84d9BlqOqN55OwdjVPdZqfXul7vfoOJ13xaVUtVwvdndOhnKTP5P898EzE3ba3ZPKSBuJ
	 pvJn58d0ZxCdyJjNUwoGmvn1IrV2sJGygqM8Ovz4Q9nG/2fXkGLSWpnxxGfQlTzUVu7rA
	 nxaFM/L+cbNhGSt9GfV+d57eg8FHKvAi8Y7z9UhDn+S0KGMER4pWML9/KCOPuFON6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tl+HGnHa;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FC606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tl+HGnHa
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4c685c751so20796167b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104107; x=1795708907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ZxPIuLt+/kiepGNuwG64GaZNG5kVNJvtdcH3UsJ5V8=;
        b=Tl+HGnHaqVMQ8e83+0+G/PBH9EvpKLU+LRYt+fR2tmuIj5npjpUgDWN0uMm1iEGTur
         jtu3qMfDFHWS/WM0IanTtuo/GppWeWMfJj09pvaQJnm+uBeDpRVk2P+HGsLl6ZfhAd/h
         P0KccTU1rj/57isj+90nFFBY1T61sGV2KEBc1Ok6weaEafrMsNyUrvBBPwU2Bab5STmX
         51ozJWMnx6yHZwAY9PRMAO8jne2OFys70hzmlTCjIANDFg3Jz2i4y3agLUAvi5nfQ7L5
         XT+5Ei+npXDCcCoG7psJ854BWoIijw2SekT/jcGKm94LaVvopkzv67HPbiqkMskeIiEt
         XZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104107; x=1795708907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ZxPIuLt+/kiepGNuwG64GaZNG5kVNJvtdcH3UsJ5V8=;
        b=XqRnA0P41N0L19negD3d4d4vgGgdXVhPPJn92gZpwFc9I5NFPFWoSjet3f+1LFjGDp
         nsloew0KxmddoFoy/LA7t5rBryF+wlWPPdW27ob+953/Ob4SSTJrQgO9y9Up2XwB17mi
         bPPYJE//b/ZYb1NQfQaUbX4gVUUPVhcMUPs0rZXLu0vSZW+pCGaW1Ftr6PFMKmZaqrkE
         OdLkKD7Mq6MceJ+wIiMAL8KtmE8Dw1E/BCxFvf8zsZZt79sbmABJ/mskLdsaSCJ26Odd
         Gf6nrjlTlxExZ7415TPJ6jTS5eJ6MK8zuthKbhAHHe0gDYe3oFzzEm/VrjhwmfeyvXgP
         nmQQ==
X-Forwarded-Encrypted: i=1; AL+hErExG328Ad/Aov9aK7vPajq6LI+GlkIQXY+8E7j11vTvsLfq+5o8jIqfYVyyli59sXQxlkYAKucW4WZeTPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tjGxMlwcurXVs6EpvMnP12t31zw7hniHLp4DBdgdTQluf1JMh
	jE2P53TAc8Hv3vhIVk7VrOcCo5wzQHi10Y3A6rmlPhpotgKeuZBUTTjZ
X-Gm-Gg: AZFdTZdnrgEUW7bPPDHSMOC/T2/Ez4l9ER4xf26V9pbkL3WFHns8rOBRxTACnRbbPkU
	JOKyNPV8goyWvQor7YqtWETiGsXc4u+0/D3uNHaFm6qXSgL3vnZn76aIWBHl5nfZEXRARd/XxGB
	lqi6PciVANlHKMXHtPt5rVFTLapbCW8vZ4/l4CPMlcpGh175QEKN4oJV/bYiKtZp/EaaMCUpObc
	g2LRwJG8mWBLYP4/pD8hu5JZlHv6tV0CYg3q5RsZSCA6+RP6EvRlQ28eHOIGRtdDzgOpoqzaHo9
	iLhNm9QzO7w9HoeUxRCImig8hoGQePCj7vOVIHsGURCfDNcmllXO2A47LrHSzfi4aOUhP8cgz/t
	8SVJ3ahvzwJAIkeT4YMHQc+icrP3rpWN71kmXz7JozGDnCVcvNw9Y6MULIw6g/2zIA0YdVkK6qO
	S6nI/bJtFG1Kx5/YdR/pVIilyawtU9a68xOhxsYkpA4tSRVEG6PjgWyht6snM6VwRIjLuAB8d/F
	8eURJFmjDsbnnRLdR3G0NAUYa9CUtOB/55YsZsoqqJmO19f8WH4XpOau2j1c4jYs3NpGsTie8PJ
	ZrgqtZTYIYNRFvwcg5DXNC94HAOo9fCPWSiqvccUqAJPnGrg7u6UR9PDY5xvbY00O5kIYAAxbqK
	Nc5c44JIjbba3SeEV76ECc8moKJemwGUsjrQIvz5zm20iyXc6bnX4uHAK8zlR4deE/oe0VXHbUI
	CCx+F6OFx4nuFFgSNdK/QuGI8V1JPntI7N8jfKHIbujxbwSE8HzYY=
X-Received: by 2002:a05:690c:370a:b0:8a9:693a:324 with SMTP id 00721157ae682-8b520524d38mr523527b3.109.1795104106234;
        Thu, 19 Nov 2026 08:01:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 0/9] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Thu, 19 Nov 2026 09:00:55 -0700
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T22rjMBAG4FcJvq5aaXQYKVd9j2UvdBg1Ks2ht
 pPNUvruHScUjKG44JvR4dMI/f7oBuobDd1289H1dGlDOx648A+bLu/i4YVEK1x3IMEpJb0Yzmn
 fRlH+iXhtouyjGMbjSZzieSBxUSIHXRWhQ+VCx8qpp9qutxP+/L3XTLxSHid2WpEi70x9POTdN
 MQLenp/+uEAN+3YNR7q/9+avqhJ/n1//EmRjaesAgUi8/yyj+3tMR/33dTfBeZeWPeAPWdiYbN
 UDHrp6Zmn5Lqn2dO2lpqiT06VpWfmHqx7ZvIoZTAJjC5p6dm5p9c9y563oCNgsuj90nNzz657j
 r2UE+jCsZEQlh7OPVz3kL1iK2gZYi0Ic+/z4TtfZ076eE/lPYA8z+524xx4wmKyS2CzL8pXpY0
 lvq8soDyEGAnJ3LIdx7zjH2S7qVkbbbzUWpZoaw2WLKAKAWtEfnYMiBmS5xY+vwCBwHycdAMAA
 A==
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Wang YuWei <1973615295@qq.com>
X-Mailer: b4 0.17-dev

Keep cyclic mode in each descriptor so failed preparation and queued
work cannot change the completion handling of another transfer.

Use the layout-aware channel enable check during termination and retain
transfer resources when the channel does not stop. Preserve suspension
status for the pause and resume paths, including acknowledgments that
arrive after a polling timeout or during another channel's interrupt.

Keep a pending pause across cyclic segment completion and resume the
segment only after the client releases the pause. Track the active
descriptor until completion so queued work cannot reissue it while its
interrupt is pending.

Retain terminated descriptors until their callbacks have drained, including
cyclic descriptors that error handling has moved to the completed list.
Serialize interrupt status collection with channel reuse so an old event
cannot complete a replacement transfer.

Require at least one IRQ before registering the controller. Keep shared
IRQ handlers out of uninitialized or suspended hardware, and drain them
before disabling clocks or removing channel devices.

This series uses the shared virt-dma descriptor-retirement helper [0].

[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v8:
- Use read_poll_timeout_atomic() for stop and suspend polling and a
  scoped IRQ-save guard during termination, following Frank's review.
- Propagate deferred IRQ discovery and reject controllers without IRQs
  before registering their DMA channels.
- Keep controller interrupts masked until DMA registration completes.
  Serialize the hardware mask with handler admission and rearming across
  power transitions, following Sashiko's review of v7 patch 8.
- Leave a suspended controller powered down on removal.
- Link to v7: https://patch.msgid.link/20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com

Changes in v7:
- Guard shared interrupts until hardware and channel registration are ready,
  following Sashiko's review, and hold an active runtime PM reference while
  handling them.
- Balance probe/removal power references and drain handlers before clock
  shutdown, including forced system suspend.
- Link to v6: https://patch.msgid.link/20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com

Changes in v6:
- Retain descriptors through callback synchronization using the posted
  virt-dma helper, covering pending, executing and error-completed cyclic
  callbacks raised in Mitch's follow-up.
- Serialize interrupt status collection with channel reuse and clear old
  completion and error status after successful termination.
- Link to v5: https://patch.msgid.link/20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com

Changes in v5:
- Use a positive enabled-channel condition in the suspend-status helper,
  following Andy's review.
- Initialize the resume result immediately before its first use.
- Separate the lock-protected channel bitfields from the preceding fields.
- Link to v4: https://patch.msgid.link/20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com

Changes in v4:
- Add a preparatory fix for cyclic mode leaking between transfers,
  following Sashiko's review. Store the mode in each descriptor so
  failed preparation, error recovery and queued work cannot change
  another transfer's completion handling.
- Link to v3: https://patch.msgid.link/20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com

Changes in v3:
- Wrap the atomic polling calls by argument group and correct their
  continuation indentation, following Andy's review.
- Move the termination return-value check simplification into the
  channel-enable polling patch.
- Separate the pause-loop conversion to atomic polling from the
  pending-request and cyclic-restart changes.
- Annotate the suspend-wait helper with its channel-lock requirement.
- Pack the lock-protected flags into existing padding while keeping
  cyclic separately writable, following Andy's review.
- Link to v2: https://patch.msgid.link/20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com

Changes in v2:
- Use readx_poll_timeout_atomic() for the single-argument status helpers
  and express the termination polling interval and timeout in milliseconds,
  following Andy's review.
- Track pending suspend requests separately from confirmed suspension so
  resume can handle acknowledgments received after a pause timeout.
- Use the atomic polling helper, including its final status check, and
  report -EAGAIN if resume cannot yet cancel a pending suspend request.
- Defer cyclic restart while paused and track the active descriptor until
  completion, preventing resume or issue_pending from reissuing it.
- Reset pause state on successful termination and channel allocation;
  clear stale status when starting a new descriptor.
- Link to v1: https://patch.msgid.link/20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com

To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Sergey Khimich <serghox@gmail.com>
To: Sia Jee Heng <jee.heng.sia@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (9):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests
      dmaengine: dw-axi-dmac: retain descriptors until callbacks drain
      dmaengine: dw-axi-dmac: serialize interrupt status with channel reuse
      dmaengine: dw-axi-dmac: require an IRQ before registering the controller
      dmaengine: dw-axi-dmac: guard shared IRQs across the controller lifetime

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 311 +++++++++++++++++--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  13 +-
 2 files changed, 218 insertions(+), 106 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
prerequisite-patch-id: fc343480330da5ff95e5271997fa71107977c2b8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

