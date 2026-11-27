Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795740546;
	b=u87wje2AIQZTqbqq5rSIKqH6zUKL3qsFjnrUkkVVTKLVK/K5wTFAQefYYeTSK9XEMtKw
	 3jkif8n97jaKmOBWmNd4+wYZ8q4Rk+pOyytoLBLSvFdmYoKL7bfnjc/1njoseW4Jfv0cK
	 X20c9RfGqSLy5HSdhg8EnceIYOwJaYTE3E/5kqxoGodU4Lceyn430IaJO05WyY1ukueU3
	 fQLlgICA7Zgzv6HWkfwIIguv77FAenx3s6SCVMmXXaWxzLljTrcqPlP1ADQv9mTqarIUh
	 enKlsJN3X636Uuskk7+JMeSsgftGB3tJ+el8Nitvzf4KrBIwsOp5c0Dwx6vM4MoZLsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0snGaQWC19GTFkILdN/2yzoYXzCXLuGVq7u3ACjroNQ=;
	b=Zv7LwGlNoky79HTd21WdjDNs+9P0fE6kZD/1ESbRbBQdSqigNqm+eINqno8L8050RI0z
	 iHWleAyfvdbgCAdKJfGMu/Ur20vX20g07KHZ/JSrpJMIqp7xiSkorHp4dVlDNhx5bGwsf
	 /WuhbsBJmeejJwFwdeDaekzHpqnCtFVVOBB8zGoBBG99W5A+wi6Q2bY/wy+8+D/mznktE
	 26criXIXTkLe6D/NsC3GNGROuX8eTaqRK1Dh1pBE4Z0PaE5HF3mqC29QHipc2Stof5vfN
	 kN+2ghB+uD9YGwzfGI8J59kMuZqsBn87nPnNObmZp9+Dd6+LgrOxa8aVpcBykNK1Tng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCpcu3t9;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCpcu3t9
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so10143890eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795740545; x=1796345345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0snGaQWC19GTFkILdN/2yzoYXzCXLuGVq7u3ACjroNQ=;
        b=dCpcu3t9NAFZX1Piwjr7XMeu+OO3Blu1bs20zIWVhdaLtpPImOO6pnEYSt2gb78gMa
         Smszd08Y5TMA95ZzQTu8dGYRHG6vTl5bjgrpJvPq/yxB2UbSxf9gDQf7ZCnkz+FmGcl8
         jKgnmPPMByKIzveGKyxhDjvfLidC4RAEef6fwESvLUv3YTVEOm8UueJwn24bn2nVji0T
         WtU/8T1rDorc/23RxybhDMfaSuX2JTuibhPUKUpw2SHdnxWx9+gjDIfq1D90UGcJ3S5t
         4eTsquUiRz4f/DPM+5MBF62Oy07yl3NZSMSfWpqF7BhhbLUPP9ACWVN6njydtSCSviC3
         ziZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795740545; x=1796345345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0snGaQWC19GTFkILdN/2yzoYXzCXLuGVq7u3ACjroNQ=;
        b=UxwqrGccy1i9v6AjZBfCcZUHwKfxjpQaj5OhDW9UeCeCIWxvMaX0c/be5CirRPlKlb
         /cn//FgmQdcfzDfq0F5UCrO9fwIzjRcFR3FbZczClx0fRv58zvlXQEkq/VZGAHfIY0KR
         uwFPnChPBnPaQKOusAiZq/MeNnlgEFj1k+swR21C6exGPWHrM/CuKU3yjTDksqd7M+oD
         Z9Xyl0Vs3Z1DWST0Lg7j8amaW+YX267RD60JS9EeYf94RCz2zDt8gUUXLmTkNc5hBA9b
         u/jH/Ru0mqkBo/kcZc3hNyTXrtnO+tEmS/WDPJkCZCfh6c5pKFhC9hL6ZXjGexmKtTVw
         qYvQ==
X-Forwarded-Encrypted: i=1; AL+hErEAxrz03BxUovq6xc4kUbZlMWvqITnFK5hOiQIamSyu1WfQvzsP961Q8UDUwTatjLi+5KHfkZOoJAVGTsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oCjqgT9eZRrHzcEkczkxZT+UcS93Drk+zbgfz1QtvX9idGQQK
	rxSZhF1yPs0BjN2+Dzs7AzKP9tL9i6zpJqR40PmhPYcs6/NyeangUPn3
X-Gm-Gg: AZFdTZcr/5jrLYHiGzaWyDltmRqJK3PsrqgkA1lNuoeTOrElUaFK6N3jndNjJsR1TR3
	eXvyPfsngHWbby28poF3UDr9oIyiSVZL2B+utfknFvdQs1WA9a1CPM2FbhnfsarB0uLVtA1Vyt6
	bcR63n/VQGA1Ffvx/krEvxhWjzpOQB9n51MiePcs14al1DFbD8IUgBIvowpU4g5hlE2EbmK3yKa
	ZtGFJB7tT5NB/LZC4sLoUlDzKXo5qD+Dkla1DQpnUJbPKB7ofUCSkg28rwfr5Gqa5o7pnJK6U5s
	6nyBvRM3Bg2XUzXiCEapjmbXOw9vVGCZa8abaUJF87tbgw8ShrpwFFcSCi86b9JFeoToxDi2l1Z
	RfPpXe1XxbryXfBnGCH2YARJ+r4XUePlOjP/OG++75EL7agufkBz1Vr8vuEsIZ/D0nMWjdMcwp4
	XrTFwJdohNaBoRvhMw12qNSfPc3/jOOGCq9JfKMic05J3/AeeW0CzV72FDFAAMYuBgm0eRgbHjc
	TeEOUcIQ/o3sL2MKOJ/b3O63mpauobg+ojdbOLUAUb9oBbIi5bcv2twZgcZx6ByxcKQwYKtJ1g1
	M6NUwVPZAD66FjxugF/TmsPSE7G6iGk=
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr12202728eec.2.1795740544685;
        Thu, 26 Nov 2026 16:49:04 -0800 (PST)
Received: from penguine ([157.15.89.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm69566770eec.6.2026.11.26.16.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:49:04 -0800 (PST)
From: Swapnil Shinde <shindeswapnil028@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Swapnil Shinde <shindeswapnil028@gmail.com>
Subject: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts on shutdown
Date: Fri, 27 Nov 2026 06:18:22 +0530
Message-ID: <20261127004822.8536-1-shindeswapnil028@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Currently rtw_pci_shutdown() invokes chip->ops->shutdown() and
immediately transitions the device to PCI_D3hot without powering off
the MAC or disabling PCI interrupts when RTW_FLAG_POWERON is active.

On RTL8723DE combo cards, leaving the MAC powered across a warm reset
causes REG_APS_FSMCO polling (offset 0x5, mask 0x1) to time out with
-EBUSY (-16) on the next boot. Power off the MAC under rtwdev->mutex
and disable PCI interrupts before entering PCI_D3hot.

Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f51..b0bbb9397 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1949,14 +1949,29 @@ void rtw_pci_shutdown(struct pci_dev *pdev)
 {
 	struct ieee80211_hw *hw = pci_get_drvdata(pdev);
 	struct rtw_dev *rtwdev;
+	struct rtw_pci *rtwpci;
 	const struct rtw_chip_info *chip;
 
 	if (!hw)
 		return;
 
 	rtwdev = hw->priv;
+	rtwpci = (struct rtw_pci *)rtwdev->priv;
 	chip = rtwdev->chip;
 
+	mutex_lock(&rtwdev->mutex);
+	if (test_bit(RTW_FLAG_POWERON, rtwdev->flags)) {
+		clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
+		clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
+		rtw_power_off(rtwdev);
+		clear_bit(RTW_FLAG_POWERON, rtwdev->flags);
+	} else {
+		rtw_hci_link_ps(rtwdev, false);
+	}
+	mutex_unlock(&rtwdev->mutex);
+
+	rtw_pci_disable_interrupt(rtwdev, rtwpci);
+
 	if (chip->ops->shutdown)
 		chip->ops->shutdown(rtwdev);
 
-- 
2.56.0

