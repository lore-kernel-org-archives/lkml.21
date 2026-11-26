Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697293;
	b=k2SWnAMr+PUpxzJzn3L843ndECpn49HaP0E+NToPwwUcI8CrZFl7X5Nc6kzMX2LKKT8b
	 L6CMeByuiVnmhtVVTwV4RnPWalkb7CdCFleysV1oV6Q+tAIk/Cu8hEDYfj7CgFrEmd3pw
	 qWROCL8BW7h2bThG99V+tNDJNNTs2e4FxYsyWX4UuZTftLKIvkDTDW/wfMqJcuXfl7eL3
	 De61d9sLVrXxspKO95Mo3Fhd0/XodDFg4YZiWBbI1VggvvXzf88wlHnlg9qvMMl/0amyn
	 mJRSB0zULJFgP7K5k6pk0gnNkwxVovz8XP5LGId1ZVBQ6/JiD+3rSb4diRwka82letw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8UXmhjzmrSz9c7UGZC3PvW2Va1zzLFwfvXp87xtgrDI=;
	b=VNj1Jywl/LGaPolN3PHOLSQWZOQphDlUQvLAFolSLooHI23eA5jNH/sDU5KIzkSVmuE1
	 GVN644OCEPWh9zW5dD70oTEzqKu4AIZw+ncmsPzxNKdosw8saZEl9WPkG5fwb/K07teOS
	 upbdfxwdEc7TD2zGRs0nQzYOOpu+oDLGree+wSID7nJhZlWSepRcFdcWNTyhjEUritddC
	 Rq0y0ykFPxayIFMNTzckhTD83Vk3GBq7Pxw9EdN0vrFF4lXhxtVlJuTDonrxatU2pAO/H
	 dGv/T5q/xWIjK951dT255Atc5rYd+pQa8aKnxSwKqM+SakKtY0j55krg+/8QrfpXe3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRd6IM2n;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBF3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRd6IM2n
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b497279c25so2038825a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697292; x=1796302092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UXmhjzmrSz9c7UGZC3PvW2Va1zzLFwfvXp87xtgrDI=;
        b=NRd6IM2nMKDbRQaG0Ara5j45MRa5HNcGGGOv9QmXi88i3V4kx9O1RUtaft1LqiJHKU
         oRzc7zM5wNS0f1gbek0tsZZu857dTzMgDfwsr9x99nsBtV5aZvZ2yZR3bM6mcy/S490z
         EgGm87JPBxho7Asm2iGgyZCcpq94GXlUnNbXcGqdXzxTj/VkouXfSbPdcPCTk6YkHvSy
         NDqDNMcI9GQfNqCl0PwwiD92MgpBkhlPav0oJbv3dVOf4WuW/NSctBO+YSYpD/TXqW72
         hk9qomN8IK5prBkHJWqNbdK9er0jKAMf4uJLmdJmFktcYM2qmVvPyy0yN92tw1PQFhP+
         BgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697292; x=1796302092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UXmhjzmrSz9c7UGZC3PvW2Va1zzLFwfvXp87xtgrDI=;
        b=tcG/4f57KQV1g4L5fXMooKH5RPbCFv1QHfPir/MGG8SnK5qb+jnuqh5mbttHXvLa3U
         EZAnrqBlM/HiOLr4DDokI5mvWGeoC893HOezIrUXthMBPnYuBGCTHj3VYMN3TESq6dAF
         3VKWOe5kgoutt7jHtjRIz1DXMWeQu+vNARyqweAxMAvrYoykoas35ToTYqeQEhVTnjUC
         QxWAYkpDgtYSsg7WBBoVpcuESg7ctrF8qrbZmqjS/NsZ2O0P6OK1l5RuCh4r3+LWXjzV
         rbJfvEXIKjDV5OOScoZNDxn5fejXUCIJGtOyuLexUj55vmnNN9YCwZURKN4MyO23xrsP
         XfXA==
X-Forwarded-Encrypted: i=1; AL+hErGOhqOkFk05hHeNr0Xo/Z5/CrxnHSe+4cIaF0EPzQh1FeXthsMf148HLLyorihmd2QCfngBG5KTYRcXUCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81lxA4Sdj1k+CwJgQGReNPTy6wjU89JqRYWr/UawcPagaNgk7D
	oDpcMTgKjvjAhSeAzDSR/Ih/RcI3r9SXrW2ONCN4erlHzN3lcDgNmFiwmcztKCXlU2HS5g==
X-Gm-Gg: AZFdTZfh0lboVNuOEdn87nIXSC9va2TmN4uDw0S094j381dA0J4cbLaBX1A7eBfLlID
	KXAwVo5E7Wp+CbImFXnowc8f2w7ykmoiO9Kz/KCjTSfIMD3R7umXryevwmUMke1DLfceagYdNOO
	4oERk/tcEE3F/eDU2OrScaniTCdaOfjGDpitw3D8U7Am8itf6fBkRc7I7wyLJKv+WeikN1yxZkb
	Z5UYaskV6bzJqqg6SwGjQzGlaGhJN6njmGnd//MaI53gNLpIJfJMCb9ENjX6GFfXprp6qvPMk6Y
	IfLmrmwU82Mq1QRQbI1hQsFZUbJs1+XzQMK9GaCKYINjzjIkGCH3NUn9vAX6gmOO+F+7UoiSYoa
	a/zgjWeAqmA5s9eLLbX6Gu6o7grcubxwPX7oU6Co5HIkaVLpk1TbsrbCk+cmCamcVBf8agAFNsx
	UzOc7250PzbEoqCrAjf2WJbRygdH+lYUWnMyB4ul+AqPamf6+Epcv6xndk8TtkTt08SDcoismLF
	HcM+nTImDv4Veqo7lVSR2bGP2fG5EPdcsNxSfXnyfkPR6cRXCFuwQD17cZBK4+GAuR2hjnVM7sy
	F2cW+Zb+ZWBKeEI6MQ4BvsmPKAx3E7hMPBaicHNWylftBY8TN4P+ym4ixhE=
X-Received: by 2002:a17:90a:e705:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b41c7e127cmr20237965a91.3.1795697292077;
        Thu, 26 Nov 2026 04:48:12 -0800 (PST)
Received: from amax.cluster.local ([115.233.223.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d1361fsm35201528a91.6.2026.11.26.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:48:11 -0800 (PST)
From: l1za0.sec@gmail.com
To: Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haocheng Yu <l1za0.sec@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: cdev: fix memory leak in lineinfo_changed_notify
Date: Thu, 26 Nov 2026 20:47:51 +0800
Message-Id: <20261126124751.3184158-1-l1za0.sec@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
References: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
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

From: Haocheng Yu <l1za0.sec@gmail.com>

Commit 1feb5d39b05a ("gpio: cdev: fix kernel stack leak to
user-space in error path") made gpio_desc_to_lineinfo() return an error
when the GPIO chip guard cannot be acquired, introducing a new error
path in lineinfo_changed_notify().

This error path can be reached when a watched line changes state while
its GPIO chip is being removed. The state-change path may decide to
emit a notification while the chip is still present, but before
gpio_desc_to_lineinfo() enters its own SRCU read-side critical section,
gpiochip_remove() may clear gdev->chip. The newly acquired chip guard
then observes a NULL chip and gpio_desc_to_lineinfo() returns -ENODEV.
Driver unbind, hot-unplug, or device-tree overlay removal can create
this race with line request, release, or configuration changes.

At this point lineinfo_changed_notify() drops the file reference and
returns, but it neither frees the newly allocated notification context
nor queues the work that normally takes ownership of and frees it.

Free the context before returning to avoid leaking it whenever the race 
is hit.

Fixes: 1feb5d39b05a ("gpio: cdev: fix kernel stack leak to user-space in error path")
Cc: stable@vger.kernel.org
Signed-off-by: Haocheng Yu <l1za0.sec@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 5d53bfcdf726..1146198415f8 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2535,6 +2535,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	ret = gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
 	if (ret) {
 		fput(fp);
+		kfree(ctx);
 		return NOTIFY_DONE;
 	}
 
-- 
2.43.0
