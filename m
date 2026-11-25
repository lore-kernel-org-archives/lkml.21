Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638154;
	b=WeePUh/PYbKG0MOcC4OhoL8XjwwYWqbyP+oeC36vA33Hlxu+HW5CxtvuFEZ0UDrtWbBs
	 OmrR069VoP2jM0XcV4y7VDwthIAW154yRH5C8Vw33zWnmcP01sRTA/poo3GrnyELC8llT
	 Ph3BiDcXv11D7RBysRhi6j1SrYMWbhKQUKfidKcj+BJE/kiQCQA5HQfFovgAa00822XmL
	 Y8b4XmvhPyXzn4MXRikuOus073Kb1yeDTa3i/7krEo6Xri26D/0MXyeyBbanfyHmqazDJ
	 NJDF4Qc/3SebxEqC2G8Q8C3lH4tAv+377qj1lwep2Eh+lyc7yA4xxuU/HSIxHPDRHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638154;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Lb2D2tWbP9xpFGNwCPYhXighNPd8wZ8FSIPXRSIeOMM=;
	b=dg86JK8+v45Rl0I0ImxpCFjzSOp2BDf/oYS0OmdSKxmSq0S8GsDUgPNe5dtXVZ4B0YJA
	 gJm5Ybt07Y4vNVjmesrSl/cAZXeKj5nOCabN637Sxz14paIPpeGjguiUMzYxW5phrjx+1
	 iQwzT0F/hqGO36SlZqfL/CeyueuAcFYnQuxa9nIXi1ewF/h+wXG1rpUCAvdcEDQuiANer
	 dn03qgjoMQJvkxMQ1z2LA7J4BuGij5+STIjueUxdIStbGNLIUaPF69NWhK1c2WnoeCI3v
	 ynSKuNyqsF1tKTU/Kpwr0L242LoRk3Vbi0IL3nptoeATU1CmnYtuiUhjRrKl9+NHJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547FB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4e246acc2so45072507b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638153; x=1796242953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lb2D2tWbP9xpFGNwCPYhXighNPd8wZ8FSIPXRSIeOMM=;
        b=XCBXLereBBbPYQTgoHP+amhy2epeF2uxKgdgmKf60iYLPQz6fBnN3VEvfYw+StQUEs
         BNsr5drzV+nxNe1wA2N63cDBPMcxZjbEmf4s6pzlZASm+K+rG0U3ntGk29AySQ0XJzlB
         20D6r3U97ALlre9cDPx6VsBh/AzcNFFp7ss6K1TAG4hIEcnxEG4z2Exc6TLKQlfPzXlL
         VK+6KdHN6S0ihrfL7+X2qxQ0o0uqAWZkkJVL3nTZyMF3aPrwPIh730jHb9GQFgWlLG+N
         D/xy4F/YTznQwQIuYN7QVbrortrggQdnMB5YRYqzxGoJLbr71ZIhvEmNuJp0MJOiQXy8
         nMbA==
X-Forwarded-Encrypted: i=1; AL+hErGEMP6qaLF9OejOGsSScD5/vACqTqwVS5ppwIFiv92QEGWpgwApszp8LFv2iKRyPONGAGnbr+6YFZvKJiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hCExuxqlLsOafYinzeNLeWqsvupWDG8vx0SfqizEv80bDIXAb
	D0pm8uajykwegsNvYeF3NKHIW4gPARxPt93cFQM8NReVWaRxln/Ag6Fk+aRvM26fk1Y=
X-Gm-Gg: AZFdTZcfkhDGJVyaJfO9A61t9aU1mtkQd4HH8+bU5bi/ez2VhmxgjruZDDAC93Kg4Zo
	q3JoX01caVMofRU2xBTj5Q6jCgoAnbbT46XNSwt3xZwpuxH0wNGAHD7TGs7eA+exd7X1Nl0iAgE
	CU5iaTFo68wRIBSowcLnkfaK2z4dfO1mcMVNML6T99ndB2ErBRYYc3IIF4DyxzfThe6xVUgD29C
	A8ewMOXdc8FbztatqEcRvRI0rlyKCe09RppR41g0lugBOgeRAIJKhvf1lPSHrGUp/9NSYvRvY9D
	/uIufTZdvOIialYQprm3ngjMYvsK9gUNXq8BZ1gr+QB5NtflipQAnPnoc273N/iFE3fgu3KayPz
	BUzWxjRhCaL4tAQVt7n/ScRwYhWSlmgUO2SyIclMQimGR2NpkvkgqFjAyVUrrb8frIFDTvmgxtY
	T637/XljcSVdSvJfBG0YALtX0Sqwrg4KjX+/pWxkiE5nWnT2k87I+mU2xg9eoieIARElWaEVONa
	F4F+quxytkaEeKc4rwLw3b8eHacJf+VFISHCSjvOU5Lq7mRn+X4kFvFo1JTGrgEg3tYKBwHEBZC
	rzE9SeceM4zIrX+WawX74/biE7aLQ/MMHhxIT2RqVusrIwKTckV4mPudqMhk+FTBtfH0dHiDtcT
	YlPv6rRtio3dvUsdnGTPML+pmVIYgmzNXXA/4DR3w5RdPaVms7zEpgRTIMmVklh1Y/9hTxAIKh2
	j+417F9HPzj6XolRA/1z3JTTKa
X-Received: by 2002:a05:690c:9a09:b0:8b4:c2c4:bda1 with SMTP id 00721157ae682-8b5205201d7mr81799737b3.67.1795638153094;
        Wed, 25 Nov 2026 12:22:33 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:32 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH v2 0/6] iio: potentiometer: mcp4018: Add Analog Devices
 AD5246
Date: Wed, 25 Nov 2026 15:22:27 -0500
Message-Id: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22Nyw7CIBBFf6WZtRhAhMaV/2G64DG1o6Y1gETT8
 O+2devyJOeeO0PCSJjg1MwQsVCiaVxA7hrwgx2vyCgsDJJLLYTQjGhiNhyl0qwN6mCMkK1RBpb
 BM2JP7y126X6cXu6GPq+F1Rgo5Sl+trciVu9vuAjGGfbaGc91UI6fMz6sve8DFuhqrV+fS/jft
 wAAAA==
X-Change-ID: 20261116-iio-ad5246-8d4377128747
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The AD5246 is a 128-position I2C rheostat that speaks the MCP4017/18/19
protocol. This series adds it to the mcp4018 driver, so it can be an IIO
channel provider for an in-kernel consumer.

Patch 1 moves the out_resistance*_raw_available ABI to the generic file,
patch 2 reports the wiper range, patch 3 adds the binding, patch 4 turns
on the vdd supply, patch 5 moves the scale divisor into the per-part
config, and patch 6 adds the parts.

---
Changes in v2:
- 1/6: keep the moved entry's Date: line (Andy).
- 2/6: include <linux/array_size.h> and <linux/bits.h> (Andy).
- 3/6: rename the binding to adi,ad5246-005.yaml and say in the commit
  message why there is no fallback (Conor).
- 4/6: include <linux/dev_printk.h> (Andy).
- 5/6: new, split out of v1 5/5: the scale divisor, now unsigned, moves
  into the per-part config (Andy).
- 6/6: name the driver for the MCP4018 and compatible parts, list-style
  Kconfig help, AD5246 sorted first (Andy).
- Link to v1: https://patch.msgid.link/20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev

---
Joseph Telaak (6):
      iio: ABI: Move out_resistance_raw_available to sysfs-bus-iio
      iio: potentiometer: mcp4018: Report the available wiper positions
      dt-bindings: iio: potentiometer: Add Analog Devices AD5246
      iio: potentiometer: mcp4018: Turn on the vdd supply
      iio: potentiometer: mcp4018: Move the scale divisor into the per-part config
      iio: potentiometer: mcp4018: Add Analog Devices AD5246

 Documentation/ABI/testing/sysfs-bus-iio            | 10 ++++
 .../testing/sysfs-bus-iio-potentiometer-mcp4531    |  8 ---
 .../bindings/iio/potentiometer/adi,ad5246-005.yaml | 54 ++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 drivers/iio/potentiometer/Kconfig                  | 10 ++--
 drivers/iio/potentiometer/mcp4018.c                | 65 +++++++++++++++++++---
 6 files changed, 129 insertions(+), 20 deletions(-)
---
base-commit: f2cbef9101b9fc979a324bb1242b8b802a2484b6
change-id: 20261116-iio-ad5246-8d4377128747

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

