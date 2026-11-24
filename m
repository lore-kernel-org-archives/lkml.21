Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504494;
	b=WiPfIQBErbMuO5Fvu/FTvUBBjigcujGaWFLqQEgulnHTG0vrJzlrz3BOc3mdVoGHcyiY
	 lb58kKTR9V4TQQgd9FHiGoU9VSsocAeXRnn4Oa7ryLPVhNuV/ujaph/mmAjot6KJu6Btj
	 253i/kGfd1VWpg1OfCvWMFRw5TTiIwBfXf0kQ8+kN3960GgVE6gDc7b3C12EGLR4Tr7jU
	 Nd2saQzPtSJyvJgU48EcRjJ6T3cxGDyxLkM2LLsPSv5qrG+5A4Gi6mTmlTOiaKHNY1cpm
	 NsWw3PMDmfIW+gfVyXy2Bb36Hyj/b2YGyZ4rC1tr+71vX8NaJlpRlZNoAdwtDhy2Qeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r92WySJltCbzAIQSkhCxDUxd/ppTsO+Gy6IJ0fgBl+I=;
	b=rWp7I6ANp2kCFitfOR2pJWiRUKe01iAwLihhOtM9AuA6gsIPrLgfhhQAXoqxA24oKm3i
	 eLjSJuKkrw674cuoHCZJIpwnQ95xt07+cbj4JTYI9UKuF5Z/JHitT2TnGE8/7TLK2FZoK
	 UytIfGshU3iIhZ8d2t0NNjh65Qd84TEIKoHMXWWQ+GTHc2jWU7+rPQZ3mpGexjRVZYDqS
	 vGPWTAdlh3RDq5YpGtVoZLKRE4Xc0KIhKt4LJjE+uzVS3kExDcMVMKhOohhZucveaduoK
	 rIiyzGlfLoLt1sE+4s1nd8wjQn4n2U9bpH09uz6NKewVSBXSSe7HgHgBrCcZ3sBc9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQOe79FH;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129B606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2129B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQOe79FH
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso2821583b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504493; x=1796109293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r92WySJltCbzAIQSkhCxDUxd/ppTsO+Gy6IJ0fgBl+I=;
        b=RQOe79FHMOX81GjJpMtYnYPXVbf+elJ5fnF6NYa6DYl81ZKmLKrf60ZN/PxnkilUXF
         v0FArxdhFIHyVMa9HnCRjpY3a+XwsUapCYSsw/hqT9vSOP5HYiU70pCIwPJB1Zhhzn6C
         xo/+/Ck7EIL7pq6cQT8iBIVlhoFOJ8IHVDcx7rcotzXfmJOurZZ0oX5xPdn5MsMdnRBg
         PFgp7KeqJqnu1jryuFzI9jCJ2lqelIFbYDK9ouoWszngql2Uknst0II0dDCmddV+mA42
         2YzgwkXM+lfyfVkQuNHtxGaMplw6PxVkkGXvdD5uMW7dHsIOHNvLF9US2Yb3RUHkpG3y
         Fo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504493; x=1796109293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r92WySJltCbzAIQSkhCxDUxd/ppTsO+Gy6IJ0fgBl+I=;
        b=Lfn2GMc5hXpxafmDGNdUPKwb8XsxZo2CgQFMfIBp9K6+zKNWIQhPdSrj0V8GPk5aZ7
         oxbsQPg0710ojYZCDp2FkWoWl9lGdebxLZnLxN1Ehw26tNDMOfWqb4Iuj4xd+7e/ZA4x
         pJZcauUl5nqiP44JoTTjX386+003AoC+gWu/ootpa4hqLPn4nZnbdcpMubf+xAozuLlD
         VcN8DUpfnmzuDyuX5Afp70uttG7VRb7OOAU6Z+wGbJx63t/X0c3PB0SPQl1XYLmiKxgn
         TTg15rec5TIVzeKW3atQTlCNLsx+B3V1OYetsJj3C0QZTKqKdeR4Rsbi9yy+XVnqcQWf
         Q+sA==
X-Forwarded-Encrypted: i=1; AL+hErG0FPYP8t2MOOkycWk4+AGMOz7wnwSQMhqlziPSN2LwQTZHScU5ePS6QUTcdTCpqu0aAfh4IaKyHFWeLl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IxNI0+vgPfUj8hiL9yAkTc3xVPDT5QmWan/IsEN79iduJylTt
	OBtAZKsoHJYZBuTHZWF/Wx86TC219JHrXSTua9vDP/dFjFjPkmlZHIv6
X-Gm-Gg: AZFdTZdi645lxVlDwEg06Yyg2SVDz32OdDgODm4JxKdJxnSmh7QHlIIrwbCcB1ZypYE
	n50MmVmNZKy6S5ZIuXSbtKxdtjpA6XmVwnEoNR0Js1DiMKNFJeppLFiU9OElmeuprmKcMvtUo+z
	r22lY4wkJ3v1ohL4ZyOuJOIKKKFOQNibGU+vQ72OfiNueTrQcr3+cxo4JoBkvsZE+sutqQa3G7Y
	jvS3SUAFIlbLCeL7oNXuAYPsCeGDvIWyz9FC1yPf2PNJhmGSwFM+qH0AOKP5X7ee5OtP8dX6i9e
	fJURY4+Va06V/8/CS33vdzEpc9ufbZfpRDkdfzx/lZzXKI/S8eNWo6Bc1KIlxYdlGhnRybRW10M
	x+IgyAuRBcyec1FaGuxg2u6NWy0dlLsFDd8mROeUvI5QvMRLRcEkttwaNmXUaWnEjYGaj7nGNGv
	ya05O+PE7dmucuA0Z2PUh+EsrCBIDb5VmdQfT7JKvvNAQe/qUpnlwu5g+ZqNWAv7fcFhQjqyFbo
	hP+rSeHd7AQrHR9dviNXxtU4ewwy6MSCH9a47lFdVVJgSOoQhvc/fC8euTXvi4JGC8QcOBJAqKT
	fvwO31I/8/BogV96C74Yk+VVDb/MBGshWcBwpEa9sl/Sg+s9
X-Received: by 2002:a05:6a21:3296:b0:3e1:a27e:304f with SMTP id adf61e73a8af0-400ae433054mr11434270637.35.1795504493317;
        Mon, 23 Nov 2026 23:14:53 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:53 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 3/4] remoteproc: core: Guard against a missing stop() in the attach unwind
Date: Tue, 24 Nov 2026 15:14:08 +0800
Message-Id: <20261124071409.972-4-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
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

When the subdevice registration fails after a successful ops->attach(),
__rproc_attach() unrolls with an unconditional ops->stop() call: an
implementation without stop() turns that error path into a NULL
dereference.

An attach-only implementation, such as commit 1168af40b1ad ("remoteproc:
k3-r5: Add support for IPC-only mode for all R5Fs"), has no stop() and
can reach that path.  Skip the rollback call when there is no stop():
with nothing to roll the attach back with, the processor stays running
and the failure is reported by the attach attempt itself.

Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e44b45510b4e..8c3fc85b8f04 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1357,7 +1357,10 @@ static int __rproc_attach(struct rproc *rproc)
 	if (ret) {
 		dev_err(dev, "failed to probe subdevices for %s: %d\n",
 			rproc->name, ret);
-		goto stop_rproc;
+		if (rproc->ops->stop)
+			goto stop_rproc;
+		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);
+		goto unprepare_subdevices;
 	}
 
 	rproc->state = RPROC_ATTACHED;
-- 
2.34.1

