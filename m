Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009591;
	b=UbbwDYfk/uHETd/RCY4QdorweAsU75Snp/ft338SMKnIgw91XDCElrQpa8/nvkYSqnAn
	 rYnM9YLIR5NCeNQUVRaVZNQY8FMWJDJ13SzapCPo5q14yNOzoEJlojYrEPJf3TTbTN5re
	 26IJDfzrBcJd2rweUqaegBNqb9zan5N+wxz6jJjw5vMyt64/HuAvFoKY6j/f+yKo3WrcG
	 eT8TH3Nke/wz0RAbHBFOskdLPHMkd0WAUTwnEoN5GN5BJ8fS93R8TuYz/ow9QNHeO5V8x
	 uHZn8a1FTaKZKFmo55akKxwpqFlY7Ur2iPGZkcWufz90i5lqFcb7eDQOkG00rTKN/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r5rkylK0kmxNPJjElKiNQWgQc8hm3aYSqsTEmAj7cWY=;
	b=r6URDNLJd81j6yXQtNclri9a+jqYXfS/D94gED3SWJ120qLxLuhpab/B3YO4Vw4JwdBY
	 gtDfE7qq6FEqRVfO2n4EjQO2iAZrvlGwC1j3l0pliljRPu3NiAUaEZSMAnCmGZEgRiNJ2
	 Ec0OS4eeH21DL8tqKBT1BaSWQrc9D/2jiU0gfAVfocV1VS2Qa8gaNtGPgrXhQeZqFE3AH
	 +8h6eZIWoy2Ej5JG2auxorcW+Va7SyO+5zvI4hyRQ2kEbNzYwyYw/JKcxA6seeiAKyhDi
	 7QTW8l92N7cfN144dNbAlNf+NYSfhclm3jHgaPU4TMWFy3r+wRbY0U05ftweew8x//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MXZF5KO;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0D3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MXZF5KO
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so421411666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009589; x=1795614389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5rkylK0kmxNPJjElKiNQWgQc8hm3aYSqsTEmAj7cWY=;
        b=0MXZF5KOwiqwOAzMhO7D4kY65eEcZmRgLYINH0+Lr2BNsVJSqQWl2rMOvgIJ8QC1vR
         sIDh2/aNdFWd43gznbGMcDtBaqKgndsJyYBp+bGq/RRh4yQlvO5+tE7CC4P/bHaxNJya
         VgPBv2HrHksg1mxF02hSenGYzVqRQHOqiqkuaOuI332dGM7Fk5qz/LKcVexiKyH/cXQ3
         5OinlWnek5KA0+87MSZ7+YSPJ++Oz623wWPen2LpLSInUtQEmW9IUU/uLRZyqZThNA4o
         b9EGShylrHVpMe8TZ9gZWEVCUzR8CLeybdFDIIEGfzQY8G2sXtbd5Wp0+aw9Ez+GTYwk
         1OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009589; x=1795614389;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5rkylK0kmxNPJjElKiNQWgQc8hm3aYSqsTEmAj7cWY=;
        b=o5TX6XpCAfrw0GOWKeyjZIXdRJee+sQ5W/53VUPb8L5uUF+9aIa3BtdE/RUi6NF4EF
         VvCpPmv8nXZQiPi+qKQvsZ7jRLr2i/8TGb5YvWGhjclbOdJu0Gj3NZaopQFdaqDvZrnx
         vnb5u0IgQ9JIcBHjzZN413EvryOTPpKttBHNaY13Mz75HYPKQFuFkJGJaS3X4gFESJ6d
         Z3P14jHJe06QqshFa2djlWIGHwhxJqsuk14Qp8GIEjXwWf6scbbRYG1Xa3R2LvbFtybY
         cXVBChuPl+kFQEtTsy7Bp+834E4xBr8o6sD6Uh/Psc4DXKeH0WG7bWdLw17idhsWV0BO
         mdzA==
X-Forwarded-Encrypted: i=1; AL+hErEzimmigFY5Imb+t7yY8g4jEzjOYnfzXNBHjpaCyvAfezuc6XfCkmKZ9dLaE9DOvNQ9KiHIwmIQZAuXanY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pNO1LHHxgd0zQlND2EwSXRBO/4508hHVJHkdsA3Fl9P44CKf0
	E04gUa/MS77Bizk6XgaSV0hdSxSrP+hJQnzV04i4JZA/BOH24zMAhm0d
X-Gm-Gg: AYBFou3WpM1Z/ulX1peAmTqLFrrSWeB/9Bv8UbfhKHnpFrCsKeT6F7vPtgfp+BH+ITM
	WQi8LT+Jn18YWySHDldrLgAHj3O0X5SkKZQXJAfztaEtB7cXFR5ujU8j4x+B5RfUXxsPGCRlU6+
	9xEmLCrwjOQKM96EirUKFj1hJSYR1Ue6ryi1eT08E5uTB9SmGM6cGt50vUodHSeTZZK2EErO5rJ
	0QUbr5RLSnEHYaFxP0hZV869c9rOSUWDChlOPViETJbBwJyyFOVGzQQ02lBd9a2C+B8LDo+oWQT
	uP+fbnMNLUrOopf/0+EW47DKwSkkigBpBS/4+2UfwS/DYuawohwhHqa6eexVgeQ1llWNDePww3b
	AJF+YvHpsDsBUCh/7df5snX5iOp2cR8WPqSEChiSyunijdq5TLas9usPgxZ8PVysyltFu33qaKU
	SYCQCB4oLfDyuScjzoCRbc3qfiYYOWncFOfZ4pzsrL3oO6C3fDlj+wYbsNUw6aoShFN2f6XQy80
	khHemaCSBpw+rdIdSaFVKr2j+jA41+fBewqBmeFzmFf3iX/hsrNdA5OCkyanPVoWB7lcSZJHL7f
	WVv4/a3NSQeGRAJO2cpa9uaAr812r68VYWIX2IKCNeC9+gOsZZfUqTtW2BD2q7j3sNOeZ9ipUZ5
	emwIMiXkElQ==
X-Received: by 2002:a17:907:72cb:b0:c50:8612:d441 with SMTP id a640c23a62f3a-c510e39c4ecmr254203666b.21.1795009589188;
        Wed, 18 Nov 2026 05:46:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab33aasm95461766b.52.2026.11.18.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:46:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] platform/asus: Add driver for ASUS Transformer's Dock
Date: Wed, 18 Nov 2026 15:45:45 +0200
Message-ID: <20261118134555.195479-1-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASUS Transformer dock used by Tegra-based devices has an extended I2C
bus where certain devices are hot-pluggable and their presence
is indicated by a GPIO line. The set of hot-pluggable devices must be
predetermined and static.

Tegra20 and Tegra30 Transformers have EC and dockram clients on this line,
while TF600T and Tegra114 Transformers have hid-over-i2c keyboard,
touchpad and EC here.

I have tried to submit this patch in more generic way, but I was rejected.
More details: https://lore.kernel.org/lkml/20251013060018.43851-1-clamor95@gmail.com/

Michał Mirosław (1):
  platform/asus: Add driver for ASUS Transformer's Dock of Tegra based
    devices

Svyatoslav Ryhel (1):
  dt-bindings: i2c: Document ASUS Transformer's Dock

 .../bindings/i2c/asus,transformer-dock.yaml   |  56 ++++
 drivers/platform/asus/Kconfig                 |  11 +
 drivers/platform/asus/Makefile                |   1 +
 drivers/platform/asus/asus-transformer-dock.c | 260 ++++++++++++++++++
 4 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
 create mode 100644 drivers/platform/asus/asus-transformer-dock.c

-- 
2.53.0

