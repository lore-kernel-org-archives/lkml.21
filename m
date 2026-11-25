Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588337;
	b=vydWc8r+pzhsVlEMroJy7Q6c+2hpt0Eh/IlGASnpPrzbZr/ZjAft4ALJvnDsbqaMKOAx
	 RB65giB5W9uxicg+5g1cq1TFn0thBvyYiUbaFC5LHbiw1OOnvol/XSztTzXk+VJRHx7pg
	 mveAnqc84xRlhlGr7I77xySfQyh++XdAXCJeNgR3ZTc76EMKEP+j3m14KRgQS8nZiThj/
	 qN5wbgafcaZl/P5zLSzTXQj4oo4OYu7oIQBkVaxgJ3oxqXdXxx7fsscgpk/MwHMAckS8s
	 Xlx96Lkzk5gyIFIL7ihYSnhuB+giMEbVPSDGtniXsvWXl6+XKhkUHqbgLLa0mYV/p0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KHXzp+84iLQUjnjlG0As4PHmQ5NglIl63AJkWeb4QbE=;
	b=2pZyk7UV/OJORotyVQnOU7NZcm4cZMTTFCYn1FUjf/GjVoaVHbBee42McXF6c0LaGOtG
	 WgXFJPNf52uG220qYpQuV2FIrsxkkKQNVxSX1AOGIpwo51+ZAN2PZdsgwyEzhZDMgDDxu
	 XjKSb5QerHqq09VdQvU+BjnIdq8Efg1XEr94CGxd0cfrvKaATc1UOa4YOdmSZ6pSqphUh
	 RMnnwniAaad9WjVDm6tfIMbGtYyE5bu42dwyBCHGT480ul0Q15PA/40mAM0xtVgwk+VdW
	 7vr9Sw36Hxvyn4Yf5v2OAYaeLqnWpbzvI8QZTB/wJMb7YCB+bVm0iOwh0xJtDWLlDvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WqNWpXUL;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E39A606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E39A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WqNWpXUL
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f09a37f41dso26947185ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795588337; x=1796193137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KHXzp+84iLQUjnjlG0As4PHmQ5NglIl63AJkWeb4QbE=;
        b=WqNWpXULC+EIH0Lll03C1uAj8+QrlYSD6zZ6l5JmPh/M1qVqVhFjKf1DAP/h0XH+KH
         cMte7N7XbzS/N9OvTXLLoC+sGA5G2xbShvF+4cJj6tEInwRWNttMVGBqz2glvCS+dMfJ
         d0q+4YWI79W4lv5g+HPVVgbHZzwo33ECEMwke6VxTFjmA2MukGUWh3u/jPuwibwGjKyU
         hwX9fyZBFP1YFHmsNAJA5jd9as88utou1zUXya0zQhjhZnPciF0hhW5RWJOUMIwnuLBq
         ppPhhUM5AMRpFaGN67H1TejRcGStauT42VkuhlENdmrQrqD19o0xkHW1r20Awb6H/Btr
         q6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795588337; x=1796193137;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHXzp+84iLQUjnjlG0As4PHmQ5NglIl63AJkWeb4QbE=;
        b=02L5u+1KqKyd5H9oIhZU4PuEva8sbxwmVYWxpRwry3sQDcIVOvUhh0lAd/FGSBhkXk
         B3R7M7S2CbdvdeKtyFHREgGP2t1jYWKqQDcCgDfKVXhpEARYJPguHyibPGsc9jGOpHjm
         W2ijm805ok4f75753RclLvMM8iU5EFIiRntF8ekn6U4E9yDFg3fRGbs26wQ5g2bWyy07
         Lb3clKD1YYRvidvroYNuDNa85WWMwJ0cTXL/5JEpiRvmVAhQ+E3stLLY0zh0X7AV3Zgg
         BvVvq39WdVwxuZ8pF4cMIdhP8KhHmUBIi53T9X8e1aUgz1ucn/HMHD2Ce1uJzjOjIGix
         vOYw==
X-Forwarded-Encrypted: i=1; AL+hErGqdftEmpik/sH0bCIvgHn8PCKplr42E1uLr4aOqn+NQ8nrcw6XO8x8kUfQ69HSnhweGKrDNUiixcZIfGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L/nzBgO0kvYWYorg4HcL2mjiS/NNGlFiFxIs8IiYNuFjpK8mN
	9eSwlg2mn1CP+P1FiUuAtes8TpviMrBtNH6hsdbIjML/yNq5SylYbx60QnQwYOrAQrzLSh8Jos4
	L/EWhYLIW3WDNSbzAF7FH2Z0eh1Zbcmuieg==
X-Received: from plbms15.prod.google.com ([2002:a17:903:acf:b0:2e1:326b:da73])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:19cb:b0:2ed:2856:6442 with SMTP id d9443c01a7336-2f03f1eaa0fmr179076345ad.28.1795588336373;
 Tue, 24 Nov 2026 22:32:16 -0800 (PST)
Date: Wed, 25 Nov 2026 06:32:15 +0000
In-Reply-To: <20261125002808.GA1198022@bhelgaas>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
 <20261110002437.2376944-1-rathodpriyank@google.com> <20261124174411.4183038-1-rathodpriyank@google.com>
 <20261125002808.GA1198022@bhelgaas>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125063215.1499950-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Thanks =E2=80=94 I have rebased the series onto v7.4-rc1 and just posted it=
 as v8:
https://lore.kernel.org/r/20261125-pcie-link-endpoints-v8-0-19d49c17c05f@go=
ogle.com

(There are no dependencies on anything in pci/next beyond v7.4-rc1;
drivers/pci/pcie/Kconfig just has a minor context difference in pci/next
after the PCIE_EDR cleanup.)

Thanks,
Priyank
