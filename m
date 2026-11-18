Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003979;
	b=F9vzczRel+zd/ICOB+r651BEt/wFoNPiOgVPy5hdr0tdZPyvn+MyeQeBh6ByR4Y7cU0d
	 ER8nYnv/dRWf3XnbBQVRFM7IIhiFihuZFfvccUPV/+V4IQbLcKj0g5JeQ2eI5+GU+8Y0X
	 Ox8HLsQkMBD2yjy32Y4xf6FVLeW2iD3cvnWsUZX0DnVmVr6cKOVVRPrEwmILVah+N7lfL
	 lhb8BLNBqgugbiNSCmfv6XpbwPWOUvHzLgq8pnVg/fm5oGnFfjp4ykRI/odprzqt7qdUh
	 SPcsJF44J/CF+bVGOVM+qcbgdVdM16s0sj34kITuQHy8XQcv/AxSUP6GdGARcdSfPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VToF9amWTCrNW1AvfVMc3RB1WXmBdknEErgNhEgj6zw=;
	b=FarP3/REmX7vQEgknvEJvFek8kcdxR9wpY4I8Ti/W0SV9cvXfxjHHWv3N2Lsd/lrG884
	 tUEnjU0gHoCpOxhwG6TrNiDyuT+o42CXDEWhKWvl/0640PpLOtpLS+hAyp7QFPVLNsSe5
	 Fj9R+9+lVGQOv15j04Q8bE/vkC6307ODtfOjM6pZh6jExYQmpvgaoUuARP60bRh5Zdgmm
	 IfLBlmwJp1YbcGzXuCXwzF6hb7R5FMP6CKTpEcC/Lk/F3eg/yP+NfiadhZwxDC/yDyJk4
	 Ct9Zlms33jqlc7MDEuKysIulU2EEz6iZ6nZ5VpyxDQGMPoVU1EbIoc1xMFASWRAHkGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5XNLxSp;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83849606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83849606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5XNLxSp
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so713136a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003978; x=1795608778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VToF9amWTCrNW1AvfVMc3RB1WXmBdknEErgNhEgj6zw=;
        b=F5XNLxSpHySTF+ld3i9RFIcPWLa1BLVpQca8ENIgXFtCD+DgnIKR1q7WV1SqX5rkcE
         yZB+VicZ7r8xKwIsaNkjfDeY3vyPoGRMZ63139IofXj8hJw3VPd7HVHN2JVkmJgTrW5G
         i68SXrVRISqis0XYmUHaOxfy7OhXl8TyOJa+K+oIffqJVoz3qSLJr5zTB+9wRkVshVgK
         mtM26jqrhVR1gtFP3W8qdFQq27JnHS8vXF7I+gnLz4XUHgJaAOTTGGetS+I2c4te5j6M
         QtAkOc1qaDXpvLZrMOqyjPVoEiJbqq43h8Hi0/g+oOT7jZhf/SvEWmY3XTq3cc+H3eP7
         X+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003978; x=1795608778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VToF9amWTCrNW1AvfVMc3RB1WXmBdknEErgNhEgj6zw=;
        b=NHBk9Rd5dg4DwM4Aaf3DT4WIl66EBeBr1v/zZcru7aO1IYGPyGIeV8gRxiBmZ2Tqt4
         jW4Yo+KZYTKDsnltqhwBm/CkTD6VTNImIC3vUw7lrY5noM/2/Twn/GmOYOK+/C95G2gB
         ZhY3XjNTEEC1MFwTWo+wBs9+5MJeX7BMxMbKVE9iOaOedHYFX6UVZlI0hcpb3pAv07UY
         wXHeX84O+Qxx++Uae3PJkIuPmE+5tLIcwPUazdrHC/1pQOEghQxx0qTvLfdl7VclzGWK
         iBv6yWn8esR+ETdoR26ipXRMnLbuMORzazyVtCR7dihfs/NMiKI8HeKkHZnWYtqPW08+
         VECw==
X-Forwarded-Encrypted: i=1; AL+hErHu7EqLeXCL/BLVvo6fG8PE6bbZMr1wPOBVguM/DWb6YPnXP9GAT/Xr6jHyg8iIL/ixZo187C3JjO5zl5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JhOfOEBtyQqiDDBoJGvMuUxAyWKESzeCgFHqcG4J4tV0zvFxe
	GT7wEJxMnVcTi8CruLfGNf7jDFRtr1YrgQaRnXySbHkQuSF2PKqU9XN5ugzo/w==
X-Gm-Gg: AZFdTZdfe1oWywk8Dzvt/IPhNLcMLqGRUuiorIQJNnH9TP4//y6s8RuMXfWYswLuqrM
	ZpFNdlsJhmAH3ScBC1SQ/+zKF6QQ/qU24xHZ86Q5ptFiJvWr+8eAYA+iFPf8C6AcjHvQLqhHsjb
	CavtK7qrA8EH4I1l1w/oo602Vk5ftS9jjdPHrOzRgPLQIyOCDEb7rjFpaw6aC/Jo5whmQ7suElb
	6nVx7hURuiuGhYUTQi7GFaqSrFby8HALO+0faH2IU2s33U4UBDqSsbkDRsR1NdIpS3PVjL+E+QW
	PJ1Racis346zre6m/idkvrv2GYtddDA6hneXuP7+Ua0DXMj7MNyZPFUfu+TGq+Mi1X8uMnA3zMd
	uOMLFMeI9/YBF30JkBGZphUcaZ3zopGrMNq99ZH7RcM1TOj2DGPv9XKq+Tu6hqfJBrtf5mrRMz7
	pbsSolBJxFduwac8pZe6CO4qbyjAWo1vA3BNbVjvXM1EGenWpoEwICNYY7eFSeM3RqCL6aP9Srx
	cv6wRJE8n2Zt1SlcUN7uGvvi3Z5k4Um6QNKvrv+poUcOenk5odmSxaKI4eT8QdZCVMnSYCU9eBP
	Ym4f/kEIFJPSqt3a5XW6DtpP1iuqRsfBpRdoigdQTbAn+42di1zgCw==
X-Received: by 2002:a17:90b:558e:b0:3b3:b453:2453 with SMTP id 98e67ed59e1d1-3b3d07c842cmr2806712a91.37.1795003978466;
        Wed, 18 Nov 2026 04:12:58 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm4095609a91.15.2026.11.18.04.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:12:58 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Input: cyapa - check the panel scan response against its length
Date: Wed, 18 Nov 2026 20:12:14 +0800
Message-Id: <20261118121214.3571621-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

cyapa_gen5_read_panel_scan_raw_data() takes the element count and the
element size from the trackpad's response. It walks read_elements *
data_size bytes of resp_data[] without checking that length against
resp_len. A large count reads past the 256-byte buffer on the stack,
and an element size of 0 divides by zero.

Return -EINVAL when the elements do not fit in the received bytes or
the element size is 0.

Found with a CodeQL-based static analysis tool that we are developing.
Both reproduce in a userspace harness under ASan and UBSan, which
report neither with this patch. Not tested on hardware, only
compile-tested with W=1.

Fixes: 6499d390a166 ("Input: cyapa - add gen5 trackpad read baseline support")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

I have no PIP data sheet. I assumed that the element count of a
response covers only the elements in that response.

 drivers/input/mouse/cyapa_gen5.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/mouse/cyapa_gen5.c b/drivers/input/mouse/cyapa_gen5.c
index 59f6e97d54827de..c346f16961cc97a 100644
--- a/drivers/input/mouse/cyapa_gen5.c
+++ b/drivers/input/mouse/cyapa_gen5.c
@@ -2265,6 +2265,11 @@ static int cyapa_gen5_read_panel_scan_raw_data(struct cyapa *cyapa,
 			break;
 
 		data_size = (resp_data[9] & GEN5_PWC_DATA_ELEMENT_SIZE_MASK);
+		if (!data_size ||
+		    read_elements * data_size >
+		    resp_len - GEN5_RESP_DATA_STRUCTURE_OFFSET)
+			return -EINVAL;
+
 		offset += read_elements;
 		if (read_elements) {
 			for (i = GEN5_RESP_DATA_STRUCTURE_OFFSET;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

