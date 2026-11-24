Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521969;
	b=aMmSF1lSjMkpmppJTMhv5vHXCtXBTP2yONHjtwwu3WcgRMl37hdURByD7rig86BuEZJ1
	 iSB7vsKcaHXAhX9cda4+DwXdQw5U0G3cDNQO1Yv/wh1f/Llrx2qZQjCT5l10t2KQ9D0EO
	 h2AOiIp06G4QgMO/8oWHpui+Ds+xTUCaH6vbxXvK/gJtyYhiSwbjro74flUXAEiJFtHIm
	 pnK+B8x5/GePfbVdI11xoUU7UPNOKFntEBhd//vs+7apYFbvGSUN2c/f/IA24TKanoJht
	 QU8HLRdh7wYVqxJdknnxPldcqmBqhntDQI6+4U/NMeg5+YvErZigYzzHcjQU+8fkATg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=KOl2yz4M7C/s7a2F3laG5SJ8ROMJ5wzUSTSBiLclugA=;
	b=dkNRXzMdaU1z+N6kYh2kX+/XVqayiDfBc2CTNPsjF6iiOl+4kcWKo+N+dszM9cctvBB9
	 99/RuyUWadV+0N24ZacPT+8vA05ib+q+7W0PrGZL/Kn19yLsNMNMggL6gGlhWm/AamsBg
	 XTE7l1z8qcGZMnQ3l3oEhdknWYkDUFevkMYeLpnmDsLPblgFgcq2LAFQEdN2izSPkxbF6
	 uqtpFbpRFzHtcTeg1UNXngTZ38CqIh9ZvEwYdUmWjySyOwDahmNyhxvIJbup4cxHlLtHt
	 e/CemTvmvXB5Oj+NMuQNb4cBRLK9Y8esGhBsRrwDdaRyt0pX3t8n9hSFLk3K2YSqAvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="MQ/RXhgV";
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9021C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MQ/RXhgV
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso34165891fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795521967; x=1796126767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KOl2yz4M7C/s7a2F3laG5SJ8ROMJ5wzUSTSBiLclugA=;
        b=MQ/RXhgVqU5sAcBNnuTQ5U0+AZ6JbM/oIPEOQ2KoEQwTD+GMBeWAGs5HSHWf5LbnjY
         0dlv/BunRCPGkSSliuOGd524M5yxjRd8aHmBHJJOuW5cL9ddleDulX+v9QfPjxrB12in
         pehtr+vEznWV+PMiZ0Vz5rsflnAJ2nOcmL/ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521967; x=1796126767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KOl2yz4M7C/s7a2F3laG5SJ8ROMJ5wzUSTSBiLclugA=;
        b=SW29XnwxD1MVd2IStSldKCp4K8KeWclS77OTc27epfoZZXNJ6OoyHrtxXkHyV/Y+Gc
         SOmiJOPodEvlx81DokVapsvAq7U4J6287NEHe+oO4faFC+D+rDWSY8sUz9IcwMhcl8DJ
         pV7xllcWOR+joSeLIn9zCivX1woo1HnQIVjkjuXO3OidKCaRUyeXu/ay7mP1SOqSsmxR
         nAFuA0DCRYSNXcNn6vGQn2R8M382PucO1Q98a+ysM+2Kzu0XGmG5fmWDPqg41X3y4npd
         hKxP+KEYpY4VjqleANYQQmvH5KF/QCJfmh9hSyhNI3lKNliPOVMGyA7RRV0D3/nbTvCM
         s92g==
X-Forwarded-Encrypted: i=1; AL+hErFk3NY0sm8V5AQMhC7R8v2qtWEKfcqE/xogyn+RYBIYRobupneih+VChWrfSwKz6Y5onP2eDnUkwCDf/Q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GCky7XDQo2Q60VwfBTvUazug3YeBlkmAO+5IhImkSGb+MTryd
	5hWAYHv86/Nl4KWsdvbM3nwd5W3qDIl3IXuM614PkSta5H0lttaCeanfIqnGn0M1jg==
X-Gm-Gg: AZFdTZc8sAt6PhCyiOLGizNBimNZktu1rBEonw8nET2KEB0JOneA8vBTox3phGHkEw9
	K6Wqh2CF4aKbCjdrStkLxpaS6cob/UYq0yMX3ezKogYgAt8hNP43D4BNur5ZRdz/Mb640v11BnK
	OZsoz/6W1FCmM/2I9GtGwo4aKuJLPKmJlpBQKLYYvFArWS4JZlugt9aZeRnFle6SKfDqKWMNd+L
	aTWOcSHmDk5acRFA/7KpP2xX/x5ncMVl8HOmeFOcftlhhfpezDdld0gBA7nKbFBXRDWAaxEl0dp
	L5puQqJ1iEbw0s7RVyMBK0hdq3Bge0LPVI6Y8AvVdsGxn5LwUvDC1hGmfYhfRlzCs392VA7lO15
	lnuvF+vmRM1Q8F7oWVH73QiB+AprStNaZPJ2Wb/S4jFYYy7wmMeoRmigsW5QxGLqMopBSxj5FbB
	h+KDgYOqaOQ6+2YjxKiGBdoNEnKimzYdvYaBK9T4y3xkPE5l9q2OAeEDMlvs39ZHkBzfheBPmm5
	kTAJA2qtSte8srC8yRpxE70v8gST/WiYca4PF/YGTsDxcluYFpi9TtNYuw5aiQcQqhlwtLS+CrL
	N0txwnLUDqtHTZgO+BjrPLfnJ1i8O/S7NfZPEeUFfL1yDi3WyRUfqwHMyUvkjwrUuZyif4xuySW
	t2pRE6PtHUA==
X-Received: by 2002:a05:6512:3087:b0:5c1:4a42:fb17 with SMTP id 2adb3069b0e04-5c1bc89ed7amr4414564e87.59.1795521966845;
        Tue, 24 Nov 2026 04:06:06 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm3654675e87.39.2026.11.24.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: uvcvideo: Fix race condition on metadata
 buffers
Date: Tue, 24 Nov 2026 12:06:03 +0000
Message-Id: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAKt9BWsC/3XMQQ6DIBCF4asY1p0GsNLQVe/RdDHCoCyUBpS0M
 d69aNKNSZfvJf+3sETRU2K3amGRsk8+jGXUp4qZHseOwNuymeSy4VdxgTkbiGhooAnBEUlSum2
 dsawkr0jOv3fu8Sy792kK8bPrWWzvHygLEFArbosnGtR4N30Mg5+Hc4gd26wsf73iSupDL4GD4
 KSFleha5Id+XdcvXrJgeOsAAAA=
X-Change-ID: 20250714-uvc-racemeta-fee2e69bbfcd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Georg Neis <neis@google.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series fixes a race condition when calling streamoff only on the
metadata queue while streaming.

The first patch fixes the race condition and the second patch replaces a
busy wait with a waitqueue. It is probably overkilled and this is why it
is a follow-up patch.

Feel free to apply the first patch, both, or squash them into one patch.

Regards!!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Fix race condition in uvc_video_get_current_meta_buffer() by checking
  stream->meta.streaming under stream->meta.irqlock before peeking the
  metadata queue.
- Introduce stream->meta.streaming set in uvc_start_streaming_meta() and
  cleared in uvc_stop_streaming_meta() to prevent URB completions from
  acquiring metadata buffers or starving stop_streaming.
- Add Reported-by: Georg Neis <neis@google.com>, who also reported the
  same bug internally and pointed at the race condition without
  meta.streaming.
- Link to v2: https://lore.kernel.org/r/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org

Changes in v2:
- Use a new flag in_flight to avoid keeping the spinlock for long
  periods of time
- Link to v1: https://lore.kernel.org/r/20250714-uvc-racemeta-v1-1-360de2e15a9a@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Fix race condition for meta buffer list
      media: uvcvideo: Use wait queue for metadata streamoff

 drivers/media/usb/uvc/uvc_queue.c | 27 ++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_video.c | 32 +++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  4 ++++
 3 files changed, 59 insertions(+), 4 deletions(-)
---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20250714-uvc-racemeta-fee2e69bbfcd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

