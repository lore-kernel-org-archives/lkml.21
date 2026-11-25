Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629060;
	b=IhmGevMimWbM5HVXdANTcIfSyA+z8iNhVly8cQXSamM10e6dYxyGKmqY7owh2xO6u24c
	 ZUs8kaoUhRWQICU3ubxWtPxbDIFXnm0beP0lQYwdCi/6vHhPu6JkI9UKMmH8SlQI4BWrp
	 rJspuZ/mz9sd/nxYQVMfAnhB1+BInMgydd3zGq580dewoVQpI6X4DdXaHVpx5nQ2c9eMf
	 cDah2IsLzF3hh+SCysXeSWksQ53PtfWO/7FQrtTatiaWXOZM/k9CiYJfXyeHiUXSQCD26
	 Fx76DVf/mu17FHajX2u3EvnJd/jfUXwMw0SmcEtG67y9lnej8Mx5NO0GK0Qo+BztI0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629060;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=R32+wDXxmTkP/gEthbKPhXatwdXsuuJxCRpBzoKrIWQ=;
	b=0FIVYd++RP1sHUrgA9VINpFvDkjGgFV6XSFkBZyEq/TjsJHp5L6K9+RKbyDBhEuqnTuv
	 zZPeVyBd+af0xMQA4Q9VzVCsEnq9JFTDh3TlCTdR9wS6VuwwOJdNLIQDeIwSk7fEokiXS
	 JHlaUTouG74QgsXbuKk24zMKSPLc6k0eH7Fnc0pygQb2SMkhDB6QceqzDuXNlhZWo0cjS
	 V3DoMjuIiBbMCuFrQrtGb7vjzE7cy9bdoeUUs+AVeMgzyPM8s3nVomoiAd5cOwBM44Vbi
	 VH7NiL3jyoJxZpRLOiTXcE64KD4YuH4Eqs4VShBSFI9TC5rM8J1AzHg5tEaNtt//Xsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W1hUVnws;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA6A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W1hUVnws
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9688DC6221E;
	Wed, 25 Nov 2026 17:51:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FA4A60480;
	Wed, 25 Nov 2026 17:50:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19D8611E6B0AD;
	Wed, 25 Nov 2026 18:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R32+wDXxmTkP/gEthbKPhXatwdXsuuJxCRpBzoKrIWQ=;
	b=W1hUVnwsiqKWJbspXP+GMe+L3xc0yhktOUgBlG5A/W5vbiRH2iDdAqdTif4mEQeP+LkF5v
	YbNMn4mGJN1s66/oSyVblattEwIeo9WUw8xpy3UPcbh5SZ+UqXY4YXvWuhsRnOj8zgC3mf
	Bl3eXaxQrT/dOPuHleFVawX+ayu99ke2dtOWrJMUhQUTF8IjG42H6O+J2DytlHQk1Dsu8+
	EkS34IZ39X0nBQ+tQHrD7xsJLJkxCAbLfNF/YZOwSPM2mUuPOeDDuTqBP/YPVyuDYeiE6F
	xDnkRtUYbKwt4cRTw9fVErSq06nmrgI4TzEezk5UWKkg643ofnxrJ3RonUhYYg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:15 +0100
Subject: [PATCH v4 02/32] drm/display: hdmi-cec-helper: add non-drmm API
 variant
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
Message-Id: <20261125-drm-bridge-hotplug-v4-2-822722850492@bootlin.com>
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
drm_bridge_connector) add a non-drmm variant of the CEC adapter
(de)registration API, with an explicit unregister API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 60 ++++++++++++++++++---------
 include/drm/display/drm_hdmi_cec_helper.h     |  6 +++
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index b79c41703d53..81b271659ad9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -67,15 +67,8 @@ static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *c
 static void drmm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
-	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
-
-	cec_unregister_adapter(data->adapter);
-
-	if (data->funcs->uninit)
-		data->funcs->uninit(connector);
 
-	kfree(data);
-	connector->cec.data = NULL;
+	drm_connector_hdmi_cec_unregister(connector);
 }
 
 static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
@@ -83,11 +76,11 @@ static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
 	.phys_addr_set = drm_connector_hdmi_cec_adapter_phys_addr_set,
 };
 
-int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
-				     const struct drm_connector_hdmi_cec_funcs *funcs,
-				     const char *name,
-				     u8 available_las,
-				     struct device *dev)
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev)
 {
 	struct drm_connector_hdmi_cec_data *data;
 	struct cec_connector_info conn_info;
@@ -125,9 +118,8 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 		goto err_delete_adapter;
 
 	/*
-	 * NOTE: the CEC adapter will be unregistered by drmm cleanup from
-	 * drm_managed_release(), which is called from drm_dev_release()
-	 * during device unbind.
+	 * NOTE: the CEC adapter will be unregistered by
+	 * cec_unregister_adapter().
 	 *
 	 * However, the CEC framework cleans up the CEC adapter only when the
 	 * last user has closed its file descriptor, so we don't need to handle
@@ -144,9 +136,7 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 
 	mutex_unlock(&connector->cec.mutex);
 
-	return drmm_add_action_or_reset(connector->dev,
-					drmm_connector_hdmi_cec_adapter_unregister,
-					connector);
+	return 0;
 
 err_delete_adapter:
 	cec_delete_adapter(cec_adap);
@@ -160,6 +150,38 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_unregister_adapter(data->adapter);
+
+	if (data->funcs->uninit)
+		data->funcs->uninit(connector);
+
+	kfree(data);
+	connector->cec.data = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
+
+int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
+				     const struct drm_connector_hdmi_cec_funcs *funcs,
+				     const char *name,
+				     u8 available_las,
+				     struct device *dev)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_cec_register(connector, funcs, name, available_las, dev);
+	if (ret)
+		return ret;
+
+	return drmm_add_action_or_reset(connector->dev,
+					drmm_connector_hdmi_cec_adapter_unregister,
+					connector);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_cec_register);
 
 void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index fd8f4d2f02c1..7e76a163e3a5 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -39,6 +39,12 @@ struct drm_connector_hdmi_cec_funcs {
 			u32 signal_free_time, struct cec_msg *msg);
 };
 
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev);
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector);
 int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 				     const struct drm_connector_hdmi_cec_funcs *funcs,
 				     const char *name,

-- 
2.56.1

