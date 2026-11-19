Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059407;
	b=PYxLV71VRzcNUkFWZPEemMrhnJ3Fii6N4JT3gYHnuGLzn+HzGs7ak2Fd7bLZD0mFXIm4
	 vb8Z0hu86w99SgaIOuIOS/FTUwncbZ+6e5NcMVa45kZErwf+aFXvezcbiRo39m5Aw1tVR
	 66gCLGYesVv26QEkqUz8zHtjAx/pAwasKaVS7wIIFfdiKs/VBfCJ0GpQvbg1mzihLXY7F
	 dSuUj8LSUwK4myn2C2fVvpVNXLAAzOqzEvsz8jDi/o1oQaWTMqGl/3/PqSTlzqWyYm+HZ
	 6T7zQm5orCf5DXfEkWA6ADo5g6YvBOYU10XQp9wIeiZRw3XYjEw2wxaBG9IOxJSaYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059407;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=vqQDhQ27c96+ICQ06C2ZP3AiP+V7DWXdXfnHpwkYr5E=;
	b=zzBfbh9g7EwyzptADWwmX9HgIsVnuj28Mpa0TRJK90bg2dWHZgqcSQQDAmtv96TTfeeO
	 ZD+taKCEJXXSEml4v6nkRHFd9EJV6pzgASdXgYxBaQxEJJgdIZUMp1O+u6BG7/60oJQVR
	 lVanUNx7PK3ddzqb0aJSzCYSeskasPPpuxB9+jVCjPepetMA23l+JBBzystBGLMBtK3ee
	 q1QAlrXIO4O/3rmL/xCejDXSiy/+md7GrRZWyV2yQ0Fcd0ySeKzvXZ0a5dZ6QGGBvJVIX
	 K9YwJKtzHR4T40yPkKPDZFwMN2Vx8xcVM4rJhXLYqBRvBaQaKoYYcKQWQ6BuRvwbacg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ujAsVEOt;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A084B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ujAsVEOt
X-UUID: 6bd4b5e0e3ca11f1b1788b6acf885367-20261119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vqQDhQ27c96+ICQ06C2ZP3AiP+V7DWXdXfnHpwkYr5E=;
	b=ujAsVEOtSjkOIQqJQiVp9CAffikFG+4YXAmbaWXLUq5Ici2WWakk+lFIi971N1UyKAVDugskNhhcmBUjsrqzRxUDCOz2iYXPIwyZsQYdO/a34ua3nZ8VSkXOzBsXb9disCQmaAimb0+5vOkBbePb4PDGwanfbXUtsiaUV/32mq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4cafcee4-7f92-44ff-997c-aac646ad964a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:af5c0218-34d4-49d8-ada8-f7bca7795bb3,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6bd4b5e0e3ca11f1b1788b6acf885367-20261119
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mtk38076@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1246713359; Thu, 19 Nov 2026 11:36:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Nov 2026 11:36:34 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Thu, 19 Nov 2026 11:36:34 +0800
Received: by mediatek.com (Postfix, from userid 10038076)
	id 801DD200C5; Thu, 19 Nov 2026 11:36:34 +0800 (CST)
From: Zi-Hao Huang <zi-hao.huang@mediatek.com>
To: <ck.hu@mediatek.com>
CC: <Zi-hao.Huang@mediatek.com>, <airlied@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <chunkuang.hu@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<shaoming.chen@mediatek.com>, <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/mediatek: dsi: Don't let a signal cut the IRQ wait short
Date: Thu, 19 Nov 2026 11:36:34 +0800
Message-ID: <20261119033634.1844084-1-zi-hao.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <26e896f79e5811514f2aa631d77f436c09ba1544.camel@mediatek.com>
References: <26e896f79e5811514f2aa631d77f436c09ba1544.camel@mediatek.com>
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
Content-Type: text/plain

Hi CK, Angelo,

On Thu, 2026-11-19 at 01:28 +0000, CK Hu wrote:
> So I need more information.
>
> 1. How this bug happen (include callstack, time sequence) before restructure.

I'm not sure the trigger is specific to our downstream driver. On
v7.4-rc2, panel-novatek-nt36536 sends display off (0x28) and enter
sleep (0x10) from .unprepare. Because the panel sets prepare_prev_first,
this runs before mtk_dsi_bridge_atomic_post_disable(), and
mtk_dsi_bridge_atomic_disable() only clears dsi->enabled. So both
commands go through mtk_dsi_host_transfer() while video mode is running:
stop video mode, send the command, wait for CMD_DONE, restore video
mode. If that wait returns early, video mode is restarted before
CMD_DONE has been handled.

On MT8196 we hit this in a warm reboot stress test. The commands were
sent from an atomic commit by the compositor (hwcomposer) while the
system was going down. With debug prints:

  - 0x28 is sent, and mtk_dsi_wait_for_irq_done() returns after about
    11 us without a timeout warning, before CMD_DONE has been handled
  - restore_dsi_mode sets DSI_START, so video mode runs again
  - 4 to 26 us later CMD_DONE arrives, with DSI_BUSY set because video
    mode is running
  - mtk_dsi_irq() writes RACK and loops on DSI_BUSY; nothing stops video
    mode, so it never leaves the handler until the watchdog reports a
    hard lockup

Backtrace of the stuck CPU from another occurrence, without debug
prints:

  readl+0x40/0x80 [mediatek_drm]
  mtk_dsi_irq+0x48/0xbc [mediatek_drm]
  handle_irq_event+0x88/0x2f8
  handle_fasteoi_irq+0xa0/0x2e0
  generic_handle_domain_irq+0x4c/0x74
  gic_handle_irq+0x64/0x264
  do_interrupt_handler+0x80/0x90
  el1_interrupt+0x40/0x8c
  el1h_64_irq_handler+0x18/0x24
  el1h_64_irq+0x7c/0x80

wait_event_interruptible_timeout() can only return early like this if
the condition is already true or a signal is pending, and a task being
torn down during reboot is likely to have a signal pending. I did not
catch the signal directly. wait_event_timeout() would still return
early on a condition that is already true, but with only the wait made
uninterruptible the lockup did not show up in 2500 warm reboots, nor in
1500 more with this patch. Forcing -ERESTARTSYS for these two commands,
with CMD_DONE held off until video mode is restored, reproduces it
every time. I have not tried mainline, since it has no MT8196 display
support.

> 2. How restructure fix this.

Angelo, in the restructured driver, does the panel's .unprepare still
send its commands while DSI is in video mode? If so, I think the same
early return can happen there.

Thanks,
Zi-Hao
