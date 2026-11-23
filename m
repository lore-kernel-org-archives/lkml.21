Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405452;
	b=RV+lVaQef0hP3tH/hAB+3BYVZLUtQbGrTf4JzuaYj0CkMB1T0xNuU1smh60Ec3dtODnr
	 lO7DccdadLLEEsP6zx3R4gFNVqYRGin/wlKIf4owHDeufl5S2BoIP0hZrHc+uMKx9oVUs
	 kee244XHSQwDmEhzOQmnrUEUsYqJTF76XxsgNGYyeyTk4OmgZOqrA1HqpDfJ9X4UC6H8c
	 eOaYwH4Gx5BQXV9BBkQaCm0SRhiGNAVUWIRMErTqAj1EQRoGLHo8vlu7CEHk7jkLQdoza
	 9udtX2SbN7vNCOtu3rYPbQ4J6huD1DuK31em3L4eXRduUiNVma9GHngJq9yncvtL41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405452;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=2LU4gd1QwZ6NBKlWkP/KjhmJHqiN9qYm6aI1qrY30QU=;
	b=BeMNvFS3AoEOc5/dAQbgsVzSh16Ilo5ZX3P2xnuS/rlAPLt7naPnr+ktahju6ypWU23N
	 IdagogfUu2DprqrbjEQpgOTS2DpKRsvPQ7FRzU+bPqSjabxPCvIw3ilckWTgavmTpwO/G
	 SwzVQSMaWur0vYzwNyhfunqaZqnfYYwyGkRHE+0lUxCYFXxyfZNgcy3BO9/xczmFk+T/a
	 Wupx8tg1bLcoikZk0/IY3u4BEz7pT9RfjPCzW1isP328y7DRkqApRjEj0EYpasT7RloRE
	 Z6HHX86AD5wA3EGzXzsG2wkHRvJVS/aTquj2L6gxkNtVNkucHZobCPhQVpg2eHgagbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=xR24xrBh;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=eumUSM8O;
	arc=none smtp.remote-ip=92.204.81.42
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [92.204.81.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB91606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB91606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=xR24xrBh;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=eumUSM8O
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKyDxiqSV; Mon, 23 Nov 2026 03:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405438;
	bh=2LU4gd1QwZ6NBKlWkP/KjhmJHqiN9qYm6aI1qrY30QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xR24xrBhPUDFyVyjjrfmkUAAgQ5HAGPfcc4RdLmnvrXJ+PJMz9bEI5evjqI6NNWeA
	 sUDKMz2LpVh2q/1eHaO+7extYxDZlTlNLsSTaXb18c0fVaNRi2o/YcoPeSECtdjHVd
	 +H2X3NlVWXnr/VMXsDeq62t2H3VvqvWZISRsnQg8Ht4skAc31fVQQ0tYIqvE0iXeaP
	 MsAqM9Y8tsVVxW06uXepS/7bU/LG/I+uSML2Mb04K1H54Znf0glt+O3JYleej/xwzS
	 vi/O/9jn1vIkdTHfAK7k8CecMzNBsNYh7AnbFHqaJ+7fZKQIqB/KLualcB4/92mdIH
	 ljDAto+nOSVZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405438;
	bh=2LU4gd1QwZ6NBKlWkP/KjhmJHqiN9qYm6aI1qrY30QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eumUSM8OQgF0Hnr5Zgp5BEItIvQIuJNsdAj/3JiRR4BRrZoCCv1jbOybzNOq5VhMy
	 QKb0wJAbI1BOjI3cr67tnItahx/8gHLho0yt8qDwJ6g3zO9yfLq7xcJZSViCYUDG3A
	 m0gaLQYizbpDbMPxqz6LF/JrTqgreZJQsVR3j35qf2B51Uz7ED75Dr3s8MzT34P+ak
	 2jr+0/q5SGOsevCopAaDcOWLSIQXu3VhMD4whp7kvz7LfbQ6eVWmGtno/mgcX29tjH
	 LCDmJ5bIsJp9izhEb4dj0i3fo0Zp3R/JCP32jlvFYWlPAQdZl7Wo7muKJKVi+c/iZE
	 pGa8X8q85/Lqw==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b67e
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=novXQP1oP690d8Wgf2EA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 1d77c92af1f23b670027341628da9528:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 23/23] Squashfs: check index isn't greater than S64_MAX in squashfs_read_data()
Date: Mon, 23 Nov 2026 03:43:04 +0000
Message-ID: <20261123034304.261742-24-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfNTbIq9y176UuZGuHWL4OPPhxnOiYIwlwqqhHYj2ePkz514PVr9pLxod+MyM9PMZ4yh6WXH7JB2vbltmgICvvBvuTFxMrA31EuKMafJeo+YJQP60LrjI
 uGoCMZxpPGx3K9jq4rqH0Z8zWHTgDfAi/FrKihN0kRz8avRxoH1ZQMGIc2jvyAQfh5w0e2n5CVLYkOWY+ejBtiT4bUqNYbZARJ1iboU2ej5iohTQ+YTzJcs/
 8ycRe2cm88m2+j2WI/vmJlXNLyVXeORySF6miyiv37zQUOc+J35Si6j1j0k4uqZ0

The previous commits in this patch-set now sanity check index before
squashfs_read_data() is called.  However, it is always wise to take
a belts and braces approach and sanity check at the lowest level to
trap any values that could slip through.

Fixes: e2780ab159ac6 ("Squashfs: block operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 20c3030b4f96..f2f03d815167 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -297,6 +297,15 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 	int res;
 	int offset;
 
+	/*
+	 * Reject index values greater than possible filesystem size (S64_MAX).
+	 * This also ensures the index variable doesn't overflow in the function.
+	 */
+	if (index > S64_MAX) {
+		res = -EIO;
+		goto out;
+	}
+
 	if (length) {
 		/*
 		 * Datablock.
-- 
2.47.3

