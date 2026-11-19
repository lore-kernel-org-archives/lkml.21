Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107925;
	b=M+mt3OOL8oooCEaVks4y1Of/K6WnzUmGftpdRmCCX/veBB95ZppLUv4GNNRejqm9iO89
	 h/usbHuoMTvaEWMPbSRe0EXj97qV4ZMECFgBd4F/9Q4yQwIHkwn1gOI97DRWw8PhiVJyp
	 SaT1BOJD+eKI2xUq3kN8g1E1aal3EXn6fOhu16PUarenzq/SXF68ubDbmOLJxzozmV28Z
	 GhrOzOl51T3ImFnXWEwRF3VGGt/Iz31OUDO8EMD5/Ga1SzVOkTo9NPRMIKUv14lurZXoH
	 92alDocpv7KwWssW8bWxKy9VNoVF5lLgTd9aMBQF0fB8ctHvixcN2wunIduU+Hr78Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107925;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=bhXIKOBgYo9ODFl0eTsalG7rKmJZwQdt2xRDgmvrRz0=;
	b=PgZom/R+EDliQwRnEs9PjsD8FdjPKJ1vjevrG4G/FTAPqaiia2evOglR8X0AdvLlUtj/
	 rB9+3q/zTZotiIlrFndzHqNQF/DA5j/yBIetshaR8vCgF86uTIIK8oIz3zODLYRYbFrhv
	 CvUcRhJrlgnL9tW+B1S6DLE9nZ+7smvOOz9wHxxy8F2aVxMnI4O7Ny5rKc/t2+SEdNDBe
	 xfvCoO7+19iNYdL6R7/Y1l98gdYVJOnjkvNm8PO3rpEjr1JxRpPqVUfj0xU0gT1T6Yf45
	 IUQnjRfVFGFsOLOeGn3/zNGKY3AvwSs0AwlaX+EWD1gNaTmxCOBxTuTarvAsuL40KxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=srs.galae.net;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kmw8J5xT;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7660A2630
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F7660A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.galae.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kmw8J5xT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3AF994E4166D;
	Thu, 19 Nov 2026 17:05:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A7965FF9A;
	Thu, 19 Nov 2026 17:05:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F4F811BC0CE4;
	Thu, 19 Nov 2026 18:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795107920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bhXIKOBgYo9ODFl0eTsalG7rKmJZwQdt2xRDgmvrRz0=;
	b=kmw8J5xTFEWAkXsuC6V1moj0U48GOHQayLNiIdN6ht8G9jHDivJVuq1jOvkBaLW9WUdiC0
	eYd0efyL6q8H4Ur/JR0fwWTIrxGUZo4sOfgjSBtSlelTQn34Pv4MrMhsRjU41qSFXzuk4g
	MqtdM5sdbDY0W/ZLq4T93PtO9TpSD4lNI6D6e/YlucX8SepTuEel3UNq9evnUCOTIt1SV9
	SQCkYQ2GIxri1AfQtCZ0YHhtWHJQ49XCURGNXCdyLmrQN6LuqEAbG/L5Oyk2ds3HruIbvl
	Y1cjwNOeR+UD0sOI4MgPr/gHGRJCJZw/jfe1z4CZno253ZxQ+QTiygfTInDkGg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 18:05:07 +0100
Message-Id: <DMZCN8AD4WMD.2ZO1SYMI93O3M@bootlin.com>
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Cc: <luca.ceresoli@bootlin.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <allen.chen@ite.com.tw>,
 <treapking@chromium.org>, <wenst@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
To: "Daniel Golle" <daniel@makrotopia.org>, <Hermes.Wu@ite.com.tw>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org> <179251509978.78870.2485132679226608837.b4-review@b4> <179481904178.211952.8076269834336042526@makrotopia.org> <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw> <av8jL0W1vgdqPQhu@makrotopia.org>
In-Reply-To: <av8jL0W1vgdqPQhu@makrotopia.org>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 19, 2026 at 5:26 PM CET, Daniel Golle wrote:
> On Wed, Nov 18, 2026 at 03:12:14AM +0000, Hermes.Wu@ite.com.tw wrote:
>> Hi Daniel, Luca,
>>
>> On Mon, Nov 16, 2026 at 08:56:18AM +0000, Daniel Golle wrote:
>> > On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
>> > > If you could share what that register is for, it would probably answ=
er some
>> > > of those questions.
>> >
>> > I don't have documentation for it either, and with ITE gone there is
>> > nobody left to ask.
>>
>> REG_AUDIO_INPUT_FREQ (0xBE) is a read-only input audio frequency
>> counter. The driver uses it to check whether the I2S BCLK is
>> present and changing, i.e. whether there is audio input.
>
> Great to see you are actually still around, and thank you for confirming
> that we can drop the register read there.
>
> I was afraid the bouncing emails of the former driver maintainers would
> indicate the driver has now been orphaned. It'd hence be great if you
> can enlist yourself in the MAINTAINERS file for that driver.
>
>> > As for the logging, I don't think it is worth an extra i2c read and a
>> > division in the enable path, so in v9 I'll drop the read and the
>> > print from it6505_enable_audio() instead of guarding the division.
>>
>> Fine with us, the value is only informational there.
>
> +1

Ah, great, thanks Hermes for the feedback and Daniel for the patience in
getting to the bottom of this!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
