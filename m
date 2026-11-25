Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599862;
	b=kK6KvwOlbdqB48Ed2yxL1NNqoBtN1cK0hpqY0RyHsCFyeWl56o44aOEck3zIxCu6qcRl
	 mVH/nktTR15fuUDOlAlr/GfiFE6UdEkhb4slSvp3aIj/LjsucsB+uDOaLbvcRm9DrKxf9
	 rQoLoKlqr8UEZdw1JXu2MKy/JDH8Hea45uD0ptP4fVaXiAw9MhItumDZB6MexNmCaBjyU
	 Tie0JkbRkm0W0Tif5FfXKbEAEslYgjAClHIiMNVi2Zk2T5iIHljLTGRKYtDY24AanHExt
	 9TL+1l9NN0GJXG6KutTlF3LKponzOZFWEPupNtik8GCDx7H0Wf622/2L5JUU9VNFg5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599862;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LR0+keKzieIe20y/fGYIyqOsCHIgXpLCwFu/SOvu5f4=;
	b=44JIVYhxKtinphvpN+zrbBct9eNn3b1CSh/IPhl4STxrybqBVLpagc7NoclhsEKxGIpu
	 w+/cke14y/cRc4M63zIUZRvoJJUWQvoayi3m5UkYYjcfdcTpBFQLqz4pcHyX6QGI7T7KY
	 N4Fe0pJOncqaQf4DQU1dveAZ/d0FYPxAsutBOEAolrnQR4oNDAdOT17cBwFV++XdOM4mU
	 KOG/xtb1q5cbk70TKIq4ZZJdkKvEC0FlG7+/9JeDcuCWX2gRTL1XiJtDQCcl+o8udt9al
	 rvPhOrOpzvdisINV+cXzdkjWJkmjpyLFanbL14u+QTA/2XRg5KA2B6p2XbtPxskU/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UZncsBi6;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E818606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E818606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UZncsBi6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1795599853;
	bh=SrpVuKAWFLKvu/BeSyXfyvqmDLVMnHDVL8WHe7WviTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UZncsBi6WHIefMWTmWztnmgEsKcGuixa0pxvoZo793tdysvKRwHz7hL87gCXHAaQQ
	 Ccs3gE1IAtqK/eZeCb3pTqPCTXIcizlscv6meMDXqJS/c4n0bmktXm5E6S3okqWtcW
	 eDmCEefOsZbGSgcNFmQ1DPwEotQJPQsRk+lxCx2o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 25 Nov 2026 10:43:44 +0100
Subject: [PATCH 3/3] tools/nolibc: remove the open-coded fcntl() in dup2()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-nolibc-fcntl-v1-3-503d81db293f@weissschuh.net>
References: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
In-Reply-To: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Danish Khateeb <danishkhateeb03@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599851; l=1167;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SrpVuKAWFLKvu/BeSyXfyvqmDLVMnHDVL8WHe7WviTs=;
 b=4mPBx1PBoPjQKQqGBonvz41F5VhRLKINXJ4vOTCZ89y/pfutFj1DVE+EoeTeLoKaLtb1QjPnT
 TYjukAgtgXWB3vysTErgHcI/GoLqS103Il5bZt0zxbaOCYZ63TZPIjk
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that nolibc has a proper fctnl() wrapper use that in the dup2()
implementation instead of the open-coded logic.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index b63fa6c618c5..5cd1c3ea9013 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -29,6 +29,7 @@
 #include "stdarg.h"
 #include "types.h"
 
+static int _sys_fcntl(int fd, int cmd, unsigned long arg);
 
 /* Syscall return helper: takes the syscall value in argument and checks for an
  * error in it. This may only be used with signed returns (int or long), but
@@ -262,16 +263,10 @@ static __attribute__((unused))
 int _sys_dup2(int old, int new)
 {
 #if defined(__NR_dup3)
-	int ret, nr_fcntl;
-
-#ifdef __NR_fcntl64
-	nr_fcntl = __NR_fcntl64;
-#else
-	nr_fcntl = __NR_fcntl;
-#endif
+	int ret;
 
 	if (old == new) {
-		ret = __nolibc_syscall2(nr_fcntl, old, F_GETFD);
+		ret = _sys_fcntl(old, F_GETFD, 0);
 		return ret < 0 ? ret : old;
 	}
 

-- 
2.56.1

