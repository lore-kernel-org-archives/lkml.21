Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211978;
	b=opSjUswuhdkWT3hUI1r5Y3K6X1+qiAPYEHWRmVwAutn0WlXo5ETEx6MIl7A4UAjdPP8T
	 QiEAkEWe8oathcYzM8gflOjcKsihc8s8564pP1cvEUewFQmAdd3ts5C4ihQ1PoI1cwuWy
	 dFUGgsbxwbk5myAwib1scdpecsaSws/ZrxNntg/EIYonSNF4PEreNkdoiIA16w0fWrukH
	 wzFjUL9JJzvzsmGAgdwuLQFA3XXXkEftYPjUWR99cWMlW1bOPdIVxdVbKlOkg6ptLFHHi
	 4QvmuSdLDfean4oyIbDBC2A5C7MwstdEYgbbuvUisJ9FCZEJyW4T3QVDRqMk3jv1k+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yQp6wu37grFSLFpLYqDqLuKQZrEDeFa5v47ChyJcE5k=;
	b=zQGcdAyM5PwYrmqSJ9zA/Vl/r9z5BOHDe8wr0XYtFMk5By24znvaiF20ZjMGSFDzXW46
	 JemgvSceYZheDM0gQ3QZBPXXROK5llL0GZsX9bT6PsakIEcrXztuSczU4xzx8TJbcheJe
	 8ZPoOcND9Drz8SzfMirrj790k0/81SHpjiGqGguMdupgp3vHIQL/rZQfCTNqtEvTspfZT
	 JSo+y+KfkkhBAFijAxjJxNgslfLPPut8sU7CJksBVR+DkgeiqhcfdZ3LXoWCVj75fJQ7k
	 SBaYWenqLQ1kQu7UL0zM17Lk9uS6GKsc7R1bLD9MdcfH3XlIG2Ne4HXuPX8aeWWsRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DmsRgpud;
	arc=none smtp.remote-ip=209.85.222.198
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7F60A2633
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A7F60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DmsRgpud
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso197115585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795211974; x=1795816774; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQp6wu37grFSLFpLYqDqLuKQZrEDeFa5v47ChyJcE5k=;
        b=DmsRgpudvuRAzsbrAEXYra7xBF73LG7dlb0dspoO7HXMXrCSj+yw+MfU7007+EbFNZ
         gZOhcpRUaP8f4Jh0B7CnvIOPaeCArOf7mh56NXtOV4zf74X/GapuOGcVAKdkpX0/A9x8
         V98FXDN6TxVl2AduH033kwC03/05kHVH92JzO5cjd5m3cSChRdG/IagciFZMaWhA+0pR
         ZsZqCGWOY1VUl2MGT72pQ9WHavKn1j/xakZy9cmnQEmNMUwD8qIK3eLEo+6RE9ABeD4c
         osoVroPlqmX+QH84D/vF4giz/Q1jtRn98dwZ6KT6XrPlX69nYRMbraQ8m/ByButufvjM
         BK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211974; x=1795816774;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQp6wu37grFSLFpLYqDqLuKQZrEDeFa5v47ChyJcE5k=;
        b=xmKijNo6CgO/U/eE2AtlecFIjyB9XRh/w58bNFlzDAT/HaN687Jb9rPgBIE7N0BCXB
         4zPpX0U3zUeiLcYbgasSTjDySFnlQSE0/fzl38zIV2p591ZOplmXgtUZDvdgPXQDG6i5
         jbmerecYqSURBAH4tt452+YbtHQdQ8IveWNvd/xWhYKrMsvDaEqBK/Tnbqnq57w/pWt0
         T0rKCBKZyR1zUtt7TAUQsbNVSB1FaDVMXvbWvkaTuomxwLsAEQ+nhBsfB5SCF5YYRzNU
         Qbi54nYLplDqeJT67iQcndhAtvIcVmfrcrXpI5iqJZITUd5SCz3m8zzjpElu5k9qIjQ5
         p03w==
X-Forwarded-Encrypted: i=1; AL+hErGoFJkMoe3ToQNqWevMiCeIZM2PTm5UsLTbH+niXIn4vqRHET2D8TI486N3KPDWvxld7bqCKCoT3MKfnY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3goOxcwwQDr+MFXJ50WpG/usSCQCtFSeJfUQYzmcJpQQaKrtj
	5dGr82rrtPmJLcsBjyL/sTr2sgoDVy8N4dOk0EjxxUWY4dvDhCd353ULoga/hVarcj/2n7O2o72
	dVx5gVFbjhqLZ8m7AQmuLf8q7BMRH
X-Received: from qkil7.prod.google.com ([2002:a05:620a:c07:b0:93e:7793:940c])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4556:b0:93e:c691:a1c with SMTP id af79cd13be357-949bab3d32emr690699785a.76.1795211974300;
 Fri, 20 Nov 2026 13:59:34 -0800 (PST)
Date: Fri, 20 Nov 2026 16:59:16 -0500
In-Reply-To: <20261120215916.3149345-1-briandaniels@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120215916.3149345-1-briandaniels@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120215916.3149345-7-briandaniels@google.com>
Subject: [PATCH v11 6/6] media: virtio: clear the size of legacy controls
 built on the stack
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com, 
	Nick Rogers <nick@getfieldwork.ai>
Content-Type: text/plain; charset="UTF-8"

From: Nick Rogers <nick@getfieldwork.ai>

A driver without a control handler receives VIDIOC_G_CTRL and
VIDIOC_S_CTRL from the V4L2 core as a single extended control that the
core builds on its own stack, with the control's size left
uninitialized. virtio_media_send_ext_controls_ioctl() takes a nonzero
size as a payload to copy from userspace, so these ioctls fail with
-EINVAL whenever the stack is dirty. GStreamer's V4L2 encoders set their
profile with VIDIOC_S_CTRL and cannot negotiate, and v4l2-ctl cannot
read the MIN_BUFFERS controls.

Legacy controls carry a 32-bit value and never a payload, and an array
that comes from userspace is copied into an allocation, never onto the
stack. Clear the size of each control when the array is on the stack.

The core is being fixed to zero the structure [1]; this keeps the driver
working on kernels without that fix.

[1] https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/

Assisted-by: LLM
Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
---
 drivers/media/virtio/virtio_media_ioctls.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/virtio/virtio_media_ioctls.c b/drivers/media/virtio/virtio_media_ioctls.c
index aa56efe9a..ad240073a 100644
--- a/drivers/media/virtio/virtio_media_ioctls.c
+++ b/drivers/media/virtio/virtio_media_ioctls.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2024-2026 Google LLC.
  */
 
+#include <linux/sched/task_stack.h>
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <linux/virtio_config.h>
@@ -593,11 +594,31 @@ static int virtio_media_querycap(struct file *file, void *fh,
  * Extended control ioctls are handled mostly identically.
  */
 
+/*
+ * VIDIOC_G_CTRL and VIDIOC_S_CTRL reach a driver without a control handler
+ * as one extended control the V4L2 core builds on its own stack, with its
+ * size left uninitialized. They carry a 32-bit value and never a payload,
+ * so a size there is stack garbage, which would be sent as a user pointer
+ * to copy and fail the ioctl. An array from userspace is never on the
+ * stack: the core copies it into an allocation.
+ */
+static void virtio_media_legacy_ctrl(struct v4l2_ext_controls *ctrls)
+{
+	u32 i;
+
+	if (!ctrls->count || !object_is_on_stack(ctrls->controls))
+		return;
+	for (i = 0; i < ctrls->count; i++)
+		ctrls->controls[i].size = 0;
+}
+
 static int virtio_media_g_ext_ctrls(struct file *file, void *fh,
 				    struct v4l2_ext_controls *ctrls)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_G_EXT_CTRLS,
 						    ctrls);
 }
@@ -607,6 +628,8 @@ static int virtio_media_s_ext_ctrls(struct file *file, void *fh,
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_S_EXT_CTRLS,
 						    ctrls);
 }
@@ -616,6 +639,8 @@ static int virtio_media_try_ext_ctrls(struct file *file, void *fh,
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_TRY_EXT_CTRLS,
 						    ctrls);
 }
-- 
2.56.1.750.gf70dc682cf-goog

