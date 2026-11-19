Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109060;
	b=WJSSaYVpfPcoJMPsFkMp8U6Q2gN8J+7Cw/nynIwzZSC9tPyhggbfyfJmUEn0E88NjGMY
	 5+LkZQFdHZJfCETX6RA8pRiYY1diS+pZySLAP0Lc3bH2r6lMuXzIH7AVmuRaGFw7gra+v
	 KeS08aMz2K5Qr9NY+0RGTsTSHmLkIwBSkIjc+7Hykd6YnJk9GksNKAjIoN2PvT//YuunS
	 hyL0EGm3jstvtZNPXhowEtv13bmGNeKot84bmeGqdIziP4qRLv10masbRpCfOETY5SQm8
	 iEN5YOLgcbrJrnMqM2Ud6DzRdyLQS+wX+dxW5b/YOl7i6WaPSEQblDUJK+8Fr21BAjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ybt3yDy2PVnBctTda6fFNeBbSLRMNED8RLSC/2nr034=;
	b=cl+NzW9BuHhWDRsL0CJPSJd0mkALo8yw5S37fXceAtbEDGZ5+LrotAk+YdmD0dNpw5WD
	 VMYcHyO+UZXZYUWfBwa4F13/IzrVkcK/Z6H0hkWgIs9vw9KPOSrDkzyo+BIy+7UXB2cat
	 C2PmRXxBcTdCl5dPyAqCYhHRq15G2Y38cqwmQVqbtvPUwI/TRI3FSoBEigqtEJhrvUtvr
	 7zQwrx3FaQufFiWF1jncX3ElasrEdodbO1GTAFZEEVBbhVOmlo1l5WWB1GcQnG//3nsyV
	 ZjBxxAwqB3gcCDVCj+nT7bGZrWWJ9ywUzDgorOD/C9llcIbV7gf9M6HI6vYIx/XhPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=jD9NsWHE;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=jD9NsWHE
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so28008815e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795109058; x=1795713858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ybt3yDy2PVnBctTda6fFNeBbSLRMNED8RLSC/2nr034=;
        b=jD9NsWHEcpatdmkdARhiuKvJF8rOijuHu4QsWe5pwXO/hCwFJt23oZzBSkW3RxE3ez
         HDXmr6cRmfsFwFAy8r5Gefm4/JTb+2WilSA9p9UYjvMupIOWW1BllrzQEBEzdPIpMkYa
         nsfL0+2xw5a48YGHj/+hdypYNNqC7vSWdCFI9Qul2FiDvBK/Pho/QdDVUQT2EXExT3EW
         0X2SSGfyKL4Jkka9NRhr087wMg13s/LtvgdBfHGc5GsHxeU+emJgMhKeL5rvyCcxEubZ
         C3REhaiwrUacIb5LugvECbYId2qVh99ulNcHvTXm4iuN/eHRaxfANYmx8W+w3CtthPW9
         l2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109058; x=1795713858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ybt3yDy2PVnBctTda6fFNeBbSLRMNED8RLSC/2nr034=;
        b=fOdboiBLypqwe4Uz/pCuwTa5uxGV1/FuctCysYcLaRGB7/hyFeODj/B1cfXbqhvvz5
         NSkxZXDoLui5ZM3py1pKkCi9yz33HNyEa8fEev4DobE4Ix/LbilQ2W1UM1P3CH1E3HpH
         n4fytB2Mx8Z+RdIznQPk9HAOH4LuLCejT6xqChPj+JdDyo2Uky5uIbR2sKQctzKpFXKT
         et6LqO5wd52qOIxqln6/h7Sfs+vRmIqIRtMr7mIyeBtFmCCG/YFjdwMMFN8UBlfZaynd
         8ZfxEsCn8qeAVbJWgystZPmkcDB+5Ay21s2VXmou9IbvbLvpAwWwBLuz8KQPKUYktk6O
         ZsIQ==
X-Forwarded-Encrypted: i=1; AL+hErG3MuI5clEywhYYBakPB+j7zG9NMiu0DyysApKUfCe0M9bn/eH3z0uqDC3zWZCnwP7xhHHHHQ6txENLQs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n7mjpLUpeVsGdHqFNfRjfXMo3XFHZY36PQwOqZrLzA5N6uKMo
	cKnMFZiwhTU6OnRWbqlVLQ2azSBtdvKt9el/vp9KVxGhx+cPwpm3zd8whk4ygX09SFc=
X-Gm-Gg: AYBFou36Jr2pPrjj59qgt8GfLxKQh58BHKaGtoyPfw2lLBGjNqf5ZC4Hsjb7qUl3gVQ
	Kxec+5nbU7OvoFpGJS5imGRM4JHvFhg/tRTCXRHJq5VoW6SLNWmqiNPngetw5k50eBGEWvKmtro
	FvwzHaMH/v8QzdBjUD2wHUvljeplW2YSFsb9/zGNXlOH5vzbSoj+7MLUk7oReTB/4iQSWUyKyWa
	zYhhpqQKZgZ0/zazV6F8Lh/nr5WnvBfO6HUmfdOkJ+GoZugc5Cf95jSJNeHY4jWdqlO+b1CX/oR
	2nHGsyd6LgBx12Z80BQOoi50v925R3O+KYCd7dheKK18or8XC2hM3bPTmL14i5KdIDgmpmswSrj
	cl+jOr2DH6c5XQXIdz//Ooi0eT57ggbkFaus2nbc2mtsU4Mqb0gXX9YJcUMsaDDHYSwG8toIZvn
	JZIqxtyB332YrY2zuPURu3iw0sD+jzIJBKn0tWhI21P98m1atFHqVM+9Eh/G/B/2z2PHpHOxfgg
	/LtMoY3DaALOdciAeqioN5oXSAy+v/mtlBOmI8npnOmWj8e0o1P2+9WyPz75k69ALiWUcNXtxUa
	9KBsPITk+zZgKmWOg7FzYtzF
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr4268105e9.18.1795109057952;
        Thu, 19 Nov 2026 09:24:17 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm17951085e9.14.2026.11.19.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:24:17 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH net] ieee802154: keep the original error after a netns rollback
Date: Thu, 19 Nov 2026 18:24:13 +0100
Message-ID: <20261119172413.2068073-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

cfg802154_switch_netns() moves all of a phy's netdevs into a new netns. If
one move fails, it jumps to the errout label and moves the already-moved
netdevs back to the old netns.

That rollback loop overwrites the same 'err' variable with the result of
each move-back. The move-backs succeed, so 'err' ends up 0 and the function
returns 0 -- success -- even though nothing moved and the phy stayed in the
old netns. nl802154_wpan_phy_netns() then tells userspace the move worked.

Keep the original error in a separate variable and return that.

Fixes: 66e5c2672cd1 ("ieee802154: add netns support")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a backport review.

On debian13 6.12.88, "iwpan phy phy0 set netns name T" reported success
(returned 0) while phy0 and its wpan0 interface stayed in the original
namespace; internally the move had failed with -EEXIST, but the function
returned 0 anyway. With the fix the same command correctly fails
with "File exists".

 net/ieee802154/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -222,6 +222,7 @@
 {
 	struct wpan_dev *wpan_dev;
 	int err = 0;
+	int ret;
 
 	list_for_each_entry(wpan_dev, &rdev->wpan_dev_list, list) {
 		if (!wpan_dev->netdev)
@@ -249,6 +250,7 @@
 	return 0;
 
 errout:
+	ret = err;
 	/* failed -- clean up to old netns */
 	net = wpan_phy_net(&rdev->wpan_phy);
 
@@ -264,7 +266,7 @@
 		wpan_dev->netdev->netns_immutable = true;
 	}
 
-	return err;
+	return ret;
 }
 
 void cfg802154_dev_free(struct cfg802154_registered_device *rdev)
