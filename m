Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543360;
	b=s0kxjiMhnYi4i/Sr7lZn/tVMpLwtmrFu2YTLYhYpU7XlrWzYRieSD9Hp0aFFbkVKcOy5
	 FqZyumIByCQ3BznxGWXBCEzagWWgv6jHqVNClipCkawGUdLLi1Lc02wZ7UtIkH2Ju8QNn
	 d6Kf1pQfkRSAPMKLdZrKoVteO8yXApNbDRHbQ3p6N3C4ZCJwEI1+3wawf/FStNReO7HGf
	 toTmUA9+mNlWkiVEAvl/ddP0lTvurKuj0wSwggUXQoQMbeVWYx1Vn5n+2hqKKGXEtILGR
	 r73g6RAQKnu0+akUkK86wza6eNl/ZEgqOaPj5YXStAmsj/Oog0oPKjt7coiKAIw/9GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zQkgUQWvgHuDLhp8zgHPxhn7fVYRY6fg/KKwqiExn3U=;
	b=g5Gk3vE8TCPWy/LbzjFFr4Utl6tum13Kg/1SqtrvGrgGF9FoLKnddFCQXfnBe2GR8IXV
	 YRP7yV3H7TLMAEdRYnzxWQIgjzxC/Wm1eELHzWORVTrF50kyB6lBZqPdUVAPjESZx+ym3
	 wx7wAtCfXhJMfa9aL/GSCR8aJBD+k34HNfiEb/sqfrNhI7eoSpXauA/DB9NAPKp+YP8TO
	 Rttr850grrWjaR1IbC4JRE4el+EAySq5h749d1dCDtJzZ0XLVb0BVKRnUbfvYRHnzOqOM
	 hvCXkkJkZG59BD1Xkcz6BpKN4IsxR+KgYdmfzHEWSKH2OTcuE6Zq/rP6l8dutYV4Nxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kxT/wa2m";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C106E606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C106E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxT/wa2m
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-844a8bf7e25so2603906a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795543359; x=1796148159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQkgUQWvgHuDLhp8zgHPxhn7fVYRY6fg/KKwqiExn3U=;
        b=kxT/wa2mI5ypXdXzTiyqvREnUl3j2J6bmqGMGaiBZ70znPMyiS0zD00BWruxAwBCVW
         +2R1JiAl6gG9Y9yi2kEUZEEBIyG2s1WTzUAhQ8BllT+bLodxvbnK13O9mNVKOEuuMsLd
         iaCZ8SoUlALn+ghlbpOBdwYJ1cbidOo+Tdrl+l6SDW2Pm0wRRF4KKb2SB5vwe5ZYoPhg
         e2NJq6TBPgszeLWlddzfV3ZRhnPJ6wTQH9Tfj+VhrGMauSuhET6PXYPgubfprLrp/h4P
         UZfZLahhI1SqEQB3B/fBGeSvBJ9SnOa6LahihtQ5dnD15yWkFauIxty3GZmHBx/LQDp8
         5MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543359; x=1796148159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQkgUQWvgHuDLhp8zgHPxhn7fVYRY6fg/KKwqiExn3U=;
        b=cSV/Ml8f709uSuOk1fgFaKvRWq5ZjNvh3J40T8KCA5dVbBYOnApSxhZcsRj/v5nEnX
         rZEwI7B2nmrJ0ZNiP0OnSoVpw9VYYRmPKPrXj12qeSeFc7dwiqj2gfy2vPJDVgQ7xf8W
         AFcPj8ufjaNYpB8j35LkrYeFZxXET5JFoqG/uwxxi38WsCwB1Bjs4jxEpP5JlPsUekLI
         avlsqYQL4H/e8ZqV1OE6qX+2/ec1rjmyn+TYa0h+uSgTTkaqJtc39DRCmZLnVHADqzdZ
         uBIODmkurjhz69ys8MWXSBmeejssIek9DsK7GTUFBRSxhlx7emFL/it6lJ9YopYjsgcv
         1mRg==
X-Forwarded-Encrypted: i=1; AL+hErGzBSOV3cxH5jZnLZh+HS+yn03pm6RgE1V/6UosiiYB8fz55Yg+gnSIQskJHPguDDBOErpJBIcghZXT3p4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+Dkj6wW5dhV8m90uRQdhtRhtCneGLHfW/fz7I5JmYeIOe/fX/
	4niz1xqk8FWYGFhCo1rtat5lrMz8LSWKBq3afYRZLeXhV/+k0Nz6j7h2
X-Gm-Gg: AZFdTZdArjHOYUcdw8OTll+bAXdxI13t5EthE70nvtjPxSKXvAPTiFApBjRERtwFteh
	VyeLB1fRamAqHUfCWfvH7GwfBjvPwxSZPtSSd9MFi/sHgbJDfOssy0je/okJfYV5lMOTAD7mNZI
	zgfGtybQWf695VeTyXhxd/ly/TAMDpym/4h/W9UqHs7uYbT0fcaCBfN7saFJHu7XygFvxiSuqHn
	l+IWNCi5BiW5mnF9mmpAKxcR9W5S29RDyTIDxxgUFxjVZHE79ohw7bAGNB7F8fcsOJLTmGwLI5n
	V5VPnYipw3eRG4lAFp5UY0hB+1vDfQ8vFhmg5D+OgJrfJHKwdpIle/0zR6w7Qz0lQFkyQjsDogM
	1R8R4iPyYeEgLPJh68S4gppgUNUFA7PV5GDuLd3LBzhckiWCaR4soIb/es7dYrDSWnJrbprcibY
	qciGmKzFrwR6g3oLzIk3o/DWufV3rlz6WD9AvK/OrYftRi45F1Vu2LKIOVW2BWBSTL8kOmsn1FJ
	1U0AiVqP0DdlTjJehBOW0LAwZZB2JgyjcuBgpg96YqDXekd/xxNBVkZHe5CJXLwbfU3X7qQmDoo
	KBTsV0WMKl5pOGfTuMQWhk0Bbh+mZ4TJXddT9Y0UT7zbWB9iCHiLt5YSyanWJTEJ8w6TH3CtHKw
	iEB1/WKO1VxOpdYhwAt6GbbXYqV+wXFK2ag9vvjQwtZ/I/XxdbVwUcGDbyd8gKPxCLUI=
X-Received: by 2002:a05:6830:719f:b0:862:c685:84bf with SMTP id 46e09a7af769-863152f7117mr15179705a34.4.1795543358575;
        Tue, 24 Nov 2026 10:02:38 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm11940806a34.24.2026.11.24.10.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:02:38 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Karan Tilak Kumar <kartilak@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Narsimhulu Musini <nmusini@cisco.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] scsi: snic: Disable the devcmd2 WQ before freeing its results ring
Date: Tue, 24 Nov 2026 18:02:31 +0000
Message-ID: <20261124180234.400564-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
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

vnic_dev_deinit_devcmd2() frees the devcmd2 results ring before it
disables the devcmd2 WQ. The adapter writes the result of each devcmd2
command into that ring. When a command times out in _svnic_dev_cmd2(),
its descriptor stays posted on the WQ, and snic_remove() ignores the
error from svnic_dev_close(), so the adapter can still complete the
command and write its result after the ring has been freed.

Disable the WQ first, so that the adapter has acknowledged stopping the
queue before the results ring is freed.

Fixes: c8806b6c9e82 ("snic: driver for Cisco SCSI HBA")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64, SCSI_SNIC=m, W=1). I have no Cisco VIC
adapter, and the late write would come from the adapter, so I could not
reproduce it.

 drivers/scsi/snic/vnic_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/snic/vnic_dev.c b/drivers/scsi/snic/vnic_dev.c
index 22303f827583..44a2cc59821c 100644
--- a/drivers/scsi/snic/vnic_dev.c
+++ b/drivers/scsi/snic/vnic_dev.c
@@ -421,8 +421,8 @@ static void vnic_dev_deinit_devcmd2(struct vnic_dev *vdev)
 	vdev->devcmd2 = NULL;
 	vdev->devcmd_rtn = NULL;
 
-	svnic_dev_free_desc_ring(vdev, &dc2c->results_ring);
 	svnic_wq_disable(&dc2c->wq);
+	svnic_dev_free_desc_ring(vdev, &dc2c->results_ring);
 	svnic_wq_free(&dc2c->wq);
 	kfree(dc2c);
 }

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

