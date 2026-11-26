Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692617;
	b=fcy2dTKWxGwpotW92S7wT7gj6bj1ZV/1raTb0kDNSiD7IR25LzYx+9etHr5qOai9jjYj
	 uMVaogjkJjz+I93cVNzdL5kiVTs8+Wp/YIPVgOidZguohogxW1aExKklaahdQvr9TLBGx
	 J3Ah0ZVAZthctecbtpGW5dncmzIMZ+QIq6gxNfpCdlmrrSqcUSy/kre/ISgo41Wo9jY7b
	 FASVfGBwRtHumQtX1zMUIVAuW65+0Ecw0lp+cUqaUl29dut24QfYX38kYW5DC25uWz2xK
	 fzRtsYdQfdIa1ftrOrj9akNLW+xvMXQEQiytCoLVLMChqFRK8VraF0s0C0WXC4Kk1Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692617;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=K79H14QN8yiUYu28AoqZ0UTk4OEZ0WPMraRKucLJFqs=;
	b=K/LWx6Bgl92AD3gRuK/XgRXYOjGkgeH7YPgRHgQ0wfIlFbVS6RLrRoVxUphBMD7Bq3oq
	 G1Ee50y2pB7bOcviiCGbr+lCCYd4pHxSs+QoER7OleV7YCzNGjL8pSuZwzCTJMS9CGFrD
	 NyMh6a5CSoEHO7klUCdAnrPS6sOr5xfTiXJucSZ0O+4g5JhUwJtmZyuDfYPhUJdp0Z1VV
	 1lz1JPxGplgl2jW4DByjwcK1Pjlskustsgu3MhEFRrwXhKpDY7ipEKrD7n4os/DICSkkA
	 A6Oo2kV4hNo3otWOVyr7CwHJy1/1yWrAkg8DqhLO+kDUEzS01kwnN8SXhAuFnoGc54w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uFRKC9MB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA610606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA610606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uFRKC9MB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65EC21A1808;
	Thu, 26 Nov 2026 11:30:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3833060237;
	Thu, 26 Nov 2026 11:30:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B30F11E6B302;
	Thu, 26 Nov 2026 12:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K79H14QN8yiUYu28AoqZ0UTk4OEZ0WPMraRKucLJFqs=;
	b=uFRKC9MB4EJe0n9p2mlJAeF325m8VSrEyY1aWxYkuLyT5G3uOyimTSaHBRzNhnCK5+Aj3h
	X1rh+iDoUPjy/7qjS86Iq00JVK8sLo5B1GZloqJnDrryGAX3noD/Yap+Ljgl2zov69dPNW
	aR/H0MGTcX/90XzjbswVlDFbm9HLyC6wRq5UtXlXUxYY5oj8JHgnTd15TfVVad11a5feFB
	AcYWzs4TSFCUbeQ/EYNUVp+St0gnzTt2bO5m9b4kFfHba0kwuGkmyu16YZmQBFio7cZEhn
	Fj3yQjzBCHtqjam7gnPIJ0x+dUDn6+T0hHn3RBIyfwId6mtiz6AKnBvOUE8rCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:53 +0100
Subject: [PATCH v7 10/43] drm/vkms: Reset config->dev when the device
 creation fails
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
Message-Id: <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

vkms_create() stores the vkms_device in config->dev, but the error paths
after that point free the device (through devres_release_group()) without
clearing the pointer. The configuration then keeps a dangling pointer,
which can be dereferenced later (for example by vkms_destroy() or by the
configfs disable path) once the device is already gone.

Clear config->dev in the out_devres error path so the configuration stays
consistent when the device creation fails.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 28b99511f186..4cbb1173fcc6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -215,6 +215,7 @@ int vkms_create(struct vkms_config *config)
 
 out_devres:
 	devres_release_group(&fdev->dev, NULL);
+	config->dev = NULL;
 out_unregister:
 	faux_device_destroy(fdev);
 	return ret;

-- 
2.56.0

