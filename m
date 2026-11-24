Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514794;
	b=h8BUky/+nWbCg7XB8V31xcYpSqIBRrs9h3nEq7DLt/isqzHOVyTHDezCU94WWADwUg9K
	 iXyhTh33MuYmNP7NREnVIFEYZMDZr2vjNJ0A0TM2F8t4bzElgGJQa9r+9xwqSR+T7TVpG
	 U5qzU2/jlS9VMYGZYQbSSC8EThztNfrKz91wdR7TpI8k5vdimScqkIwxtunUc/Jwthr9M
	 BRkpq2XNsFoZTj4ljFNUU+n5tuk9R4ma3KSs+PKYTIs0pZGfpiLBN9WXk7jZbXKLZDtg/
	 YQJ54WY/HfTljwd2h6iPGr7Tt8q+hjMsFRD8K6jNGthxOS1ce03wMa5BNOkD68R/Gqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xCV3uHv6UUGCtV+qOA/N0OQ1sLrfBWMg/N6VVd28diA=;
	b=hrkoqKm2ukv0eUONivDs3xKN7BYHGZyyvf4FFJFXG26q0syUHhHJXywLeSAkzFo9T4Xa
	 AFaeC/6crzgizyCM7vwDUq3xcJud15cXWqOOn6gOLYeMl3ESc+/LVqE46XcEsVVoOz7qD
	 6KW0fZQ+r/0AJ1lQlbZOZi4yzYmA2I3YZiUEcemNYtXrfoDR+/6Kjvl63R83A0URg/0CZ
	 eR4yYPD2vgvLjbAkp5fJpHgNYWTCt+LZ5q7qk23Llp7U22NbnAmglUDA9olEG5d4S2Nfj
	 8fEv4ZCLi3+w3n1xLgihwfxO2M8BHg0N2zDsVIv1slEpA4lmz1J4cjbLItUki8dpuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="JD/QvWSY";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B94606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B94606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=JD/QvWSY
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4DCAE3FC3F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795514786;
	bh=xCV3uHv6UUGCtV+qOA/N0OQ1sLrfBWMg/N6VVd28diA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JD/QvWSYpBpe+tu1dO/I3xnCXP8flTGMvmH8QaDTLuk06IWZdJJK58a8ErFf6MWJm
	 WubsxHb3z7w9Xuu/t+ZMBZWyQbVHGOz+SzMaKebvpPJAh1gUfq1dItq81XOiXC0Fc+
	 1+YZep+e60cvk6t74/e7l/XmRX5enZ+9PqRZJXrPpZwcdX4xwrl/NDt4a6epgaz4K+
	 lZOFPZ4IE+zjYyAhpm29Fz18TMVbf8E/ocs5axNhheOsdNnGJoIZRiKd76uOnmoROM
	 THzdhzs5nn9nk0SlSo6/mMqtV2dNZxpre7UVdXvDH5fA3E9jFaRh5u+Ljk7zliN7Jf
	 PylG/H516pupDQYPFY0VvE3PXXQjJh0CVUy04YK3kBgB8Rbr4D/f7Sg+aKYPEw9p6t
	 TF2GoW+vLNW6I1FNS1vcaL8UoCawyKVI1/XrbRNV6Oe3D7envZeekIz9lcJ5WP/W6v
	 7nERnJTTi/R1HxdOCM9/7V2xoYoP2JnHZYIQGDw0k244HF0mFN2qS5g25IqOXMvnTQ
	 hVCS3/yFb1YK0pBWim+NS2yFLdulNMzTe2U1jrgul0wQG2kpD0M0Ej+UeqI9DuBDDm
	 dJFtbsJT5hHLt41VUEzj3VTl4L2NO2/1darqY8LY6GNenUOEStXV90r5W+AM+ZlKtt
	 yaAkmWnujmETZBKnvNS3HTaM=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so38583385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514786; x=1796119586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCV3uHv6UUGCtV+qOA/N0OQ1sLrfBWMg/N6VVd28diA=;
        b=bvsx4NDgH0gS/VLcWFNEb0eSfy0S1luYIR9Hi8SAnp0AJxBaClxHHHcu8zLypWSkt/
         SWCScRql20sY6t8Lh4F6TYWJGS2FGQknR3dfDMJyS14mMILeFzA67RQ+W8zvYgKequ8u
         63e0xPcxvTdmp2zG8xcTj9sQDXJruY7mZuuMxLB35lULOHlsrcTNI8+HMzrr/vRmMV+G
         azTxUQuLk6Lko0xIpu1oymVMeYrYKU46jZBcrY5/+2+Rs/P4DoA/uvLR6m7jBeXYIBvP
         asfmrC0BhsCedhG1i2cEJqSk2kd3WH+3sDQQOE1VN11fjOZ7EACkTqSqVDwrdfYf5uj1
         h32g==
X-Gm-Message-State: APuU4Z93sYFufs5v/ZTqiLVkyJ5qtZLiBoavPo1Tndt603mOksEvsW9h
	Y7GTQJalTSs7lBp90VEmdsFWalGqLg2JzgwTDNjmVrGTv48ZNTALs/azD5yOOXbGbLn4c+Uc0kJ
	MJKBXRsJqmmzz0RiS+M1Sm2rvFH0EsAb7rHylikl1w6SCm3Tju5X7+/9gmtSXJ3dS8TqvFfHsi1
	XTuk7HrA==
X-Gm-Gg: AZFdTZfQTijiGTVuccCOXbGjMZBf0b2Bh02WCMqv1EcuM3rX/mk8qDP7qD3U/z6IxCl
	jjntAjbcsiYpUU9fJBaF6jieWAch3Mdd1QzeSB2B66U9PDaVUDVsQj4ix3VleyJ+CXXv6sTWjQy
	lMHIOoD+R7a64YCBIU7R1r617qoUBiXJrmEitKjMekAmUYYnXpTUovVkrzJx/XQ21OrpzXOp44K
	AEply67xRm7faSELocuOkho9bi0oybRcOy1pX17CIMtjt5399ywBUo+vhOw59+IR6SlcUWi/ZSV
	Qh7z4K+hUCq5uw2XBJEK70QJ1cQHZLLm1/b0GWNi8f/r/yMZLCr6oSjJCYUFpAjFhhCXNDoygAA
	0w5zRlk+SPVc0oZhWHkfy0WOSnqshCnpbRh2x6mkd9xt83Q9GkmrsjyGwfIdJy9s=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr287877155e9.18.1795514785692;
        Tue, 24 Nov 2026 02:06:25 -0800 (PST)
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr287876405e9.18.1795514785213;
        Tue, 24 Nov 2026 02:06:25 -0800 (PST)
Received: from px13.Home ([2a06:5902:822:4600:d3c1:2e3f:2545:da9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27831841f8f.48.2026.11.24.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:24 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: [PATCH 0/3] media: uvcvideo: fix control restore on reset_resume
Date: Tue, 24 Nov 2026 10:06:20 +0000
Message-ID: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
X-Mailer: git-send-email 2.53.0
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

uvc_ctrl_restore_values() restores each entity's modified controls in
index order via the transactional commit machinery
(uvc_ctrl_commit_entity()). On devices where SET_CUR on a manual control
STALLs while its master auto control is enabled, the commit switches to
rollback on the first failure: the remaining controls of the entity are
skipped, later entities are not restored, and the rollback copies
UVC_CTRL_DATA_BACKUP over UVC_CTRL_DATA_CURRENT for every dirty control
in the entity - but BACKUP is never populated on the restore path, so
the cached values are corrupted with stale data. __uvc_resume() then
returns early and uvc_status_resume() never runs, leaving the status
(interrupt) endpoint dead after resume. Observed on a Logitech C270
(046d:0825, USB_QUIRK_RESET_RESUME): SET_CUR on WHITE_BALANCE_TEMPERATURE
(selector 10 on unit 2) gets UVC error code 7 (Invalid Request) while
auto WB is enabled. The only userspace-visible effect is
"reset_resume error -5"; on such devices, every resume of a camera whose
controls have been written fails the restore. Kernel log:

  restoring control 00000000-...-000000000101/6/10
  restoring control 00000000-...-000000000101/12/11
  Control error 7 (Invalid request) for (SET_CUR) control 10 on unit 2
  UVC non compliance: Error -5 restoring control White Balance Temperature
  (selector 10 on unit 2)
  reset_resume error -5

patch 1/3 reports the failing control (V4L2 name, entity id, selector,
errno) when the restore fails; diagnostics only, and independently
useful.
patch 2/3 restores the auto (master) controls first and skips inactive
manual controls, so SET_CUR is not sent for a slave while its master is
on. Because the restore does not populate the cache, a master whose
state is unknown (not restored in the first pass and not cached) is
queried with GET_CUR rather than assumed; slaves skipped as inactive
have their cached state invalidated.
patch 3/3 stops using the transactional commit machinery for the
restore: each control is restored individually, failures are recorded
and the remaining controls and entities are still restored, the cached
state is not corrupted by rollback, and __uvc_resume() returns the first
restore error while always resuming the status endpoint - a status URB
submission failure takes priority over the already-logged best-effort
restore error.

Verified on the C270: with auto WB on, the WB temperature restore is
skipped as inactive and no error occurs; with manual WB active, WB auto
is restored first and then WB temperature; PLF and gain are restored
correctly. A 120-trial census across repeated
suspend/reset_resume/capture cycles (three control sequences x two
formats x 20 trials, camera autosuspended before every open so every
open runs the full reset_resume restore) completed with 0 wedged images,
0 restore errors and 0 recovery interventions. Returning the error is
safe: the USB core treats a reset_resume error as informational
(usb_resume_interface()).

Unrelated: the same camera also has a firmware-level race around AWB
mode writes near stream start (userspace-visible; in our testing it
fires only when stream start does not follow a reset_resume). May be
addressed by a quirk series later.

Chris
-- 
2.53.0

