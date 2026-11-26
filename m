Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702423;
	b=wykDwLtt26/AYsvXRB5MDC0p5Qxnlhp+U6Vk2VosGXOz6OGvvqqp3XtEazaEoCsjc/X6
	 DfL0Sh5JVH1WXkydkJbFVfVM1T7zOdgvLzPyWC9iK0sbpSRgJjoSQ2NLYRFIx1x0mbv/G
	 7rSuH/rnmCGMSpww1ytrwpHrsVMFZyqr1wlAtmEQQgulqijniX0Dt5673/xCFX+FbBwOi
	 9Xmh9iZ/B9IO39JLZo4gnZP8lpkdS7/qoOpzCFFq8Hs0JfcYYoKnkqDhRQVSQ4iggSChV
	 7nFjVHYdpUuvUcPrxYtTFST2IU8zg1SxqrZAsHh9F7GH+bEMg80jdXzChgT9JX8I4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UqL3Wpz/mpEA5/gi5iaPzqW5ysijFqXD7W3q78hLBpM=;
	b=b3aHi2S73+lmFDBz0UbBD95b5RqYP2Ma5ax/Z6JRPbCRwopoyp2L0fQPZjqcQ9iZgBKO
	 k9dMlhjoo/pTbSyBysdzYg3f44cvn0xoKV02rMCwmoj+qhVfOIPKeg9mc391orcM3pkx7
	 UN/lOZzluiLt6bJ0GGkIJ2IxKsRO1hWidI+HL7nTGu18skrsexhP12few77ITsW/mpHqG
	 pmnyWNKqHKQA6qGk6TZMrbSY5j7vii/FiLcGIGotfichPXTg78FH9uccV2KeyIA31ITst
	 9xVOjQYay1+JL4HXZA3IE7w3gHxN5nhR5i0i2lTP4zz9ZjckfxW5HGsA0c+J3BHEneg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4Z6b0A3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4510606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4510606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4Z6b0A3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso15966315e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702420; x=1796307220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqL3Wpz/mpEA5/gi5iaPzqW5ysijFqXD7W3q78hLBpM=;
        b=C4Z6b0A3EuhZliyCsGSkDMPbQbJidxOy5SfDjkBF4jTSkfrXi6MTxAxeR6v7Q1wcxr
         Bv+hA2a1fsugPQyziIgcOI1rCBR5fJTiTAwnX9ueKVtGMlvsTMXv+uELDUZ4VBMCdpPF
         S7aQPIZtMBm1KEXb5tZO1polSFuqRm0uu2XV6XRV6ck3Z6AEusPrI0HXPUpSjCrT37Oa
         Pv6kEcyQX58U1dAcFU7t9XP9g5pJldrGiBWZn7T3rMgcC6efw96ktssAcB+9AAyvAAeb
         7agGATV2ciAdl8hGVpc6mSGBIpC3HDW3y5+iJs4uorfk3TEw+uz7ltF1G1qf9S6GQC6g
         d3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702420; x=1796307220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqL3Wpz/mpEA5/gi5iaPzqW5ysijFqXD7W3q78hLBpM=;
        b=gj72Mt0Ij9lU/0NhNwEpPUj/kXmY4+JDgndqKpCyWepxRgGstGVaa/+0ieVUKqY9xM
         VvN18qe3qTUzdAMYdHjYdOUZAVL4ZMKICGWD4Wg/vfgymAnXbLVSfzDbNmYtKVdbGgXK
         xDzsZHe6F7/rXbKU5EZmGPtod0aMFSRd5tkWWRcRkVW2RYCiIFHf25NqKhcaTC7Vmnqb
         GN85jYfPFxaFXdvVKpRm6Fr1W1sgucveeXZ/PO55azeDixPCltirMUG4AX+BJp1AJ+ki
         jYisSjAaoDmodrHn4eOQJR9QtE7IGVhyMC9iGL4TxUt92nHiuY/vUzMp3hqFkZ5S/204
         FfTw==
X-Forwarded-Encrypted: i=1; AL+hErGDKbY4M5OsbD5cLegKSkiQEOf3Xj15ciAZtyXxk0Zcit0LvctF0s3+bBIBOYijkmW4icxcAxONxAfGVQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oiS9717wNBUwQOzCxt9/K6r6HOEDiULewc583VHmvECEosJbB
	RsPMXAVvJJOrqvRJgNXytBQdah5YoDNi8EYci8pwSROdNwCuE4cvx9zT
X-Gm-Gg: AZFdTZejfxUo9C5k7yAWrcCFcEPknOfh14qQiwBERH1jwpUYvUQwNGCkjy1FNOsouk8
	pQUaC5fShdcbnLDeDyIZ5POXbk9j7MknK5S03Xfkdz4dsVQfpE4QiyRN45bWjzEUWmKvNtL9MNJ
	hWTbNCu0h+QsTr0ejTIa+1QQ0saR3hF2iRcFgIHUwlsmvHS3qqNs5qGMmb8gwpp7LM9mk0KiOm7
	DMzgT//ogY4EyUKpzb6TyXIA9+sOQrB/gY4zyLOgkOZyp+Ma1iKidZitlxxi61vTwE5qEMQcW68
	k6gcui3huQbCIJ41gcOchmDPckPBbc+8VOhj3L5D6/3qqGWn0dhUcGGkZJU7LgNckqIeqQpB2HX
	flwKx+rM0mUJHMv4DLcZI668aWmdZsxw3ODYGmNYFJ2kjww8xVm+yFR6WHVtU8yo57TUHOB0EDl
	nmQTIxCPSK56x3pWvxfjKgY1k9Ga+dUbUzxvG6rjOGBtZh6rsDn90kwTwfG66IMG6nIOp+bVNEx
	Ks/05KnHpLVFzMDeEj1ec77U5/IVstU2QJKBFMRAYQsDrTEzSSE6+O7jE1rLx4IOU4TvBGKrnWT
	csKSFHmE3S/4JXlsThEBI0gMBp1qbvD07H+Q0cQHYw0zoPvj9eQjeC0j61KkPrbRGnLsVZNIaPK
	5fjIojfBuDqp0vVChjEoOWNz1dDFbS6VUaFoXzPn1
X-Received: by 2002:a5d:5e01:0:b0:4a8:eed3:770 with SMTP id ffacd0b85a97d-4abb47b25eemr44322800f8f.4.1795702420197;
        Thu, 26 Nov 2026 06:13:40 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm38519262f8f.22.2026.11.26.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:13:39 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Koby Elbaz <koby.elbaz@intel.com>,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:HABANALABS PCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] accel/habanalabs/gaudi2: free the event queue IRQ with the right dev_id
Date: Thu, 26 Nov 2026 15:10:53 +0100
Message-ID: <20261126141100.44391-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

gaudi2_enable_msix() requests the event queue vector with
&hdev->event_queue as dev_id, but its error path frees it with the
completion queue pointer. free_irq() does not find the action, so the
event queue IRQ stays registered while pci_free_irq_vectors() tears the
vectors down.

Use the same dev_id as the request.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: c833ac1a5f34 ("habanalabs/gaudi2: free event irq if init fails")
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 5d9c6f0698b7..b082d7eb6c45 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4761,7 +4761,7 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 	gaudi2_dec_disable_msix(hdev, GAUDI2_IRQ_NUM_DEC_LAST + 1);
 free_event_irq:
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_EVENT_QUEUE);
-	free_irq(irq, cq);
+	free_irq(irq, &hdev->event_queue);
 
 free_completion_irq:
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_COMPLETION);
-- 
2.53.0

