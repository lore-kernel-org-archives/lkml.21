Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306154;
	b=1/btabzQbOKvujSRatdAmeYMiuDZAENSsAfGFoDXHxgMVb638eDkqjWL1lD1mnzEJDqs
	 WPUMXq0CpxpchgS+9txD0QQ6NXs7RUxg6BqDXDuQIjy7fAbEirvSoulARWCX/G3UTCuQo
	 S+YbNzSCxtIn5+mrDpnVE+K0cMyl+ML5MztOIbKE6omkC/Y3HuaeluC4Ru1g1/gU0Eyck
	 yfCaYARW4knqwXGzBDEmWggicvqHT9pi7eS3BZyjB8wnsv19+67Y0vdoEaUT1d21DYwSA
	 rmmGXG2tPcikzo3kPghDe5iCE7TwWJqV/tkbBkLUL3WdT9aZyRxde+aac6aJ83NhPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m+aU85cIm+C4zcua0cgiJZNThrvCIO+uOHsPRDd+6Js=;
	b=BWA7TcprFQCIqFwscluVKG05nt11+pRK5GCLEQrrKjTqLY96E38jdFMRvEQ1SoOn5b0U
	 l6iQNG1f8I0eWmSy99BRIFwnotGvVq1OigstLbKXSbrHBPnzsLwwkUdJnPJxyxzFDi+RW
	 KJDtAMKgg7f1WUw2mPRt8rTW988uAuwrUv+v9SfnJSb1I8h0MAWc+FrFlk0b5mLHIC4Px
	 qeSDKL4lAN48QopqNLr4iA5Z9vdtFhFbKahQNGzeChj72UtJqfHjExhiQRgeIQ74YrdhZ
	 6mGDsSPO27EXGs9sXwoaOItNewqvYFCGjV0hNsQAI3K4DPNWZuLBi4UB7ZLdZHwGK6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPs1eFKA;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32745606A336
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32745606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPs1eFKA
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so1964483f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795306152; x=1795910952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+aU85cIm+C4zcua0cgiJZNThrvCIO+uOHsPRDd+6Js=;
        b=uPs1eFKARZ3CMN/dT8oiRSxugGoFsYDdKXUnYIxGeix5KMAnxe4Q/d3FUpwvXWQNDW
         o3jCvaS8IC75goOsIwb2FpTZGzUiWy+pD/MtACLf4+8QxBVD1zUb/CcM10TR+oe7hIC9
         ju7ZcTGtcQjR3mityRZLNrZ/e9JBOUbyO3B5/RTwvvo9luBkMORWvPlVla22R7BogrFZ
         HP9hMHhopm0Wdj5qdfeTfiAo6V158aCiuK7tgveO6P9LdGfRfXXr6qiA6kvyFiQQ6kN6
         rFHku0ETJBqZYY8cG6bhmTTz4YY9ztpesuz0kc57HvDPn26dQ8CY/N7rAhgU5MWJTDT4
         9x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306152; x=1795910952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+aU85cIm+C4zcua0cgiJZNThrvCIO+uOHsPRDd+6Js=;
        b=r93pDwASQHqAj9DjzeD839QuPyn8uiPcaj345xzk5Qbq6Z/oil4QjcF9LWjGwlS+1X
         j4EgL97BSrI7q2YtGQi8stvxTp5pDjb8ZOdNNVyyhKPkBBpHSdVbliJHYqyiZMLa9CHG
         YGImw402KxQrzPnaS3G4voHLS6QrwQhhXo3SklwdBkqVzGqihD16gxPCHnQ1ENSR1DEB
         mRwqnqRCHfEB4hv24/n/7gYzgipHLzCwyqqzjcf0hNjLz+nSBRIqkjib2tZslzcKhC8x
         TKd8lDd+QAW8oRhG2KFI38yM2ivU7yp9eEM5huOAHP8RuLfMsa5EeeJ2PrXmuDNFSSQG
         gYDw==
X-Forwarded-Encrypted: i=1; AL+hErGG5U7qlTD8P96P32L9sXteRzaTpYVKTfUM48z963Rz5P1GDERJuaVWEySH6pH07guKDwDCQO0sAxr25lM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w45ONKvgpI1LKfyocBo42Kil0KhtuxqrnWFufl6CSV630+39Z
	rpC7cnCh2gLY22HhKE4AuXMtMec2vMYF/U1x8r8dyBAYuyY5Bw/GhRvd
X-Gm-Gg: AZFdTZeU9aLvroxBIHelY5xyb7OafZWtMVD5MLgrR1qIgaF6gU8HfVPx3AGaF/pyWpn
	plg3kpDUs6iwUTC5UJc+P5de6E4CCI4+EvlVRxVuOLMVDzW98PHbadZNN/9r38alIdppdBZetUJ
	XVlKinRdza4SBJ3ideQJRsRjswiP9P/SS/kqElO9pQdpEUD42HPeheqRn2I0OsqE5zdJiaqKMGC
	zCUudNMN6ni/4WsWrFdeGCPjieg0tCm52FDClVt4wxwKrbRuP5WZEma9SPVTPOYsHi3tJ04a9pg
	bvHQPlbxG7dslqsmdFbxzrx6qCHXBIJoPD+wUTocSP9H4nnBs91hjtGElVpHU5xgPNPS2RLaHPr
	wbXOgck373tNeJJeAlZhPPsLRqZ/mHAIoQkGKUSpQ5JSeJjqxTxwfwD1KMWU70eT/as7L9SljV2
	7179k5GHoBUIEdutwaSTNyff2xcBttuoKnh27hiFFmdNKuAEWkSC7of64hq9iaKllwjQcxVGSje
	kJs8RA14aJ+WH1OW0LhAyNYgVpAjYmwCUzcot3NdfPsel7rUhSz6ffSqit8lX8XwhJNnxd09jqD
	bkDYowkHbsnVDpG+OaOY1+vKxw==
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr10514425f8f.15.1795306152315;
        Sat, 21 Nov 2026 16:09:12 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm13461872f8f.0.2026.11.21.16.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:09:10 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lauri Gates <lauri.gates@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Dave Chinner <dgc@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH 0/3] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
Date: Sun, 22 Nov 2026 01:08:53 +0100
Message-ID: <20261122000856.536902-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This is a follow up patch series stemmed from [1] and [2], splitting the
_mask change for the fileattr API into its own separate patch.

The first patch is a preparatory patch so that the code in the patch
after can be formatted better.

The second patch is the actual implementation, which introduces:
- fa_xflags_{rw,ro}_mask fields to struct file_attr
- fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_kattr

These masks have the following semantics:
- rw_mask:
  * for filesystems: advertise which xflags they support changing
  * for userspace: specify which xflags it wants to modify
- ro_mask:
  * for filesystems: advertise which xflags they support only reading
  * for userspace: ignored

(ro_mask for userspace was also proposed as a "verification mask"[3] but
I left out that semantic to keep this patch series more contained, and
can be added later if needed.)

This allows userspace to not have to do a RMW cycle when using the
file_[gs]etattr() syscalls, avoiding possible race conditions and
simplifying their usage.

Patch 2/3 also introduces the missing FS_XFLAG_PROJID flag so that
programs like chattr can leverage the new mask API.
FS_XFLAG_PROJID is kept out of the legacy FS_XFLAG_MASK and so it's
defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
will be used moving forward for any new xflag (like the one proposed in [2]).

Patch 3/3 converts fs/ntfs to this new API, to show how it can benefit
filesystem drivers too.

The series has been tested across NTFS, ext4 (with project quotas), XFS
(project quotas and extent size hints), and Btrfs.

Thanks,
koraynilay

[1]: https://lore.kernel.org/CAOQ4uxg8aVcWyNiFDk8djdn-M3xJcu_7-kRxVq9jjFsbcGp1ew@mail.gmail.com/
[2]: https://lore.kernel.org/CAOQ4uxjVQ9cjV=_jBjQtNg9zCuWUEJT9KNYMKV+1jwBkHen5OA@mail.gmail.com/
[3]: https://lore.kernel.org/CAOQ4uxjCN-ekd18R-soD8tkGFnXjK0S1VdSNhq9b3Ev6y8K9jQ@mail.gmail.com/

koraynilay (3):
  vfs: use goto out on error in vfs_fileattr_set()
  vfs: add xflags mask to fileattr API
  ntfs: switch to the new xflags fileattr API

 fs/file_attr.c           | 179 ++++++++++++++++++++++++++++++++-------
 fs/ntfs/file.c           |  63 +++++++-------
 include/linux/fileattr.h |  13 ++-
 include/uapi/linux/fs.h  |   9 +-
 4 files changed, 197 insertions(+), 67 deletions(-)


base-commit: 3857587d9d6fa44d40d1c73bde6a39f6f7a5216c
prerequisite-patch-id: 7af19117a27af492e3e525774310fb3a76700ffa
-- 
2.56.0

