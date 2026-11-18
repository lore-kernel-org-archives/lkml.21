Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001131;
	b=pnQtmupYrnD10e+9gbCUOgbGui+K+H/gNRtjhXmOFDXn5JQWhTBTZdMPdV/iwZJ1Gypi
	 /T/Vbv6LgZ4vtJ7HgjnHpxNUvVMB1FtTvfzskwWbDrEl2LXGTpact0+jf4hWRAQ8FkONP
	 VZdQQhZHyiJJ53eH/ki9klCDZPt78dpvX57J7ZVa/ZjU67RYF0D9aNpcQCaWHNCcq51lH
	 uqMp3cgrxE8XbZWOYjZ8cHpomrAmTIzvVuc2M7jhl+OeEHaNQ2YQOrP0Essd4jDDId71o
	 qtwy1MkB5Zl+NdphoURp1qct5dXtN3rLJXWJZW6WXSFeOQGtL/ZHsBeQ3WwBcEsZUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YoWmRHzC0ZELuZ7/SC3fVKMECkRMqpESbzYlx1qsT7E=;
	b=C7/Oe21BUIJFrlMo8VALhR4P9KJHFkVGH1rrBL2tePMh+lWRDmFLh5xy4LYFI156ntfA
	 OUEyVEG/JFwhDHBV8KogO9Qsf2PyYpU9VmbnBEQYTxDJcV3WTUhhkClP17/0S8K9XnmqP
	 7WPHdVuay0itgdMks6N2+fOLMJjBlSt1mDUw9WkRN1ZhB/W+1xPsAcOsy8nRiEQKxe+fb
	 Emi7Sun6/uZHlzFg/D4MgHSZ3jcpnvBLCN4JJZpQ/2LYMGRWFH/opfcjsc5gihVihmwCE
	 DeulSq2ZAN/w514ftaXimhO+MN89WIbeyX9FYsqiP22UZnu7Vgop7h1IGCVf7n5SAhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BhHhSd8J;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDA606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEDA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BhHhSd8J
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eff722a480so4385285ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001131; x=1795605931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoWmRHzC0ZELuZ7/SC3fVKMECkRMqpESbzYlx1qsT7E=;
        b=BhHhSd8Jqwqaq+ZpO72sN5yxdyMAYiIVo/1PbavN/9YSm1mLO++iVhA7k2Udt0uv9N
         i6acSDn7tj3qkYtH900QKBWJFouCFLttP0SKwwGll7Kc7A/Nw9/V/lWRCpGCSY480gsU
         qfmFsQHeegbR84dlAEYHFJ9EmaIOWQQMpYufu+vMN1p+HbBZqq3JhMezwDiZio1mPBH7
         7s8PnLsYF5CDIjUjhE9eT2yJ4kbRV+zg/t8dU04AG8MS8iZUIEuA8OWkb3wyZ+zy8U1r
         mpvmtgguowT7hirXMXeY/HjNfEzTV4piCLpP5rMxMMPvY++/63hE1c1cS5bWsIiO20Ea
         oBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001131; x=1795605931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoWmRHzC0ZELuZ7/SC3fVKMECkRMqpESbzYlx1qsT7E=;
        b=H8G1XYTZsjnNFscYxlX720mEU8VW3kr4IGwvKqQ8EZpKKyHgF018uuq9rBYzsRNtZu
         0J80/jQbZXwrchyMY2jDzT7GM/xybYkqF+4ZPwwkigCGs3x+bwaQFSkKj1bEkeZySfP3
         9qwUtnkmrkli9vWPdECzDTQmpTlB9isAJuKjqCiccNXk5+pse/lDBMg3JX6CI2GKJsp3
         4S3zA4iS8kUNXzCEKw5Xs340Yb6AFYorotVPb9BJKRKpct51o80Hz1FKdfVtPXOyNkH8
         ITi/1VGF9np6o5OyWIPJ68KOb3u2dHkzwDEiIRXf6RiGBJdLIfJymvdVoEvz6w3sJduI
         rtWg==
X-Forwarded-Encrypted: i=1; AL+hErHYVHf9MOnQ8w2xz84eiZDueTEf03HaLDRzK26oL0sTwP9zwgRFZi2F64ZCatQuDAEfUJ10zupVQC9fMT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7+NQcf6sSyqbDUshYTjsUqHKoTGFHRuwq7u1jrlsumSLKkng/
	wJ9IKavMtQ26kkHAWpC8HmVGQu3EiqRzeL8+qg53YwWFSGA1IRHK+kjJ
X-Gm-Gg: AZFdTZejrH06KCI7WfGymba65O0jdAnAue3QexU/alv2PPDn0HT5GjgU0DDiPNbWIoV
	i3hdZONxqNVOD/x/7Ui2meJxah8dqHuCaAz5nA8wvNBvKO5uo12c6731yGu4pIJ05NXoSQLXDcv
	S42hv56roBCMXFyvLPR7tJmBFjH3Yb2NBoMmJ8JDlhdDHgcJfMYgzvBWYV/HOR5mA9WpSESKof0
	PIRgzALTayWTDMz3h05CeJE3DaHsyCZQYSiNzLooQFbnl2NSAs3lLjBImgsfHsnZufEfvv2oGwe
	8BRl8sZZUixVYJWzJqOb9QB1Ey8Fh/2JMsEHVkJKVklfjnoiSCnjGhPOTTGmk30G2OCwwhY/iu0
	JWy7VHCB5X6nDv1UPCzhchmISEGjztJg3MMsJTEDw+qMIIab8aIiBpPfTkkJ4V3AJ/itwTZIuJS
	O55sWojxCzFJGIPM2NFn+PV0Ug9p6p2yGI7AArjCzPL9ppKxSJBu+icnb9KjwA2XUzM6vZEelOW
	+ngJm3Er0RK6zD90bO5Q3d6IxzrT5+s7BQ94XgSx6/wwuIue0DbY3hzQRgmu0Mwj13cG91xhipx
	EVpsk7V/EqhNkgiH4VJtvlAd1szD9QRtCQ==
X-Received: by 2002:a17:903:384d:b0:2e8:95d8:6423 with SMTP id d9443c01a7336-2efd9eeba96mr39665665ad.38.1795001130590;
        Wed, 18 Nov 2026 03:25:30 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6183f8csm11702945ad.31.2026.11.18.03.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:25:29 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: xiang@kernel.org,
	chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	zbestahu@gmail.com,
	jefflexu@163.com,
	dhavale@google.com,
	hongbohbli@tencent.com,
	guochunhai@vivo.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] erofs: preserve unspecified options on remount
Date: Wed, 18 Nov 2026 19:25:23 +0800
Message-Id: <20261118112523.3824782-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Before the fs_context conversion, erofs_remount() parsed the new
options on top of the live option set, so an option not mentioned
in the remount data kept its current value.  After the conversion,
erofs_fc_reconfigure() swaps in a freshly parsed option set, so
every option left unspecified is silently reset to its default.

In practice util-linux and busybox mount paper over this by
re-sending the options shown in /proc/mounts, but any caller doing
a mount(2) remount with NULL or partial data silently loses e.g.
cache_strategy or, on a filesystem mounted with inode_share, the
page cache sharing feature itself -- memory usage then silently
grows once new inodes stop deduplicating.  It can be observed on a
mount of "-o domain_id=test,inode_share" followed by:

    mount(NULL, mnt, NULL, MS_RDONLY | MS_REMOUNT, NULL);

which returns 0 while "inode_share" disappears from /proc/mounts.

Fix it by seeding the reconfigure option set from the live one,
in the same spirit as ext4 (fc->s_fs_info = EXT4_SB(sb)) and
tmpfs (only "seen" options applied).

Fixes: f57a3fe44995a ("erofs: convert to use the new mount fs_context api")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 fs/erofs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index c2c652522fad..305b2daa343f 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -1000,6 +1000,13 @@ static int erofs_init_fs_context(struct fs_context *fc)
 	idr_init(&sbi->devs->tree);
 	init_rwsem(&sbi->devs->rwsem);
 	erofs_default_options(sbi);
+	/*
+	 * On remount, start from the current option set so that options
+	 * left unspecified this round keep their existing values rather
+	 * than being silently reset to defaults.
+	 */
+	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE)
+		sbi->opt = EROFS_SB(fc->root->d_sb)->opt;
 	fc->ops = &erofs_context_ops;
 	return 0;
 }

base-commit: 79f9e56d1bbf598503b240b8119624602e7ef3d2
-- 
2.34.1

