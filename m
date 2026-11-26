Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705808;
	b=jIPVKwY+24d2rvswD05m40oMZivt65v+XZxYrDVeF+J+Wu2jFqB2hWQL58VsCuJEwtkf
	 d3bWMngqH0hFD9I2zCZeJTUc7a6NyMohXS4B5h/Px+cRPfCeaukNkJyZAm0eErwKOXZlM
	 Zt5tFi2KnRBDOv8P5YQr9YTYNbegk9tb+9mN35Zxr1mc8kigfSTT5W020THzcu+D7BuX2
	 2+klua6/BcYEsi6zIhWqpwpRkAnOBgRNVLdzSt0wZ5Q3c1+8wrsf6ueiK0qm+frMg2fnM
	 trIXpib/uehjUIcpkYE0HBOM8YHYM0XkN6EhirFLvOpQ7gNCFAw2ElQVqTNctFnJk3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=qF8Gq3/DvfR9bgvTJhpHtUh60h1rATqchUrrPkWfF34=;
	b=Nc3nqKmUVBqj2iIw+HG73L0+nrhVpTTmVJOADMBgsJGOoLM1HPghTb70/BODrN1AeeT1
	 rLDzr/DO9dbuWX4dqUZ8X1iITjChhVd81v4qKpW0ozfHYO+pXI9OjK0TPR83tiX4cvbOv
	 xs1+RsGgHSaP5HaoOSAqI6pF1I4NOyfpY2zNcobw5KfYaBUs3S6x5mLzzEe/Y8r6BWaNO
	 BKcKoTWffbjETGPG9uuN/WxXuXtOSiWzyrDnr8mew+dBP/p0VSdnozPk4mOM/yQsVP/MC
	 NH++mzQnY7oIP36RRf1MKg8jfhSHGSDG9BfQbSse7cXZmekf3EnV7m+3VV4pycftpGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVWrWfsL;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVWrWfsL
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so3250264b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705807; x=1796310607; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qF8Gq3/DvfR9bgvTJhpHtUh60h1rATqchUrrPkWfF34=;
        b=sVWrWfsLGRp0Isn5pPucJMuYuU5jEAa9H0Jd6Y8Aq6x1hJ2zyQri+N0tmaqKNDZtlE
         yaZN0C69i/lUA7Gpbf7QDqoUun0daKC6C4cd2qgAH9hxTpG2bXIM4ciVwDh+CqB9ikEF
         eSK+mF4mZErFJtJTULr0JCYSLe6e2dwIw8cxgG9Zr86tWy4vjBt8IrEY/NPbPf97xcY9
         /M5VhyD7npJdqdvWvZTi2c9SG76qdq5mUb3aWCFXwSK4V3bRJ4JWP7z0lUNc6dsXmRC4
         wDiUgdNxJaZrN+VtIqhVE2pigKCphnr2mqS9jrENXl1p+WNsI2tt3Re4OvkhAsXNsYgt
         RTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705807; x=1796310607;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qF8Gq3/DvfR9bgvTJhpHtUh60h1rATqchUrrPkWfF34=;
        b=Ghg1VlxF535vJCnOEEEWAu6MTv9r8xpRCy2NfS7ERgSaal/TseMA4wKyEgizB/rqsG
         PJlAGBJKQZxq2bZJFokVyGkBPZoUfURIfM/CZ2/k6uAJ7h08YnT1GmTqxjGZRzMLH3WN
         G3IBvYlKd4XeYyEqcz8gcYiJWm2tDnFIycZQlxPC1YoWkHJeicQ81jBwYLrVzYiNuJXd
         7ps4/U0uUGn6Skolp1bi39QpQPq3eH+/AoHl96q3kdWmPVnUs+6qaOodRogJjQMg4z/t
         8vd/VTCk8ZKXLw6y4yQ4VjVPwTuuCXgr2/Js1l2DJ+6ZiNKHSbK2UPIhZFeAsplMyV6D
         Nmjw==
X-Forwarded-Encrypted: i=1; AL+hErFa6hpJGwJPxwEd7sWurA1Ou7clKyOGrGFOo651U17shc8hOUvRLobQnBq9OatA5rt+eKWz4MdATe6Ex/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a8iAlS0bPpzxKxa4hGlo5J2675cJQHmfn5ASADyfgUSecy2ku
	kIjXFEGw8HkUz0dL9RywfGta/Setkj02TpOaxWOzi/iIQ9lhsFG/5LAQ
X-Gm-Gg: AZFdTZeAny9a4m+8qeIOfCwBondaQEThmQgmShuY5OKiX4VVLU36NgeLTVsU8qnp2gv
	U5kYa6ZKO3qo1Qgj8x7yvpGmMh0zF0XEyFwqOvpjVGo3Ch2h7YZMFSehOKU+dPvddfEPKgvnkXG
	Fb68Tm0vcoYewtz1ZafR4K9Wy1QaTFLt/LvPhqeQB7yUeTE3as5u8O3myKilykOMf2GzgqQE8w+
	dEZmftRt0Yo3KSTmLpZhoBujtDphB7XdBpXRBZl5KsSGeUmfSYfDQYpl5Ak/CZ//83iMTzfzVxW
	SxZBHAxoHjUsaeqCWsP0vPo6FwDXuEs2C9OuSZ5HaRQWWANiyE6st+BmsKBiUrdqOtgS4lJTZ8B
	jJZ2d+/BpwVhHtyQAiSl4OlmUGQTptDoQyrv5vchUFyYdW52fr2ieoI15VaMVP+1lVHPxfh/tlz
	zmuRRD4ecYI2zuCVGh4S7axgNoEdy7e+RmRJ7OXqkaI9UON0LHRuA7r8x9Nw8CjjcgB5ryKMfl5
	tleUvLfeAo8AvMUXNlaTUBRYDXKlMKPx2qEKNTsh8Cl89SJbe6A55HPEAotBzZGgzBk1/AIKJlp
	rwNZAKgTIYCrtbGbvEhQErZTdDQV+yTnOp/WpLsPyNBoRnvYsg==
X-Received: by 2002:a05:6a20:3d1a:b0:3eb:37a7:12a2 with SMTP id adf61e73a8af0-4014cf57a08mr21001490637.33.1795705807164;
        Thu, 26 Nov 2026 07:10:07 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:06 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH v3 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Thu, 26 Nov 2026 23:09:43 +0800
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALdLCGsC/5WNyw6CMBBFf8V07Zh2gAKu/A/jovYBkwBtWiAaw
 r+LJiZs2d1zF+csLNlINrHraWHRzpTIDxtk5xPTrRoaC2Q2ZshRCoE5TOHpVTQQaNBj7EAZAzS
 MWvCi/A8LaQrBxxFsVT5zbkUmi5xtzhCto9evd39s3FIafXz/8rP4vv9SdrA0C0BwmCGqWshKm
 lvTK+ou2vfsW5pxby+O2hE46IqXtatcIWu3t6/r+gGAY3p8SAEAAA==
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add support for "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and missing groups and functions data for 
INTC1055 & INTC1057 & INTC105E.

Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

There are no compile-time dependencies for each file, all pin groups 
functions data will forward to set default when pinctrl upboard probe.
It shows an error when run-time dependencies are not mapping to right
groups and functions.

The pinctrl-upboard is provide additional driving power and pin mux 
function through native SOC pins->FPGA/CPLD->hat pins for flexible board
level applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
Changes in v3:
- Update detailed description in the cover letter.
- Update fixes patch detailed commit messgae.
- Correct the I2C group mapping names for the UP Squared Pro 7000.
- Link to v2: https://lore.kernel.org/r/20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com

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

