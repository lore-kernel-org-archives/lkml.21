Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347308;
	b=IF/C0Q9/ZQk4bWxnynJMQoVzrBBkTfwP3vKotFxCmgSx28NDCf5S7wdsB0yMkTIJJ+V3
	 pimpMBrv8iim/lIhFAM+Eq42EAUfXU8isundoEy7TDj0B5YVYW1AyU11KT0LcoOWuTv+G
	 D2gaxmu1ySQihgCSiQ1IfXgKNlYmJMD7WA776N+2JOovAsL4btqxDuChmov5QEI6dB7pi
	 mkl8L5iVhLbFZLTMBELAE/6c0fjfuYtC+Ug7jgdEPnGjCv55oVVyZ86ZDQdOPdN35W+B9
	 CBslGjWnLDUPns3sOIuSebjmnw+GZGlX/nkG3o7q230EEdMQRXrIsTY14X7B3ZRO1dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347308;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kblLbfcAqOgdw53tmrqkehBtGoJXhzL1fp0l0rk+2NY=;
	b=qPB4WW02BeTZ9zwhgx1/NNwvCzrjsW9zOfn+xnoBPhuP78410+Ti4PGbYXwC+YLWwomy
	 rbLnz1/JwRZsKu3K/6olXpRk7tLSsedT1GPQKPX+xn2M4HNbCpX5AQTc+IUTTq4KNe4fN
	 f8C6sHoODm9nVEH7TCdsQIY07ok81fvS3ujNr9/P9kSkNxfvjJ1Crn7rQgLz7k1IR2QiY
	 IOBj7dErMT6biR006mE5wZTcOLpQZTK/pQgRCryzLi2l3kEHAVPDLLu48thDj0iCsWgMC
	 i9BK3HyBvfmCleG88UyzLGUwWmV77UQaob2urkH0bpq2r3z3a8LHJGIBbanvBnR4NLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Spv9Fpw8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C2606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Spv9Fpw8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795347308;
	b=E9hA068WRKTK6kJwtZNANdScdk2WOKSiRTl7CxBISXcYn1FKjHLvizPl6OpwFdzSSNe3
	 hYPFpLmZILpX6OBmlwWGXNUiOXvXg3M+9dZnnup5Pw+X7LY7/kpMUsbX5BtEBOCLBOutl
	 J6/9bNMTCK4j0R9ZQ4jV/5S7jPX1VLb953a5HNLfckzrwyk59SThLq2rYmnEBakLTsj4y
	 MyvhcKwir1AIsPUUJgwEagj/vorYO7Fu/oyeME9l915a3you3ISS1Y4ncjqLMMJidnvjY
	 v3yA2rwBb8mxwtLK4rtZrliQd5bY0ijnt/Kpj8wz3CQL4XpaEkXTmsXXgDDq8f8MEqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795347308;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kblLbfcAqOgdw53tmrqkehBtGoJXhzL1fp0l0rk+2NY=;
	b=Dlorw5lhF2f1SJo6Vvi26z4TZB2cHe1JLt46FlpH5u9MKkyHhWgloDI6tu0eXYUzZrUY
	 jGI0mbv8cOVqZspBqDzmvy9d3NPMx/IJJdcDZ5f0YyBcO4sxfEZ/sy/iYKJia6haJNYXL
	 Vh5n9iJMN6a6SJn6D/i/pbAIf2WUQJ0H6zxykwq4+xezNP7vz3q3wL9F7NUx4OprIAsYM
	 6kM0YXgq0FdfQHFj96yq3xiCG5eCImqA+SJZZ4uiwcCC0e3248ptGsL2CdkKbTKM+ILGr
	 DsUuxLx+y6ikm/aiOEDZ7fW06QGFeU0dXohwhiwgpKsRu3CaPGODlbCWv5M9HF2H1jQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74CD61F000C4;
	Sun, 22 Nov 2026 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795347308;
	bh=kblLbfcAqOgdw53tmrqkehBtGoJXhzL1fp0l0rk+2NY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Spv9Fpw8BFmTNX31wP4SHakBuSegWYtb1/R9tCdqFCZVekGCEnk1ArR2iQ6DcUElQ
	 gl0aerfg5Ifs3OJ7sCW8zTXVKIuCpCWU+Sf8ttm1GPzvHw6w/DEUnIJlxakY1fCaTP
	 EfwFDBeH16ye623/dzA4u5c6Kujbx+tju/QmoSbVY9i0yAl1MBYreSzVK44Vs3RDJP
	 eWjhUUC63gkmzQOzaL9lbMAtdyGMfAxcgEdwXiTQYibyAwmBr+p5DPIiscpD+oz+bh
	 pjmbiRZqgafYzYBNXVtmUNrs0y9cvWfOn0f9oUKg5pww9K8nG04QU6PW0LLsdrUyE6
	 NKEoFVnajenAg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E89054C001;
	Sun, 22 Nov 2026 11:35:06 +0000 (UTC)
From: Anthony Ruhier via B4 Relay <devnull+aruhier.mailbox.org@kernel.org>
Date: Sun, 22 Nov 2026 12:34:25 +0100
Subject: [PATCH RFC] clocksource/arm_arch_timer: park stopped timers
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
Message-Id: <20261122-x1e-arch-timer-park-v1-1-c26dc527c71f@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQuCQBBG/4p85wacDWTrGvQDukqHbR1zikxmV
 QTxv7fV8T14b0USU0k4FitMZk367jPwrkDsQn8X0iYzXOkqZudoYaFgsaNRX2I0BHtSU7Z+f5D
 AlffI5WDS6vK71ricT7j+ZZpuD4nj94dt+wCadHu1fAAAAA==
X-Change-ID: 20261122-x1e-arch-timer-park-d0f839ea1688
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anthony Ruhier <aruhier@mailbox.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3127;
 i=aruhier@mailbox.org; s=2026; h=from:subject:message-id;
 bh=OlttGN71nDchITfUTGgkO4dnaqxjbFjLuTe80BMQ2p4=;
 b=owGbwMvMwCV2okp4cvOBsLOMp9WSGLKZLmd9S585bWfZ9Pjg3JqyLVI/9reU9lx79yV1b4mPo
 aaPYemTjoksDGJcDJZiiiwXLAseP74VPbm7zqYLZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jBi4OAVgqtffYPif3fXF7J/z2fe3OT5fa9BZNl3gh2uk4Hz1jBf2pn/nXd3xiZFhX9B9t9k
 9kW3r2/9J8XQt/Drvo/QF92lT4u76TJ1f1ujLDQA=
X-Developer-Key: i=aruhier@mailbox.org; a=openpgp;
 fpr=F4A378DD8D494AE48EBA554CB00FBC7D08D231D9
X-Endpoint-Received: by B4 Relay for aruhier@mailbox.org/2026 with
 auth_id=1292
X-Original-From: Anthony Ruhier <aruhier@mailbox.org>
Reply-To: aruhier@mailbox.org
Content-Transfer-Encoding: 7bit

From: Anthony Ruhier <aruhier@mailbox.org>

When a clockevent is shut down, the timer is disabled and its CVAL is
left at the last programmed deadline, which is in the past.

On Qualcomm X1E (Hamoa), when Linux runs at EL2 and uses the physical
timer (CNTP_*_EL0, i.e. CNTHP_*_EL2 under VHE), the firmware seems to
expect a non disabled timer and uses its CVAL to compute the wake-up
deadline for system power collapse. In s2idle the stale CVAL makes PSCI
CPU_SUSPEND return immediately, so the SoC never reaches DDR LPM or CX
collapse.

Instead of disabling the timer on shutdown, leave it enabled but masked,
with CVAL set to BIT(width - 1) - 1. The firmware seems to treat CVAL as
a signed value, so this is the largest value it accepts. Anything higher
is rejected and ends up in the same immediate wake-up loop.

Tested on a Lenovo Yoga Slim 7x (X1E80100): s2idle now reaches DDR LPM,
CXSD and AOSD for 99.9% of the suspend.

Initially found by
https://github.com/justririll/x1e-sleep/blob/main/modules/el1tmr/el1tmr.c.

Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
---
Hi,

This patch is needed on Qualcomm X1E laptops (Hamoa) when Linux runs at
EL2 to reach the lower states in s2idle. I am aware that changing the
shutdown behavior of the physical timer unconditionally on every
platforms would not be acceptable.
Marc (maz@) recommended me to send an email here to discuss how this
should be handled upstream.

On my Yoga Slim 7x laptop, PSCI CPU_SUSPEND for the system state
returned within ~5 us, thousands of times per second, and the SoC never
reached DDR LPM or CX collapse. With this patch (added to an ADSP fix,
unreleated to this bug), it reaches DDR LPM, CXSD and AOSD for 99.9% of
the suspend. This makes s2idle using 0.7W before, to 0.18W now.

I guess this should be implemented as a quirk for Hamoa.

For the Qualcomm folks: is this firmware behaviour known, and does it
also apply to other Qualcomm WoA laptops (X1P, Glymor, etc.)?

Thanks,
Anthony
---
 drivers/clocksource/arm_arch_timer.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index cc9a8b399004..6f03670119f6 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -590,11 +590,10 @@ static irqreturn_t arch_timer_handler_phys(int irq, void *dev_id)
 static __always_inline int arch_timer_shutdown(const int access,
 					       struct clock_event_device *clk)
 {
-	unsigned long ctrl;
-
-	ctrl = arch_timer_reg_read_cp15(access, ARCH_TIMER_REG_CTRL);
-	ctrl &= ~ARCH_TIMER_CTRL_ENABLE;
-	arch_timer_reg_write_cp15(access, ARCH_TIMER_REG_CTRL, ctrl);
+	arch_timer_reg_write_cp15(access, ARCH_TIMER_REG_CTRL,
+				  ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_MASK);
+	arch_timer_reg_write_cp15(access, ARCH_TIMER_REG_CVAL,
+				  BIT(arch_counter_get_width() - 1) - 1);
 
 	return 0;
 }

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261122-x1e-arch-timer-park-d0f839ea1688

Best regards,
--  
Anthony Ruhier <aruhier@mailbox.org>


