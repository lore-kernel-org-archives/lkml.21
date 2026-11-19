Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105615;
	b=Y6A09w82fsh4HyhTmpkej5IBfgIVM5sbcQoeZC6bQyVPv8fHQokuWF/n3aQbTu+m/Qwo
	 4XsmPVzmF207rVSzKD/Xq/5BGhFe/ZI/dWkrSxl/Xyqc02+XsxQ7AZe0QdyaR3h3xuynx
	 iB8QShmlVIknU6jn3oAyHSLhUxJGhq18+y1XKqrlvjqudG0PTIE+ljR0GUcFBBvZMui8d
	 fHQ0yCNdUfZrlhew1WQitAf3CHlKkvC3BAo1VSYOv5DZyzmaCQGKiBTUPUIsEORu7WiKa
	 zmxePS1NSxsyU5UUU0Jhf1bJ4/g2vMsd9vmunG/pQ95r6FSgjWhh2mAH5sQB/CVWApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105615;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0Q5O7wQWWp7G0PSZR747dT3nh3JKK2m5Y0byjfb03Bk=;
	b=oMgqY8AM/92lep4OTL+3KjnXnhcClywLkhkb/pTuU8xke68SNrp63KQf2YpcxiUa3WfB
	 afxzfnxsNOqpzuaalN4bBBWFAyiOdm3eKeG7gHixDaPOTdxQ62Xf1V+LoZLpXyTa4LGzW
	 Zhol3zNnILZNnJzi+9OT3MQJj2UY2OAMbPCpGKhsI8xIfrj+Y39lI1zjbS3lqlyVSq13x
	 O9jqniMY0eji/jKcBlTaWWqsjtD/n+CI4CAFozuherunvYMTBw8O8cIa0obMEwZ/naINV
	 Hrnr570nQeGLDmz075X6n5RBB+mYdrwTYkdpq1qYMfcuBnoxooTAoSWsvcG3KZo3ljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D9606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xU4y2-000000007XY-2OT2;
	Thu, 19 Nov 2026 16:26:34 +0000
Date: Thu, 19 Nov 2026 16:26:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Hermes.Wu@ite.com.tw
Cc: luca.ceresoli@bootlin.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, allen.chen@ite.com.tw,
	treapking@chromium.org, wenst@chromium.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Message-ID: <av8jL0W1vgdqPQhu@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
 <179481904178.211952.8076269834336042526@makrotopia.org>
 <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
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
In-Reply-To: <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>

On Wed, Nov 18, 2026 at 03:12:14AM +0000, Hermes.Wu@ite.com.tw wrote:
> Hi Daniel, Luca,
> 
> On Mon, Nov 16, 2026 at 08:56:18AM +0000, Daniel Golle wrote:
> > On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
> > > If you could share what that register is for, it would probably answer some
> > > of those questions.
> >
> > I don't have documentation for it either, and with ITE gone there is
> > nobody left to ask.
> 
> REG_AUDIO_INPUT_FREQ (0xBE) is a read-only input audio frequency
> counter. The driver uses it to check whether the I2S BCLK is
> present and changing, i.e. whether there is audio input.

Great to see you are actually still around, and thank you for confirming
that we can drop the register read there.

I was afraid the bouncing emails of the former driver maintainers would
indicate the driver has now been orphaned. It'd hence be great if you
can enlist yourself in the MAINTAINERS file for that driver.

> > As for the logging, I don't think it is worth an extra i2c read and a
> > division in the enable path, so in v9 I'll drop the read and the
> > print from it6505_enable_audio() instead of guarding the division.
> 
> Fine with us, the value is only informational there.

+1
