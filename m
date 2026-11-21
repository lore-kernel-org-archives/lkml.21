Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267970;
	b=DCJ/zeT0eMhB43JHGDTHMUvTv2UFTFt0DeKCMWGv46dA8QCSMPsQG0tZkgqDdM4VbZ59
	 RREzl5OHt4hwseNz3r6+Lg6+GPgGzsuLPEPc7zsFZ4tBkz5TOai5FOmPF7gfxRDD6KImA
	 1xa4Jds6i0cuVmNnFH/F5fX0uQWRYis9z/Zrf50AKt7FoZjQr7C6fR4EBzR51tsrwjNA2
	 qGOTHwkHGJcvHl4hUqLxDCFwrhIo8K7lvNKhIl0R2RtKkSxZSJWF/QD4Ek3UPzHIAhUaR
	 U3aRIal96pw21GkrPNDw+sPY7LTUF1J+0wj2xUDPEqPkxJzXSEud7naZOF+wVP4/qDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
	b=EQDQFUrx4885jrjegPqpWGlurDHP0WRTerNgDgt1oIzKHBY2Vr6n5HNIrCqgWlB5mfZ0
	 BsIm8deA26cr0AeZ+hlxq9ly34FptpX0UxdRXJPghazd9sBPxcCgoo/wH0qWYv+wFxyY1
	 SbHrDQTPXxY/6jq8YfIlwDiJiPlr8KqOlID0bpPmJyK9MDCsJ5q3x2ovW/2faY+7zwnUK
	 jRmFmLO9HYEcEcDFQ+KDcGl/yFcxOUeY2lFQhKWQjClP0/UWV/51rjYFp4TGKzjgCVYcY
	 28Rvjd7g6pk7u3C1KoG7xy6+FJDxav0Jr/hFsrO2a54NT+Xo6DMKjB5PqvbOlbyd/Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=km2s4lvd;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9236F606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9236F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=km2s4lvd
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12726095e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267969; x=1795872769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
        b=km2s4lvdtngUXUwRBoBtn6pONA/EYuNEtSCTGRJ7U1Mt8zZk1puZrUGQrsdqUycmPf
         slEGwiriLbjoI29ddae8ge3XhCle6jBoYQj3hspcZs8MVjE9IEeMknf08hYFlinQFQvy
         ki2Nrj0AhiWKOVOBxoao8RMY10Kvu4cW36smDhbU3M5slqGxcMFNtFMii86IfSHpirMq
         SQvNtMNmDmdGkNGcl04b1+iSXdnLkdKaylOSl+9NckxmF+5xhUcM3/vgN2pxp3/pPN/h
         Thg7aqfv11eIzw1qI9zgf8119BcmfUIVP8WvgLZ60bxAwY9OrobEdj9b/cYmmPvddFir
         nP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267969; x=1795872769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
        b=aelkFy1Hw3CMmpQ8aVy8Fp814uk3Nry35M1uKRzBstAebbGEVb+04nc8Swj+OSR3AI
         8UK+Y1agX/cY6jXq3SqZdxZHN3GcTPrYwmBfdvHPIASDkvSBJug4fjIM5K0o0HS9GUKc
         sA1LEbXCKeFC4o0EOOq6JAhCBwZ6XpCtqXwVWqoP9unLIAGgayRZD78lkVQCH0yFrfqO
         FLu4mUNJMLy1zOsexBWeba8dW9xmAEs3K5XtkPkdIiiRTVY2fqYvDRrEwYLXc+gNXWm9
         SE6ip+12bw6xj+QUwqVRdQbh1nFRQesBHfi45RSgK7Am0Os683hzTmi6s1w+UMDFiNRa
         Nx3Q==
X-Forwarded-Encrypted: i=1; AL+hErGWGHVSvnL3nAAgbvRCx5u6+P+82tuW7hEIDSNbXPlouFnsNsSWzRANJoRw9V9iBpEREFwFXVhHkEzh50o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m3bczyneWPD7BrzlK3XQ6anITmc1FMC+npjmibZ3pg6cZc7FQ
	Zo4NYLUSJVsB3nrDVKmN1ZrGJisoGGGFZXtNIcM+jXH8S7Njmp0iFn/9
X-Gm-Gg: AZFdTZeLEW+CSy/7aMX1KWAYZES2cp8CC4zWCk3CXuQ+7Dh4jJ3MQNUPF3pTAhiShlM
	O1ShHm2slxbb/uo9T+nWgAx4ROJMOSeDDsh7IiFgcRLhaIvyYPyAP6aBk6RXUrARH17DmKG23sU
	L2r60Q5FOiBZNtNz9eHSZq9gd/vj1LAwe0jYhuKE283CmFARtLtSd3QXBwsR8/9HJyIPr0CuzVR
	iSZoJivKuT1loK5DtFPOrPJEqB0wiIGyBx031nWioMDGaL/wL2ZNNBJnHYLYVm+uM71GUa6TmJk
	nrq28O22G7ObcgfVJu58kP8yfebc03kT7NNrUJ/kk+UZ6Vz0c2033BSHUYQp87+vwWSuU84CYSm
	Hur11vH9ghFdBuelUg28ylTJRyriidCd0evBSiDahljC4mjJ0Br2kfL7d1NpiPEAtGL75o263ud
	DGTS3ranK/RsVcY5Zs0jfr13+Rh59bfDyWCeS/xh8k0JJ54oPFITSZiVmVgD6TDYhyEbI/1XI3C
	YiXV99H9sarOSulN9J1TjrO3B+rh0kt6tH2FzSzNHQBCYOkVr4hj0VE6JxhHSAgfjVvrmZkNEyh
	Cw+e2pmniLCVilowX7mO+irYpKtxu2DtfH+q+bercdVExB3ZQvpeWlfAOlGNDNuDLr37cU/CRWa
	Fq6QBNNve0E34
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr101433245e9.10.1795267969099;
        Sat, 21 Nov 2026 05:32:49 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:48 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice nodes on rollback
Date: Sat, 21 Nov 2026 14:31:31 +0100
Message-ID: <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

Subdevice node registration skips nodes which already exist. On failure,
however, it walks the subdevice list from the beginning and unregisters
nodes regardless of whether the current call created them. On AtomISP
this can remove the camera sensor nodes when a lens rebind fails.

Keep a list of the video devices registered by this call and unregister
only those devices on failure. Record each device before creating its
media interface link so a failure in that step rolls back the new node
as well. Calls with no missing nodes need no bookkeeping allocation.

Codex drafted the change and tested allocation, registration and
media-link failure using the registration helper with mocked operations.

Fixes: db0f4691d974 ("[media] v4l: Allow calling v4l2_device_register_subdev_nodes() multiple times")
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 26 ++++++++++++++++++++------
 include/media/v4l2-device.h           |  3 +++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index b4036105c..8cfca95ce 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -191,10 +191,23 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
 int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 					bool read_only)
 {
+	unsigned int count = 0, registered = 0;
+	struct video_device **new_nodes;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
 	int err;
 
+	list_for_each_entry(sd, &v4l2_dev->subdevs, list)
+		if ((sd->flags & V4L2_SUBDEV_FL_HAS_DEVNODE) && !sd->devnode)
+			count++;
+
+	if (!count)
+		return 0;
+
+	new_nodes = kcalloc(count, sizeof(*new_nodes), GFP_KERNEL);
+	if (!new_nodes)
+		return -ENOMEM;
+
 	/* Register a device node for every subdev marked with the
 	 * V4L2_SUBDEV_FL_HAS_DEVNODE flag.
 	 */
@@ -228,6 +241,7 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 			kfree(vdev);
 			goto clean_up;
 		}
+		new_nodes[registered++] = vdev;
 #if defined(CONFIG_MEDIA_CONTROLLER)
 		sd->entity.info.dev.major = VIDEO_MAJOR;
 		sd->entity.info.dev.minor = vdev->minor;
@@ -247,15 +261,15 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 		}
 #endif
 	}
-	return 0;
+	err = 0;
+	goto out;
 
 clean_up:
-	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		if (!sd->devnode)
-			break;
-		video_unregister_device(sd->devnode);
-	}
+	while (registered)
+		video_unregister_device(new_nodes[--registered]);
 
+out:
+	kfree(new_nodes);
 	return err;
 }
 EXPORT_SYMBOL_GPL(__v4l2_device_register_subdev_nodes);
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8..6d8834d40 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -183,6 +183,9 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
  * @read_only: subdevices read-only flag. True to register the subdevices
  *	device nodes in read-only mode, false to allow full access to the
  *	subdevice userspace API.
+ *
+ * Existing nodes are kept even if registration of a new node fails.
+ * The caller must serialize this operation with changes to the subdevice list.
  */
 int __must_check
 __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
-- 
2.53.0


