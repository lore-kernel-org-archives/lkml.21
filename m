Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244581;
	b=Btc+SCRbx5yfMxVGPA/leBDYF1QmqvWo2VtHiKj8apHcSbkrDRXXHpspPXc6+cMgcDAb
	 PwVrVQYFN4l3wgCUVNhkxB0uUoas199gYILaMA39Jtd04WfT0NpZweHRbvhCbxNyDEsf0
	 x3D+VnNWKx7Fj8+RKc3HUN1ZewV2MO2VfyakSo4Gc7+GCcUJKSyCXMQdVdDDkEs7fMESs
	 u8EspBkrtmuAoIYMSGaS2F3bhA/wtGPP9FNcP9UlMFcF2OryzII2ecVzxOpQTmzhj+lJp
	 d81T6qSreUd8bGB2ssPYv2yfx1lbh/dTgspPvxT+uHOEih4gUKOvBjXRw1P3bllUyXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EWDbsrVkRWC4HFqWsX65D8yUGLkpn215xh1jwQhzrJA=;
	b=u8q9nFZ6wdJhctXyZaSt+ogB9d4lMewDBg2EgIIWznQDwUN0S4U4iPcXH7HCXs4eL1ZQ
	 jAsNBsXvJvOqzsAbV82Q2STDRWuzwh0tcV3xb7b47a/FlW2p/VkcoHRPoQ8APOx9CUqwq
	 4iSsxZcwuvkKBfxMPDegkKf5uDcLaPLtPFtrpL7bEaadMjIOAZocYD3AHshFTAfjBVD56
	 gpOPxnWbY5OLoGrwhTFB3GQ4fw/aBFLojBQf++Jif/aMINuYd9vmerO70+wYCjACXr8lm
	 fwOdkM9vHZOgwa0fkzuZr6Zs7+++KcWbg6ql9AhBDdgtqGoLf9ocAQi2vQ46v1SlEew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJ2kO9j3;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902E606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6902E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJ2kO9j3
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1062264b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795244581; x=1795849381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWDbsrVkRWC4HFqWsX65D8yUGLkpn215xh1jwQhzrJA=;
        b=OJ2kO9j3DdVXXJD3XHJUtyoaumraB7SlkqMIahn9wBpYGK7LgMvEUFsfGdE30J4PuT
         sKF+mpcmgJtVbtQpTbFyqeKz0a/FXVdXhoaVwPveZAzuQ4UzRzS5x6zik6hGFhPcIi1e
         O09coAoFvWxsY2XeFTCgA7xOr0CBx54KSXKD0CFX1Ukf0mX7o1oLThdh5thXHyoP/LAg
         uTb+gz74dB58SInLG1o3ZCzzi3rDQq3+AJWBLxCFTSHoJWEFFhEesaL3ioFltUJ40POR
         8GaUpL/etXOfSXjDT+4C2MeX88/vEwmIeaYjkYfzj78RLvY6U9RD/9G2QHtrr62b94oy
         gSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244581; x=1795849381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWDbsrVkRWC4HFqWsX65D8yUGLkpn215xh1jwQhzrJA=;
        b=nKSZddLpK+Lvn3iQV9ks/eUnA6wjyTVHAi1Hodrp7WEYMecs/fuiDUrOlweo03W75Z
         T7M6mRP1tD084caTa9qrIj955VgnFJuXcbLz6Tw2CF9O4aAyAl/hI58KxsBJqFpRcTfi
         fb9vNhJW9xC3ARjq4idGJWNey2pNl9KOud5bqDS9S9k6COccwNLPlO3Ur6EXMnrmF7i0
         l10X8XdZHyz+Ki7kYPUjfKy48+thb7rB2NXS8YjGAdI4gtPlg7JKNPVXMwFi+K+amc16
         1oiW2z2boE6y3POphRpdcm1zPyUSPgghljXFfotxASqIaZLqocxptAJYPnNXrLyVfR4p
         ftfA==
X-Forwarded-Encrypted: i=1; AL+hErGBJYmqy5c6d8XWBBmoS8Iq96e+CW2yP2iFVJNhrWT2Qb3mVtvDbhL/LCNjCxeGCCq1XjwKil950vuuzDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AVYFaPFRkWu+S74WF5HhMXbGO4LGt6H8hss7EM+YfAo28bBOd
	ErAggMQ7Jm9C9h5wFlXktnQJlzoNpz6CwKEsFfa8Q5TQPdR6QYJ4DNGP
X-Gm-Gg: AZFdTZfjngEt3+qsk23ctWTvdW5COaKtpm4VZgjiWInRHhPcao6VAT/0VBIx6J1IaPT
	of6bCBb4b3ldcx5jRjoyEZAqnGUvfdv+tmyxi69YaFDSP0MQVQbuV6mTE7ep8IcQpL4OdleExRi
	P13HTlrON6KafdgubHG91OSddstTMSXa93mKjfRxqWfisnVOAgH6dgSTY+/iG3dsBHngcxPHZ8Z
	QWQsKsAbqAHwCUtgMI6TQjVyOC28TeiXhTnmY+nM/5VFfPlyHj0A+59duEB12yZ+DRFqQvE2mVO
	XRiO8MnBZOxwL2IPkSNwPsVqZiWg4Xozf4WFjHA61BVWpWD7qw8J+rVAQwprLnaXtkumjDHoP8v
	0bYIdM583kpgjMRB2sBfbd/c49x1mmcygWQXBHkwIfYFELGYzWaSyn7dEu1DNeKRrdcfc7xnpje
	0s+6WWsQe6aVo20Ng7aDCDew/+ix8nSgU2u0v0zjyJSAxHJM6MthkQ3zoAZPr9Rj4w3wqnocLUB
	uotDEzSNiVjoj3GGzkAjAATpATlKn7ZIfjAXOfN3G3N2HNxagXh2SjwX3g+y1ANnmkFY0ReXA8T
	7XUaSCJNvhADsnm7ZZ+PaN/v
X-Received: by 2002:a05:6a00:84d:b0:883:4a94:8132 with SMTP id d2e1a72fcca58-8c7dd9d6a17mr4587991b3a.20.1795244580532;
        Fri, 20 Nov 2026 23:03:00 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm2477793b3a.13.2026.11.20.23.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:03:00 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: RFCOMM: Protect sockets during teardown and TTY handoff
Date: Sat, 21 Nov 2026 15:02:50 +0800
Message-Id: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Socket notification and TTY handoff can outlive the object which made
the socket's borrowed pointers valid. Keep the listener alive across
child unlink and notification, and finish old socket users before the
TTY replaces its DLC callbacks.

Cen Zhang (2):
  Bluetooth: RFCOMM: Hold the listener across child unlink
  Bluetooth: RFCOMM: Close the socket before transferring its DLC

 net/bluetooth/rfcomm/sock.c | 17 ++++++++++++-----
 net/bluetooth/rfcomm/tty.c  | 20 ++++++++------------
 2 files changed, 20 insertions(+), 17 deletions(-)

---
