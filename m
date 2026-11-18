Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021419;
	b=lM9MxU7gt3qQg3pVhSOCLeG+693uVq1+5GMdFXk5QCWJdo65EuVS2Ezz0lKYkrCIjbSo
	 0QrJcPNJlErVvgks5xYzXUuheLeRi8Ab5G55FxUAocjEzAO4L+nqD+Nj9IC5u5V8597TV
	 tDPipkvcgBH4ImgX/zgZl2dt3+xgk6Do1zN+OMxKvT8M0QOF9UAgkt0MjWLx7/f5m9lTz
	 WeqKxL01lG+vRf4YDoVAO9bcVYWWgvzIgTYY99RfVTDlRw7Gk/6z6dLybr1e/nh+I7oLP
	 CL89xR7tEimQnY5YGzfdYO7KYFPTzwQ2g7j0hDwFPLpnuj3n1KjAtvTVCB00tBO52LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Nz+IbEOviOWTqeWPFaSKYQFDDLKcLrIMVLmfi5/eTq8=;
	b=EvHWpTQbFOafjbcX2Ayd+9yqL9eN/SzAAOLInfJgwcNz9/1MOhJIWy8YtyWXy7ob0PD1
	 OKGK/5q3qQeQ0ZJ3O2cIaMwVUrdcjfWyTvrjXktYAN94bmEK94/fUAzHxuufgrSqPtkQe
	 vIKgQ89gbu0nrPrdSKc2DqjMs6IxbCTbaRhIZ0d2ZnyCqUpe/1Zx47UdA6WCWXTm0huCQ
	 VNMMb1wQT2o1M+v0JESNeHOy19bGRKuVHQ93X36T8XyjkC9CGM16PPLlQpoAH2whEroix
	 Dcpdy5MBkmJ8Lb4KmiIw536kUbBWHuHN6Sxdo2D/hI3CAi/99CB94I9sfTcZHra1eVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=RYYnDKjb;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F7A606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F7A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=RYYnDKjb
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91eb46044c4so14452896d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795021417; x=1795626217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz+IbEOviOWTqeWPFaSKYQFDDLKcLrIMVLmfi5/eTq8=;
        b=RYYnDKjbnXwVVfMkR5rVpzsoay5v4fYowEr/xrIsozOndFgoJNMKNlazBBG6+xaKuo
         f2M20sHVniTYaHovrJM/58OydmMRkDa5lRJn4+UqyZ/FIrvrTfHG+Fe0gOgRK5b7NqjK
         T+kLa1Tf0qgl3MefkW6gWFQPwTQLJyi7Qp8g6OAHCM1eUelx04VXcqkcxfG872OxIQO6
         oUt5pQm7OyO/2VIJ5ioD4kuvOL1AjQnr0sQy/D3oyoUGu/VfUPJkdJGdXcU0io9hTTi0
         8BvVpkSBN9qM/z3grPj+rrMzAtQSZsjnwBwUoyWmhL63qjG8oCQaEaoy0ApGCGQmgXAN
         kpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021417; x=1795626217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nz+IbEOviOWTqeWPFaSKYQFDDLKcLrIMVLmfi5/eTq8=;
        b=jl/PEVo99kpWvApjTNu5prqUwGxQy7b5keqjmPYpqjmtYsUtmLL9BXZQkbOj9UM6Vb
         Ef+AWg9J6juMiyg7p++8vpi+D1YLisZ/ydu9rhQ5SRnJx0Cz4I9fr4ajKsuGARlU45e0
         cVQP2Hdj5zB74I/FfDMmhWz/bOTjLRy1yO8n+i5bbwe02nFBWsBviJt+tNzfRCEkYVXv
         ArjUmXGVuzsfGK2Lm5mcW7UpqdvgmpB6JiF8bAsfm00NZrzXO+LsAH8rgdqOd6mJh0dL
         KjWX3VAeW2+zbhCbTrVocH8XH2OgSzLr8LaYtyrsP0nOmPXGNrSQLRHWDuxuWDj5JW8P
         6Maw==
X-Forwarded-Encrypted: i=1; AL+hErGKCoqQZeyx4Rn2l8EF2NLXbxPO4Lwnu3STF4RuEcplUCBAyvAsKUJLgvF7UYqFsuyana7fgTDey4Co7qE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xlQFgrzx+giiKXhX1fiGagcfQrJZ9K8PeWPvJedreRp5Ygqwq
	MczqCdcfgiBByX7Ue+AmhCW6RRyW1r+ybwZj2SaVyyk8uclroPbxj37mumSy3F7Or/o=
X-Gm-Gg: AZFdTZfKzvIqLWwFL5LJsh+pdE1iCDNC3mmNmnwKza4GHz02J28d2sQcgZioqr3r8yK
	MpvRFAuNMogI3vSceU1cBtA2cvV9lVjddbQOSwQ3ZPFpzXUdPm/j4vIkhNLcc9my+oWZ6AqzQg/
	73c9UAqISk3f5im/6AXNmxAA9yC1NczNvaS7jWeesiEVWxVpvV1+9JVsIJJO42lWeqZD5I6y7s4
	3YMJkqs/gCbaTmksIbU/+yQNMRTOn9S3TEsd64ssL8MkJT6/tiG/d8N3Quq5ZLwW+l7khatne6n
	ujZwaoNLIvlOYV4Okp04WROw1RrUq4ICMnGqf2bSGzZHng+qDnbLa4zkCOzXY0Hxirta1xnkBOD
	rpfARy8Y3kCudbl2p0iWydMjq4RcKyCaNXSLM9tGa0i/GRznGeF+uVgE+rCjedog2luGRCXCzxG
	FGiQ8ZiSECZKR1yVKnHUdusZksLaHEY4/LLrVR67GBmyeWRUuUsiwSC2Ii/jclDV3lT527rt1OX
	a6PotqsO+R1sUCP902ynn4tm6KrBgpRufHUvI5tRs/rbgz4K4+tSpP5YYU7Be9lKJ2nZNzQ+DlR
	4qr9O6y730oas2iwSLUSt6qlHwJw6KkJaslSQ4jC4v3ACUw=
X-Received: by 2002:ad4:5f0d:0:b0:91e:dde3:f213 with SMTP id 6a1803df08f44-92114f6e1a2mr51313906d6.40.1795021417403;
        Wed, 18 Nov 2026 09:03:37 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm26217506d6.7.2026.11.18.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:03:36 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 18 Nov 2026 17:03:25 +0000
Subject: [PATCH v7 2/7] ovl: no fsync=relaxed without data integrity
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-ovl-containerized-sync-v7-2-54f45743fe55@toxicpanda.com>
References: <20261118-b4-ovl-containerized-sync-v7-0-54f45743fe55@toxicpanda.com>
In-Reply-To: <20261118-b4-ovl-containerized-sync-v7-0-54f45743fe55@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1795021413; l=2797;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=m/J0LFSWS2GOFbjFlPJg5ev3Pv5YOtwv52o2fbrDkrM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJaASzyDcz8eRSVN5bIxFtETYxlSP6hrDkAbw4w7+PorJtI2UWASNywIzy1ye/L726ylFajsmAi
 bP6pwRVuy1ww=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A sync does not wait for a filesystem with SB_I_NO_DATA_INTEGRITY, which is
fuse, so that a server that does not answer cannot block it.

With fsync=relaxed, syncfs() and unmount of the overlay are going to write
the upper inodes one by one and wait for each.  fuse_write_inode() waits
for the server whatever the sync mode is, so they would wait for the
server once for every inode.

Do not resolve fsync=auto to fsync=relaxed on such an upper filesystem, and
fall back to fsync=on if fsync=relaxed was asked for.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 Documentation/filesystems/overlayfs.rst |  4 ++++
 fs/overlayfs/super.c                    | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/filesystems/overlayfs.rst
index 1a59500834a1..8a007fbc5257 100644
--- a/Documentation/filesystems/overlayfs.rst
+++ b/Documentation/filesystems/overlayfs.rst
@@ -870,6 +870,10 @@ The default is "fsync=on" instead of "fsync=auto" with the module option
 "fsync_auto=N" or with the kernel config option
 CONFIG_OVERLAY_FS_FSYNC_AUTO=n.
 
+An upper filesystem that cannot guarantee data persistence on sync (fuse)
+does not get "fsync=relaxed".  "fsync=auto" means "fsync=on" there, and
+"fsync=relaxed" falls back to it.
+
 If the upper filesystem has no writeback (e.g. tmpfs), a non-default mode
 falls back to "fsync=off".
 
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 5960974c5af2..31a58e28968c 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -765,7 +765,8 @@ static int ovl_make_workdir(struct super_block *sb, struct ovl_fs *ofs,
 
 	/* fsync=auto that is not resolved to fsync=relaxed means fsync=on */
 	if (ofs->config.fsync_mode == OVL_FSYNC_AUTO && rename_whiteout &&
-	    mnt->mnt_sb->s_bdi != &noop_backing_dev_info)
+	    mnt->mnt_sb->s_bdi != &noop_backing_dev_info &&
+	    !(mnt->mnt_sb->s_iflags & SB_I_NO_DATA_INTEGRITY))
 		ofs->config.fsync_mode = OVL_FSYNC_RELAXED;
 
 	/*
@@ -1499,6 +1500,16 @@ static int ovl_fill_super_creds(struct fs_context *fc, struct super_block *sb)
 			ofs->config.fsync_mode = OVL_FSYNC_OFF;
 		}
 
+		/*
+		 * A sync does not wait for such an upper fs, whose server may
+		 * not answer.  A relaxed overlay waits for each upper inode.
+		 */
+		if ((upper_sb->s_iflags & SB_I_NO_DATA_INTEGRITY) &&
+		    ofs->config.fsync_mode == OVL_FSYNC_RELAXED) {
+			pr_warn("upper fs does not guarantee data integrity, falling back to fsync=on.\n");
+			ofs->config.fsync_mode = OVL_FSYNC_ON;
+		}
+
 		if (!ovl_should_sync(ofs)) {
 			ofs->errseq = errseq_sample(&upper_sb->s_wb_err);
 			if (errseq_check(&upper_sb->s_wb_err, ofs->errseq)) {

-- 
2.55.0

