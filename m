Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629054;
	b=YLhtJo5GxWRSezW/ZGxuQW5MN88PQenqzHXNG8ybiY5D0JHWvCsaHLakb4UFvOfnu10z
	 giZ7+RepieQdYMQ8C4JYJlh+bridAboBmBk4GqUwJE0O2CicragdRs1RPKP2lYb5mq5id
	 cLKd5zhWdd8ZWgw3i1blNFcubvftR0hjArTfDRJTikBgUJ213BixyQ2vSfqkS1nsH+Ui8
	 /epgXcsAi/KGk9Cz7WAfdA3QF28KP72nyiIksuugv9hAg2cQ12LO+/gBhqyMXRyKWeBba
	 PdVWKNyQSTm5eruvOTxFStp8sGiDejFIh7PzK0gvk97K/c5aUm4kBQxOga05drjXMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629054;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=;
	b=F61dS3NsEBs475wXWCeqyw6MNVIy63U6NC2v97jZO7vWVWNcGp/n2f2Ji85ehEdMv4Nm
	 1YHfMSUlXWNfQN9eH3C52ZsfnhFJCSjfX8/LAWSwLUY9rYxk71H/+h1CUHMDs/HqcDZeE
	 +uhux7EfP2jha6YZ+awaMfAnW1sSqqRM+/pP8qqZuXeM0GjNGpZ7y7VHwzhXarMbaz0B+
	 UgDzO0UXHgk0EIW/dGfclcoz+6ve1+/jDlcj0PZiYdWq16GpHMhJZ7APZxnT7q5nQqQsx
	 mIIHcSGIDqrmgZF3s1sR0PE6XSJB7G5diOoezXxU3sV21JSavL3/R7l9symOu2GXsrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T3yBgD7k;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62099606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62099606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T3yBgD7k
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A223FC69149;
	Wed, 25 Nov 2026 17:51:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB43B60480;
	Wed, 25 Nov 2026 17:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13EC811E6B0AE;
	Wed, 25 Nov 2026 18:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=;
	b=T3yBgD7kNom/UC8jM/fqJ0PKNpxSkNWy6tbuEqzfZoVxS+CJpXNXszU8oP+OxAG+d3lwVK
	M0x7bLm5BNNwYnZHmfqRw2TPVPFf5uICtiW8KVAjcxwcUdpd3yEIbOkk2Jy6j2Mm/i+Ktd
	YT76oPZNaEzPIbUqsoURhquEcYgqaxs6B+PSZoV+et2/VZ3LUk/5QYgvnS9dbJpzmUDYpH
	ROPrzbUscL/jaoWLidsC0zHmJhBVo98+FPbATV1KaybKTfLNSFP5JcD+/DNLDmh19o4sHi
	Uf5hE7Fp18gA3VHn30honf1AxR1Wla+gIkfmEZ9RApzU1XkC1p3BfBNY55kulw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:14 +0100
Subject: [PATCH v4 01/32] drm/display: hdmi-cec-helper: use drmm_ prefix
 for drmm action
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-1-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support hotpluggable HDMI bridges (and the
drm_bridge_connector) we need a non-drmm variant of the CEC adapter
(de)registration API, with an explicit unregister API.

To differentiate the new explicit unregister API from the existing drmm
cleanup action, use the drmm_ prefix for the latter.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3.
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index ef6dbaa59dee..b79c41703d53 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -64,7 +64,7 @@ static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *c
 	cec_s_phys_addr(data->adapter, addr, false);
 }
 
-static void drm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
+static void drmm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
 	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
@@ -145,7 +145,7 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 	mutex_unlock(&connector->cec.mutex);
 
 	return drmm_add_action_or_reset(connector->dev,
-					drm_connector_hdmi_cec_adapter_unregister,
+					drmm_connector_hdmi_cec_adapter_unregister,
 					connector);
 
 err_delete_adapter:

-- 
2.56.1

