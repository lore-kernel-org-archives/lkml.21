Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962310;
	b=EJvKEZyEsHwjd/+qwaM/sJz+Q+6EWk4BkCdJ21S2ZzW/W60xKtQj1dmy3dME6Tram9SP
	 qdPQP+yuWx1Y6+oKaY+3sBh7/2iqFsUMTfc7FjADxpTM8pTFoauoAMBSrSFqdlzxjoBjS
	 ZRa9Nt7nPILGDsH6fKGdmg0/Jj4SCDo4IwDLEXeIOVPpl7SplSIw/oFu3wzre2Jvx/cwc
	 UejLFL314Kqd+ezxfzZ70Tky1p++6nUG80TNGJebrrTX3QUx3Iv2rNetwShLwr/z+L2C5
	 L7oUIuOk8ZGjDldhuwvwDzi4cgt+zm9381ihGKPOBS3zYuj+h2fJ61PDjfT3Dx23Nxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
	b=taSioWsvdl0XFmvFqIj+JviVYxjsRDkzjWqIXid2KK+FuXsIheNrK/peT3WzgTMpi81n
	 oz0fXiJwRLj+pBaBKRZZKmZ2EhHhmEoJO+zh2xVcGQlg2wRVo2JdjK6pG/ivaY9ZhmxQx
	 QVjyILdmUkTwNWyiH+oZ+Q8qtGYq1mvz6ARWXly/SSDYFMDnd8H7Wf/u1OY78vrnPMD3L
	 Jyf+4qBcmMHytHBYeAslIvyx8D1AEwy+QsywCoaQwXCypOua5MaV9L8D6PAC8+3zEyq1t
	 UwiHGh87y+IP44sxacR4zyi/x30c6l31alyXsK6Vr4CgzfTMc03CPOUXkTEVAo4wxYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3O2G2t7;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E4A606A88B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E4A606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3O2G2t7
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382c3c9671fso223061eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962308; x=1795567108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=j3O2G2t7EleXwjDSIAXaqkz83fmJajqHRFZEKncFhXPzTewJP43CrYnwjn/nS6ICvu
         JiUf9vSIqK/o3Ps1+23SbUg8UJwXFTWSfZYptuVEOlCUI851mjLbKEGjJ4DbmrN4IXj4
         AT3ClrCSKvM+DL6z7k8MFJzs65x7VUkXkTJZUNm8dBbo8s73K2zY7cCZaVH3K5tPA3K6
         q2AePKO+oIU67bI6wd8jOnUFfPugWm6jTtc7oBZXdNWhB5AGfdxAVh0orWOBDiLKcTOI
         Ua3kmlgGLa6NkPqhQh8ew4KonWIIzhdfh+Bbv2vj+MRtQYuggZu436UmGgQ26MmfER/V
         oSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962308; x=1795567108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=C4hwEPZCOBhfev1HwUWubwdyy7gYVBV8lCYvE33fxqRYwj1qTknB4E0oUZ+gQk3zOZ
         PJEYaLJrpfQJ9LWDl83mtWl9/Aw8XK3d/ay92z9ppXgEy0NFBJrJHcMtNBh/3qBveQ1x
         hdaYwM3D1F1eLO6z6LCYDC9NGMJSD/JCPUIH2SyqLS+IKzcd9ys6pbic5PXMTU5b0dNb
         WMj+mhv41jiJyGRFw/PQL/U0kTn/B/XpP9ku7zZjRaJiGNHQqKEyFhUCrKudpHwKGssp
         4Rt80JLYgkxjMUKrTiSUENM+ghQhXL/KOdOfRKtGlc3d8FiZbR1YtGiR1bgkvlroXWi5
         +bFQ==
X-Forwarded-Encrypted: i=1; AL+hErHlfhLBFdKlXN26XjpbA2rLUOKwZGfXZZ0EbxWJK21gmzmFDvt5JB7zeFzrnc6ZxIdd4cNSMsrbR5j7oHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TLnbmYbXpbd6CqME2FYe2gXjpMMrPUMnXl7KLrCecD+ScOIjc
	pXfq8uUBnk+MAM2ON0XVKFn5BXy9J4yZw6lYPCyYEDNWddSWOZRhM7Iuo0f1hMKqcSQ=
X-Gm-Gg: AZFdTZdTMVBcckllhDgp9/pSKNKrRjWGAyDq3gHPNgVQaowaoUNO7fJyjFv82mocjVW
	O/vysb33H8sjnylvYptd3VIQ7VezCHWGRw/mA+f+zHXh4s3i1ZX2iVVEbKjO+yQY3vuJAZmbG0P
	A9zLfQNB97q5USuyoRNfl0nJv7crP+A1DF6eOIb7EV7EwAR6JN8WWpYNmvSsE6oI5c4VDKlIu9w
	8jbFaf/Fjasc4MAc2+/DXEsqAVwmGHvNK55H0KfD/fbtmBoOBZy42pdvMW5QZUgPJJgQm/6/aKC
	YIgrV/9H8u+ALxb0vNHBK1GmbaCg1eusW9nhnphGaLhyQ+PMYn23mHpXJ5tgRid1az/9dLIJRa4
	H4Zpr0vKiZN6aqPgf/qMXjpdc9qW8VQ0XWXG4qGdUQkCq7WL5dwjoFzEr7kT95PtCPM+d9DR/VS
	YrYj8mmbWQzEy/ENxIbTxzCE0Es4Q8tBKaLKPFt7i3BGX8CP7hVTTLzzcxwgoG5nMlMfJ3kKs9o
	vj62gs9eMffofFcVuPF3RLr9Ie8UkXR7iRAfUvaPtYxrmgnoSRZddUYCLIexD/afXcodS0/df/a
	IE8V4ZO79fekyiow9fBjAbynKux9aTznpAh8ezlMy9TcZW5xUqAGeJj3m2s=
X-Received: by 2002:a05:7300:d18c:b0:36e:53bc:467d with SMTP id 5a478bee46e88-3827abdf096mr807203eec.0.1794962307806;
        Tue, 17 Nov 2026 16:38:27 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm1523892eec.21.2026.11.17.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:38:27 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: paulo.ravazzano@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:37:42 -0300
Message-ID: <20261118003742.363133-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
References: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 6787d5189e32
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 6787d5189e32 ("media: i2c: saa7115: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/saa7115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f113..32c526df1 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1868,7 +1868,9 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1927,7 +1929,9 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.56.1

