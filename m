Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540251;
	b=pQ0LFNIK/iBxZZPB4VFCPSHiw/jC2q6IGK2Fvcn1CWX/Cp7tZ4/Bi4yWi4QNsPqO09Gf
	 BFlBIeUab61oZ2Q9Scq2QgcQ4K/sHotT0MJBKZHAd0bh05U9jDcj+S3XQNiKzQOOIXYqs
	 pqvjzh8Whc6WuMOJs/kl3a+lVNQHDpxt0GUBv4fhyRmTbWHSi4jNfuT3inXyGfIu4IW8t
	 7V73TZfhUOK0XWLOcfTZbew5FjLYZr+4MmtZX5XbmCVQBKb9OoKzJSElaMdRspb6uIae1
	 bZzcjGw1nlalLLfQEpRMoAo+BI7d9Jek6tuK9M+Px2sBF7R+kfC3mpWn9jJ8tkMpDJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=u8kv2zYNDRxVVHOiDhvZgUHGX0zKQbtOrLo9540hpuo=;
	b=IKyzSdROM6L+OcA/5Ffiu2NIAHVstWOvkJZytjbCJp4aXP/QT9GNxROAQPqDVLpzunDG
	 a2uvTUu2gbV6fEUSgiJHoQHtTjncn3d6ZVcLXddw6qiTZeLfDkLTKNz85jAZIbuntoqiN
	 HdnbrqHxC7UHnw7hB54azko340k9/0nxK8PtYp2YFC5wHbGcSp6uObuRbfHjCF9Wu6AQG
	 1Z0dx+deG5LFVrgfyIqskV8+2s/AbnTCX0TwBoEezlKkallmSrb2BNpc7HJoCx34VZ3dS
	 crr9erym1HkM9zoSDcotDgLU4EWNRRrxMzW5+cze/dkjdZUsROBHeOJFbFK8HIm3WIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESCI8Weh;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D56606A682
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D56606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESCI8Weh
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843cf077f10so6633382a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540249; x=1796145049; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u8kv2zYNDRxVVHOiDhvZgUHGX0zKQbtOrLo9540hpuo=;
        b=ESCI8Wehg58uJN9SHkEiE+nEdgJUZDkWTjGDxOa+lqjLHEH89QsNf9J6d5OM+7eVdF
         IHuj9QNzXnI9dRKVMjaHDnDUID7et+aws4Nhglh33DnRaW+UIHzVLqiKWGh8H7MBz7GP
         +z8+4O8/xRbljkGGIe3JWjKOGes8xdiX3gqIeva2m+PnbI6QhQg2FvtmBcQdkuOAJy/f
         QLDXB8NaaS1Bd9HukZy8yWzx4YnWjiwzNuIdR2BpfwdKZYHREEM19K5fxzIc+Y9TXINb
         xK2/o78SgOxzGjcPoCKnlzM9vvpt2ZQK6inEam5eSUIaMQhZddsQL35LukCAcpXwz7xe
         8nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540249; x=1796145049;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u8kv2zYNDRxVVHOiDhvZgUHGX0zKQbtOrLo9540hpuo=;
        b=oZaMdgwLni4w2Xus9ZQ1O9NY8lO2E9KlqxCO9y75S/Xxsn5Ae2N/13ZSjLRiDrdNTG
         TieYbOP5CrHpkjyX96bV+F/sFlFIad6qbl0ibBBOyI3l0jXWLrvVH7OSMyT+UpstWq2G
         HwDrx5B8fNM4Oe4ElrJoDl+uYnzcXGDeQZCAO+18bJD1zAj156fNZu3ie3qbE5AXtJlF
         O+IMMD0vHOS2Zzj8O0rtTO167geJRfoRe7By3oYlrkkLIFJuIu1u7sGcpPHZYj7b9bGc
         pS+0yDfOtWKl+R9LQ6iSI7LmQDQtH0QgAbZgZxUEYGZWopaDAXhuA+h7qSZRJ5N+vj0J
         6FYw==
X-Forwarded-Encrypted: i=1; AL+hErHvtNGyUF48YnXeOgdWvZOZjfRuSIFqADNjYMZjf9AZI6hYqvoRWufDqc9n39rod37kxmCsSfTCH4URlqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+52fqCr6WkOCYknuEaaeXi2V3hSYsFgDLbqmhFZhsaQ2pK06in
	++/0U82i73GiZfG/MZ/bYJvX2PLHXBHPl5ox+GOuioup7xg6u9lSngeS
X-Gm-Gg: AZFdTZc/qOP6SCueRmy0dhu+fKLRhaHneR8DAyWrvlfYWEnanbT0CUFzWWhPpM8994Y
	AXhsgyR+6bzA8vNgsNi34PTqMn2B3FqeoVdA8GVophF1Zwlych/YkkCHgW0/Jg6ipLVMK55U69+
	MygoRdMxbq5EEEBB2BHXyTvN9YDExS9qB7h4Z7WYOlMtQLaHHP8WIy0HYa/R6QPihktcO9lDKY/
	F3sVkzeRasg0LV0VXpv/Aoi2EX4nbTwjDz+gYqxCnDsClwB9yjTb144MCKzePWvc34gqlgxjzeK
	U54mpTKLz+EA3W8sKuAv2fLweHpajC93cnqniXH3k/qIbcEzGhk6EWG8N2yMW2POex0FoJ52knr
	baT2Ne0fxNa4heCyMcoQ7cmAXIgga9R0Mp5sIrXjHRLMaz2XpK/WryZsbzkTLtClpFtD8UZgQwo
	+PqVLWYRZ7vS3kYcN8gBNIHKgJEX/el8vJMT7RmnCyExS62aV/t7HI8A7dXs1MKHmzme69+flYY
	1sT6vxNBmSizmOWVeH+GdRKJEtl5tb2JP+MpkgD5aAlQcLnCkePJVWdaULoX0OVSrCzK3IlQqPD
	gwuqcD1XUXH4iUo=
X-Received: by 2002:a05:6830:6411:b0:81f:8a6d:7b52 with SMTP id 46e09a7af769-8631593a1cdmr16409262a34.24.1795540249576;
        Tue, 24 Nov 2026 09:10:49 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:10:49 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH v2 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Wed, 25 Nov 2026 01:10:34 +0800
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAArFBWsC/5XNQQ6DIBCF4as0rDuNoKLtqvdoXCCMOokKATRtj
 HcvNfEA3c0/i/dtLKAnDOxx2ZjHlQLZOYW4Xpge1NwjkEnNRCYk56KAxbVWeQOOZh39CMoYoDl
 qnpXVeSCExTnrI2BdtUWGPJdlwdKm89jR+/BeTeqBQrT+c/Ar/31PKf9TWjkI6EQuhLpzWUvz7
 CdF403biTX7vn8BM5i6TuoAAAA=
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add missing groups and functions in Tigerlake & Alderlake & Meteorlake
for INTC1055 & INTC1057 & INTC105E.
Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000".
Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

The pinctrl-upboard is provide additional driving power & pin mux function
through native SOC pins->FPGA/CPLD->hat pins for flexable board level
applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

To: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Linus Walleij <linusw@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>
Cc: JunYingLai <junyinglai@aaeon.com.tw>
Cc: Louis Chen <louischen@aaeon.com.tw>
Cc: BillyChou <BillyChou@aaeon.com.tw>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Gary Wang <is0124@gmail.com>

Changes in v2:
- Add missing SoB.
- Fix CPLD I2C pinmux-select by good method and update commit message.
- Link to v1: https://lore.kernel.org/r/20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com

---
Gary Wang (5):
      pinctrl: tigerlake: add ish_uart groups and functions for INTC1055
      pinctrl: alderlake: add some groups and functions for INTC1057
      pinctrl: meteorlake: add some groups and functions for INTC105E
      pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mode
      pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boards support

 drivers/pinctrl/intel/pinctrl-alderlake.c  |  40 +++++++++++
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  32 +++++++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c  |   4 ++
 drivers/pinctrl/pinctrl-upboard.c          | 108 ++++++++++++++++++++++++++---
 4 files changed, 176 insertions(+), 8 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261124-upboard-pinctrl-add-intc1057-intc105e-support-e87b40e13654

Best regards,
-- 
Gary Wang <is0124@gmail.com>

