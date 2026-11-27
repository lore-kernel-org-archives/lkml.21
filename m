Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799156;
	b=g8nnlGRVUDEycD6qLC63iM0qGuCjC2q64j6kbExoCA2uXGrHO9gO3HGeWlaku3WSZQeK
	 rBXA1k7RrJE4KsIYJB2zzSanQgFgBtSTWx05YT+Qwz3dpLWpRXormrgQ/3PkyT716KDTk
	 B+SyNAIwzw9HB7vIKTvmg8zfu4JE56QzNr6sE9CIZPAaXpWNNSt6hEfba5FlHF0bRD8hs
	 MyS5BbLcBzUr7GSzSIjQTWDBV851LqT16nogzJCpNjtehnACTMTfAiMNLuTYZKRN3zw16
	 v8IaxJSks77+HJSaR0eoFjjeeRRCSwlvXwp7fpZzfVlCxs0+rNskXoR7/Rzr2xZ6rMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799156;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=epMG1oEJxcH1Mz0PZ5IoUhFZrQxUMuiU/tJZjWFh0u4=;
	b=vMDESaWLAxEX++4EBFiQC0yTw9jTlboCb85W/QyuZy9j9owusoO0QvWY5mInCRZHhjer
	 IabxwhNjsjv/BCOVyJjJLU02LRUq1239XByyL6r//ZepkFXzyLPRPjiaTHlEbInvGYpoj
	 0GyOw4tfbYJzWcc3+QpGpflCbB241ZQaWwi89+P4Qi2QzY3G8hs7vjL7e6iD2/kjmkwdS
	 hfGnVKQYxsSOBPJtEBLJ2nzMYKghOijqb4VQ4U+AmTbzAW6pZfmnSrTdYfM9nvrBThYSB
	 iBUYL9abYM32cHA95+8KZWCDNCvszvJl1J7fkf8SR1+ORQxOvxE5IVFFDnG4x4UoD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=srazc7DB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 530F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=srazc7DB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC388C2AC4C;
	Fri, 27 Nov 2026 17:06:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B647D6049C;
	Fri, 27 Nov 2026 17:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE5AD11E90D96;
	Fri, 27 Nov 2026 18:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795799147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=epMG1oEJxcH1Mz0PZ5IoUhFZrQxUMuiU/tJZjWFh0u4=;
	b=srazc7DBq+otogBqeRV2y6653RuMxbb9ubD4FxMA+QGTENZLTZ5v0QZeaSpaa69NZodljs
	3ZGDU86Vg3KoSyAhh8ms5OMM1iU4fADwX859ddG5BLg4TGWJhkWbr1j6VoVaUUyRinj+EJ
	cm5lRiRFqis1QkgaMf4HGoEVOKWgIRDLCfZFr/QffKrooUYMvN7wJBwjz4DZDaOjCAG++D
	rMomtzBXfoAzRCbGzFkxnh9sJPcaUcR/gKsZFdNZ0xAgdwMXUoy3VPOLIaUkIgh4r7uToU
	V+O7Dk9CkhAt9VS44Qihl9v9gX1xrrrwoort34F3iiBiG1qkxpHTYkHjaZEyRw==
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
Date: Fri, 27 Nov 2026 18:05:27 +0100
Message-Id: <DN65NU9ZTJQH.1GRA0TZTLGY0I@bootlin.com>
Subject: Re: [PATCH v3 0/4] drm/komeda: Use the bridge connector
Cc: "Ayan Halder" <Ayan.Halder@arm.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <cix-kernel-upstream@cixtech.com>,
 <Wuyi.Shen@cixtech.com>
To: "Luo Liu" <Luo.Liu@cixtech.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Liviu Dudau"
 <liviu.dudau@arm.com>, "Russell King" <linux@armlinux.org.uk>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261124094119.3220267-1-Luo.Liu@cixtech.com>
In-Reply-To: <20261124094119.3220267-1-Luo.Liu@cixtech.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Luo,

On Tue Nov 24, 2026 at 10:41 AM CET, Luo Liu wrote:
> The first patch converts komeda to the new DRM bridge model. Bridges
> following that model no longer create a connector themselves, so the
> display driver attaches them with DRM_BRIDGE_ATTACH_NO_CONNECTOR and
> creates one connector for the whole chain with
> drm_bridge_connector_init().
>
> The second patch fixes the teardown path that the conversion exposes.
> drm_bridge_connector_init() creates the connector with
> drmm_connector_init(), which provides no ->destroy hook and leaves the
> cleanup to a managed action. The drm_mode_config_cleanup() call in
> komeda_kms_detach(), and in the komeda_kms_attach() error paths, drops
> the connector references directly, so drm_connector_free() ends up
> calling the NULL ->destroy pointer.
>
> Switching to drmm_mode_config_init() lets the core release the mode
> configuration after the connector cleanup actions have run. The komeda
> private objects are then finalized by walking the pipelines instead of
> mode_config.privobj_list, which also holds the bridges that the encoder
> cleanup releases.
>
> The third patch fixes a latent interrupt race found in review. The IRQ
> is still registered after komeda_kms_detach(), and the
> komeda_kms_attach() error path, clear drm->dev_private, so a shared
> interrupt can reach komeda_kms_irq_handler() and dereference a NULL
> mdev. It is independent of the conversion.
>
> The fourth patch fixes the tda998x bridge, which accepts the
> connector-less attach flag but keeps using its own connector. In that
> mode the connector is never initialised, so the bridge reads an empty
> display_info and ELD and stays in DVI mode without sending hotplug
> events. Use the connector provided to the detect and EDID read
> operations, report hotplug through drm_bridge_hpd_notify() and
> advertise interlaced mode support through the bridge.
>
> Changes in v3:
> - Add a fix for the tda998x bridge, which accepts
>   DRM_BRIDGE_ATTACH_NO_CONNECTOR but keeps using its own connector.

There are two v3 series you've sent the same day. Which is the right one to
review?

Please reply to one of them saying "ignore this series, it was sent by
mistake" or similar.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
