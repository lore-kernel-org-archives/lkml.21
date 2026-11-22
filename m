Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376859;
	b=qA53RJfhoHjJe9BctsdkrIo/UWuhUW7oRrg6QAq6V3TaODFB7fI7FMqtLD8CA07Ng27p
	 RLybsDapwPcEOTe8ac1U75THDb0kJDKRFxE3+Fo7edLpjJGn6cnyWHEe74iko5YrjTNjS
	 t3CwONN/plgDrCVNPj2YBqFIFN8zpKOk9nSXpGl9gPTkYHk0IQfYwt/0fs4k+rpKePX6e
	 crPBFHvHUrUmfYWQ+5cTa/ghuIFiq0/WeQ/W1H/QtKEQijdGSUMvZWr+4/2US00Lg1y7L
	 NiL9ol+7jI17Ye8EDZ26TUqXHUQZ7DxtpTZsci7VzYzdWfZRBFOXWHVIJOkI7L0KI7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kw/m5totZaX/utB4M9W1bJbsY2L3dnvokfGFuRSainE=;
	b=tyN3ovpGCN9HG2Mux3YCi/1COd1x8C0gpnygZSyZwQuvKNGsdzDDTqYEDC1DXjnQnsbF
	 ua8+BG/utL8z3PhKVxEE6o9aXVsZFEZs/r4H8bHX68WA4CbjGqB8dXe0/ELBfVDJQECLX
	 FZFaD5kq3MMigaNuYY4b9E3N8UMOUtmo6VWYk85Gkjg5IRAceIOohQwnuaflkgrLBFAd5
	 luHC8GapkEZN6CAI0eXANQ1u2W5eJgWyNnWZpJQ9hbFMpL28EQWpi6AT+FaJdLPQqe9wi
	 cs3mraofe7SvmBgsIcTJDX3pwM67vNneyjlbSU7Leie7enab73/ufMortpJv7ho9jbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gHqjla4U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNdjlNFz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gHqjla4U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNdjlNFz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV1sg3476840
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kw/m5totZaX/utB4M9W1bJbsY2L3dnvokfGFuRSainE=; b=gHqjla4Udo5LSqE4
	zWd0rGvx9bVODGcbMljk/U0/XkyenUf/yBHReQLzg+h3vM5c7rQImlw6+tR4OjSX
	CCQSRDv6KLuILOLEkzQEDQUuYKEE//+B9ESaw0y0HnXsSWsXrgUAdBOSoxFuobfC
	sqVIMfdaX7j+9QzP2T1osC5v+hpVf5ECcP3EsZf4bah3GatNB/aQvXS4jEoq9vSK
	Vz7mEKQtvHOPykTlkaaRwRWoXOV5gMfkrztOV+iONEruDth9DdlSFFxvGAs4iZzA
	zcOlTvYsGTYiXvIvnWVsLn+DyMDfxua0x9wKQtWOBA92MgLkjL6+uFXaiIExq3Nt
	7lAAkg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gm114-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:47:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a7af8b94so675763eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376856; x=1795981656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kw/m5totZaX/utB4M9W1bJbsY2L3dnvokfGFuRSainE=;
        b=TNdjlNFzdAw7jKQ0SZiB+PJyIc8157bwS7sX+9NS0SeBn/2KG6CJXijfwZZCeB2JsA
         NDVkKv9qlbupoK4QynrN8DPhLt+T1K8bKNI+EUJ5/rS0HWqeBDzu/uMg+vn2YlLuXbrg
         MXfJIw/+0N6LkyubHRptuYO+6BnyPSkOKAoP+W7/V3vjbXLp6EdMZVuqB3Lg0X6x4mbL
         8ym3KX7Aqdl/2bVDJzIa6UzGTVua3GcMMgS3URptp4WIygg8DL7p5AAWLvdKPeIz7++q
         HGUfhd2Cw6h+KvOJPoHdSZAzLKtVbBZYSsS/4CQnG5C4lH2Z6boIvUjaN/gOqhUp2+BU
         Ce4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376856; x=1795981656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kw/m5totZaX/utB4M9W1bJbsY2L3dnvokfGFuRSainE=;
        b=G+1/XcHBX+Zo4qHy0r6gkE9BbykYz/nEK9tdhb5qHsCv7Az9k031aXTOdFG5SuSETj
         Q2YuV/1kfUmV66BtgzQXoImBrWQmRvgKDS/l54GfCpxZfIkpesYUg0L65PYoDnE3K6+U
         ft/fBJBtqVX3KaP6a1Chc7P7B+Enkemtohg0Hi9gw8xCVvx1lKP7Ewcgp7YlDrFfpfnj
         CAj8UGSXyxdak3PrFjfIsRk3DteXPS1IfCgZXOvR11VUl9o/5pvMznABtEkl6gIPy8FS
         hrZMcLXjbB8YRF3Ga02I8ShW0a5ZDwXqwsVsxU2KbbFfi2IbeC2OaBTyJg3xlX0yAgu8
         b6jw==
X-Forwarded-Encrypted: i=1; AL+hErGWAoxI1C29sAsRoWHu2fCi1YATOszbI9t1J03Z2ecFTtRrVRF+mTL75WjcY7K38vStC/rJ+5qDZ5wD8Lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LtpRJS7cBDm2ZnjxIUTYKbcvAA/zQ0zA+FJtFKpwF8bonZ4VA
	6BI327ThmexsGsZMlseQP1mgBWsClfPo8iqjF81tgwNRBUN9OsX9RCmNTsvPHWQhIrxQCIcPPeg
	k8UayCbLWH58wk2njjCIaYaNrvEKFGpaf4B9cF5NvsvKFXjUPoLSBFCHScKldCk+1SfZRzDdoCF
	U=
X-Gm-Gg: AZFdTZdDZz9mXRQsJQnEzqX5o2769bnjlajLoPA2pv1bnKSiyXlO5a0eHkvV4fVVM0O
	9PtVKsbRRCHgl/P2QKwKvicY+xmesZpXtjZcuHMIjTKnZ6xk0fAmuJ1T+tAkOb+JAHvxnpyKDGX
	bgQRu4XLYWUjpMJumc5yxbm1FAtIzRA80DI0gUHiaQz8xN+ZnqgwikimNNptnwYrJoUg7YnbERe
	eVVrwtjIts2EqPzszuXS71hUc1RD/rvDSb1ZPXDAhhmQ/VczKj71YS3+sttw+MC8XNyskVMwMKs
	Z9wkuNmD3IQAp1ezw3fPu60sdheNtHpT9v56c+jp6LDmx/4+b2gbOQlrM6mQZlJ0uG/JHi5VQbs
	BIL/zU+hpOBjyymxUBypQmxtSsg6kUyVdegaEnsXlejkd+eH5e6LPLwRQNqvduX3Pnv17K6eLBg
	==
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr11870242eec.14.1795376856102;
        Sun, 22 Nov 2026 11:47:36 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr11870211eec.14.1795376855348;
        Sun, 22 Nov 2026 11:47:35 -0800 (PST)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm25608071eec.8.2026.11.22.11.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:47:35 -0800 (PST)
Date: Mon, 23 Nov 2026 01:17:25 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Sunyun Yang <syyang@lontium.com>
Subject: Re: [PATCH v18 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <awNGzbNgIvPVe99r@hu-mdsor-hyd.qualcomm.com>
References: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
 <20261021-lt9611c-v7-v18-2-4978b94896f1@oss.qualcomm.com>
 <179312387051.631593.2688359681409940856.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179312387051.631593.2688359681409940856.b4-review@b4>
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b0346d9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=y6ODm9WSYb8X-rfnW2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=d3PnA9EDa4IxuAV0gXij:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: -KrMI2XuFt4mb9Mf248jpAsM4HvmCfRg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX4rzLMDWx+KNs
 rJ2hYlK2/u9W1nOnPUO5oI9DXcWLdXyEN5O/6I0DmHYmAoG/NXCkmCWgZk6Qb/XnXGR5LOljo85
 PArXIOyJnuHudCUOXp7F5rS30a79b+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX5XuXAmXbyqTc
 VBPM0gSjCIB59ouaWjGOet14pm6Zt2xIqVnxCt27dDlRrFp+OCghZNWIHo7V6/QEL6AYM4Xzytq
 RkiGcMoUryxcphsxDIT9jbeUtBt+4kZVgbXVrTZWw/p4FWoDyk+tZVV0PWTf6ST8pX6d1riiQ13
 SYxkgAHLu8PnT1mWD7GDMH/yl5geP3ArlrGeo2hIYaLHm7XQ18ilOQynxEMzNXe3ASfrArBzKTf
 UBCf4mVW7MbHqvVUHfOsm1Ll8ruYqa7mky90/b8uYauMgumlyzrwAQn6X8ekot3m+PvN8vm5hdd
 XcL8UHEwft73jClpzzqdqG8DgSKWCOquLjHOr7F3AFbx8r0oN9ZNzw/9tIWF5j3urSXhftHfU43
 Kz5KrazKwXUoeYDX2MCFWHfmCLqYmFh/tJE4kfqSaWMn8Gui3x+WmHerHG4BRx0QjcYGX1GsD+l
 ga9yn96oY6E/tAmDCAg==
X-Proofpoint-GUID: -KrMI2XuFt4mb9Mf248jpAsM4HvmCfRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

On Tue, Oct 27, 2026 at 06:57:50PM +0100, Luca Ceresoli wrote:
> Hello,
> 
> > LT9611C(EX/UXD) is an I2C-controlled chip that receives single or dual
> > port MIPI DSI and outputs HDMI. Differences in hardware features:
> > - LT9611C:   supports 1-port MIPI DSI to HDMI 1.4
> > - LT9611EX:  supports 2-port MIPI DSI to HDMI 1.4
> > - LT9611UXD: supports 2-port MIPI DSI to HDMI 1.4/2.0
> >
> > The driver supports:
> > - EDID read and mode filtering via custom MCU command protocol
> > - HPD detection and interrupt handling
> > - HDMI audio output via I2S
> > - Firmware upgrade via sysfs
> > - Dual DSI bonded mode for LT9611EX and LT9611UXD variants
> >
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > Co-developed-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> >
> > diff --git a/Documentation/ABI/testing/sysfs-lontium-firmware b/Documentation/ABI/testing/sysfs-lontium-firmware
> > new file mode 100644
> > index 000000000000..8700933ba0f0
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-lontium-firmware
> > @@ -0,0 +1,10 @@
> > +What:		/sys/bus/i2c/drivers/<driver>/.../firmware
> > +Date:		July 2026
> > +KernelVersion:	7.3
> 
> This should be 7.5 now.
Will be fixed in v19
> 
> > +Contact:	Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > +Description:
> > +		Read: Returns the current firmware version loaded on the
> > +		Lontium bridge chip in hex format (e.g. "0x0105").
> > +
> > +		Write: Triggers a firmware upgrade of the chip using the
> > +		firmware file loaded via the firmware loader.
> 
> Other then debugging, what is the use case for triggering a firmware
> upgrade? It seems to creates lots of complications in the code and exposes
> and race conditions (see sashiko-reported issues). Maybe starting with a
> simpler driver which loads only at probe time would help reviewing.
> 
> In case that was discussed previously: sorry, I didn't find the discussion
> after a quick look at the (many!) previous iterations, can you point me to
> the exact thread?
The LT9611UXD ships with factory-flashed firmware that may contain bugs fixed in later Lontium releases. The sysfs trigger allows platform integrators to upgrade
firmware post-deployment (e.g. via a distro package shipping a new .bin file).

> 
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -0,0 +1,1361 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > + * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/crc8.h>
> > +#include <linux/firmware.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/media-bus-format.h>
> 
> Unused?
Wil be fixed in v19
> 
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> 
> Not sure this is used.
Will be fixed in v19
> 
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_probe_helper.h>
> 
> Unused?
Will be fixed in v19
> 
> > +#include <drm/display/drm_hdmi_audio_helper.h>
> 
> Unused?
Will be fixed in v19
> 
> > +#include <drm/display/drm_hdmi_state_helper.h>
> > +#include <sound/hdmi-codec.h>
> 
> > +struct lt9611c {
> > +	struct device *dev;
> > +	struct i2c_client *client;
> > +	struct drm_bridge bridge;
> > +	struct regmap *regmap;
> > +	struct mutex mcu_lock;
> > +	struct work_struct work;
> > +	struct gpio_desc *reset_gpio;
> > +	struct regulator_bulk_data supplies[2];
> > +	int fw_version;
> > +	const struct lt9611c_chip_data *cdata;
> > +	bool hdmi_connected;
> > +	bool dual_dsi;
> > +};
> 
>  | sashiko-bot@kernel.org <sashiko-bot@kernel.org>:
>  |
>  | [Severity: Low]
>  | In drivers/gpu/drm/bridge/lontium-lt9611c.c, is MODULE_DEVICE_TABLE(i2c,
>  | lt9611c_id) missing after lt9611c_id?
>  |
>  | Without MODULE_DEVICE_TABLE(i2c, lt9611c_id), building the driver as a module
>  | (CONFIG_DRM_LONTIUM_LT9611C=m) omits the i2c:lt9611c, i2c:lt9611ex, and
>  | i2c:lt9611uxd modalias entries from modules.alias, preventing automatic module
>  | loading when devices are instantiated via I2C device IDs.
> 
> Not sure why it's mentiond here, but it's right.
> 
> Also, please reply to sashiko remarks either saying you will fix them, or
> saying why you won't (e.g. invalid).
Replied to all sashiko comments.
> 
> > +static int lt9611c_read_write_flow(struct lt9611c *lt9611c,
> > +				   const struct lt9611c_cmd *cmd,
> > +				   struct lt9611c_rsp *rsp)
> > +{
> > +	int ret;
> > +	unsigned int i;
> > +	unsigned int temp;
> > +	unsigned int max_params = 0xe0dd - 0xe0b0 + 1;
> > +
> > +	regmap_write(lt9611c->regmap, 0xe0de, 0x01);
> 
> Can't registers have a #define with a meaningful name? This is valid for th
> entire driver.
Fixed for entire driver.
> 
> > +static void lt9611c_lock(struct lt9611c *lt9611c)
> > +{
> > +	mutex_lock(&lt9611c->mcu_lock);
> > +	regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> > +}
> 
> I'm not sure I get why in some cases you just take mcu_lock and other times
> you need this function, which additionally writes a register. Can you
> elaborate on that?
lt9611c_lock() does two things: acquires mcu_lock AND writes LT9611C_MCU_HALT=1 to pause the chip's internal MCU before
accessing its registers. The chip's MCU and the host share the same register bus — without halting the MCU first, concurrent
access corrupts communication.

guard(mutex)(&lt9611c->mcu_lock) alone is used only inside lt9611c_read_write_flow(), which implements the MCU command
protocol. There the MCU must remain running as it is the intended participant in the transaction.
> 
> > +static void lt9611c_hpd_work(struct work_struct *work)
> > +{
> > +	struct lt9611c *lt9611c = container_of(work, struct lt9611c, work);
> > +	struct device *dev = lt9611c->dev;
> > +	static const u8 hpd_data[] = { 0x00 };
> > +	struct lt9611c_cmd cmd = {
> > +		.hdr = { LT9611C_FUNC_READ, LT9611C_TYPE_HDMI, 0x31, LT9611C_CMD_SEP },
> > +		.data = hpd_data,
> > +		.data_len = 1,
> > +	};
> > +	u8 hpd_status;
> > +	struct lt9611c_rsp rsp = { .data = &hpd_status, .data_len = 1 };
> > +	bool connected;
> > +	int ret;
> > +
> > +	/*
> > +	 * Wait for the MCU to debounce and latch the HPD state after the
> > +	 * interrupt fires. The MCU needs time to update its internal HPD
> > +	 * register; reading immediately after the interrupt returns stale
> > +	 * state. 200 ms is empirically sufficient.
> > +	 */
> > +	msleep(200);
> > +
> > +	mutex_lock(&lt9611c->mcu_lock);
> > +	ret = lt9611c_read_write_flow(lt9611c, &cmd, &rsp);
> > +	if (ret)
> > +		dev_err(dev, "failed to read HPD status\n");
> > +	else
> > +		lt9611c->hdmi_connected = (hpd_status == 0x02);
> > +
> > +	connected = lt9611c->hdmi_connected;
> > +	mutex_unlock(&lt9611c->mcu_lock);
> > +
> > +	drm_bridge_hpd_notify(&lt9611c->bridge,
> > +			      connected ? connector_status_connected :
> > +			      connector_status_disconnected);
> > +}
> > +
> > +static int lt9611c_regulator_init(struct lt9611c *lt9611c)
> > +{
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +
> > +	lt9611c->supplies[0].supply = "vcc";
> > +	lt9611c->supplies[1].supply = "vdd";
> > +
> > +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +}
> > +
> > +static struct mipi_dsi_device *lt9611c_attach_dsi(struct lt9611c *lt9611c,
> > +						  struct device_node *dsi_node)
> > +{
> > +	const struct mipi_dsi_device_info info = { "lt9611c", 0, NULL };
> > +	struct mipi_dsi_device *dsi;
> > +	struct mipi_dsi_host *host;
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +
> > +	host = of_find_mipi_dsi_host_by_node(dsi_node);
> > +	if (!host)
> > +		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER, "failed to find dsi host\n"));
> > +
> > +	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> > +	if (IS_ERR(dsi))
> > +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(dsi), "failed to create dsi device\n"));
> > +
> > +	dsi->lanes = 4;
> > +	dsi->format = MIPI_DSI_FMT_RGB888;
> > +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > +			 MIPI_DSI_MODE_VIDEO_HSE;
> > +
> > +	ret = devm_mipi_dsi_attach(dev, dsi);
> > +	if (ret < 0)
> > +		return ERR_PTR(dev_err_probe(dev, ret, "failed to attach dsi to host\n"));
> > +
> > +	return dsi;
> > +}
> 
> lt9611c_regulator_init() and lt9611c_attach_dsi() are referenced only by
> probe. So please move them just before the probe function, to make it clear
> they are part of the probe sequence and they can legitimately use devm.
will be fixed in v19
> 
> > +static int lt9611c_bridge_attach(struct drm_bridge *bridge,
> > +				 struct drm_encoder *encoder,
> > +				 enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> > +		return -EINVAL;
> 
> Good!
Thanks
> 
> > +	return drm_bridge_attach(encoder, lt9611c->bridge.next_bridge, bridge, flags);
> > +}
> > +
> > +static enum drm_mode_status
> > +lt9611c_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> > +				  const struct drm_display_mode *mode,
> > +				  unsigned long long tmds_rate)
> > +{
> > +	const struct lt9611c *lt9611c = bridge_to_lt9611c_const(bridge);
> > +
> > +	if (tmds_rate > lt9611c->cdata->max_tmds_rate)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (tmds_rate < 25000000)
> 
> Please #define this number with an informative name,
> e.g. LT9611C_MIX_TMDS_RATE (not sure it's correct).
Will be fixed in v19
> 
> > +		return MODE_CLOCK_LOW;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static void lt9611c_video_setup(struct lt9611c *lt9611c,
> > +				const struct drm_display_mode *mode)
> > +{
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +	struct {
> > +		__be16 htotal;
> > +		__be16 hactive;
> > +		__be16 hfront_porch;
> > +		__be16 hsync_len;
> > +		__be16 hback_porch;
> > +		__be16 vtotal;
> > +		__be16 vactive;
> > +		__be16 vfront_porch;
> > +		__be16 vsync_len;
> > +		__be16 vback_porch;
> > +		u8 framerate;
> > +		u8 vic;
> > +	} timing_data;
> > +	struct lt9611c_rsp rsp = {};
> > +	struct lt9611c_cmd cmd = {
> > +		.hdr = { LT9611C_FUNC_WRITE, LT9611C_TYPE_MIPI, 0x33, LT9611C_CMD_SEP },
> > +		.data = (u8 *)&timing_data,
> > +		.data_len = sizeof(timing_data),
> > +	};
> > +
> > +	timing_data.htotal      = cpu_to_be16(mode->htotal);
> > +	timing_data.hactive     = cpu_to_be16(mode->hdisplay);
> > +	timing_data.hfront_porch = cpu_to_be16(mode->hsync_start - mode->hdisplay);
> > +	timing_data.hsync_len   = cpu_to_be16(mode->hsync_end - mode->hsync_start);
> > +	timing_data.hback_porch = cpu_to_be16(mode->htotal - mode->hsync_end);
> > +	timing_data.vtotal      = cpu_to_be16(mode->vtotal);
> > +	timing_data.vactive     = cpu_to_be16(mode->vdisplay);
> > +	timing_data.vfront_porch = cpu_to_be16(mode->vsync_start - mode->vdisplay);
> > +	timing_data.vsync_len   = cpu_to_be16(mode->vsync_end - mode->vsync_start);
> > +	timing_data.vback_porch = cpu_to_be16(mode->vtotal - mode->vsync_end);
> > +	timing_data.framerate   = drm_mode_vrefresh(mode);
> > +	timing_data.vic         = drm_match_cea_mode(mode);
> > +
> > +	dev_dbg(dev, "hactive=%d, vactive=%d\n", mode->hdisplay, mode->vdisplay);
> > +	dev_dbg(dev, "framerate=%d\n", timing_data.framerate);
> > +	dev_dbg(dev, "vic = 0x%02x\n", timing_data.vic);
> > +
> > +	guard(mutex)(&lt9611c->mcu_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, &cmd, &rsp);
> > +	if (ret)
> > +		dev_err(dev, "video set failed\n");
> > +}
> > +
> > +/*
> > + * Enables dual DSI port input on the LT9611UXD/EX. Must be called
> > + * after video_setup when two DSI hosts are connected.
> > + */
> > +static int lt9611c_dual_port_enable(struct lt9611c *lt9611c)
> > +{
> > +	static const u8 dual_port_data[] = { 0x02, 0x70 };
> > +	struct device *dev = lt9611c->dev;
> > +	u8 ack = 0;
> > +	int ret;
> > +	struct lt9611c_rsp rsp = { .data = &ack, .data_len = 1 };
> > +	struct lt9611c_cmd cmd = {
> > +		.hdr = { LT9611C_FUNC_WRITE, LT9611C_TYPE_MIPI, 0x31, LT9611C_CMD_SEP },
> > +		.data = dual_port_data,
> > +		.data_len = ARRAY_SIZE(dual_port_data),
> > +	};
> > +
> > +	guard(mutex)(&lt9611c->mcu_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, &cmd, &rsp);
> > +	if (ret || !ack) {
> > +		dev_err(dev, "failed to enable dual DSI port (err=%d)\n", ret);
> > +		return ret ? ret : -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_atomic_commit *state)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> > +	struct drm_display_mode *mode;
> > +	int ret;
> > +
> > +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> > +	if (WARN_ON(!connector))
> > +		return;
> > +
> > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > +	if (WARN_ON(!conn_state))
> > +		return;
> > +
> > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > +	if (WARN_ON(!crtc_state))
> > +		return;
> > +
> > +	mode = &crtc_state->adjusted_mode;
> > +
> > +	lt9611c_video_setup(lt9611c, mode);
> > +
> > +	if (lt9611c->dual_dsi) {
> > +		ret = lt9611c_dual_port_enable(lt9611c);
> > +		if (ret)
> > +			dev_err(lt9611c->dev, "failed to enable dual DSI port (err=%d)\n", ret);
> > +	}
> 
> lt9611c_video_setup() takes and releases mcu_lock, and
> lt9611c_dual_port_enable() take it again, so there is a possible race
> window. I'm not sure it can cause problems, but these two functions are
> never called separately, so whay not folding lt9611c_dual_port_enable()
> into lt9611c_video_setup()? Or at least calling lt9611c_dual_port_enable()
> from lt9611c_video_setup(), so callers (or, well, the unique caller) don't
> have to take care about dual DSI?
Will be fixed in v19
> 
> > +
> > +	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > +}
> > +
> > +static enum drm_connector_status
> > +lt9611c_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +	bool connected = false;
> > +	static const u8 hpd_data[] = { 0x00 };
> > +	struct lt9611c_cmd cmd = {
> > +		.hdr = { LT9611C_FUNC_READ, LT9611C_TYPE_HDMI, 0x31, LT9611C_CMD_SEP },
> > +		.data = hpd_data,
> > +		.data_len = 1,
> > +	};
> > +	u8 hpd_status;
> > +	struct lt9611c_rsp rsp = { .data = &hpd_status, .data_len = 1 };
> > +
> > +	guard(mutex)(&lt9611c->mcu_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, &cmd, &rsp);
> > +	if (ret)
> > +		dev_err(dev, "failed to read HPD status (err=%d)\n", ret);
> > +	else
> > +		connected = (hpd_status == 0x02);
> > +
> > +	lt9611c->hdmi_connected = connected;
> > +
> > +	return connected ? connector_status_connected :
> > +				connector_status_disconnected;
> > +}
> 
> This code is very similar to lt9611c_hpd_work(), can the common code be
> moved to an internal function? It might take the msleep timeout as a
> parameter, as it seems to be the only real difference.
> 
> BTW is the timeout really never necessary here? Even if
> lt9611c_bridge_detect() is called by chance just after an interrupt?
Will be fixed in v19
> 
> > +static int lt9611c_parse_dt(struct device *dev,
> > +			    struct lt9611c *lt9611c,
> > +			    struct device_node **dsi0_node,
> > +			    struct device_node **dsi1_node)
> > +{
> > +	int ret;
> > +
> > +	*dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
> > +	if (!*dsi0_node)
> > +		return dev_err_probe(dev, -ENODEV, "failed to get remote node for primary dsi\n");
> > +
> > +	*dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
> > +
> > +	if (*dsi1_node && lt9611c->cdata->chip_type == CHIP_LT9611C) {
> > +		ret = dev_err_probe(dev, -EINVAL,
> > +				    "LT9611C does not support dual DSI\n");
> > +		goto err_put_dsi1;
> > +	}
> > +
> > +	if (*dsi1_node)
> > +		lt9611c->dual_dsi = true;
> > +
> > +	lt9611c->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
> > +	if (IS_ERR(lt9611c->bridge.next_bridge)) {
> > +		ret = PTR_ERR(lt9611c->bridge.next_bridge);
> > +		goto err_put_dsi1;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_put_dsi1:
> > +	of_node_put(*dsi1_node);
> > +	of_node_put(*dsi0_node);
> > +	return ret;
> > +}
> > +
> > +static int lt9611c_read_version(struct lt9611c *lt9611c)
> 
> Maybe rename to lt9611c_read_fw_version() for clarity?
Will be fixed in v19
> 
> > +{
> > +	u8 buf[2];
> > +	int ret;
> > +
> > +	ret = regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_bulk_read(lt9611c->regmap, 0xe080, buf, ARRAY_SIZE(buf));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return (buf[0] << 8) | buf[1];
> > +}
> 
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	if (!lt9611c)
> > +		return -ENODEV;
> > +
> > +	dev_warn(dev, "starting firmware upgrade — display will be disrupted\n");
> > +
> > +	ret = lt9611c_firmware_upgrade(lt9611c);
> > +	if (ret < 0) {
> > +		dev_err(dev, "upgrade failure\n");
> > +		return ret;
> > +	}
> > +
> > +	lt9611c_lock(lt9611c);
> > +	WRITE_ONCE(lt9611c->fw_version, lt9611c_read_version(lt9611c));
> > +	lt9611c_unlock(lt9611c);
> > +
> > +	if (READ_ONCE(lt9611c->fw_version) < 0)
> > +		dev_warn(dev, "upgrade succeeded but failed to read new fw version\n");
> 
> Logging the errno (lt9611c->fw_version) could be useful here.
Will be fixed in v19
> 
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> > +	struct lt9611c *lt9611c;
> > +	struct device *dev = &client->dev;
> > +	struct device_node *dsi0_node = NULL;
> > +	struct device_node *dsi1_node = NULL;
> 
> Small improvement: using a cleanup action would simplify a bit the error
> management, removing the err_put_nodes label here and the err_put_dsi1
> label in lt9611c_parse_dt():
> 
>   struct device_node *dsi0_node __free(device_node) = NULL;
Will be fixed in v19
> 
> > +	struct mipi_dsi_device *dsi;
> > +	bool fw_updated = false;
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> > +
> > +	lt9611c = devm_drm_bridge_alloc(dev, struct lt9611c, bridge, &lt9611c_bridge_funcs);
> > +	if (IS_ERR(lt9611c))
> > +		return dev_err_probe(dev, PTR_ERR(lt9611c), "drm bridge alloc failed.\n");
> > +
> > +	lt9611c->dev = dev;
> > +	lt9611c->client = client;
> > +	i2c_set_clientdata(client, lt9611c);
> > +
> > +	const struct lt9611c_chip_data *cdata = i2c_get_match_data(client);
> > +
> > +	if (!cdata)
> > +		return dev_err_probe(dev, -EINVAL, "no match data for device\n");
> 
> Minor nit: no newline between variable assignment and error checking.
The blank line is intentionally omitted — adding it triggers a checkpatch/patchwise warning about variable declarations not
being at the top of the block.
> 
> > +
> > +	lt9611c->cdata = cdata;
> > +
> > +	ret = devm_mutex_init(dev, &lt9611c->mcu_lock);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to init mutex\n");
> > +
> > +	lt9611c->regmap = devm_regmap_init_i2c(client, &lt9611c_regmap_config);
> > +	if (IS_ERR(lt9611c->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(lt9611c->regmap), "regmap i2c init failed\n");
> > +
> > +	ret = lt9611c_parse_dt(dev, lt9611c, &dsi0_node, &dsi1_node);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to parse device tree\n");
> > +
> > +	lt9611c->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt9611c->reset_gpio)) {
> > +		ret = PTR_ERR(lt9611c->reset_gpio);
> > +		goto err_put_nodes;
> > +	}
> > +
> > +	ret = lt9611c_regulator_init(lt9611c);
> > +	if (ret < 0)
> > +		goto err_put_nodes;
> > +
> > +	lt9611c_reset(lt9611c);
> > +
> > +	lt9611c_lock(lt9611c);
> > +
> > +	ret = lt9611c_read_chipid(lt9611c);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to read chip id.\n");
> > +		lt9611c_unlock(lt9611c);
> > +		goto err_disable_regulators;
> > +	}
> > +
> > +retry:
> > +	lt9611c->fw_version = lt9611c_read_version(lt9611c);
> > +	if (lt9611c->fw_version < 0) {
> > +		dev_err(dev, "failed to read fw version\n");
> > +		ret = -EOPNOTSUPP;
> > +		lt9611c_unlock(lt9611c);
> > +		goto err_disable_regulators;
> 
> lt9611c_read_version() returns an error code from regmap functions. Why are
> you ignoring it and forcing -EOPNOTSUPP?
> 
> Also, dev_err_probe would be better here:
> 
> 	if (lt9611c->fw_version < 0) {
> 		ret = lt9611c->fw_version
> 		dev_err_probe(dev, ret, "failed to read fw version\n");
> 		lt9611c_unlock(lt9611c);
> 		goto err_disable_regulators;
> 	} else ...
> 
will be fixed in v19
> > +	} else if (lt9611c->fw_version == 0) {
> > +		if (!fw_updated) {
> > +			fw_updated = true;
> > +			lt9611c_unlock(lt9611c);
> > +			ret = lt9611c_firmware_upgrade(lt9611c);
> > +			if (ret < 0)
> > +				goto err_disable_regulators;
> > +			lt9611c_lock(lt9611c);
> > +			goto retry;
> > +
> > +		} else {
> > +			dev_err(dev, "fw version 0x%04x, update failed\n", lt9611c->fw_version);
> > +			ret = -EOPNOTSUPP;
> > +			lt9611c_unlock(lt9611c);
> > +			goto err_disable_regulators;
> > +		}
> > +	}
> 
> Ugh, a goto-based loop in the middle of a very long function is not helping
> readability. The FW loading logic would be better moved to its own
> function.
Will be fixed in v19
> 
> > +
> > +	lt9611c_unlock(lt9611c);
> > +	dev_dbg(dev, "current version:0x%04x", lt9611c->fw_version);
> > +
> > +	INIT_WORK(&lt9611c->work, lt9611c_hpd_work);
> > +
> > +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> > +					lt9611c_irq_thread_handler,
> > +					IRQF_TRIGGER_FALLING |
> > +					IRQF_ONESHOT |
> > +					IRQF_NO_AUTOEN,
> > +					"lt9611c", lt9611c);
> > +	if (ret) {
> > +		dev_err(dev, "failed to request irq\n");
> > +		goto err_disable_regulators;
> > +	}
> > +
> > +	lt9611c->bridge.of_node = client->dev.of_node;
> > +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > +			DRM_BRIDGE_OP_EDID |
> > +			DRM_BRIDGE_OP_HPD |
> > +			DRM_BRIDGE_OP_HDMI |
> > +			DRM_BRIDGE_OP_HDMI_AUDIO;
> > +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > +
> > +	lt9611c->bridge.vendor = "Lontium";
> > +	lt9611c->bridge.product = "LT9611C";
> > +
> > +	lt9611c->bridge.hdmi_audio_dev = dev;
> > +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> > +	lt9611c->bridge.hdmi_audio_dai_port = 2;
> > +
> > +	drm_bridge_add(&lt9611c->bridge);
> > +
> > +	/* Attach primary DSI */
> > +	dsi = lt9611c_attach_dsi(lt9611c, dsi0_node);
> > +	if (IS_ERR(dsi)) {
> > +		ret = PTR_ERR(dsi);
> > +		goto err_remove_bridge;
> > +	}
> > +
> > +	/* Attach secondary DSI, if specified */
> > +	if (dsi1_node) {
> > +		dsi = lt9611c_attach_dsi(lt9611c, dsi1_node);
> > +		if (IS_ERR(dsi)) {
> > +			ret = PTR_ERR(dsi);
> > +			goto err_remove_bridge;
> > +		}
> > +	}
> > +
> > +	lt9611c->hdmi_connected = false;
> > +	enable_irq(client->irq);
> 
> 
> > +
> > +	of_node_put(dsi1_node);
> > +	of_node_put(dsi0_node);
> > +
> > +	return 0;
> > +
> > +err_remove_bridge:
> > +	drm_bridge_remove(&lt9611c->bridge);
> > +	cancel_work_sync(&lt9611c->work);
> > +
> > +err_disable_regulators:
> > +	regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +
> > +err_put_nodes:
> > +	of_node_put(dsi1_node);
> > +	of_node_put(dsi0_node);
> > +
> > +	return ret;
> > +}
> 
> > +static struct i2c_driver lt9611c_driver = {
> > +	.driver = {
> > +		.name = "lt9611c",
> > +		.of_match_table = lt9611c_match_table,
> > +		.pm = &lt9611c_bridge_pm_ops,
> 
> As suggested by sashiko, please use the new DEFINE_SIMPLE_DEV_PM_OPS()
> macro or similar to avoid "defined but unused" warnings. Also test your
> driver in all combinations of DRM_LONTIUM_LT9611C=y/m and PM_SLEEP=y/n.
Will be fixed in v19
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
