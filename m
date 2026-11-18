Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975869;
	b=qUoO0Znj5WPV2Fr1uFUDd2aFxBYA2y+ECEC9VRoeQEbzUviMKxhqqHLosK0n9NVI6o1g
	 IyPajWzcButviOxhyttCaDQhoQbZeiPfcgyixqBApFoOU4H2Pfz+cPUDsvdSkSTU0q23A
	 hJ3ucqGUBW1ZfSqAPM8l9742Y22Pc5xA/D9385LX+KcLqyNATW8GlCH9EfXkbtaAa2dfM
	 YQ6nbDk/f9Ru+V0ODmdw2KiVNzx+2JPIV6r7JlOWRjvlMt3PNuaqU3co5fC9tf8Z1u3UP
	 xI9V+6JpIQosri/sbNXkmirEY2bdore/J3TK2xjVCRzedWa2Dp/TTPE4uAnxWB7QV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975869;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=lGriT5mvGmwLjZVhyWJORLnWv5py1JwCn14OrwKl/ns=;
	b=uPSVjMMqZAgXnpWxeLH5a0KHZJJ/Y7dGEoRR9qhY4i2JAIYTrWNXUoeNV10LymNeGHjj
	 CBiVxru7NiL/KCRNjGWSQ2lPzWFQS0/kmpLyXXkXS8pHNvZ7y3ffq/Kv/FKTMl86OpYOr
	 4NYuPwLEyeQUFmF4cQWydx1tcZfEzctIxPjRcqqg4wpCsl8twOf71vqS8oxKwevBvEj3Z
	 tLLcXH2Vff8emsYKvEICLliJwuGUQ9ut2uZpdPiIy7W6VQmvXVi+jB856zCivddzVpCRc
	 NhNMVAUYb20wx2+hXKStQ0/AdG4gG8uKdpbr3gF3AbMqgn3ZL1Ce4Xg0TRoORfe2j0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZkvXRGQy;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880C8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 880C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZkvXRGQy
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id TRDgxY7rAVK9UTXDhxEYX4; Wed, 18 Nov 2026 04:24:29 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TXDgx9PiqGh2BTXDgx1YVo; Wed, 18 Nov 2026 04:24:28 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6afd287c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Byx-y9mGAAAA:8
 a=bFsclcQv4yI7B98-yzEA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lGriT5mvGmwLjZVhyWJORLnWv5py1JwCn14OrwKl/ns=; b=ZkvXRGQyU0Wzkfafy1hMVHyBGu
	HCriZteRWNHQit/5wA01C7TLyBVGK2iOveswT90ziJ2AfriLIUXMGCGTwlBnNsaDRorcqjItIFQW2
	a5bmgGt2lfTj8ShHcmxjmPi6evkb1+wyslBtAyZEk7c1QrNUrWNevqcaRuBXNIwm43smI3xYCmW8Z
	fqvhqEh5dErJ3qO0uE8lJwRrY8DBn5PE3iccQmtedd4ed1oZE9kdXzFqLeIv4oL1WFfGND1L78JYO
	JsVK1CyKrTuaGoBH5u1XsVo+3kl0mtVGaFn0+8Lk3rVxRYylcXvn3tw8fgwi8N5sE4Dg5tM3lW/xN
	SpglVpHw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42556 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTXDg-00000004C8t-0Nnp;
	Wed, 18 Nov 2026 09:54:28 +0530
Date: Tue, 17 Nov 2026 20:24:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yang Siyuan <hsyysy@163.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: sunxi_wdt: stop the watchdog across system
 suspend
Message-ID: <164e54ff-8a1f-4841-92eb-7fe1b7815a64@roeck-us.net>
References: <ece4aa08-fb86-4f76-b4b8-a9351a71df14@roeck-us.net>
 <20261118005048.385059-1-hsyysy@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118005048.385059-1-hsyysy@163.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTXDg-00000004C8t-0Nnp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42556
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEQ7CACs8BfJCzMn9Z1UvuShzv1sdE7g1kQv+/ElL8ZristHpki3waSmFcOgqCfA5NxnJBm1oNY+HNYWdrDXkVfiHsWy/PSZ0B4JMBMAAJD/Y05W7Vm5
 kEdR2Y8CYKrxwnU3lgEn2YOn7Fb36KT6SrYmh+wXHQnzqOUZFr3zKVtuYgwrHCcCaZ9dhmRV1ywXA5HPc6RVWmonOdSNcK+oqrmzQfaKKtUU0goHd85+idLM

On Wed, Nov 18, 2026 at 08:50:48AM +0800, Yang Siyuan wrote:
> The H616 watchdog has a maximum timeout of 16 seconds.  systemd keeps
> /dev/watchdog0 open with RuntimeWatchdogSec=16s, but during system
> suspend all userspace is frozen and the watchdog core does not stop the
> hardware.  A suspend longer than the timeout therefore resets the board
> before it can resume.
> 
> Add system sleep PM ops to stop the watchdog before suspend and restart
> it after resume if it was running.  The driver did not store its private
> data in the platform device, so add platform_set_drvdata() for the PM
> callbacks.
> 
> Use DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr(), and use
> watchdog_hw_running() instead of a private flag to decide whether the
> hardware needs to be stopped and restarted.
> 
> Tested on an Anbernic RG35XX-SP: a 30-second s2idle suspend resumes
> without the 16-second watchdog reset, and /dev/watchdog0 keeps working
> afterwards.
> 
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

Applied.

Thanks,
Guenter
