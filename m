Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858000;
	b=zFVMwIOo/PJCcNB/IvyF8ST3QliipfUo9my/rrDmrAgrNOw2KhJPCE7RtmWj1F1DFhkZ
	 kDS2DAO2wvzBBIleML8QDlKu07bC1FCBjCRZLARznp/LNzKRthzBxennzBsPgSJsm9SnU
	 TOWufPkHwYgnKOYLMabUIwuwqxA7pjF5mispup8kpkhGra/meE2qwKeRMMgBe85iIs17/
	 tIPX7TNUMOME3puzoe4zZ5diH6WDlLErG+jM/bxffVBylSWvllKcZIr9JG/wlYQfwzKvI
	 E8Po6Ej/xL9/460kjcNQvppGcqa9fcURoZh4Uk293I7cI+o/YFlv1QedsHz/YpaSk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=6f35w9cBng27FsT7gsIXpo/AGOT3TuR6wbGxOiO8l6A=;
	b=o0LJyq37c6RUNYo/i0hmMZ0vYfehPr6vY1/UtClsJCjdu8aMKD90Rh2YJDhjKNVzEIB9
	 lWd5i9gMtcTNN2Tps84iHqqjQO+eZFe2b4pJHl38flq6XiE66VRapMxHpHXaRErN2osYW
	 GijtjI4vpeP4DuKC7Z2xcH12COGkFLpmUDdXQLgZbhwN4f7C8sc5+nj/ZcWr83axcUWbs
	 zL/TchHFOSlC/I6phXSQsEeUNfeug4FnITBwC6X2CZYx7Bi3oA0zEQK1Y3RVy4JcwJCbG
	 IGJH41LBiVydXZGYdD5tHUd1diSIEQNRgM/qM+7oON/rGttCr1ciY8b94DiDQvSIbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=HM1tFYr8;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0F606A684
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B0F606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=HM1tFYr8
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4e04eda5aso65021547b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857999; x=1796462799; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6f35w9cBng27FsT7gsIXpo/AGOT3TuR6wbGxOiO8l6A=;
        b=HM1tFYr8MiS5BR7MQEXWztXLjOgkuWexwtUKUdJR+mqDPSC0OzfiYkd6rcXst+94+9
         o+USAiOn5yymjkp1f6hFbnViH94PgnvBdXlD0+R8F+XVNQh6UT3jC6nKP32CKpJXrEP6
         PLNhfpZAjTePLCeCpby4nz1PQCIp7LPs8KMJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857999; x=1796462799;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6f35w9cBng27FsT7gsIXpo/AGOT3TuR6wbGxOiO8l6A=;
        b=DvxEeGq3ZagIgoOntK2726dGm9HnWeR6n641L1YMlYDDZXIY3r6zJZcOzxjJwXhT7q
         WZYwAK6tPKdZCQyuSpHAjNjJMjjZCS3gZb5JRipHDrM8z+lhS9cBXrd1fEsXXrRfiFiJ
         bYjWG6FWtN1A25SlORBJYZPWYb0dFrj+fnLW/vcPlZZP406j/MLR4OxX1pfppo+PKLcH
         kgYLtqBHqnQKkWe4xztskYHojWMiryEfPQA+mHCVhy1ZOIjM11Pdm3JtowClkxMTOlO6
         J4MhofDpIxjc09MKimSBsY1B/YLjmIAsp8B2gN5OcIdLqjeYRq3zKhHeXXPelZZY91T7
         j/nw==
X-Forwarded-Encrypted: i=1; AL+hErFW9OBP4iBenwqLE0Pmor2rP4H9WVDcthalnRy0YuJgLCr3cuQkvB6jsjKLRPMWoVQjhlZKBP/KpsqBPpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jfxAgNhchefqsCP8sn7bQXge0Ki7udWyHeUFuRIhtY9WSiOSi
	pWLYmRDQYt8d+NJR8rqwWIpzV1+FcKNK8aLqTqidqxn/PLoJbpY8am4OiZUgFUkKG+k=
X-Gm-Gg: AZFdTZdyaY5F8WuAYwy2L/3Kbe92qApv9Agz/yjah4DZSuIrb6dFBi/Fr2LQPDwiFoF
	60ELeNItyX46FC/IT7Rdt2GI4VqHsH06Fw/qycYqvECdUe8/70dOWUm/jmU6nw68l5fhMTvxHHt
	a0HeQNoJu7OvEtV7PsFLx6I8tefsoSmBTNWOm/MMt22KpVX4bG/5N78xItoO7hEG82wEBlqF4qj
	xEAj93W+g7cA/jXZOzb7CdqNpjWM8otLRZBxLfhh4nxKURxpet1HK2ee7L1PZGTUQPxkv+QOfeQ
	fj4LIBdEkzzqsVg/sxCZI/Q35p57vZAx1sRxcm62+7LOj9+Cawzf2ND4aGDc+MGenUuq+Scvzcc
	hKVKbIrdBC1buSHS+tDqUtbV40qMyek2dpwZ0BW5Pv0anSAyzUox1A7PsjaW+gRiL81dMmFBZI6
	bbK39DaMSHXH8YX00a2qZSxkFDU2082HSeVJB7zdEFkW+9MMWNvV2Pzklbt1FPXVHizKVxxnFHb
	3x/mvwyqJL8TDgRC0c/zSrCu+vKb7akcEc/ZpYDSt/XzUIzqOVyIuWJGhhGi8/iZ4RDPyn59m6m
	nqcrvmsHh34NcwsEWej5YXYq3DQjmeSVv/QelcVpLl+Ety6gNKCjtLlHNcjjXsg6LN7pOy0xCu7
	B9soqulnVyta+dlGcwcd0mxvVu6sNObmi4wNhpXLNOEpXb6go+POmbv3oXT1dAb7SC2wFJt14lR
	UJU85c7bKcCmRSyr2hwzfwBJ4KMRH6NdEybU8gIpjD8+AeaQKZ6bulTr/A2CcofCVXzW1I5ERiW
	zDizLqpgOjlPLni1biSVgE=
X-Received: by 2002:a05:690c:445:b0:8b5:9d75:1851 with SMTP id 00721157ae682-8b59d751ce4mr9297647b3.9.1795857999148;
        Sat, 28 Nov 2026 01:26:39 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d160sm106019667b3.10.2026.11.28.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:38 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:37 -0800
Message-ID: <a1acc1de43d8ee89d64e345da817f7ac3585e86d.1795842371.git.chris@chrisdown.name>
In-Reply-To: <cover.1795842371.git.chris@chrisdown.name>
References: <cover.1795842371.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 4/5] scsi: sd: Fix WRITE SAME(10) count truncation when the
 mode changes
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

sd sets provisioning_mode and zeroing_mode before it freezes the queue
to commit the new limits. Until then, requests are still sized for the
old mode, including the ones that are already queued. For example,
take a slow disk in unmap mode with a backlog of 0x20000-block
discards. Writing writesame_10 to provisioning_mode sends the queued
ones as WRITE SAME(10) with a count of zero. Now that the zeroing mode
depends on the capacity, the same happens to queued write zeroes when a
disk shrinks and sd moves it to writesame_10_unmap.

A request is only sized once it has entered the queue, so none that
were sized for the old limits are left once the queue is frozen. Let's
change the modes at that point, as nvme_update_ns_info_block() does for
its own state.

sd_revalidate_disk() can't freeze the queue while it's still sending
commands to the disk, so move sd_config_discard() down to where the
limits are committed. That is after the new capacity is set, though.
If the disk has just grown past 2^32 blocks, a request to the new
blocks would then go out as WRITE SAME(10) with its LBA truncated until
the mode changes. So, set the capacity after the modes when the disk
has grown. When it has shrunk it still has to come first, because the
modes for the smaller disk can't address all of the old one.

You might wonder why we don't set the capacity with the queue frozen,
as nvme does. That sends the uevent with the queue frozen, which
lockdep complains about.

Fixes: c98a0eb0e90d ("[SCSI] sd: Logical Block Provisioning update")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index d995650bc8a1..792058f52f65 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -584,6 +584,7 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
 	struct scsi_disk *sdkp = to_scsi_disk(dev);
 	struct scsi_device *sdp = sdkp->device;
 	struct queue_limits lim;
+	unsigned int memflags;
 	int mode, err;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -603,8 +604,12 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
 		queue_limits_cancel_update(sdkp->disk->queue);
 		return -EINVAL;
 	}
+
+	/* Queued discards are sized for the old mode. */
+	memflags = blk_mq_freeze_queue(sdkp->disk->queue);
 	sd_config_discard(sdkp, &lim, mode);
-	err = queue_limits_commit_update_frozen(sdkp->disk->queue, &lim);
+	err = queue_limits_commit_update(sdkp->disk->queue, &lim);
+	blk_mq_unfreeze_queue(sdkp->disk->queue, memflags);
 	if (err)
 		return err;
 	return count;
@@ -3803,7 +3808,9 @@ static void sd_revalidate_disk(struct gendisk *disk)
 	sector_t old_capacity = sdkp->capacity;
 	struct queue_limits *lim = NULL;
 	unsigned char *buffer = NULL;
-	unsigned int dev_max;
+	unsigned int dev_max, memflags;
+	sector_t sectors;
+	bool grown;
 	int err;
 
 	SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
@@ -3857,8 +3864,6 @@ static void sd_revalidate_disk(struct gendisk *disk)
 			sd_zbc_read_zones(sdkp, lim, buffer);
 		}
 
-		sd_config_discard(sdkp, lim, sd_discard_mode(sdkp));
-
 		sd_print_capacity(sdkp, old_capacity);
 
 		sd_read_write_protect_flag(sdkp, buffer);
@@ -3901,10 +3906,27 @@ static void sd_revalidate_disk(struct gendisk *disk)
 
 	sdkp->first_scan = 0;
 
-	set_capacity_and_notify(disk, logical_to_sectors(sdp, sdkp->capacity));
-	sd_config_write_same(sdkp, lim);
+	/*
+	 * The WRITE SAME(10) modes can't address all of a disk with more than
+	 * 2^32 blocks, so don't show a bigger capacity until they are gone.
+	 */
+	sectors = logical_to_sectors(sdp, sdkp->capacity);
+	grown = sectors > get_capacity(disk);
+	if (!grown)
+		set_capacity_and_notify(disk, sectors);
 
-	err = queue_limits_commit_update_frozen(sdkp->disk->queue, lim);
+	/*
+	 * Queued requests are sized for the old modes, so only change the
+	 * modes once the queue is frozen.
+	 */
+	memflags = blk_mq_freeze_queue(sdkp->disk->queue);
+	if (sdkp->media_present)
+		sd_config_discard(sdkp, lim, sd_discard_mode(sdkp));
+	sd_config_write_same(sdkp, lim);
+	err = queue_limits_commit_update(sdkp->disk->queue, lim);
+	blk_mq_unfreeze_queue(sdkp->disk->queue, memflags);
+	if (grown)
+		set_capacity_and_notify(disk, sectors);
 	if (err)
 		goto out;
 
-- 
2.56.1

