Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099765;
	b=s07n7G1o3IQ5Q3ejdgZtPMQIb/0ye9Dbo2tEg3pHscI7hd2oyEKAHDx9LapCDKZI3exE
	 czJvxJc1Gz0PeVl4j2MpTthb3T70DlPdlghhHBO1ZyfV6EssTvHTBQhRu7WjmXA8PwB3u
	 1x8p3rhfnRzq8jZTaUC+G4UMKIbn3NfelmwCteXLLuAC/QHEIOgnEos0n0/xXsh0mHe9c
	 sUeJ42k2SxZb0v3p1Lh4vKrxFY575zGASEc+wt8Ib5F1shy2VYplV1N1JeowIAeM/3bSn
	 /dq3sqT1HC/tlUuRUzy5ehIPCMki952wJdoqHaal0JRuoLEdJoBXq4Ygg4wMHPtn4pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=iJQag5fmr8Xznr8HhT+POicXK/yHDqrGNFeMZ62CJB4=;
	b=oHSgOQlRZgnlgXT/EBhlg3G1DePFOwkmOe1GX3mXcdCXdRTPmub6QI5kHW92h6cpvn0f
	 jBt5WNpFF4p1CihKE89tFGSWa91DYe9DuPDc8JVH95NE3jsDelSzGYQBOzamgK1MDgDJc
	 2tN7jxMB9WGAmGDviY7jHKqW0BST0gEfhkMHmCb6wyxn2h5W+0HIfVeAy+EpqjurY40wk
	 pF4jw5NIgEs/WxXCkr3PPtrTY6dMuaAU9uJ7bGZQMww/Lq0I6MkHkkjIOedsR8Y0sqyff
	 5k3wfMJibdqgjxOFIOyjjCKkZQgjdYUKBopkON5+ISVGuUAVL5ynPQqGwF7kBk7mx/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AT3EXpnx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E403606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E403606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AT3EXpnx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so14822815e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099764; x=1795704564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iJQag5fmr8Xznr8HhT+POicXK/yHDqrGNFeMZ62CJB4=;
        b=AT3EXpnxFH2vcISzFF+yr3HrRsuaGudVPCT6rfpndYW1gGz2Gnjx37xekAa88TrvUD
         JZFfzDJ2sBcYcn06YwBYNcDsXkUHw6CJFfCZPAuQ3k+g/s5/EGXXuevCN7OMBjQ69j/Y
         n5YXPN/gJILrG41pGI7gTpm0+DwCQkp0SorjTs1oKuwGHKIU0vDdBo85pFUYYCLFIbPP
         mafk351d9I0lEZwP43Y7AZkP3Sc3PxXQBBxvthVrxPZhzC2Jkir4IcIcxVvz7lOULzt7
         g3Qa9aA3b+eNyGgAd+eY1KXsR/SEyWXfcOnLfh9DUWmvjoPMzre8wmvkUvrXz8s4we07
         f9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099764; x=1795704564;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iJQag5fmr8Xznr8HhT+POicXK/yHDqrGNFeMZ62CJB4=;
        b=fwymm1QtaZGTqCHrWmxbDZPAQPfWNBfEK2ixuO9O2cdqU7J8qQd4OePQReHzs+Hb0C
         q8vK4iLTERQET95NzafXUv8E/u6S3sWSmcCta/VbX14KG41pVNJ1ZbRpZ6apMMDeYj6D
         3sCZ/6wCgedaUROmYTfX48VKkmJbM/I4PXRX1cBKxXqbYkU6MFaU1C4Au3yHQSRgX/L2
         4PE62szL4cN59ouqx9rOybc3VzdLFzIfJL7chP+uiWrodU6ZlnCoUs2pK+g3owZDlvD9
         ksnX7Lk7wM195FbCWiK2Gy9eqm1hkBhT+z2cY9UF2chS3sClaGK2xBcmMGYfo4xjPVjz
         AemA==
X-Forwarded-Encrypted: i=1; AL+hErEk4eJYQdrVCFBG/E43o+Y2NdpvGr+W0bs+XiOEP6a37SL61hSmR23HQKCEf8cdMV2kn8fgbuSjAaljebc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T/CUP4WrNPYXsV1HFRKQGoiQJIgqD+Sr47IniRKsFpJZU8UIz
	W0v8cTBHVgE2BRM0b8X2dXW7ERPTOObKtnzW7zp6ToVl4bditvxFf+UO
X-Gm-Gg: AYBFou0JQn/Fbpp0/F95oU830QZo6yi5O++QNfTirJr2EnQPcpBikAhKNwcCKP8gs2m
	6gwUDNuHyJFMroDUCBCG8LwblnnY+dwK1Ux7rSykICaJ34e82G9nmD/0GuNTTbrMgl4bbXcTBg0
	/FPnR631wBwNeqFEeoXmlS3TQ7U0Q96s8fOABxdaf2IH1geAVFp84YVDRwUjkuRZG8Qalv30jga
	az4JDyzPVDw5ILI0vCnhsURGXpquUOU9ZqZQLYd3CD6y7eA6t+uO9KTZMjfjwtYoX/Q36lV3LOH
	xfxBu9rIyPV7IoJMH6DxTK4rGvOv8ZAjKIjvUHMy01Xo4BKM47+lGZbWy5BrRuouVlv0TsAKbfp
	52r7Oe35jcvnie9yNGVTuXIHceWOWJY766DoP6si/lgpx8LJ4ryV3SIUQfIaWUJXNGpmKowLPOM
	JOBYZ88V3tj9U0zqwzdQOy2PkbR+qMmpn8YddGkY5t5PpPqitSp533+uFe8PvWaGT1xN2adVe8t
	GnP2QTS3FFSPMdbfnQ3RRD+b4KUya78U8Lyi5gw5Pyu8vj0oUPfyh17sWX+hYm1QFtOWwwkQPuC
	9AeXKQ/rjbuG/6gjeeZRS8WpsJvzPJpG5KUS7Nv2iJAYWmHLxoMssfQ2nTwCQxU=
X-Received: by 2002:a05:600c:4f05:b0:4bb:73ad:c1f0 with SMTP id 5b1f17b1804b1-4bb7da21b8emr136305805e9.23.1795099763457;
        Thu, 19 Nov 2026 06:49:23 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm38881785e9.3.2026.11.19.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:49:22 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v4 0/2] drm/vkms: give every composer user its own switch
Date: Thu, 19 Nov 2026 15:49:06 +0100
Message-Id: <20261119-composer-v4-0-5973fc9296ee@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyw6CMBAF0F8hXVvTB63Ulf9hXPQxQI1SQpFoC
 P9uixtidHY3uefOjCIMHiI6FjMaYPLRhy6Fclcg2+quAexdyogRJmk6bMO9Dwlha5VkRFBhrEO
 p3g9Q++c6db58cnyYK9gx+9xofRzD8Fp/TTT3fsxOFFOsnKi1KqWQdXVq7trf9qmA8uzEtlBtI
 MMEa8UFKKNBGviG/B/kCTpXHoiuGOGEb+GyLG/BPc0mJAEAAA==
X-Change-ID: 20261111-composer-cc9620515bcd
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The composer has one switch, shared by the CRC reader and the writeback
jobs, so either of them turns it off for the other.

Split it: vkms_output keeps a count of holders, and a get() raises it while a
put() lowers it, so the vblank reference is taken by the first holder and
dropped by the last.  The CRC source takes and drops one per open()/release(),
which the core always pairs; each writeback job keeps its own record.

Patch 2 keeps the lock over the frame accounting and the queue, so the state
the timer read is still the state it queues.

---
Changes in v4:
- vkms_composer_get() returns the error from drm_crtc_vblank_get() instead of
  a bool, and vkms_set_crc_source() returns it, so a failed take no longer
  looks like a successful open followed by a put() with no matching get().
- vkms_crc_parse_source() failing now returns before the composer reference is
  touched, instead of falling through to vkms_composer_put().
- the kerneldoc of @composer_users no longer claims a READ_ONCE() that patch 2
  removes.

Link to v3: https://patch.msgid.link/20261119-composer-v3-0-dd470a820303@gmail.com
Link to v2: https://patch.msgid.link/20261119-composer-v2-0-a935e9bae6be@gmail.com
Link to v1: https://patch.msgid.link/20261111-composer-v1-1-9d5fa94656f8@gmail.com

---
Oarora Etimis (2):
      drm/vkms: count the composer users
      drm/vkms: queue the composer work under the output lock

 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 39 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 29 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  7 ++++---
 5 files changed, 61 insertions(+), 24 deletions(-)
---
base-commit: 97429bac371273886238bfcf63d78e7405cacb46
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

