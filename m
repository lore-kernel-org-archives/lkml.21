Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768688;
	b=KKeYZ1PHV7SHs0kx41y71u0fwxDud3lJeZPC0/l4dCq5950y3ohl5TSC9eJ7AUYdoxO0
	 XDuEMpMhoAO4wnUFLX0h03sslW/SergkN2h61BfAWZBB9Ja4CFnZbc5morYjbnirCwlL5
	 PzbIYlpIHxnPx4+pDi9Sv2Jj/89IFImyX5j1ToTncJ/u4YosV80hV+eM+ACn7TuVE+E6N
	 FpossrpkXAyEs0+hSuQk3HRssXDCeVZ2/p4u3TSuBHr2bPHw9jOdhrjGGIWPDbLFqT8pe
	 WDk+IZGJuxDPvnSibTRyHKV4+Er+z/S9zARXpbPgR5hdraQqO3tykZV/vqYbRgRaNZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JpYk4m7u55uBxRHVd1S/r6n3Zj8g95nbpdebQK3UB/Y=;
	b=xN1Y+bm8qw/oaTHPKhuBmmDP4vcYROpzlnfq9YFdybcx7Ywd13CGtthRIdL6GFZF3Ahf
	 jgWcZGQgxEwctm3OL6Ljj/WW6a6C7hGFOESu+wY7c952o3AbzB6YbDjAYvRJ9hAENHYfj
	 P6T+UhaSP6vck4H5zUMb5demCxb+YOPh24i/iHRv+p0Eal4grwMyH8rq8tSG6CsW68K1k
	 AQiZkG0bDFINBRnJtfx1N8zdTGgU0E0gywVmiFtfMWBC9O0taZCvw1TwcUU3zb9pK2fmq
	 bcwFS0jL61h59cCqHmkvmSG5HiaeRnm356CfxE8CIIMR7BWLRU5gkhceq3EtTS1kIRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNRqIf1s;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6D606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A6D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNRqIf1s
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so11685960c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768687; x=1796373487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpYk4m7u55uBxRHVd1S/r6n3Zj8g95nbpdebQK3UB/Y=;
        b=tNRqIf1sjQlfAZe1ySVZiu1K2Y1XjHcGVQ3L8NG4R2HmlEkVnNJa2B7JUha285HPZg
         /SvLgzNEKoDliF+GIyIPMZYQKFn1Ab63SOKtPYsYhQYhxlr0MKUB6DEXbwrp9BGOwQ/2
         3k6spwYQGObRvGMERhqU2+uog9qLp2mgTIvSLawb97rIPr9IXihR0LqNq+Zp0vcEQmye
         SEXARI6bK7lUJwgeb2bZ/OupJL47QzvM2UVcKe78b0Eggqma8QSWATmfOwQ63qXE7Y5o
         n74ZPOruBU7ISpC+duzcP5Z+KF/865kkXgtbtpeDcjgqxzp5IN5rH3h1S4FB4RLgjsIg
         TTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768687; x=1796373487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpYk4m7u55uBxRHVd1S/r6n3Zj8g95nbpdebQK3UB/Y=;
        b=UCSc2NXX8/vdmeAAyo4ssQysfa6tIJxPFkUz1fg7mxlFyxc8yoWtPnZ5IQk9COyzvP
         aUcw0wXHebB21qhs0FJ0Fd0tGTGDI+n0U2FqjxjgWiFbaQRffiJAI35GM1hA3//7dv37
         GN/3qD/oFcgO0hYmgS4QB8wgjwclV8Eb/MuWSKwp2VP7IZ8plK+4ZzxmjZxMsCsnWOSI
         TbiS6pno3z6QHQWY6ppvyXaJ5Q49gr+OqNmWrzUDqP0roypRXVnngXt/xWE+EcjmGbx0
         t9KBp0YWMLgo808pZ0/tUy91y+ISj8Yrx/uytSt78AfMBdmpVgzllIHkTjTWWY3AoEn4
         12fw==
X-Forwarded-Encrypted: i=1; AL+hErHqIAeR6ZpAFHQwgmZ95P1fArc9d6JUC+pFzoOPjiKVJXaY7syDz9acWOsFGPuHBcHz2GHF2804y6TLaKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/50xpAGEX5a+nwL3CgZy18oCYBY37kR/hraNYUabQM1drX0dUt
	Nbu3B3h/sFbufFGh8M4NeHCBui9csQSseRiugCG/oVNX8EhWuPoWtvb5
X-Gm-Gg: AZFdTZdxKqTAtZw/djo1YuFAkB8UlFLJwWC0+atLgzhsJbSjlYU9Uxq9YyfX02WTVb9
	voTmao4HwdoY2wXDeCa1P5T2/eu2pobIJ/NdmvaI5sS5gRTG84YfxExHXxWJgx2iXUmersUcKSq
	zxlxQTWoQjf4MKjbO1m2V4HCRcfeqxTw/hqF+xGZJVcx7UP8c0g6pMst5/nps+0S1lq8zfNk7I4
	b/OLaTPgJaxDHcdgPcQVOMNJFrJ0KucCcb7RS19GqR+neWNalbUgFAMZoA4W8tNpi/xPCZuxxth
	UADfKqYEVaT9qhJThHBiz6la82X66bOMaLlLb1xHGSzUiUd2k1MaMf/7wuyJZQS76o2La73HV9S
	shAax9GV5cGmoXipYgsRQY3hbai4X6iJdbgvkRW6Ybld8WMxhqDel3zXXP0zccDK0M51BNKctPe
	fTeG/zGlIwnPX1pmlQTope/gGT+GxOSIo6I1oSq7vvIU7piXeO300NSQ6ou/HuvMDwFykhEaIRL
	+pAFAV0Vai2Tb9J50fPgXG6OdGd5vV7QZgorECtb/g9bc7Hw5+cQQQKFxFKdZYWQX3ZIkFnQqiu
	X1LzDsCkoB2kV5AXw2Twc9CpVh9Icbk=
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr22380158eec.32.1795768687424;
        Fri, 27 Nov 2026 00:38:07 -0800 (PST)
Received: from penguine ([157.15.89.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm65793244eec.7.2026.11.27.00.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:38:06 -0800 (PST)
From: Swapnil Shinde <shindeswapnil028@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Swapnil Shinde <shindeswapnil028@gmail.com>
Subject: [PATCH v2] wifi: rtw88: pci: Enter IPS before PCI_D3hot on shutdown
Date: Fri, 27 Nov 2026 14:07:29 +0530
Message-ID: <20261127083729.7030-1-shindeswapnil028@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127004822.8536-1-shindeswapnil028@gmail.com>
References: <20261127004822.8536-1-shindeswapnil028@gmail.com>
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
immediately transitions the device to PCI_D3hot without stopping the
firmware/MAC or notifying Bluetooth coexistence when RTW_FLAG_POWERON
is active.

On RTL8723DE combo cards, leaving the MAC active across a warm reset
causes REG_APS_FSMCO polling (offset 0x5, mask 0x1) to time out with
-EBUSY (-16) on the next boot. Export rtw_enter_ips() and invoke it
under rtwdev->mutex before entering PCI_D3hot so the driver notifies
COEX_IPS_ENTER, stops the core/MAC, and enters PCIe link power save.

---
Changes in v2:
- Call rtw_enter_ips() under rtwdev->mutex instead of manually clearing
  internal flags and calling rtw_power_off() (suggested by Ping-Ke Shih).
- Export rtw_enter_ips() in ps.c so rtw88_pci can invoke it.
- Note on commits 05202746ed70 and 44492e70adc8: neither alone resolves
  the warm-reboot failure on RTL8723DE because 05202746ed70 only sets
  BIT_USB_SUS_DIS in REG_HCI_OPT_CTRL without powering down the Wi-Fi
  MAC, and 44492e70adc8 puts PCI into PCI_D3hot while the MAC is still
  powered on. Calling rtw_enter_ips() before PCI_D3hot fixes the MAC
  shutdown cleanly while keeping both commits intact.

Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 4 ++++
 drivers/net/wireless/realtek/rtw88/ps.c  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f..ecf954d 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1960,6 +1960,10 @@ void rtw_pci_shutdown(struct pci_dev *pdev)
 	if (chip->ops->shutdown)
 		chip->ops->shutdown(rtwdev);
 
+	mutex_lock(&rtwdev->mutex);
+	rtw_enter_ips(rtwdev);
+	mutex_unlock(&rtwdev->mutex);
+
 	pci_set_power_state(pdev, PCI_D3hot);
 }
 EXPORT_SYMBOL(rtw_pci_shutdown);
diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index add5a20..41a13d9 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -36,6 +36,7 @@ int rtw_enter_ips(struct rtw_dev *rtwdev)
 
 	return 0;
 }
+EXPORT_SYMBOL(rtw_enter_ips);
 
 static void rtw_restore_port_cfg_iter(void *data, struct ieee80211_vif *vif)
 {
-- 
2.56.0

