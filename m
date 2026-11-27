Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801211;
	b=iA+JjuRSMCyFZr/GGJI6s3VZ5yg+pgB2gzVmw0zzyciE3f3SPkyXZRz8hBqRMFRnkdj9
	 QqOb8vLaxgZgeUXGkO5CpZy+Rv3W5jHWrd4dSNKy1g28Fj5aYOwgqRzWmRkJUYYP4vF/O
	 BZNsQnjYj7eQiyM4j4SxGcNVKeTF6rpECZyjBIme3oP/Gqv9CUuvB/Pe4ZIoLGzRTJkwd
	 aAkRMqpZxiG8gxmYxsdvYiGPv9+thsO16NpFy7dS0mDSFtWgLPmJG0PdjzIl7/UN/6Tzq
	 Iy+u40au6ihmEoHXzE8KRyfwAHKPHo0fiKqXKj4YcR6N0xB5/0eVlG5yElI+O8ryloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=GcnQpQEXEsi+nvPttlap4C/vSdbuHSCBd/6D5U5RPLw=;
	b=fIYh0oF9JzaugJUXhMwgokZTDvonvwI0Ec5hyn3F3UFExbvCxXUDVGEjL7TeyivgwUHK
	 zk60uOjamhWSmw3Pijr2O8WGznco4MQEzMd3TdhbW/ufN8G85KthN3FoqDx76CmjQQTxA
	 RBdnhyL81zdrVIVRhQGesjnjSfwne1oBpywqtktB1PFzagl5xKnh23hey+eNBKjEQDwcG
	 xDgKq1dg3IOueV6yf8Po6HoLfvyBro0ZtVMPlQ366/EAYpVFTZiQ1t9XrWpSsN7aRg0wN
	 ec+lqk4cMqwMqdh0nPzjku3KcoNBOKUMpGRQJyp3SbV6+mCJJ9mtecEhOPerAfn0BNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BOenXBKs;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B94606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BOenXBKs
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso7392450f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795801208; x=1796406008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcnQpQEXEsi+nvPttlap4C/vSdbuHSCBd/6D5U5RPLw=;
        b=BOenXBKs540CBXJYvgFslWeU2CW9MAm0ao8OraihhQpQS/IC2hasWdF33kI53UbIpT
         QHmY2Z8NWBeWtnpVakQZYnR0ycqdrPrruk288iuzx+x9b82ukdmSzIcqao9DxSoJiojF
         L2YwfIvTqr9O/GgBGSojLHXhr5TdxzT48GO6UWBUbqXVZf+ga0086EwgvXlIf4Sinycw
         R22/BDvEpddDu326sCpNtPIuifkyQAmMktB/Za1s5PkohI/amI+Lvhn6pCqGM/RRJEQL
         YE+/xqPhgcA+iVTe8fjAyGM6hr3yalLiDCruDKJuYxmxeuZ2Og69p3b8O1cD45mTyq5o
         0puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801208; x=1796406008;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcnQpQEXEsi+nvPttlap4C/vSdbuHSCBd/6D5U5RPLw=;
        b=InpuTpdzATe6hK0GpCOc/dPVk8CTSfI3Q4NuK8OuxkEwO4t3fMFWCdVpq4YX5Sfn/X
         oUBXIRkHj2t3hlvgvYK2UGJJpp9tgrj9U1lqIs2HPRMBQlgERG6DBrgtNY973dNkhV/v
         XXiCv3lCz6kDuYljlSdcV+aFtBitdk6KYQbXDDqbPZqPoju06RrOeKm/X/y10jZ1BvyI
         RPacgsxhOvCBLVBfHGbhmfSdEp6uc6uAH9Dec47R9mnUs8CnBAavXMWg9FyochK7relI
         86bjlhM4/MiuXoEEDGqrrr6xSJKK6U3SIUNoH4XLx/JX1MP6NdCxOtxR4xBBf0j71jNF
         A/HA==
X-Forwarded-Encrypted: i=1; AL+hErEqqq9HRPli1CCkhhejCp7VHHWXhR3TX6abAdKwbo0bIQpKmZk4E8hNAX3TuNPcbvhfnI7JbmJhK+z3y0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WxePnPvwXMH8TS4ckzDrJr5HmcxNGxcRas+yu/B4u0CC8W042
	85Yr+TRlNtNtxL4TZAqZq+4uTSalJktj4gAuGd06NNe4h4JBRjyXGJJnMZtwaZhUtK9aN5+8c/6
	G7Kn+H2E=
X-Gm-Gg: AZFdTZcidkvfYxWZ0b+jarqYf24K9JNKiBECNajoGIoulxCIec5ZdoE0ayCh9MQuF9F
	51gmGt8Dwo4jxPtKJ/Xy13yJ0gWc0sYJQcgwYncrk0FozNK/lwZ77BwS2kWKGC0oulDvLJEhLmU
	ou4Rkpa4epDUpo+ExXjNynkrq4ZmoJ1pqJnkDr72u7k/c882U3PqGxFbPHQ7KYCjF2SbWZTElnv
	uqVwcottSDSCb7T0cSa1qtTdTHPZna3/WCsoyzlvmPJK+fZyWvjaerjljkMtrltdh03jNlOj2dp
	oW4jQuUO+YmX0ehv7dnevFkFeH3VezK8cKsK2d7ejzFiQfTZGUdklqAefVzowSc66pgn4ddaPN/
	jMthAOhSfXZyw9iRpETfzu6Oy+jSAsD6dRi2yPmgXeP6utzT+23u9/PSZh9BIW3qwrnxnMEwQ+S
	2amZhPTbUwOBMdfvwrvFALL7xYpg8a8oKM+DBz9t3QANP8QrWKofSI1jbIFhrFIepdpaEWtyS1w
	WITh8mHw5xVXPoI4KeXlj7I3azNfVXh/joqt3unOW/sy/V2jBWsu8OniGstZG40aWJLpnFMkF2E
	p7KMPXGOtrdBTvq3f1FlLrIOi/SZlQ/jPFwVk0/LM2DuVHkOaDU4UpikgX/7Lq3sQJJrpnjMwYV
	+nA3Iuvz5MhIH7/tY
X-Received: by 2002:a05:6000:4381:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4bb965c79f4mr15672379f8f.36.1795801208451;
        Fri, 27 Nov 2026 09:40:08 -0800 (PST)
Received: from localhost (p200300f65f044d0890ab5f15b7da13fe.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:90ab:5f15:b7da:13fe])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2e6dsm46652250f8f.6.2026.11.27.09.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:40:08 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?utf-8?q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] pwm: tiecap: Assorted fixes and improvements
Date: Fri, 27 Nov 2026 18:39:39 +0100
Message-ID: <cover.1795800756.git.u.kleine-koenig@baylibre.com>
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
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=lwyyQjPMflqKxy+krxkobamP71JzUQng4Ev8FJqpSxo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCcBbkdh7+Yic6qPU0TvIds2uMs5cGqaF1NkrA NWPlw3v2QmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawnAWwAKCRCPgPtYfRL+ TuixCACwtmwXDO2XbgeKmsVM294Aq4eyxfizgUsLoRfQF7uvH+/OROd3y7rkflkR6ddZy0MFJog u8q7ymSB9YC6LUizGhKaFi/PX0ht/OAJmeOmF4RfZBPaLZRziC861ghAem49UMsfbJmrfvCthz2 uAn8DDdAlfyfwc7s7GoRglNPASzFBKIaJhjaZnF8dmL5Z3M4H7jpS2X3zxzdAHBngD0+L6A0DZD KClKdqA/GU2/2k9XCLuIuD27e8ecRtXmxP7v3MwN6r0INbdOniGrajdwFrrl4HYHaj5abS6MBm9 b8tM9zxUdRZccQZMGGodnIuQ/gg+noqsfIJRfwZjvQPVQ/vQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

while looking into the driver for the review of
https://lore.kernel.org/linux-pwm/20261116142251.1296742-1-maximpedraza@gmail.com/
I discovered the patch opportunies taken in this series.

I didn't mark the 2nd patch as a fix as it might result in power
regressions during suspend as the clock is kept enabled there. So it
would be awesome if someone with the hardware could test that.

Best regards
Uwe

Uwe Kleine-König (5):
  pwm: tiecap: Fix type of variable holding clock rate
  pwm: tiecap: Ensure the input clock is enabled
  pwm: tiecap: Use dev_err_probe() for error handling in .probe()
  pwm: tiecap: Make sure the input clock doesn't change rate
  pwm: tiecap: Improve period calculation around overflow handling

 drivers/pwm/pwm-tiecap.c | 94 ++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 43 deletions(-)


base-commit: 8c35f759bca417ab337f3c383be2d0a001a5ab25
-- 
2.47.3

