Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467969;
	b=ZUVvXqFRSgtTXgNYeHMStu+VSapdFj7VOh30hcvFrELhmH4MEN5UTck3xEISYJHdPK5L
	 ovclNxObuzG3yYmHFKoUoBc065ZsqOjW3rr5kSeKJlAlQtl6SPTS3YkKK7yReVzkKjxID
	 eS/rsXc84luonN4vZsI2O8d6eDlnCIPvJZK6tPRh+oahGFOIXt6eI9dwi7rG6X76Yo3BR
	 AZSXjD9sILCW9IHaycPachQGm9qIgMPWmAasduPNZV7TsaAcqPRvRs1HpBP6uHRxs+8D6
	 wNG3MvKEPFKEu/E9bY4tgYWT+an0332Z1JSkQp62STH9XUr2L3BW6Pgc6c7HHQ1o05Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8JKTUUZIAz/Cut3RL8r2H2oCBi6ViU2LdrrZpCfbw2E=;
	b=wbRJEYB9aN0+eCJECRcJrUMBumcRhv6uCtM79ddNCsZY9VzDrh4EGJS9k7mqlHZq5pLb
	 fywbpuCi7/6fiWttGyAzyWVtlLd50emn+D17nEOemTrM06r69C6B1dpYW5M/YDtUMSs+C
	 vZrahTGXaZcN8HIb/gDTbreUtDrLTv5V2xOtNC6UYMwO9hUBG59XhZoLhAwwf76/e0AzO
	 GCHTa37DRSKlkYXRqup8uoLumATfpBUu6yLxulG6uMRp5FCAjTeTLtKbyd4UynJRdffoB
	 LYdd+bJBX9kXXfSkXOVrXArJoxecEvOkV0SuQCHFx/irnb0XmZN6uPj3AlLPoedEcDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTEyIUva;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637E606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B637E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTEyIUva
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99e1babd683so2126483241.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467968; x=1796072768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JKTUUZIAz/Cut3RL8r2H2oCBi6ViU2LdrrZpCfbw2E=;
        b=zTEyIUva6U7pvX91Q33j+FyFUCLSkg/KWl/kcKU3hLncciGM61XEYm6P+E/wKpsURh
         C6+B57oEuOQD/h3FJnDkSbWkt9AmE68sWI8jKwn671/3ar4XGr7v9cHQ/75dP3o9fByo
         iUv7e2NcAIi1lpGIdBLTq/PbvC99/oEzvOorPCLgjBFmK+QgWOZX4bwGJI4bwcyjRzoL
         6ggewgdkDt4BXZTJ/VmmMxfbU1i/uS8JcsK9IeRnKhBTlP2K6Kd9BDqoKVJjMwTg45tI
         kjz0iXz3Bav97xzvYgfUZb9dTYNGb2tS3EP4Ra67/gR4keCi+ljT1osAOQ3dSAqIn1g4
         t+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467968; x=1796072768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JKTUUZIAz/Cut3RL8r2H2oCBi6ViU2LdrrZpCfbw2E=;
        b=dCyJdoV+pUbWHgfFGkhClXUDGuPHTF4CdHTBjmPIXAK5DpJgAf/jz7YwoYmyxedPpt
         I8uWBZ5sfrwvNOZEF4x3+qcLBwec8n2eZvuZyV7IXCe4gui+Sy5VZ06mQ4ZhDwiLxHbV
         +fZij7Zeqno1apopervHFitbpXc+L1K5j0yeFa3taoCYC++/vX1df7Sr9hVoZIgIZ1QI
         f4rgx1kp+0vfQIKheHaYcJ2y30lEtjE9AMqcwB//z7LF3nTzY8ASstsIj1fDp23z+BqK
         rkSk2ct87V9ZIDiSwrLRlRSQNL/4h4VLwuAF8W6S3/UPq1V98EnM+/JSQgjQyda9Tt/x
         KBsQ==
X-Forwarded-Encrypted: i=1; AL+hErG+lTUKtD5s5IvDmgKRkh9p5s16w4YO/pbfu2bAloNVk4wF/Jpv4uaJwul1+/R8XbDAtl+spMG+q/PXo7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wZ4Nvefq6XWTpXHOCEDrv9IKnge5tCl07E1aMUTfeLb77RDf1
	14qMLOypRG7GHH+0MDvDesCVdBujl+1u5nYzrrHzOseGPGLMTFCB1DgF
X-Gm-Gg: AZFdTZcBBphuGIFiQGuBIMlOSexF9+qc0zi39RpIarLkTtgwwZ1PRuuA27QmvlfOzhx
	13n8OZrga5QjXGCWjRHDZZs+Zvp1mOfI9yaajEy8v40PD32ypFaWO1ZNKggJAxkdJi28e1l/hRd
	jklC2f/la/YrdkLLmvewrKzm1WnFXswzkGNLFPB8bSoXXcYnJriSQQyJmgxiGOSIm/Deu0ZN8Jm
	uJyvth7trRm6LmT0VevuxGGbZQlN7LSxUJuU8OhIE5wC8nn+JT9JkMq6dRVMj7k/PgLu4VFzYAR
	R64GGsCgl+PUoYbIbHxi7lBkQsc+GvKJy1Jf04s2gw8p/LqNJ7Q7pAkVK9vo+sEOLFa3/K7JvVJ
	Gy9YO+NYaGoEJhrqnU/G9aIWUuWwm9L3q0U5KptpkvjY5uynPGBiRKpk9NF20HyiWH2KSe2xaRX
	Js1pjcStvhV9tSv/Lqx+BBZpKjwccXGeCAuEo2LZUvyJ1k73ksoMPAXdZad2oWH+KA8TpVyAxX2
	Ye8NY9eka14MyI4gqUODPx3Q+udeYK4/0bWMnJUohWhOtKP4aRWgWQLFKMjIjt+7IKKYFMxLNZz
	4wAAlcnBBn/+8u0RS7LZ9Ju3
X-Received: by 2002:a05:6102:5794:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7d739461a80mr6614391137.16.1795467967755;
        Mon, 23 Nov 2026 13:06:07 -0800 (PST)
Received: from garuda ([187.114.10.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm13041769137.9.2026.11.23.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:06:07 -0800 (PST)
From: Renan Biegelmeyer <renan.biegel@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Renan Biegelmeyer <renan.biegel@gmail.com>
Subject: [PATCH 2/2] platform/x86: uniwill: document the WMI EC fallback
Date: Mon, 23 Nov 2026 18:05:54 -0300
Message-ID: <20261123210554.3357528-3-renan.biegel@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123210554.3357528-1-renan.biegel@gmail.com>
References: <20261123210554.3357528-1-renan.biegel@gmail.com>
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

Document that devices without the INOU0000 ACPI device use the
AcpiTest_MULong WMI interface in read-only mode.

Signed-off-by: Renan Biegelmeyer <renan.biegel@gmail.com>
---
 Documentation/wmi/devices/uniwill-laptop.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
index 65583b239..36dad51d3 100644
--- a/Documentation/wmi/devices/uniwill-laptop.rst
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -191,6 +191,14 @@ Indexed IO with IO ports with a granularity of a single byte can be performed us
 (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
 provide no benefit when compared to the native IO port access functions provided by the kernel.
 
+EC WMI fallback
+---------------
+
+Some devices do not expose the ``INOU0000`` ACPI device. On those devices the driver falls back to
+the EC WMI interface described in the previous sections (``GetSetULong``, method 4). Because this
+interface is only used for read-only access, the driver exposes the CPU/GPU temperature, fan speed
+and PWM sensors, but none of the features that require writing to the EC.
+
 Special thanks go to github user `pobrn` which developed the
 `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
 The same is true for Tuxedo Computers, which developed the
-- 
2.56.1

