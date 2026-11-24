Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560819;
	b=OiS9m9t4Z40mU2iwo/TarBFHoVPQV5I1ybR0B9QuLC80a9x+7havmCSNuX5aOHRoFfL5
	 9a7fxR6bJYkJGjOypSXNmEQ8tdw/x/Hled3bAFj1+ooyRCNHi5tf+rzTZusqYYcweeSqD
	 dCoEU35Ij7Jn4EYO7a69ItYjtouc5CppOBwYkkwfZJjNBha5F4Xf6hvKndycoCkPmku11
	 GPelPtYn/NN52hnb3C5fu9i7OgvFK34GMG5yuqS/jeZ0HlrHeAq8zi8YT4Q34bSvg7eZx
	 jP/NU2HIg4yv0mkZvZT9+I54d1xyBizHB8ZiMeJLa6XmHpcX4vG7Kdyi8wASuGRNfIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3OrUyU6UsgiNKGxOBn9zbInzN2tr0FdnmY+sZ0issxU=;
	b=jWb0I2WDoG1PnGuorRlYCgqrDmfUaaCM5wTkB2kDft7085mx2arairtXjBmmfB9akrIt
	 g3Ln+hx0kg6osjVPLdW4k3ur8dcsB1k0oZtL1YT9XG5ow6uYV597/V4cf6etJ7WWIPJUC
	 1+LT2iCKRZXp+zmnDvHktSvgxBkHike5sLs8fTN9cb3zp+07g5DQdJoPs5fOoYSRwi32I
	 N8ENDhfZt2fPeAAaPSvovCDW0zDsghQ1Phc8U43Fbq1IqrpG2fW35SvmbIQojBBwXi8tO
	 +g/7ntIbmP/k+2J6f5K5Q5JJgeluNJcNBfsxFIpfdM399vHcegsGBWMqHGaVoYJ63jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="e7/zbqfC";
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B4E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e7/zbqfC
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-675617e81f9so5772210d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795560817; x=1796165617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OrUyU6UsgiNKGxOBn9zbInzN2tr0FdnmY+sZ0issxU=;
        b=e7/zbqfC0GJXjw3w7n/Q8sV0rAyjf8KhSdlV8QJJLzAQrVtmO9MDckF+kco3JF9jJc
         IiQKfnF2n9bFi/1bX9pLLdNAJdLaZ7qHbB05vRMSgoxJ1KEYVmDwYpzkR0ljTTGteebx
         UXsoarX0WpCPvNCHuAxYiR+2U+OrOmlQb18OGG5JKMjWNuTPgdrcrVVUHMHEN1PRkEqB
         daQUzCSqIPncRLRtO9hMZxkqTh/wH7SGmGuOzj3NI7opbl0k+IDaJLwbfLb0FN3H6sLb
         G1wnCZNsAEJiWSTmJPwIDuZCWeB6Z44I38S7fj3sPmK8neEYyuyXVzCEl/QKKZ20XD7t
         dXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560817; x=1796165617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3OrUyU6UsgiNKGxOBn9zbInzN2tr0FdnmY+sZ0issxU=;
        b=vpZH/rsApWtsPLEXG+tMb2p6wtxHvScgsmcQBQANSxiOFyH+v0mT+ZmJ5Mg6vVJQJc
         fRuvKdyY+OuAqcffJUyXzVEGobVFZjVvjbf90dcWxaHJvRLs39RIZCmgKm2BRgP71oZd
         8cV/bhY+v8lPIJax3YokuXkXfzVsrn/dpLGGjyL2ftUyaIM7cgBY/594nx+8xvrluhI5
         BD4avVBBO/Wxf1B+PT9UwfcsXXXsBEqXCpiW5eZSDTHxzxHrRqC2Jm8mTJOg+MGTaQFc
         wrQ8qNmOJeHJ0BF1xBCrszfkm7MNwmCQ0whQPR+e0rKuxhab8Sdan8FiDJ/e3F80/6R3
         IRug==
X-Forwarded-Encrypted: i=1; AL+hErE31RqJCe5p8TWoScuw3lFbEAOAj2+mkgW3/1ZJSM6dKHuSFezDH8lJWrXohqJgob+y4r1MuF2g1+f6qww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yz4xj4ahFQ506NcnQUfv4R4HExJMuoglBHkdYlyqmr+eyeyth
	mu4Tzgkc2QknRmKrX2IqxYonkqvtsUy2YowixZ8t/QiRXH+jaUpRzoX3xpBN0m8rQWI=
X-Gm-Gg: AZFdTZebdAUDZk2BsViJdsdLWWyc2sy9HatRgBcRLpT7fczRC9JKgJ9Ew5qi7V50Tye
	5s7r19O3bAsEJM5x513MTfH6eBcrXdxPtc9X6Iu92T/TP4g1tZJceqgt7CaFaY1c4Ef7scsrrnr
	lo+b8Nr8uDO5ih8Elv+9b8ZIQ5ABG28YOD61GT1WVHOmjqcXJXmQekdYiEmjyXXEBo32+gSnRdo
	ClL6ZErANdRSPdcaT7prFN0DMggwqpk2Q791whn2SqMkCTYOwVecUVYcwF+3S3Klc3PuTXfKQn4
	uHZErMAwr+WMPecWESVPCRZzmYpZIXqJUUXs6tHcLMhEQhsEYo30EGiULaBYDrGhufLGHWUJ4Nw
	rsvxhPfO2p8NVZXjE19/ygpbaX4L+c3EscKanN9f/yHJLka+4zC9esdk0fYGZP0W+l2PBt/5PUk
	y14EnFrd8OJhLKmOxN4MRwsEAm7B+xiAE8qMPbsL6c90hnEBDy4SjLMO7GcqALvx4UcqwGaC8wd
	EcLjtc3pJhpdLetM//zTxMTjZTTftd4qs/5dIAmWBMbT+6iuqul7VC97aHAW8lJ08APZWPJoUWS
	0y+1je3DKC2cadhSrKOBkjiOlv2QYB5D1vxYwnkz6Q1SQ+OeRVWclGpE/uGoWg5EVfwaQaLFBnb
	KS1bIIUAN0Or/vSlvF9bKuAQOjkmMw/rFUFUucv9040QvzzxA1PU0Rt2XfJ6+M9oDSYo2UH/Z2z
	W1iztIQarPXH7wb7jT
X-Received: by 2002:a05:690e:4009:b0:67d:a096:d8b7 with SMTP id 956f58d0204a3-67df42ba074mr7634561d50.3.1795560817597;
        Tue, 24 Nov 2026 14:53:37 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:c4f2:e852:cd48:35ad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm7706219d50.20.2026.11.24.14.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:53:37 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 1/3] hfs: fix timestamp wrapped issue
Date: Tue, 24 Nov 2026 14:53:28 -0800
Message-ID: <20261124225330.3879708-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124225330.3879708-1-slava@dubeyko.com>
References: <20261124225330.3879708-1-slava@dubeyko.com>
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

The main reason of the issue is the logic:

cpu_to_be32(lower_32_bits(ut) + HFS_UTC_OFFSET)

At first, we take the lower 32 bits of the value and, then,
we add the time offset. However, if we have negative value
(timestamp before January 1, 1970), then we make completely
wrong calculation. The reverse conversion has the same issue
because it treats any on-disk timestamp under HFS_UTC_OFFSET
(January 1, 1970) as a time between 2040 and 2106. Moreover,
any timestamp after February 2106 is silently wrapped.

This patch corrects the logic of __hfs_m_to_utime() and
__hfs_u_to_mtime(). Now, the on-disk timestamp is interpreted
as unsigned number of seconds since January 1, 1904. As a result,
the supported time range is from January 1, 1904 till
February 6, 2040. HFS keeps timestamps in local time. So,
the range is shifted by the local time zone offset.
__hfs_u_to_mtime() clamps the value into the supported range
instead of wrapping it.

The hfs_fill_super() logic defines sb->s_time_min,
sb->s_time_max, and sb->s_time_gran. It means that VFS clamps
the timestamps that are out of the supported range.

This is the HFS port of the HFS+ patch
"hfsplus: fix timestamp wrapped issue".

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfs/hfs_fs.h | 16 ++++++++++++++--
 fs/hfs/super.c  |  4 ++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
index 2d56f8b1a5fa..0d710a45c61d 100644
--- a/fs/hfs/hfs_fs.h
+++ b/fs/hfs/hfs_fs.h
@@ -261,9 +261,18 @@ extern int hfs_mac2asc(struct super_block *sb,
 /* super.c */
 extern void hfs_mark_mdb_dirty(struct super_block *sb);
 
+/*
+ * time helpers: convert between 1904-base and 1970-base timestamps
+ *
+ * HFS keeps timestamps as unsigned 32-bit number of seconds since
+ * January 1, 1904 in local time. The on-disk timestamps cover the range
+ * from HFS_MIN_TIMESTAMP_SECS (Jan. 1, 1904) till HFS_MAX_TIMESTAMP_SECS
+ * (Feb. 6, 2040) shifted by the local time zone offset. The timestamps
+ * out of this range are clamped.
+ */
 static inline time64_t __hfs_m_to_utime(__be32 mt)
 {
-	time64_t ut = (u32)(be32_to_cpu(mt) - HFS_UTC_OFFSET);
+	time64_t ut = (time64_t)be32_to_cpu(mt) - HFS_UTC_OFFSET;
 
 	return ut + sys_tz.tz_minuteswest * 60;
 }
@@ -271,8 +280,11 @@ static inline time64_t __hfs_m_to_utime(__be32 mt)
 static inline __be32 __hfs_u_to_mtime(time64_t ut)
 {
 	ut -= sys_tz.tz_minuteswest * 60;
+	ut = clamp_t(time64_t, ut,
+		     HFS_MIN_TIMESTAMP_SECS, HFS_MAX_TIMESTAMP_SECS);
+	ut += HFS_UTC_OFFSET;
 
-	return cpu_to_be32(lower_32_bits(ut) + HFS_UTC_OFFSET);
+	return cpu_to_be32(lower_32_bits(ut));
 }
 #define HFS_I(inode)	(container_of(inode, struct hfs_inode_info, vfs_inode))
 #define HFS_SB(sb)	((struct hfs_sb_info *)(sb)->s_fs_info)
diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index c0c3541e3d34..a63b92709984 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -345,6 +345,10 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_op = &hfs_super_operations;
 	sb->s_xattr = hfs_xattr_handlers;
 	sb->s_flags |= SB_NOATIME | SB_NODIRATIME;
+	sb->s_time_gran = NSEC_PER_SEC;
+	/* on-disk timestamps are in local time */
+	sb->s_time_min = HFS_MIN_TIMESTAMP_SECS + sys_tz.tz_minuteswest * 60;
+	sb->s_time_max = HFS_MAX_TIMESTAMP_SECS + sys_tz.tz_minuteswest * 60;
 	mutex_init(&sbi->mdb_lock);
 	mutex_init(&sbi->bitmap_lock);
 
-- 
2.53.0

