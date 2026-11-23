Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428384;
	b=iqmX9LoDXynVBssV2svV5h9SrQ7NeZZoQ4qWReSOsEyOhNSAczkq+R0jQdutjfyVLiTl
	 ALc5EtYbCfda7psRHYqG9CrUunkpXXw3Nb9XTVOZmMEHnk9ZYXpfx1ff9Sfp/u8i6Zoz3
	 l/XqseghvnJma5ys+ZfZ70aejj/xMWiknCv223KtmCIugzVs3pR4VnT3vTBjr6Lj0c8EX
	 ztBAgdbOr3gGloyQkwN2XGVdYlsvWOAMq2xiWPg1P6N21Se4LDFotcGVIsa4W5eqMRZyW
	 c0Bl2HrUc2x+01KiMAgok4/PQvGm1FDmT9YStBE8Z7H2hI681UpHd5RVnP1wbsnbCGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Qb/A1/BMTIlaDj0IlRnc07XWwEZCqGHcxjA0/m3yjJo=;
	b=e2BZ+2emacFZUEGPzy3Q0KG9JmA+jUZDxADhpE5vnPT4l+Obb+UIyDoFS8PTX0YzXO5N
	 vQju6ju+Hcy/dyFO7Up/uInu97SdQ5tGNuQqxgyjSon1cW97Eeh0/OKkwPXb9QspLS8OR
	 KNDpeQqQOgum9JV3qRDu4mX0CtbCWH6V9diRLkkZvKbhwXCpdLNPUS9PoB8eSAQ5u9EwA
	 3D7m9/JostXPgI5IoXqEgyk61PBg/fcGMfecEoygsJb79fMTQf/aRJ2oVGswDy+g5EUKv
	 AFZjF4XtkJT688WVf/ikZZS25LguT69O2ZS/TduN7CIhE44kNRSxn2v/tB2o+NwCQIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Kl02Oyz/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72693606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72693606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kl02Oyz/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386b8f2f671so140905eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428383; x=1796033183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb/A1/BMTIlaDj0IlRnc07XWwEZCqGHcxjA0/m3yjJo=;
        b=Kl02Oyz/tOz3/lYmGLFclT4PQJtcIO7vfdI/lCFYgd0ZDiZRMS+qmNZ3VDCJA4TYNG
         WdmPbfAGA9Oz22cmUhOQjvmvLeApqaBUJGtVUj7srTVi6xstDMePu6zpyji2ztOHy/WR
         al+/hCMJbCJMsrJyfjstNuLJvM7tx/bIRhXe1dyw/Pu/x6B1YNdu4OV+VN65fSjuZfhq
         2Q87zzBWRNPTdxjXAyFviDIgfX/hjlwCbIhBYlIVT1+XZjajY/sbHq+EQJEt6g5krGf3
         qunL7OuobmTN0pGHcYFmrWQn2oswyNQA9njpDP5weonBKRedl+nsiJVwXcpFNFZ9R17s
         2oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428383; x=1796033183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb/A1/BMTIlaDj0IlRnc07XWwEZCqGHcxjA0/m3yjJo=;
        b=EQwfKld9fwdbM8PGs/HwxmmcgSleHy8uaqZhDQr4MuSgpkXPqgfkFrUT1DCZ9gxO6A
         Gt6W9buIzwccEZXSSHEzwbm7RRcLXT68dDxpKfd7Mb+h9yk0RfS9RRZl9zWtzjmlH+IE
         nuti+EzWBbhpDIcnAjx+0kYImkxQ1QAWGNHEvxQrskv97otawQA0GadRdNMbvNZcuOlY
         rbEP7AUHFqh4B/HyRUrMTsAlHOn9vt+7dMxnfBitci0EzVJ+QOQaKZEwmc0BI/oue9hT
         OLZbN+4kAKjRA0nwNg3T38FqTp4QTHQRQsczlJdRfdROehrawoOUaEe5yGVmYTdUrJfZ
         a1ow==
X-Gm-Message-State: APuU4Z845G1poZy+N00tLTgtaVQDjoqxV7JkM2ci0/gOiJh7wJV4Uacr
	ZJwKzcTMWOaey+DhtmbpXM+8KhG4bdfvcFso4LeEQUsSK/VdYgJYfdO1
X-Gm-Gg: AZFdTZeU/8NjW9U9hT/P522gu4578D+OtPFzGWhRQKbfmPZZzD/5FD3xMUZOmjg44Jw
	5vuIU9ewIBhbNq5YNKtTMnkXWQVzgPIkYYzGbjwrz9h+C+VflT9P7hrQicr3YTFW3tKd68dYgq8
	16cQzkx44GJDKs+o3YdfpsUTp9v9QizIwWXqsDihonQu9Ud6wP8WkNWzb1Jx3XfU45Svn1VwMme
	tWOfDWY+GholXaaJKF/goSAd+K8vm9NG7bpEgefG9ms7jF+q6+5jdHGUDnIo0cRgcsDgI78GEqg
	CsyLPcR1t3g2SJf3cu5ImQU+59HPCZR+v1MrPCXngaOV5ahHhFzaUe7doZ5nXtARrQCCAUFhH2Y
	n4KTTGo63gHxqBXGs1UfEcTrIRjqgJ2aSJ8xiZ6lbZXXlefLxNPVisa/y8BDL0SeR1Dfi8MWULJ
	+2fOZCEpmwIlKyhZSgc9qmDXqa/zTc18pfWpBupgFeJ268Kj49eD8M2ALrUePdkp3UGJPVnwZNk
	bbPVVxsrPipIwnqPOuzhuA3E0bYC7zeUyWiG9KK1/AumJsITagYbrj3CWeewWwe2rWcdqi6CG//
	kTUrZ5uHtv+xDnUTZztqvuDoDlgTYF+U9BHy+cHrqJ94JOPB184=
X-Received: by 2002:a05:693c:6390:10b0:386:ac97:f670 with SMTP id 5a478bee46e88-386ac97f867mr3232917eec.12.1795428383429;
        Mon, 23 Nov 2026 02:06:23 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm35968437eec.12.2026.11.23.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:06:22 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] sound: core: Check return value of device_create()
Date: Mon, 23 Nov 2026 10:05:35 +0000
Message-ID: <20261123100535.3025-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The sound_insert_unit() function ignores the return value of
device_create(). If device creation fails, the function still
returns the allocated minor number as if registration succeeded.

Add a helper function, sound_device_create(), to create the sound
device and check the return value using PTR_ERR_OR_ZERO().

If device creation fails, remove the allocated sound unit from
the sound loader list, unregister the character device when
preclaim_oss is disabled, and free the allocated memory.

Return the original error code to the caller instead of reporting
successful registration.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/sound_core.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 10db8c699630..90d59b14245d 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -231,6 +231,21 @@ static struct sound_unit *__sound_remove_unit(struct sound_unit **list, int unit
 
 static DEFINE_SPINLOCK(sound_loader_lock);
 
+/*
+ * Create the sound device and return an error if device creation fails.
+ */
+
+static int sound_device_create(struct sound_unit *s, struct device *dev)
+{
+	struct device *device;
+
+	device = device_create(&sound_class, dev,
+			       MKDEV(SOUND_MAJOR, s->unit_minor),
+			       NULL, "%s", s->name + 6);
+
+	return PTR_ERR_OR_ZERO(device);
+}
+
 /*
  *	Allocate the controlling structure and add it to the sound driver
  *	list. Acquires locks as needed
@@ -277,10 +292,20 @@ static int sound_insert_unit(struct sound_unit **list, const struct file_operati
 		}
 	}
 
-	device_create(&sound_class, dev, MKDEV(SOUND_MAJOR, s->unit_minor),
-		      NULL, "%s", s->name+6);
+	r = sound_device_create(s, dev);
+	if (r)
+		goto err_remove_unit;
+
 	return s->unit_minor;
 
+err_remove_unit:
+	if (!preclaim_oss)
+		__unregister_chrdev(SOUND_MAJOR, s->unit_minor, 1, s->name);
+
+	spin_lock(&sound_loader_lock);
+	__sound_remove_unit(list, s->unit_minor);
+	spin_unlock(&sound_loader_lock);
+
 fail:
 	kfree(s);
 	return r;
-- 
2.55.0

