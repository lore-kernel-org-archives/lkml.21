Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858002;
	b=TOgpukzoCWmDajoYaO2pEmZcCJbhNepD8fH0CgWvYwleVEnTUF7QAVmFZ0LXLaEWYf2T
	 SPjjh9RhrAY7BMVERa2UwtEPIPAhxLB0ewzsIdXsB3nnrLwCi0BlTsGUU2WOXanyLUa3g
	 ijNcx/ozmRK7ADyYuw2lXmVfMKFALwyC3GHszMWrx4BG8dWt2adw5CZIfiuNUtDu5EwoP
	 sJI7eTBs5tEWNDoxrq1X2wYPdiwG0B/kDpfN4ypkswkQJMuTqZTMQziH9H0QY6wlrs063
	 6NdcIiF7jfT2kb/BsFLya3kvhpviQSWj8t8zkPnRqo28MB/bSvVgvTuhr4bf5Z8pqwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=1Sri8kxz2uoEL3sSeB5rKcJwSB9FUVM+rwbkcMwDLFM=;
	b=JNpAKvoD6ndeMXwTa7vigLCw0rAQ7+bhkyB/mdkoLBw+E+JFkKCaS/F4mcwu7wq6WuQs
	 +SDpRWD1WSJoDJk2+3RtKpgsAhC4iN22rqLVukvJ43HmSjGmpxnxBPCmn1/7jw/Yqlv1+
	 XsOSIiRtoEpQ0ov1GErLdT2MM+PTsrPq2noUuUbeZfk/K/paAeIXqYWUNQO3+BsoPEWcl
	 fnN/iFaQRLpRqzRMFwIAolB9sFkG5ULCXCJDKAlH+rtwuZGh7ujrzP52UX+TUgTKCCRe0
	 XI6V987EFqJpJXOwLxVuAraWRiIxxHvrhkmp1chPTx3ygZbq9Ft2qS8k+felk61AvOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sxiVnH6D;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E88606A689
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E88606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sxiVnH6D
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677bc4704cbso10282222d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858001; x=1796462801; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Sri8kxz2uoEL3sSeB5rKcJwSB9FUVM+rwbkcMwDLFM=;
        b=sxiVnH6DsPbF5W5f2ILVwXiPDYERvznuiRwvYAyFn1uNZHtNnzdvFjsl++AgMQHATF
         9ZSR5LWgUMW4B0nr04nNxrGIOzFQ0yYjqImgwJi2izBZWFI+8zBvFQ3oK7V/kaVaB7xk
         S7wXnFm6MvkgnUQEl4RJNstW8l5aIFjNiqwK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858001; x=1796462801;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Sri8kxz2uoEL3sSeB5rKcJwSB9FUVM+rwbkcMwDLFM=;
        b=ugOYKj3vByetjhGbO7evZB0Xp+xKbIdaPHkE4ujmzMt7uC6xUG1qru0VmUG/vDaFjl
         2pkepS9jK3j6CDquGoEFL8PjS7xQzGXoe0eZ7VjNeOy4R8eoSx824XBjBODj30bQi/TV
         49roXDJdC2Ys6XS+dkQuA3nQFef9stuHidjDNZk4eVZIENViAt1N2jg0JXZk1b5/uC+2
         tfY62sLaAApu/NvrVw4HOrcXUkJeEXVU53rVe1s6zgFT7kiBsNJYgj1lNjND0mrJ6wRn
         SbFw2qtCTnLUiA5W/DiXQVtFlfLJHDc44rHbcE8OZ0jBpAMq0INV+kWdaFpT7/ZO8Blk
         kT8A==
X-Forwarded-Encrypted: i=1; AL+hErGVi5SbSQcBTrgSBTWu4h2PPbLhvDW9t0cKNYhlPfoV6qCe5gl6wQn+uisrJvS5qMwa1UyftcqOjA5X+WI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LUopSkGk/d2kZ6AY1O3/b59g8lwFp8VmPcKifWMmizW3Rb8xm
	6KGE5xUg46PyzwKaHGaR0i2ZfsFWUg8yOL2nLNv0SWBH7Nv7eobe8JCm7ghIjWawfoQ=
X-Gm-Gg: AZFdTZcltWIv7eeymwJouHgmV5EWMydUlz88DJzLgDGuEkE82Exp/y04ac93O+P5mfV
	DgPHxC5X9RrXar2daDSrxyMTv0ksswt282dtQi//214iivUiF8XqkRMNRzcXqqHkBRrEOmMg1qL
	LO+1y/WMEGqAbyRO1+OpfTaxrzc+chUKLH6ZPB7MLlQQMECWwzILU8Tvlv9mfjwji/+lT2ufjyN
	ROQZHLTNfHviPmLhyJzJuVxYceQfhcABrOyZqmnfe/5CzyvyhJyFgVjHOhkfRbp36SRbmurripW
	u2pTE9fg+iTTWJwr6W5KvAljSexNVhDymqoJC58OxDVo/jXSBrI6b+teOsBloc3nUfUUtIYsmFU
	7e3h3q3Dryq0DA4OJ3e/U1xKqP+k1y5Ai2vyelGHMFmgBYey9ip5MDei1nRUmP0W5AkfQiqMOD/
	Rx6IqmpTqi0sEGcD9g9OVthMVMEEh64KZKhBdOVvrXLfUxyBMnf8YavnerPqaSdWAEL23u6g4cW
	1FUDfOzavQG/4no7VFBrrMrfnf/2piPRGTpEqJyprL/BqiOAvnhTfqTJOjCmAsrrElVTC7kgbPa
	QG2dqInueelqvxISMrOP7c68p6ktD5xU8CgEmfZkWXDO8S/Lqh3TIRBv9z41o8ZsXP91P85Xaak
	z2DKangRtw2x1S6nIrYIRq2HwSnYYUUY4d1QzpsQlI1UAwduZr4bXx5hQ7gIqzwElLhpSq1RNed
	s+U2USxLygXR8R12yaX52sFOOvadC8kzM1wMIzHQqd/f0j5r3MAbLm5HgF9sJXB7c0T7XEzkRmW
	aUcdHq/BHHvQDNK2P9+G+Qi
X-Received: by 2002:a05:690e:1446:b0:67e:653b:319d with SMTP id 956f58d0204a3-67e653b3b4dmr3232301d50.133.1795858001577;
        Sat, 28 Nov 2026 01:26:41 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33105fesm12336245d50.7.2026.11.28.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:40 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:39 -0800
Message-ID: <6e833f169d0c31a3a7da7581c68d4aee5d348ca1.1795842371.git.chris@chrisdown.name>
In-Reply-To: <cover.1795842371.git.chris@chrisdown.name>
References: <cover.1795842371.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 5/5] scsi: sd: Fix unsplit discards when the granularity
 exceeds the limit
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

The block layer doesn't split a discard when the discard granularity is
larger than max_discard_sectors. A disk in writesame_10 mode with an
unmap granularity of 0x10000 blocks then gets a 0x20000-block discard
as one request, and sends that as WRITE SAME(10) with a count of zero.
The other modes have room for the count, but the discard is still
larger than the limit we set.

mmc and drbd already make sure they don't report a granularity above
the discard limit. Let's do the same here and disable discard in that
case, as drbd_reconsider_queue_parameters() does.

A zero limit isn't enough on its own, because a discard that was
submitted before the limit changed still reaches us, and isn't split
either. So set provisioning_mode to disabled as well, which makes
sd_init_command() fail it.

Fixes: c98a0eb0e90d ("[SCSI] sd: Logical Block Provisioning update")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 792058f52f65..ef9c2d55c933 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -206,6 +206,17 @@ static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
 
 	lim->max_hw_discard_sectors = max_blocks *
 		(logical_block_size >> SECTOR_SHIFT);
+
+	/*
+	 * The block layer doesn't split a discard if the limit is below the
+	 * granularity, so we'd get discards of any size.
+	 */
+	if (lim->max_hw_discard_sectors &&
+	    lim->max_hw_discard_sectors <
+	    lim->discard_granularity >> SECTOR_SHIFT) {
+		sdkp->provisioning_mode = SD_LBP_DISABLE;
+		lim->max_hw_discard_sectors = 0;
+	}
 }
 
 static void sd_set_flush_flag(struct scsi_disk *sdkp,
-- 
2.56.1

