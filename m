Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094636;
	b=Fi77BUTkKf86JMLmA7NFvkK1gnUhByvs6d35CuMd+fDm22eu+jo6enWc9ZZD9vwxg2XQ
	 g07AKaarNfUP8yXaHh+MM1JBa5pegTrnhDE0C2Tn1Ig785CV0UHywhttJx6xPu3RZssxx
	 9S9nEIvOWAKH1DSKgV2Odxoj2M4GXpChpoaWXGcmsmcwOufEx2AZHnrN9AuSUTCgLpVWF
	 /3uSRFsLiVn5C/9/TK8W/2kqD6e90xljFPaGeTpG55PHlNTt7K8ihs9FTxLfdtENboUL8
	 l7hnqNnvbr3tpoqtvs/qiZl4cbtYhAC6LbtKdQ5Sv27JKtV0Yj3MN3X3EjgW3qBNkLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094636;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=dm2MSBUe0Lqirr4f3WaPmjkvm/rJxHWSyjN9mI+8azg=;
	b=4G3HGdvoIc9iLUeDRneiS6qydnQRQbjJL8tVTy+dgijrE/lG2MVlxxA9QA7ibuarROxp
	 dAAHxpcclyXswVHS0clGwMNEjxEPM0rggOs0ODPXpPkYbrCTnmjFSL+8CMjbtunhbz8Yn
	 MvhrIzKtu2z4FQZay5F5Z75TyFkn/jcTgGNL0szf889kJOjomucQwxiZZwYbUTU4RjZg0
	 O6Sudp5GWzpxPfJ2AOHcAVLLMUj8AGQPhaATQgDPh/tBNw9nKR3szfUCeI88V4X0HoX0u
	 0efp3uTjmZenheCTKHnyGqxsRYLotDpzE+UJQrSr09KLqG2qFURGEDTk5aWPrseVIMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=EzPcsceg;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A42660A260E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=EzPcsceg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dm2MSBUe0Lqirr4f3WaPmjkvm/rJxHWSyjN9mI+8azg=;
	t=1795094634; x=1796304234; b=EzPcscegvFNkQ8qpi58VuX6dcZhcsjnxlvye6uQ3ZvQNDM2
	BW8QaIcAPHuVv37UsgTAr8lnMx9muXJFvYVHZk8f5r5lTntoUSbaQKGm4QxtK6RDsdBdvfdoLOB6a
	iNFgDAjhE7UZ2GUodOiTuF90NbSC/XWlKEzBM21Lx4E9+Mv9k2aBP3MKTMjiQJbrAK3G0QXvQG2x6
	jxF1t5lR+ufa6YEmVh+DwHbVaASsheLYt/iuuOQgt6E5zzBrHD8W8J5cIVWKYq0CCWtKDBvFguJAL
	vWkfHDZWe3yONfPn/QAUZUxcJmJac1X34qgk6lZWuYisP3ky8QT5+s/nOlZmXFHQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU277-00000004LIl-2NOP;
	Thu, 19 Nov 2026 14:23:45 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-um@lists.infradead.org
Cc: =?UTF-8?q?=E5=AD=9F=E4=BB=A4=E6=BE=B3?= <menglingao@xiaomi.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [RFC 2/3] random: do not include utsname in early random
Date: Thu, 19 Nov 2026 14:19:13 +0100
Message-ID: <20261119142340.e6bb6d0f1205.I61c6041598778a92b9afaccdca2ba4a3803f4e6b@changeid>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119132340.225696-5-johannes@sipsolutions.net>
References: <20261119132340.225696-5-johannes@sipsolutions.net>
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

From: Benjamin Berg <benjamin.berg@intel.com>

The uts name includes information about the compile time and such and
changes. Exclude it, so that different kernel compilations will see
the same random numbers.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/char/random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b4da1fb976c1..64d0cfc99ac4 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -877,7 +877,7 @@ void __init random_init_early(const char *command_line)
 		++i;
 	}
 
-	_mix_pool_bytes(init_utsname(), sizeof(*(init_utsname())));
+	/* _mix_pool_bytes(init_utsname(), sizeof(*(init_utsname()))); */
 	_mix_pool_bytes(command_line, strlen(command_line));
 
 	/* Reseed if already seeded by earlier phases. */
-- 
2.56.1

