Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857998;
	b=lWHLa58gAmq1FOTFB2RulodWPTdQymitYUVuyw4mv0j55av5Zjo/JKewb/7LNz+jQnWf
	 cZzu6/Cayleg5OxshgLEEh9fjm0MjugNmYffBKZg/esA35kzKzdfnxKvNrEufK7iS1nWw
	 J/LCq9ZMvGr9DmS2LIr1aYrzRKrzSvH5vkmvA15i/WUkNBQ3dN8HbpNXN2vXpGlWvX0bb
	 EcnUGb50ypahL0EOsgOGmm0jmK5lb4tPeO2mMAkhcFzQIbjH6wgythae/JnVERETkJU86
	 H8AfYU7lO5JD32W3kUSNhC4fL3GdYfQ+zKTN/c21NAnhXBlL3ftroBFaLqVD6XjUlYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=SRnTEN/kcUWjL11zSBmx07TepipqRFHHEqCMVO7V/zY=;
	b=XWlu9evDHGfbYZgFCJDYizMc5gsIcBaNgp9A2jfUEuc5t7YwKVf99KMfjazBhAPA3kpd
	 Yu6Xm5PaNa+43IcGDdO3ie/socEMZRv4P+ymqILotT9m9eGnKrOwGRsLMhPq4u/zUPcJX
	 I6GuFLKnVqu5ER3hm9pxBnFdPLixHIB/x/CMw8p338s67WvkOUOpiXVWWisrPzLu9KgDb
	 UpDVVOnIe1Upy7ntGHqeGsffDZtEmEWQ2Mz37pnfyZwwB7xtFRJOVHdIv03ZABcURzZHl
	 ct2lCRdTTW43tGspUkkogBuBWNA/H/AH121vNHHeVT5SgHVo4iO38nTjsA8EvCn00iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Or+gTXzj;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A98606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A98606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Or+gTXzj
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da7d18f2fso9848377d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857997; x=1796462797; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRnTEN/kcUWjL11zSBmx07TepipqRFHHEqCMVO7V/zY=;
        b=Or+gTXzjT4nqjdVHx/a6e82Cq1ehtAeBkDyRimr3f+2xGfmX/TcgwmTR0qimfeZlYO
         8XY4aaadLr94Rylzx/bW4ouADzyfuouJT0F/eIb2Rln9lnHPEhro8i8FflOmmDzhgAI0
         Ng0KSfk1ZuYqs9fTCl8InkYaDMvExvnOTSDgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857997; x=1796462797;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRnTEN/kcUWjL11zSBmx07TepipqRFHHEqCMVO7V/zY=;
        b=2qZyxnHjd1GmUiapvl4w+79+YwVjCzuLCSaT6LuTp9HcoykbPWvWeQMYy2c2u8HtZ4
         XHaNY5z6bLu1s5dqGSzGP4RLjq4AG3/38kIdWsuUgaUGLU2wRHpZjKZKS7wOpc6qHuVW
         4dlLVScJK5+92PvxZzPjOfkFRsguWnOwPcdDfdzL8jBZ4bSX6UsCNhuaHn0Sz5LuFPQo
         tp+x9E3rOKWMx2OvcpTu3UP5kd5H0XifjWfWrrZRHtK1HQfBQf1JUSlLwzymNJWYGZE7
         gkSF5S0WBNSSqycgbF05eSqD+Ycz5GLRYKIi4jEGOS8c3zwC2R+TPiUc3wvTW1bvPWO4
         pVSQ==
X-Forwarded-Encrypted: i=1; AL+hErE1o7+bfIekDlnsWM6Yu90avJDMsZGb5UTBIRIxIflr5z161CtCBcbZ5XnsKRGAHjUt87Tia0DCpwjdE5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wQL20WL9HP37aKReesfQb6UQbHKKV5LjXBN15Mu1RRJl7/6Ny
	pwvaMyJLogz0QW4/K+xxi/mzVvlOsI4MaMoj2+JyE0qfHC3De4vXGc5MfECrbgNHFc4=
X-Gm-Gg: AZFdTZedMM79oDOO0jlCD7kmTttosY2Q3mv0hfPe8Hswi+KwR2ucJdAsSH1qyUmd1eo
	2ZmzMnNOp/SqIkkDhFdU0KzSDBVBYLqdA6LwuxPo+KZ981lhIUANnagQ8fWbfmhcvVkPCqHIEzr
	N/WAQb7ZVn2faayeemCVg5JLnNQ3Csqfw7YrTdYsK0listynl6+R5OjIIfea9r873r/1Cp/b1Ct
	N+NQKHStLIZa6Ue+a656lCR7yk2J+t0tQBVcY1JLGvj5sLrAZOpjLCnc2FY3kBgNYQ9+9q2Sni7
	wenHKHAIuymwj42vcowKv8mHf+kwK+7WzAvdxalTbZ14ZdvAP3sjreXNOxaFbh/1RGG0dVFqJx5
	0zRMcdqZJOZmaiPOWtp4hvXmWqeR2aX4ZQUmMkjqj6jS+18FO6v2lpOrBtYiNszhEp++hBGAUDG
	Skthv8ufOIYquyG1dWKDINT4ljp1fNvoWuqeRh6SN8SR3NVRVOk7Hkf84YKhgwnb+2hHy+uGijy
	Al3jQKKOTyuNaeVgPVsTVhQNvWe/wxWfANSCEA1sz14iFoWpK37urrdwYjOeCHoh6MjqxLt2FOt
	f42esTfOY/51AWc7oDK7D/3ykc/m9NKCgbRwXSOG92hKxDOg5SX5++t7WLH9gg1fr+NU2iFeqIK
	vs4xtam8rMK2u3ftcttSOcf4bh3tcGFPaHTieY+hZUX7DIt5AtLGERFdxTVlU7K4uFalch5rUfP
	esZnnQo5azdout9O8/wiRj3+Mb9j0hHGGjosXKOPNzCim+qmb1xCiI/Cks5FRemWv7ufrJzXHVX
	m+1qQqm5BUeuC05fUtZtBM=
X-Received: by 2002:a05:690e:4814:b0:67d:d7ec:565 with SMTP id 956f58d0204a3-67dec420419mr8266871d50.13.1795857997565;
        Sat, 28 Nov 2026 01:26:37 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa7afsm12223319d50.1.2026.11.28.01.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:36 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:35 -0800
Message-ID: <8b760dc9733401f8fb5161877a705f4d746e1d32.1795842371.git.chris@chrisdown.name>
In-Reply-To: <cover.1795842371.git.chris@chrisdown.name>
References: <cover.1795842371.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 3/5] scsi: sd: Fix data corruption in WRITE SAME(10)
 discards
To: "Martin K. Petersen" <mkp@kernel.org>,
    "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>,
    linux-scsi@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

We already cap the discard length in writesame_10 and writesame_zero
mode, but we still truncate the starting LBA to 32 bits. A discard at
or above block 2^32 can corrupt live data near the start of the disk
and still report success.

The reason is that both modes send WRITE SAME(10), which only has a
32-bit LBA. Given this, let's only select writesame_10 when a 32-bit
LBA can address the whole disk, and not accept either of them in
provisioning_mode for a bigger disk. This means that a bigger disk that
only reports LBPWS10 ends up with discard disabled.

Fixes: c98a0eb0e90d ("[SCSI] sd: Logical Block Provisioning update")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 88b1c1d56d2f..d995650bc8a1 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -597,6 +597,12 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 
 	lim = queue_limits_start_update(sdkp->disk->queue);
+	/* A revalidate updates the capacity under the limits lock. */
+	if ((mode == SD_LBP_WS10 || mode == SD_LBP_ZERO) &&
+	    !sd_can_use_ws10(sdkp)) {
+		queue_limits_cancel_update(sdkp->disk->queue);
+		return -EINVAL;
+	}
 	sd_config_discard(sdkp, &lim, mode);
 	err = queue_limits_commit_update_frozen(sdkp->disk->queue, &lim);
 	if (err)
@@ -3431,7 +3437,7 @@ static unsigned int sd_discard_mode(struct scsi_disk *sdkp)
 		return SD_LBP_UNMAP;
 	if (sdkp->lbpws)
 		return SD_LBP_WS16;
-	if (sdkp->lbpws10)
+	if (sdkp->lbpws10 && sd_can_use_ws10(sdkp))
 		return SD_LBP_WS10;
 	return SD_LBP_DISABLE;
 }
-- 
2.56.1

