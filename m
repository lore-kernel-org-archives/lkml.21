Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857996;
	b=1ALlrPyFMgEvgMDpT63p/Z/f/b2PFXJuqMQ3vg3cyF5QKM77pSyJUqv58HQwfHU2uH7l
	 Uy0I6gFDYX/+F36UB8YH3q/QoZdrO2/WzuIk6rJeaug5kY4ee/YLHZqOy0wvVJGRhNo+n
	 avP0FX5ivWVUWBb+QXkLdFOnQHmFrnDYUD0YrD8hILlze8YEUbax6iO7Ybs+AsBcyLqNl
	 jFZ9ZCM4pTWg6/V3B+iYhClyb2N65fhlXGCxMCp2XlvcUh3HN8yddqGJKZkE92BvsTHTY
	 UO+JGJ75B+dr5vdV/cG0ZvmGFV0xoQuaWcJNbkzpFlVfY75OQq+30ECqQUB4Od59Z6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=dXthLYgbhH4K4dQPOzjBOY95MCWmDjDCppxjt2xq/3U=;
	b=FIz2gmaV+gc42x5ofEngM0WzkpEQMfCA19G7B8o3S+K+xsGesSSaDoTg2YXHeR9T4JNC
	 Wlzrq4+ICOjZwckFO59dyG00FUFcKEF6VBNwZmzc7749tGJ0+AKaKUp7rbRLtSnY3rMAG
	 KHHTvGfJaLsxd1KfhTeLPmEfbm+Il6fB674rskoy4jqthK5Ldq6zUWoMR5X59iLQi3XvZ
	 DCCkLvr1RvoK7l5tETfpTODiB7y/bds2yuZ+UgnEuHqJcJg6ffSBcn3TYuquiGKk2MUSw
	 OKtF39g++tesMJTm3xu4yPGVPrRb4pQhgJPb1e8SFhL83yA+iul8YvhXZ3sFyfo8v1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qUCQJ6bW;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A6F606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A6F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qUCQJ6bW
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so62851787b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857995; x=1796462795; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dXthLYgbhH4K4dQPOzjBOY95MCWmDjDCppxjt2xq/3U=;
        b=qUCQJ6bWqvb52V3+BkjUHK1DHbfP0gUWHUA3JAvuX2rosYTKSbatEhSyetfABiJY4d
         KTEwZN2Ynhc9Jy/WUOZxbmZ3xF2ROjGgg1BcrBIxY8Le9tparMMHm9fhQ1gfqWrWb4MM
         w8Sihwl4/s9Lc44bk7MbWcK8g7lbQ8j3wm9a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857995; x=1796462795;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXthLYgbhH4K4dQPOzjBOY95MCWmDjDCppxjt2xq/3U=;
        b=VDdgYC5UyfUjaXf0A3opPyk4P3OYxexdoCysvyCoIdgVVpOPfDNbuydQgO9AdVQ8n5
         dsnHkzKxJdyP4Uv6KDEK4oEOIszdZCWa2VlIwwQoJgUeS1Kq+MR0UkC0o4FaXjUJMpEw
         I0vOSA6ZQDk3m5LKVLLu7rXkyliRQw0ZFXI3tKvZGPA6GT7WkNLb0JCjbGnBE8hOOL25
         oLsc4rzpflrdW/uD2b/jmKYUYnzhCMEUivsqCCpAOMXsNN4Q8xjhGFOulfYOIPfljoz5
         2WxNRgAikHwaBe4DrWpJXeIqjpxuwvox2o8O4QYYUUcvx8k4DgMgxMNjaxIP0VG39P+S
         YRrA==
X-Forwarded-Encrypted: i=1; AL+hErEE+QdnWYwOxdVg+aEd6Ggbt8wpXr5VyKC1OfMvKNlVwMuMNcEOo/nDdgVRAqFMAI+Ctm1Vuh6rNK9/AwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UZ35qEKeDNRjUFJpZDe20rL/4Spp6wBWOOvx5DBBy/kyNqneA
	kqRAz/38iI2wT+h08Sy/JzkmFrpHRtjYcSCROAQQRiKGpO6mDg7L+kTmAMHJoxGYSX0=
X-Gm-Gg: AZFdTZfgTThcYW1T98iDwQkXgsEHtcGSdbm9hX/86RgPqH3pmDg2utwy+3djrh3ld62
	AB9Fx906R9UfC/UIVl1xGrKBEnOqLc4FSunQfZ3UDU/duiZPGfwkdkHBzfp7xuv+gcY60Qbihcu
	qrw3/K4m8cT4JAFtnI0Ht6h5ZJunJhUuFQz436IqNQ+ELkfFUwcK6qJFXWG/CoiCrhCdXI8a0hN
	EX84uXCx7nz+FuB8+CWe14hn2XA7pQSmIsWxvlyfHJ2u4Vbc37GCUDcHx450Kfw6M7Thc9y0QVH
	Sc8l6oH8vYRCq+Te9N95THGMnx4QT1BJ2XqMjsxUGysBcE8eyVy/GnuhqTyupup4/OQgF784hKu
	S51xdJvueLCKGIzIZlWKTm8+GBacuOl50ey9gw1osqzXlSCyBRYb39EHKJ/1QPCNcm9D1Bhfyk0
	ku2Wq9XrOvvPujxKZByw9N96LsD2Vs3FZGLPN5F1YkOWfy8IBknvVp8Scak1kFikNraaTdFw8Jb
	8Wjkc33ETnmjNKRbKvoadLvzHEhglFOtv++9b8ALw0vctJVZ13zo/u2b0WSQ+qNsOs/nn7gHE2r
	fU/uOBytHwF30thdWHtsg9SNky+h9zv8bwRUiQ/OvWPEc2mxfUmFCc/qPsJBjC2YQnZTqo4CrKD
	K6Kzdwhj8XNaIHyv0IwpC2BY5NoPAizC9VVq/N6KaHDWm5Isj/LKE29FGxGGcsKqf0LscbjKQpp
	TJu3bEFUAU4yLMRjJWqjJmXS1ADCxQ4gkkm79UVPecPSp8AuHbJns5bCmHKasFLmnRC6CBT/C/1
	4Cn1Ol5OrFmBjluG/8NZW0=
X-Received: by 2002:a05:690c:dc5:b0:8b3:4122:f464 with SMTP id 00721157ae682-8b5204f191bmr139489267b3.55.1795857995500;
        Sat, 28 Nov 2026 01:26:35 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d628sm102527817b3.8.2026.11.28.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:34 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:33 -0800
Message-ID: <d7cba111662e11f810404d5f39cc72b4a357f442.1795842371.git.chris@chrisdown.name>
In-Reply-To: <cover.1795842371.git.chris@chrisdown.name>
References: <cover.1795842371.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/5] scsi: sd: Fix data corruption in WRITE SAME(10) write
 zeroes
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

In writesame_10_unmap mode we send write zeroes as WRITE SAME(10).
If the LBA or count doesn't fit, we truncate it and can return
success without zeroing the requested range. If the LBA wraps, we
can also corrupt live data near the start of the disk.

The LBA doesn't always fit because WRITE SAME(10) only has 32 bits for
it. Given that, we should only select writesame_10_unmap when a 32-bit
LBA can address the whole disk, and we shouldn't accept it in
zeroing_mode for a bigger disk either. A bigger disk gets WRITE SAME
without UNMAP instead, which already uses the 16-byte command where it
has to.

For the count, let's cap the queue limit when sd selects this mode so
large requests can still unmap in chunks. Writing to zeroing_mode
doesn't update the limits, so don't accept writesame_10_unmap there if
max_write_same_blocks is too big for it.

Fixes: e4b878371b85 ("sd: implement unmapping Write Zeroes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index c7018a5de847..88b1c1d56d2f 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -146,6 +146,12 @@ static void sd_large_pool_destroy(void)
 	mutex_unlock(&sd_mutex_lock);
 }
 
+/* WRITE SAME(10) only has a 32-bit LBA field. */
+static bool sd_can_use_ws10(struct scsi_disk *sdkp)
+{
+	return sdkp->capacity <= 1 + (sector_t)0xffffffff;
+}
+
 static void sd_disable_discard(struct scsi_disk *sdkp)
 {
 	sdkp->provisioning_mode = SD_LBP_DISABLE;
@@ -630,6 +636,11 @@ zeroing_mode_store(struct device *dev, struct device_attribute *attr,
 	if (mode < 0)
 		return -EINVAL;
 
+	if (mode == SD_ZERO_WS10_UNMAP &&
+	    (!sd_can_use_ws10(sdkp) ||
+	     sdkp->max_ws_blocks > SD_MAX_WS10_BLOCKS))
+		return -EINVAL;
+
 	sdkp->zeroing_mode = mode;
 
 	return count;
@@ -1214,13 +1225,18 @@ static void sd_config_write_same(struct scsi_disk *sdkp,
 
 	if (sdkp->lbprz && sdkp->lbpws)
 		sdkp->zeroing_mode = SD_ZERO_WS16_UNMAP;
-	else if (sdkp->lbprz && sdkp->lbpws10)
+	else if (sdkp->lbprz && sdkp->lbpws10 && sd_can_use_ws10(sdkp))
 		sdkp->zeroing_mode = SD_ZERO_WS10_UNMAP;
 	else if (sdkp->max_ws_blocks)
 		sdkp->zeroing_mode = SD_ZERO_WS;
 	else
 		sdkp->zeroing_mode = SD_ZERO_WRITE;
 
+	/* Split large requests so they can still unmap. */
+	if (sdkp->zeroing_mode == SD_ZERO_WS10_UNMAP)
+		sdkp->max_ws_blocks = min(sdkp->max_ws_blocks,
+					  (u32)SD_MAX_WS10_BLOCKS);
+
 	if (sdkp->max_ws_blocks &&
 	    sdkp->physical_block_size > logical_block_size) {
 		/*
-- 
2.56.1

