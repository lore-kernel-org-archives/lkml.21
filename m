Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796351;
	b=oVaSunPe+ta3iEmYygFzQMR6S613zyDFqYZ2d5RcLG8J5cDeD3jn6u9UFVMMCqRqnfKj
	 O+jvi3NVwf98XQ/E+2M4SW0IR83Ng+DrOzmLruoQb0gjtwPaOfm78koo2KS70Bf1V3zNO
	 DNI0kBaXV6Vmc8pfz8H9Yqb1v+G7pAg//trMPy76wH3DC3WcOjUUvMOm9gs+v+ibx2zlJ
	 GQZ1YsK/bEHt04r7PIl5+BQrUdlczPA5JNoVjwZJSnKQlI0ol6XQaEkhSP2wxGMT/3y3r
	 WX3xu/v/4Z/fXK+nQGM9HShSvfj1AEJe6ueKTxfS7rSw5uLzm4xT5rY/16hDNCF7E3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796351;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=hW4PnFCT49QnJHLHRZYt9yWGbDa7JaYp1uG9G1RshfE=;
	b=PQXIyR5OpR0fex2XLs44RfKNZmmxiCMhEaGicaOmSA+DIQhKAutn8UfCs/ApxEHLviUp
	 GoBqqg4vl1jh73ArQfZ74gzOeq0o5fIPOTCcUl2lWr84MpkrDV5hkFFeFSa5CTT0CEnO1
	 khCX/G7eTPTo/FPPZDJDam7vUBINPXBeWjzb/YLqC2EPjYgPb1J7FvBKXipZ5gt/51QJd
	 TRQ+QzJeDC6ZC0qJ+PqjBNBjAWYOy6Oyo+EMOyT7uYS31XJ+3GqC/Zkr0CLA86Bu4T1yH
	 lWOYx/A6qteduDaqbo1QuTQNeE5wtTqLMMXxNTlZMMUAG6AoHWMPzAQSYxR7QC57Z7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TbudbJfN;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA65606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA65606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TbudbJfN
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261127161908euoutp017c3dd23e748bad3ab286d5d23ac0a265~r80OzACJ42721927219euoutp01N
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:19:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261127161908euoutp017c3dd23e748bad3ab286d5d23ac0a265~r80OzACJ42721927219euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795796348;
	bh=hW4PnFCT49QnJHLHRZYt9yWGbDa7JaYp1uG9G1RshfE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=TbudbJfN2KEAcseLCdqwwdr/3N0wOH56zgL2BIimSzpkBxuP/owSfOiCEhof6SP2C
	 MiUaDOnX9CG+igbpmtHKVvakO0UfRcR5O2R1KPGRA2LdUyj1tOB3B0CQ7X9vCoZtbo
	 Am8wlPKUb0JuspNHw5s4QNGgclbyXZMM+UasxgR8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13~r80OX2Anv1885618856eucas1p2L;
	Fri, 27 Nov 2026 16:19:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161907eusmtip2fc9fbad8311ea1a87aa12e400dd147cb~r80Ngzdhl2969229692eusmtip26;
	Fri, 27 Nov 2026 16:19:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 27 Nov 2026 17:19:01 +0100
Subject: [PATCH 3/3] drm/bridge: inno-hdmi: Don't give the DDC adapter an OF
 node
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-inno-hdmi-ddc-of-node-v1-3-465622e1b7ad@samsung.com>
In-Reply-To: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
To: Andy Yan <andyshrk@163.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jernej Skrabec
	<jernej.skrabec@gmail.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Byron Stanoszek <gandalf@winds.org>, Dominique
	Belhachemi <db@domibel.de>,  Owen O'Hehir <oo.hehir@gmail.com>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=PekPu8YIeS97KeLHxN3IfvfgL2ZCxwDu1aOL1IF9Aio=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWRzri1fLcSmmGKvGXY7KeviEk6XVxoSnKo+1w1/t+Xzc
	f0qeZXbUcrCIMbBICumyHJ2Y7SR5D+Gp+XHH/+CmcPKBDKEgYtTACbyV4Xhn0r+v+W/WJwebM9Z
	wfc/LG3P25ePnF56euxSVnvMUbu9O4/hf0j183bZlVf2cX1c8uZm9cPKp/Uv4vX3TWZMYDWLVIn
	JZgEA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13
X-EPHeader: CA
X-CMS-RootMailID: 20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13
References: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
	<CGME20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13@eucas1p2.samsung.com>

inno_hdmi_i2c_adapter() sets the DDC adapter's of_node to the HDMI
controller's node. When the adapter is registered, the I2C core then
tries to create an I2C client for every child of that node. On RK3036,
RK3128 and the JH7110 the only child is the OF graph 'ports' node, which
is not an I2C device, so each boot logs, here on the JH7110:

  i2c i2c-7: of_i2c: modalias failure on .../controller/ports
  i2c i2c-7: Failed to create I2C device for .../controller/ports

Nothing on the DDC bus is described in DT, and nothing looks the
adapter up by its node, so don't assign one, as dw-hdmi doesn't either.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Owen O'Hehir <oo.hehir@gmail.com>
Closes: https://lore.kernel.org/all/20261012175941.258219-1-electronicconsult1@gmail.com/
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index bbc90ae9eaae04166d502c05fde52e126462b8be..bf39483d483e00ccef0daefb80f6579d5c86815a 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -1044,7 +1044,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
-	adap->dev.of_node = hdmi->dev->of_node;
 	adap->algo = &inno_hdmi_algorithm;
 	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);

-- 
2.34.1

