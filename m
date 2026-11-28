Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795838113;
	b=SUCcP/1QUlUz5t1pie9oCyVaT+6h12NMYRSpXrAcnPeOfFYUyrQvx+W9d6wqssaUy0iu
	 CgBpLrzTzjzi/rF3tXF6+UhQbz+2rOqoS7E3I0HwSmdm0n+M5bHki6/hWBLRb3D7pDzlr
	 hzaEDAp40ko63t2WfYFFriHzbwBbp4MLRBKXIBAP2t8lO2kuB/w5R9ZGHptVarMBPNSqo
	 0CirjlBGKzrEjnCPMpqKLKYolMAjbjbG9On1jY4Wtdijfihl/rGlxqHsvYrqZ/JhIsD4c
	 cjUUXF1gBcYVXv9Tzu5RTGV1d7l4TNuVxzsUq0h4bIjhTr+QLu3k4hEfjXbScfPeQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
	b=eL2rTZJ3FfGEUKR8obi4LmxGaaxKxB9iiit3uL5QiB3L50oclfb/wRU9EkCpe5wsYo9v
	 1xH1VggZLjszyen8CSffeRxJ2mBQVVyXH66vX9LeULk0K4ybK1OAVS/7Ntu7HHcRfbo/T
	 wIEA/SCax0ejY1B2BNtYRtKXoGKEEJy5MgdRa1ewE4MVYB0sMs1NmrxPLqJXR2K96YeiI
	 +J9dStMM4FCyRYaHbncxm3z7teGjw3QTDQPrhBNeO4CFzfRWhdnlP1w9EcEka9fnP2wgk
	 ipufz1AGi9UjAz75AHssBFKgiwF3yF6YKx2R776xckhpC7dEvfHybE0enqsVtWTlE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7j3vrxs;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41B606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F41B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7j3vrxs
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0426a65e0so52364125ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838112; x=1796442912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
        b=z7j3vrxsNuPQj48IJ4rQ8s7GhmpumDt/H6mPKRhZJCe2I0Ak+/1kQ7jTwjex+HRHiN
         omPje4CSLBu5YDqsW+LZ2r4z5OyAHcuJiGbwRIu5yrI++kVdBL9zCFL7O3+UdYsPfmIO
         LNufeNzboi9WdCytY57ZNu8oUAgb0+9DpOFES6l2pJRvtvOjC6Yf6jlXjxN7Y0FmJoAY
         afRG8gBCIBlcWbVYPYrTJzcqXg3ki6o8kHD+kdW6q4p/LI/mY85wyJ4YkjZP/xEjTA1d
         ks9sYVmHiB91s6uuY7txQBX0rx3fHznmIjRnn6bOO1WI8MVM8c2Xl3TrlBihM1PNJQtn
         KAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838112; x=1796442912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
        b=PjTwXGR8R7UtSZAmOZAcHfpQooRrenptv10HqdEqubKQlxzzH9jxnJXmLnkAujfZGL
         qgAQGYJfWmCT8Zm1noFVp4TYmZqx68CXFTZUchrddWXZU4fj6B/bGBcNdeVjf2c5qHbw
         6wyMppjXoX8Ek4s8gG+YJ/0n4oAXYpqX5DzoVl0HGSsqmgkJCJOx5Qfa6R4Hpe83VXr+
         T7fWJLpxLgCWct6ZB9W5JxpyKpfis3AdDwJ7GGxWaHKtEvCvXbraWltllKCzGKoiFvHQ
         YZmrYMfoD3/Meop/LZ28NrX7QcuH1eTP3neSrO5O0eNdYXRn288imv1gNX0PESiETUcE
         irCA==
X-Forwarded-Encrypted: i=1; AL+hErEhdFJg2DxwvGdhVQiSUuse5r93RuKfePlXLwzLGaa3hZbU69tXEcLYVgubsyvlV38k8L1T0sRFwQuwZuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gKijY1K3hjLIRON7EIVoQh93Mz1nri9kQoge6OTCUmKtaeY2l
	TnqihNgTMv5uZRUreGYi/B4QjQ52GZs4CIgWcUF+YQZ17j60v7QqMYKU
X-Gm-Gg: AZFdTZdfmpbgJwXzopTuFOqBai0rbSd690qszsW/uqNIggMfdWC3lXOqz/H5oD0QQzn
	Km3Dio93+HqpzJzO0EGnBea7gYKtd6A/uvm8vGBBZmsl4YWSs8Rc2FwxwgQ4UrOAvhUMLb5Vl8w
	nu1W1VGJeqoM2U09JuDb/ikFGI96ATQLNiXB7F9Jt1KIadPD8wShKV4YUaTD3izvvVnsrydsjCL
	BT5MjiHtJWedr2AZMZ9UB5Gs7aIYJgf+5kyJIsN3Xsg7MgPtUQVeT6J5HxlK5hpaOIEHDOErJne
	eYCt1gwqrx3whsh/xlyMutv9ccO1PeIR8o56GK9THhTpoFMT3VQpEwtsN8MTgJvJ/tXyEQF8Xc3
	gtD4jomy+G3HVkxCbSCIeawt5nukL8F1v23g9ScIipezwSZqDcfV4CNsjy4dCf3NTdsv/9svI+l
	kLIC/AcR10i/6c4zi2gZlZrICVB+HnuE+Y/AhpeyZGlDPQj5crOzz2Y2dQUP3ODcs3L/ARTGCHa
	s2NwCG0ZR6goOGJZRSEk6Im/n6jANlGruspLxZmWA88UVMObdXqgeGDVL9SetNHkU5a/GDkNv0A
	yk20opPXdAV076BrTOshumU+NJ0=
X-Received: by 2002:a17:903:41cd:b0:2ed:5548:2989 with SMTP id d9443c01a7336-2f03f20115cmr222838275ad.30.1795838111725;
        Fri, 27 Nov 2026 19:55:11 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:10 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add phytium
Date: Sat, 28 Nov 2026 11:55:02 +0800
Message-ID: <20261128035504.760778-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add the vendor prefix for Phytium Technology Co., Ltd.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93..374568acb2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1331,6 +1331,8 @@ patternProperties:
     description: Phontech
   "^phytec,.*":
     description: PHYTEC Messtechnik GmbH
+  "^phytium,.*":
+    description: Phytium Technology Co., Ltd.
   "^picochip,.*":
     description: Picochip Ltd
   "^pine64,.*":
-- 
2.47.3
