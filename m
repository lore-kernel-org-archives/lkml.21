Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962939;
	b=Frr1mnE/LdXa05p8WQXqdAtg23/SZ5zjLtrJmr8u4RNz189tvVw9z49ZM7XTKVH9/uND
	 tZqBihRM1Jh5qYlD4jVIRwBfjfBR7LBB4KEB9v+XeeuUQzjUDgaSuZtQT/wI3PAT1oOhS
	 cuPxv0YboZSwWfad1uvHJDl9D6FE6+FCuPc8nYp+gX9R1vjb3N4OB8LoPQ8+leW2gw/nO
	 v2lC1j7/jgFcoxgk1T3hqstE9HnUN8tnLnkFeElpOe0I3dIDZ1/ltJoCfwGeHIMJAojZB
	 PIcIXpcN18X8IUW+f3W9QfJY2LoDC0M9qsPJLGcLha/lsExEYBI3puv9E5e46p/byiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JT5GitO9guQMxmpDsN7N3JTT9ZwlLUCA63pj7Wlo4Ow=;
	b=h6n7XPap7gJawscQJgvEOIYVqEjOSVZapVcf9yiEzGtpvqaCipDltuaC7DCn3XIXmHFm
	 CPfqULG7pE/LbjG32Wbu2GiJOJ3mP6YRFuCm5RQEAQD09PZjcvvz21zuA51jFJes6wfmg
	 MwEk50JBt5QOJaUiMD0ZubiiRxtImQB7uW66jSmtWNi1WO+oPyh/h813I04cVLwnaXBoT
	 WSCrmK6pjxydwTb0D1iwuzWNLe7TeaMRbBRf/7KssK6TOFnUyMbfV+0sVAskKEzEWJ/l/
	 VDa+zPVl2hUNwU00MxjHifD9UQdrXaimvkxrpRG100Vd+TUMWaJuFkeuRgsc5sW7s8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gsVY7QIi;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87558606A88F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87558606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gsVY7QIi
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db8985419so496463d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794962937; x=1795567737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT5GitO9guQMxmpDsN7N3JTT9ZwlLUCA63pj7Wlo4Ow=;
        b=gsVY7QIiaHuhXw9hDeLuIoiMd7+78YSHKcBI9sh7vklFBT18aPuLoJ/EvDFS5jWINs
         A8A+MhYvjG5S5diQqSdSqdaPIkk5E6Dgqm3AFJ++EZdT0hD/zxy7599MQIFvC9ljaMBv
         bc+x/vl1OKmKcsPcR15R+h9UaLmVgYRvE8285uSTgRJCrD1TJDlZCZQM+r4YG2t//5L7
         JJ3H7a5uK7cr2zKAhn97lL6DVH/mXjcVgHNiDZzUPSO4iijb02o2X/d/fBRNOxAc7sIw
         C4vQVo3ArK8dsDolaUO4laRWjoBDohTdoiBtEEeul4wFrboxl8AGWUj5m2Ng7jzslNRT
         5McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962937; x=1795567737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JT5GitO9guQMxmpDsN7N3JTT9ZwlLUCA63pj7Wlo4Ow=;
        b=g2/49W0zgn7v8CCfcJeMSTqK1T9PmZ5VVySOl3C5Fe0ickSLB+iFGDiThAl6RBBGyz
         lRyRuNL/tVjG/CKI5fqy2Y+BXbjH2LlyMYEZL9mNCBcqb4OlFQZ24xg7mFqXTRDuxs4f
         adyymc4UAqFdikr29cpeDkYQT3NJYgB9yxqvLGdEUCg882r/SG/TYdrFJoxD+WJosPj5
         ayamGWSdpqXVCFjJ006tPVErvAwYHGZnMiGoPQfK8NZcAQoGKLUUgPD+VKBAJkcdipbI
         XIGoT9264RuOD4vu0Na12Sysu9WQR4glY1F6gaey2/JuVs9uaqPLilg6ltCslp7RsU8n
         vTOg==
X-Forwarded-Encrypted: i=1; AL+hErGQ+o/uKcd+22+5Wsla5MNHYRM5YNq1Z0lUgQrlGKskIgLiyqnCNwyVmLjQDptw6afoZE4zRhE82T1XNBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ifqo+KeCJpJbD4iORDGjhpTJ+TtvVNAFe3Rce7TXV4oW7Qv02
	NjBVSYNpkEdIwAt2Gb/fhJUKrrGgXu+cP4Q6RfuoHr1C2oprxnhuOkcVWcOrLiynQDI=
X-Gm-Gg: AZFdTZfugNaC5AFl17ywTtQesxTxbQlhDGblHWwIyqhZZDxExWz+Ja0qveq6HJhkfPj
	9qnMUF85dfG4ZAR4UPnYQecEQL4TSLGBO8mKce7IPb3xxmM7IGpKh1X+Wr/1RURJy9Q/xLhG5/4
	Kww+KV80jySODeaTwAmK5pSDHhSe0QKj6MJDHetNXItK60i2s3MNTuXRiEhTR4xB1ycEWSFg1or
	qiRlmbmAWdGX+ApSIJl7u2BZqw6mrysfMYwVHgx+2N1ricp/TLI74Gy6AOp7WWFqODkuwPCBnPx
	smCn5i1MwiRX794Ey1Kydw6EEqIkdj6VqVzOfTuw0DEktw/FpsvW0wuF4nECmoaFAMHzD/0di6C
	zhABGzUI6BwuBZRauX4GgbO83jZqSrsId3ysMQyKRlC5uzikepo3l6vYZkr9pl6FXfWiPK41zxv
	rKcGTgwcMQd9efMVGUdX3uOweM8sJlTj3x+3tUascihrVT83UFT/D5sDdhEHjK2FIuAyft1250c
	QmAHam8+vfpG0blTjN9IcIcQF6uDaUVVk8VQnqXEJti50vhqHgi7fabaIyqrTWFnAuUvs7wZIrq
	sDfeEtfKoRn/7BGe8aQ952xPpBEybHRHe5h6sXlqwKjspYYSRdwtppg3PpJtGoiVgXl09OnS/YT
	V2NJvb/w81nF7IouArPoAB+A49x+1BRQ8bbjrr7uUnyswX3po3lR68B3vdPV3QppN8j4wAxw=
X-Received: by 2002:a05:690e:1348:b0:67d:bb89:acd8 with SMTP id 956f58d0204a3-67dd459e236mr521095d50.76.1794962937364;
        Tue, 17 Nov 2026 16:48:57 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:5fae:4d02:7055:94ad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd56ead87sm729575d50.1.2026.11.17.16.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:48:56 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	brauner@kernel.org,
	linux-xfs@vger.kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [PATCH v5 1/5] iomap: add iomap_dio_end_io() helper
Date: Tue, 17 Nov 2026 16:48:40 -0800
Message-ID: <20261118004844.3849979-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118004844.3849979-1-slava@dubeyko.com>
References: <20261118004844.3849979-1-slava@dubeyko.com>
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

Several file systems implement an almost identical ->end_io callback
for direct writes: if the write succeeded and went beyond the current
end-of-file, update i_size and mark the inode dirty (for example,
ext2_dio_write_end_io()). Add a generic iomap_dio_end_io() helper for
this case, so that file systems don't need to open-code it.

The helper updates i_size without any locking, so it can be used only
by file systems that issue all direct writes extending i_size
synchronously (IOMAP_DIO_FORCE_WAIT) under inode_lock.

The first user will be HFS+.

cc: Christian Brauner <brauner@kernel.org>
cc: Christoph Hellwig <hch@lst.de>
cc: Darrick J. Wong <djwong@kernel.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-xfs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 include/linux/iomap.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 5254430844b2..616abe7ebad9 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -672,6 +672,26 @@ struct iomap_dio_ops {
 	struct bio_set *bio_set;
 };
 
+/*
+ * Direct I/O completion handler
+ */
+static inline
+int iomap_dio_end_io(struct kiocb *iocb, ssize_t size,
+		     int error, unsigned int flags)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (error)
+		return error;
+
+	if (size && i_size_read(inode) < iocb->ki_pos + size) {
+		i_size_write(inode, iocb->ki_pos + size);
+		mark_inode_dirty(inode);
+	}
+
+	return 0;
+}
+
 /*
  * Wait for the I/O to complete in iomap_dio_rw even if the kiocb is not
  * synchronous.
-- 
2.53.0

