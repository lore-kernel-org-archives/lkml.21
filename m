Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202043;
	b=pqNqnB73M32qQr+gUividuiMfhHAb6fr0HFjOkEbRgNgm/hN8WQPWTueF+i25dI6aCPR
	 6ECoRiE2Vq8k3Xqj3HD8WQ/zU3ATr62nUM0XeP4xxiCbdE968IacpWBM126Ho95+jp8Nf
	 LXWPXv5kzSeBAGp0Eb85NGyMlu1ZwyNghShwuGpC3WSc9ar/1fQeXY7Ffl7zcVyCfnz82
	 56ZQlx7uhdraZD5k8ePXwP8ddbtI4CgQyIuGt9Cyoy++CNHxaoZSVxOY1OIpmzm1yuiHC
	 ro3ZiuAaxo89VAeyt+c2+mkR1YR77c3zDd/IF1i7UZ0Czi8fO0fY63iabHxrogfqNKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=LoQMn/9Y5qB5mSNO/rsTN7S4E4JEirHOJTwPZqzofps=;
	b=38iD80No/Kjv2VIJsCyxwWcEUkxZOQHtU/g7i4r9czgfNc4W4zJay4MpiOh/bDFXhu+K
	 cW2VskoWGRAF3aYVj8pc8qc9qmPbLlPqEtsoTXMyJ+cDp7wjwMhPG8XURoTv0ZBF4p2EJ
	 XKvIDnA+Grmsg65DHHPsFeUmMjj46lSmnlMyy3rNgb763seDaloz1Tr7Jgarw6U3dDTsg
	 YqH73Oh62i8G4PAl0Dt4fYboBwWHB0EzyY23X8MhsbLJk8OB9qWK++q/HFcR/FGEiG4bi
	 9lwNPE83grFAoNT/JCpz7QonJof+P4Z5bj15XMaR3y8+4HG9Trr/qBG9ERwukXhxN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9obOE4E;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4429360A2627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4429360A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9obOE4E
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71aed54d4c5so876056eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202040; x=1795806840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LoQMn/9Y5qB5mSNO/rsTN7S4E4JEirHOJTwPZqzofps=;
        b=P9obOE4EwZGB+Z5GYnLyAEu7WPXJoHZOPxSa4HZtbpC4GCQy9MNT6oB3R9f8V7L+2A
         X0FM6Jfhv7XADXRHNUi++wmWBTbozrnl1YZcg/mm3NrW8f3pz0VP3zV4I73ooVQJT5Jl
         mzRtXySQZZqHmGHsmkf/D45Hi8iWUxFUz0OJQk19RkjC1LP6pktrRWNUh/URJSlovZ09
         dW9RNoEnmPmcnQfS33gzEuhNWOfjCuP1xI4x35SzyV3EkxrSSzhwjD1R/h8f9yu8CMos
         RbXQLoj4YPYjwV42RCIiZEsdg/nkHuBJ43VDu+ZNVYP3VKPgwcURLnoC3WsRemIez4aP
         1m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202040; x=1795806840;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LoQMn/9Y5qB5mSNO/rsTN7S4E4JEirHOJTwPZqzofps=;
        b=r3pQwcKnCfKmsnynX1wbucBCYHe4MwskbQq+jpFv0UTrKKuptXm4Nrq58Cb/L6kguz
         B6JvPhQ+3yfBTuhYyIJj+YJev5MOeviFppHqknw1tobKgupS6DTnWeDcGKCWssP06xVe
         EG28eI0i40BvuHPgJGXfFEgb0lSnUQrc1qdofYLnut9ci70o3883O+4W1Tvf6ayXHDqg
         Oiw+MaXPAqTZ94BTimOs+aU4kqpXxeKcLCB4UF7wusuTm3G1PsIet1Uq/ga7CmPVGlxB
         B6NrbNSp8mmkfV8N9Lc22+o8tXvhzZNuRABowWY1rJhVesOv1ny0anz9zaNF9dOhJUpJ
         eBuA==
X-Forwarded-Encrypted: i=1; AL+hErHRYQhBhR0DQCgjth/gU2ptwbxrxUYz1gRhsCKd/0dTM8iPK5Hx0KAaVxSXACU62S0yf9FB7MHbqTmN340=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E+hW43wZEmKiPvsD0WT9OS47oMmGXre3kXWzqCBNMhP5TJWai
	mWrjQgBS7zfhrgcLTV1r0kk3qwdHOIQLTIOqbANFGh5yzeZ3Yf4F+fvp
X-Gm-Gg: AYBFou0LDbzr2ZlFcRN9jcGrVnodeK0PBmR0eTEjM07nezNddxi9x313hDyOHWg4l8N
	HSIvuT/MkDaCKJ+IHDiImbJT2zjoPqCIyzeqOkFBHujz/t4BNhuCqmU+YGd2+QbF/TXQ1OMPojD
	7sGvZzHU7lbWcGau8bRypXyz5IW1TWrPO/TZE59cfvopd7xl2OrEtH4ERuyzuWXoRWocJTaY+E2
	EZd9ePcDEyYZdVrrBeIkaKg+iRIzRYix/suBdvLCFIihCHIh1+2/Wt8ICqN5nUPYCucfIIQZQ1W
	C8m/VFVdiZfGLXP/P9rDNvP/WITeznMZA4MBttHuySVoXxfUWyZwQVEhv0hkBDXLmQ1BzAzJOAM
	+nkmr4/hl06NBbeWKyLE0tLLHr7sAcKOExqYiKsl64T56mwSZr6aJWP3gmwgWBnqQffsc5f6SWK
	uaLzIMdPSa3vRrAJ9l3WvuWSrpJbFLDfZ1LhpH5azY5lHU4Zyw3+yPxVqH8bAySjx8D1vteRRkR
	k9gJCqvImPa0pLhLXra6tSeCFeFGLVAx1v6dOxpDtC96CLQsqp9Wl9a0WdqcmHBuudxL+2au8xW
	wQ/HK6AR+sBr2P+j4rY9VxNU6a92jU9edjRr1cJ3jyCr6ElosS91BF0j3NawueoQCtGLLFYOWe7
	b6S2fsj0pgauPySUqY9zebu+CNxJDgbawl61mrLbLxpuVcUnO2Vy/Tf7xhwqBklEF5ZlJaVq0RE
	Z0GSz/WhJG2YcqskYIds5MuJnvzoJ783YH3Mo8E+8Cg+PmOwEzL4NV
X-Received: by 2002:a05:6820:c7d4:b0:71b:563:8a4e with SMTP id 006d021491bc7-71b395a2a4amr2268943eaf.44.1795202040090;
        Fri, 20 Nov 2026 11:14:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:13:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 0/9] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Fri, 20 Nov 2026 12:13:50 -0700
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T20r0MBAA4FdZem38c5wke+V7iBeTZOJG3INtd
 1XEd3e6i1AKPxVCYHL4MpCZr26gvtHQbTdfXU+XNrTjgYN4t+nyDg/PJFrhuNNSg1IyiOGc9m0
 U5V3gRxNlj2IYjydxwvNA4qJEjqYq8uAVxI6VU0+1fVxfeHy6xUy8UB4ndjqRkG+mHg95Ny3xg
 Z7e/v3ngau5a7zUf16TvqhJ/nt+PKTINlBWkSKRfXjeY3u9z8d9N+V30XMvrnuaPbBY2CzVR7P
 0zMxTct0z7BlXS00YEqiy9Ozc0+uenTxKWdukrSlp6bm5Z9Y9x15w2qD2yfkQlh7MPbfuAXspJ
 20Kl43Ucen5uefXPc9ecVUbGbEWr5demHt/+N/AXg3kK4F00ea59333W69n7pzxVuW3guZ9dre
 bYkGi1IgSMySM5ErwNVjQ1bviQ6JglAW69gqOeccNt90QlKw8WGMBwUSjtJSW0KGOSBKBJwsFA
 6fw/QMjgFkOxAMAAA==
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

This series uses the virt-dma helper from patch 1/3 of the sun4i series
[0]. It retires submitted work but leaves descriptors that a client has
prepared and not yet submitted available for later use.

[0] https://lore.kernel.org/r/20261119-submit-sun4i-dma-callback-lifetime-v1-v3-1-3935aef58db9@gmail.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v9:
- Use v3 of the virt-dma prerequisite to preserve prepared descriptors
  across termination, following Frank's review.
- Explain why leaving suspend status pending does not assert the IRQ
  and why runtime PM alone cannot guard the handler during probe.
- Rebase on dmaengine/fixes at d460a02aa0ac.
- Link to v8: https://patch.msgid.link/20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com

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
base-commit: d460a02aa0ac6ba9e5d87f8462f75d78be83146e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
prerequisite-patch-id: e6dc1764346a639312004ea5a29ae0a6ae046da8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

